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

#include "../Currency/CurrencyFacade.mqh"

// ---
class TimeFacade
{

public
   :
   
   ENUM_TIMEFRAMES  timeFrame;
   CurrencyFacade * currency;
   
   
   TimeFacade 
      ( CurrencyFacade * parentCurrency , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
       : currency ( parentCurrency ) , timeFrame ( time )
      {
        
      }
      ;
};