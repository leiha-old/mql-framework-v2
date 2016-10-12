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

#include "../-.kernel/Indicator/Indicator.mqh"

// ---

class MovingAverageSignal
   : public Indicator
{
public
   :   
   int static LINE_UP;
   int static LINE_DOWN;
   
   MovingAverageSignal
      (  )
      : Indicator (  )
   {
      
   };  
};
int MovingAverageSignal::LINE_UP   = 1;
int MovingAverageSignal::LINE_DOWN = 2;
// ---

class MovingAverage
   : public Indicator
{
public
   :   
   
   MovingAverage
      (  )
      : Indicator (  )
   {
      
   };
   
   virtual MovingAverageSignal * 
      signal
         (  )
   {
      return NULL;
   };
};