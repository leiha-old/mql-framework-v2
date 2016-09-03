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

#include  "./Indicator.mqh"
#include "../Array/ArrayMap.mqh"

// ---
class Indicators
   : public ArrayMap < string , Indicator * >
{

public
   :
   
   TimeFacade * timeFrame;
   
   Indicators
      ( TimeFacade * timeFacade )
      : ArrayMap ( ) , timeFrame( timeFacade )
   {
      
   };
   
   
   
};

