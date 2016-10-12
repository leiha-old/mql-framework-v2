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

class ParabolicSARSignal
   : public Indicator
{
public
   :   
   int static LINE_PEAKUP;
   int static LINE_PEAKDOWN;
   int static LINE_TRENDUP;
   int static LINE_TRENDDOWN;
   
   ParabolicSARSignal
      (  )
      : Indicator (  )
   {
      
   };  
};
int ParabolicSARSignal::LINE_PEAKUP    = 1;
int ParabolicSARSignal::LINE_PEAKDOWN  = 2;
int ParabolicSARSignal::LINE_TRENDUP   = 3;
int ParabolicSARSignal::LINE_TRENDDOWN = 4;
// ---

class ParabolicSAR
   : public Indicator
{
public
   :   
   
   int static LINE_PRICE;
   int static LINE_AVERAGE;
   
   ParabolicSAR
      (  )
      : Indicator (  )
   {
      
   };
   
   virtual ParabolicSARSignal * 
      signal
         (  )
   {
      return NULL;
   };
};
int ParabolicSAR::LINE_PRICE     = 1;
int ParabolicSAR::LINE_AVERAGE   = 2;
