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

#include "./-.kernel/Time/Indicators.mqh"
#include "./-.kernel/Indicator/IndicatorExpert.mqh"
#include "./BullsVsBears/BullsVsBearsSignal.mqh"

// ---
class IndicatorsExpert
   : public TimeIndicators
{

protected
   :
   

public
   :
   
   /**
    */
   IndicatorsExpert 
      ( string & currencySymbol , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
         : TimeIndicators ( currencySymbol , frame ) 
   {
       
   };
      
  /** 
    * Indicator : Bulls Vs Bears Power
    */
   BullsVsBearsSignal * 
      bullsVsBears
         ( int period = 13 )
   {
      int handle = iCustom( symbol , timeFrame 
         , "Lia\\-.tests\\LiaBvsB" 
         /*, period */ 
      );      
      return new BullsVsBearsSignal( handle );      
   };
   
   /** 
    * Indicator : Parabolic SAR
    */
   IndicatorExpert * 
      parabolicSAR
         ( double step = 0.02 , double maximum = 0.2 , int periodMA = 55 , int periodMASmooth = 13 )
   {
      return new IndicatorExpert( 
         iCustom( symbol , timeFrame
            , "Lia\\-.tests\\LiaSAR"
            //, step
            //, maximum
            //, periodMA
            //, periodMASmooth
         ) 
      );
   };   
};