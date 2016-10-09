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

#include "./Signals.mqh"

// ---
class Time
{

protected :
   
   string           symbol;   
   ENUM_TIMEFRAMES  timeFrame;   

public :
   
   TimeSignals    * signals;
   TimeIndicators * indicators;
   
   /**
    */
   Time
      ( string & currencySymbol , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
         : symbol ( currencySymbol ) , timeFrame ( frame )
   {
      indicators = new TimeIndicators ( currencySymbol , frame );
      signals    = new TimeSignals    ( indicators , currencySymbol , frame );
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