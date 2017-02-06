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
template < typename TIndicators >
class WorkSpaceTimeFrame
   : public Object
{

public
   :
   
   TIndicators * indicators;
   
   WorkSpaceTimeFrame ( ) 
      : Object( )
   {
      indicators = new TIndicators ( );
   };
};

// -----
template < typename TTimeFrame >
class WorkSpaceTimeFrames
   : public ArrayMap < ENUM_TIMEFRAMES , TTimeFrame * >
{

public
   :
   
   WorkSpaceTimeFrames ( ) 
      : ArrayMap ( )
   {
      
   };
};