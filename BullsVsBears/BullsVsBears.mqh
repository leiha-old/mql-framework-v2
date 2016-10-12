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

class BullsVsBearsSignal
   : public Indicator
{
public
   :   
   int static LINE_UP;
   int static LINE_DOWN;
   
   BullsVsBearsSignal
      (  )
      : Indicator (  )
   {
      
   };  
};
int BullsVsBearsSignal::LINE_UP   = 1;
int BullsVsBearsSignal::LINE_DOWN = 2;

// ---

class BullsVsBears
   : public Indicator
{
public
   :   
   int static LINE_RANGE;
   int static LINE_AVERAGE;
   int static LINE_BULLS;
   int static LINE_BEARS; 
   
   BullsVsBears
      (  )
      : Indicator (  )
   {
      
   };
   
   virtual BullsVsBearsSignal * 
      signal
         ( int ma1 = 34 , int ma2 = 55 )
   {
      return NULL;
   };
};
int BullsVsBears::LINE_BULLS   = 1;
int BullsVsBears::LINE_BEARS   = 2;
int BullsVsBears::LINE_RANGE   = 3;
int BullsVsBears::LINE_AVERAGE = 4;
