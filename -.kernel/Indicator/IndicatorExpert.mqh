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

#include "../Serie/Serie.mqh"

class IndicatorExpert
   : public ArrayMap < int , Serie * >
{

int handle;

public
   :
   
   IndicatorExpert ( int indicatorHandle )
      : handle ( indicatorHandle )
   {
      
   };
};