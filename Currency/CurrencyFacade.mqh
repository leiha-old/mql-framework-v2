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

// ---
class CurrencyFacade
{

public
   :
   
   string symbol;
   
   CurrencyFacade ( string currencySymbol = NULL )
       : symbol ( currencySymbol )
      {}
   ;
};