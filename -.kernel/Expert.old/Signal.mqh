//+------------------------------------------------------------------+
//|                                                        Serie.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Object/Object.mqh"

// -----
/**
 * FACADE : SignalFacade
 * --------------------
 */
interface SignalFacade
   : public ObjectFacade
{

};

// -----
/**
 * CLASS : Signal
 * --------------------
 */
class Signal
   : public Object < Signal , SignalFacade , Null >
{

};