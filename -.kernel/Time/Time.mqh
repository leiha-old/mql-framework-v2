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

#include "./Indicators.mqh"

// ---
template < typename T >
class Time
{

protected :
   
   

public :
   
   T * indicators;
   
   string           symbol;   
   ENUM_TIMEFRAMES  timeFrame;   
   
   /**
    */
   Time
      ( string & currencySymbol , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
         : symbol ( currencySymbol ) , timeFrame ( frame )
   {
      indicators = new T ( currencySymbol , frame );      
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
   };
};