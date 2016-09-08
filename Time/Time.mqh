//+------------------------------------------------------------------+
//|                                                         Time.mqh |
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
#include "../Signal/Signal.mqh"

#include "../Serie/SerieBuffer.mqh"

// ---
class Time
   //: public
{

protected
   :
   
   /**
    */
   Signal * 
      getSignalBuffer
         ( string name , int bufferName = MAIN_LINE )
   {
      Signal * signal = indicators.get( name );
      if( signal == NULL ) 
      {
         signal = new Signal( );
         //signal.series.update( bufferName , new SerieBuffer( handle ) );
         signals.update( name , signal );
      }
      return signal;
   };
   
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
   
   ArrayMap < string , Signal    * > * signals;
      
   /**
    */
   Time 
      ( string & currencySymbol , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
         : symbol ( currencySymbol ) , timeFrame ( frame )
   {
       indicators = new ArrayMap < string , Indicator * > ( );
       signals    = new ArrayMap < string , Signal    * > ( );
   };
   
   /** 
    * Signal : Crossing
    */
   SignalCrossing * 
      cross
         ( Indicator * indicator1 , Indicator * indicator2 , int serieName1 = MAIN_LINE , int serieName2 = MAIN_LINE )
   {
      return cross (
         indicator1.series.get( serieName1 ) ,
         indicator2.series.get( serieName2 )
      );
   };
  
   /** 
    * Signal : Crossing
    */
   SignalCrossing * 
      cross
         ( Serie * serie1 , Serie * serie2 )
   {
      string name = "Cross";
      SignalCrossing * signal = signals.get( name );
      if( signal == NULL ) 
      {
         signal = new SignalCrossing( serie1 , serie2 );
         signals.update( name , signal );
      }
      return signal;
   };
   
    /** 
    * Signal : Crossing
    */
   SignalTrend * 
      trend
         ( Indicator * indicator1 , int serieName1 = MAIN_LINE )
   {
      return trend ( indicator1.series.get( serieName1 ) );
   };
   
    /** 
    * Signal : Crossing
    */
   SignalTrend * 
      trend
         ( Serie * serie1 )
   {
      string name = "Trend";
      SignalTrend * signal = signals.get( name );
      if( signal == NULL ) 
      {
         signal = new SignalTrend( serie1 );
         signals.update( name , signal );
      }
      return signal;
   };
   
   /** 
    * Indicator : Relative Strength Index
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
    * Indicator : Parabolic SAR
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
    * Indicator : Moving Average
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
      
      for 
         ( int i = 0 , end = signals.total() ; i < end ; i++ )
      {
         signals.getByPrimaryIndex( i ).end( );         
      }
   };
   
   /**
    * Event : onCalculate 
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
      
      for 
         ( int i = 0 , end = signals.total() ; i < end ; i++ )
      {
         Signal * signal = signals.getByPrimaryIndex( i );
         signal.onCalculate( start , toCopy );
      }
   };

};