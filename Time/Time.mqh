//+------------------------------------------------------------------+
//|                                                        Array.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Indicator/Indicator.mqh"
#include "../Serie/SerieBuffer.mqh"

// ---
class Time
   //: public
{

protected
   :
   
   /**
    */
   Indicator * 
      getIndicatorBuffer
         ( string name , int handle , int bufferName = MAIN_LINE )
   {
      Indicator * indicator = indicators.get( name );
      if( indicator == NULL ) 
      {
         indicator = new Indicator( symbol , timeFrame );
         indicator.series.update( bufferName , new SerieBuffer( handle ) );
         indicators.update( name , indicator );
      }
      return indicator;
   };
   
   string                              symbol;
   
   ENUM_TIMEFRAMES                     timeFrame;

public
   :
   
   ArrayMap < string , Indicator * > * indicators;
      
   /**
    */
   Time 
      ( string & currencySymbol , ENUM_TIMEFRAMES timeframe = PERIOD_CURRENT )
         : symbol ( currencySymbol )
   {
       indicators = new ArrayMap < string , Indicator * > ( );
   };
   
   /**
    */
   Indicator * 
      rsi
         ( int period = 13 , ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE )
   {
      return getIndicatorBuffer(
         StringFormat( "RSI.%i.%i", period , appliedPrice ) ,
         iRSI( symbol , timeFrame , period , appliedPrice ) 
      );
   };
   
   /**
    */
   Indicator * 
      sar
         ( double step = 0.02 , double maximum = 0.2 )
   {
      return getIndicatorBuffer(
         StringFormat( "SAR.%e.%e", step , maximum ) ,
         iSAR( symbol , timeFrame , step , maximum ) 
      );
   };
   
   /**
    */
   Indicator * 
      average
         ( 
            int                period       = 13          , 
            ENUM_MA_METHOD     method       = MODE_SMA    , 
            ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE , 
            int                shift        = 0 
         )
   {
      return getIndicatorBuffer(
         StringFormat( "MA.%e.%e.%e.%e", period , method , appliedPrice , shift ) ,
         iMA( symbol , timeFrame , period , shift , method, appliedPrice ) 
      );
   };
   
   /**
    */
   virtual void 
      end
         ( )
   {
      for 
         ( int i = 0 , end = indicators.total() ; i < end ; i++ )
      {
         indicators.getByPrimaryIndex( i ).end( );
      }
   };
   
   /** 
    */
   virtual void
      onCalculate 
         ( int start , int toCopy ) 
   {
      for 
         ( int i = 0 , end = indicators.total() ; i < end ; i++ )
      {
         Indicator * indicator = indicators.getByPrimaryIndex( i );
         indicator.onCalculate( start , toCopy );
      }
   };

};