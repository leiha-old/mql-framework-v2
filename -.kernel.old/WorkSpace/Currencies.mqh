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
template < typename TTimeFrame >
class WorkSpaceCurrency
   : public Object
{

public
   :
   
   WorkSpaceTimeFrames < TTimeFrame > * timeframes;
   
   WorkSpaceCurrency ( ) 
      : Object( )
   {
      timeframes = new WorkSpaceTimeFrames < TTimeFrame > ( );
   };

};

// -----
template < typename TCurrency >
class WorkSpaceCurrencies
   : public ArrayMap < string , TCurrency * >
{

public
   :

   WorkSpaceCurrencies ( ) 
      : ArrayMap ( )
   {
      
   };
};