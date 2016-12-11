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
#include "../ArrayMap.mqh"


// -----
template < typename TIndicator >
class WorkSpaceIndicators
   : public ArrayMap < int , TIndicator * >
{

public
   :
   
   WorkSpaceIndicators ( )
      : ArrayMap ( )
   {
   
   };
};