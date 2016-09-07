//+------------------------------------------------------------------+
//|                                                    Indicator.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Serie/SerieMA.mqh"
#include "../Array/ArrayMap.mqh"

// ---
class Indicator 
   //: public
{

protected
   :
   
   /** 
    */
   Indicator * 
      setString
         ( ENUM_CUSTOMIND_PROPERTY_STRING property , string value ) 
   {
      IndicatorSetString( property , value );
      return GetPointer( this );
   };
   
   /** 
    */
   Indicator * 
      setInteger
         ( ENUM_CUSTOMIND_PROPERTY_INTEGER property , int value ) 
   {
      IndicatorSetInteger( property , value );  
      return GetPointer( this );
   };
   
   /** 
    */
   Indicator * 
      setDouble
         ( ENUM_CUSTOMIND_PROPERTY_DOUBLE property , double value ) 
   {
      IndicatorSetDouble( property , value );  
      return GetPointer( this );
   };
   
   /** 
    */
   void
      setLevels 
         ( )
   {
      for 
         ( int i = 0 , end = levels.total() ; i < end ; i++ )
      {
         if ( i == 0 ){
            IndicatorSetInteger( INDICATOR_LEVELS , end );
         }
         IndicatorSetDouble( INDICATOR_LEVELVALUE , i , levels.get( i ) );         
      }
   };
   
   Array    < double >               * levels;
   
   ArrayMap < string , Indicator * > * slaves;
   
   string                              symbol;
   
   ENUM_TIMEFRAMES                     timeFrame;
   
public
   :
   
   ArrayMap < int , Serie * >        * series;
   
   Indicator
      ( string currencySymbol = NULL , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
      : symbol( currencySymbol ) , timeFrame( frame )
   {
      levels = new Array    < double >              ( );
      slaves = new ArrayMap < string , Indicator * >( );
      series = new ArrayMap < int    , Serie     * >( );
   };
   
   /**
    * Moving average on one serie of this indicator
    */
   Indicator * 
      average
         ( int period = 13 , int serieName = MAIN_LINE )
   {
      string name = StringFormat( "MA.%i.%i", period , serieName );
      
      Indicator * indicator = slaves.get( name );
      if( indicator == NULL ) {
         indicator = new Indicator( symbol , timeFrame );
         
         SerieMA * serie = new SerieMA( series.get( serieName ) );
         serie.setPeriod( period );
         
         indicator.series.update( serieName , serie );
         
         slaves.update( name , indicator );
      }    
      return indicator;           
   };
   
   /** 
    * Set levels for the Indicator
    */
   Indicator * 
      level
         ( double value ) 
   {
      levels.update( value );
      return GetPointer( this );      
   };
   
   /** 
    * Set Minimum Value for the Indicator
    */
   Indicator * 
      minimum
         ( double value ) 
   {
      return setDouble( INDICATOR_MINIMUM , value );
   };
   
   /** 
    * Set Maximum Value for the Indicator
    */
   Indicator * 
      maximum
         ( double value ) 
   {
      return setDouble( INDICATOR_MAXIMUM , value );
   };
   
   /** 
    */
   Indicator * 
      shortName
         ( string name ) 
   {
      return setString( INDICATOR_SHORTNAME , name );
   };
   
   /** 
    * Set Number of digits for all series displayed
    */
   Indicator * 
      digits
         ( int digits ) 
   {
      return setInteger( INDICATOR_DIGITS , digits );
   };
   
   /** 
    */
   Plot * 
      plot
         ( int serieName = MAIN_LINE ) 
   {
      Serie * s = series.get( serieName );
      if( s != NULL ) {
        return s.plot( );
      }
      return NULL;      
   }
   
   /** 
    */
   virtual void 
      end
         ( )
   {
      for 
         ( int i = 0 , end = series.total() ; i < end ; i++ )
      {
         series.getByPrimaryIndex( i ).end( );
      }
      
      for 
         ( int i = 0 , end = slaves.total() ; i < end ; i++ )
      {
         slaves.getByPrimaryIndex( i ).end( );
      }
      
      setLevels( );
   };
   
   /** 
    */
   virtual void
      onCalculate 
         ( int start , int toCopy ) 
   {
      for 
         ( int i = 0 , end = series.total() ; i < end ; i++ )
      {
         series.getByPrimaryIndex( i ).onCalculate( start , toCopy );
      }
      
      for 
         ( int i = 0 , end = slaves.total() ; i < end ; i++ )
      {
         slaves.getByPrimaryIndex( i ).onCalculate( start , toCopy );
      }
   };

};