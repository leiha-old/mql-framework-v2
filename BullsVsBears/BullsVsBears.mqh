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

class BullsVsBears
   : public Indicator
{
public
   :   
   int static LINE_BEARS;
   int static LINE_BULLS;    
   int static LINE_MAIN;
   int static LINE_UP;
   int static LINE_AVERAGE;
   int static LINE_DOWN;      
   
   BullsVsBears
      (  )
      : Indicator (  )
   {
      
   };   
};
int BullsVsBears::LINE_BEARS   = 0;
int BullsVsBears::LINE_BULLS   = 1;
int BullsVsBears::LINE_MAIN    = 2;
int BullsVsBears::LINE_AVERAGE = 3;
int BullsVsBears::LINE_DOWN    = 4; 
int BullsVsBears::LINE_UP      = 5;   
