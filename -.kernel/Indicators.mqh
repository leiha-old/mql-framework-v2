//+------------------------------------------------------------------+
//|                                                    WorkSpace.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// ---
#include "./WorkSpace/Indicators.mqh"
#include "./Candle.mqh"


// -----
template < typename TIndicator >
class Indicators
   : public WorkSpaceIndicators < TIndicator >
{

public
   :
   
   Indicators ( )
      : WorkSpaceIndicators ( )
   {
   
   };
   
   Candle * candle ()
   {
      return new Candle ( );
   }; 
};