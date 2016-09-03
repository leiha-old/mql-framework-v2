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

#include "../Time/TimeFacade.mqh"
#include "../Serie/Series.mqh"

// ---
class IndicatorFacade
   //: public
{

public
   :  
   
   Series         * series;
   CurrencyFacade * currency;
   TimeFacade     * timeFrame;
   
   IndicatorFacade 
      ( TimeFacade * parentTime )
         : timeFrame ( parentTime ) , currency ( parentTime.currency )
      {
         series = new Series ( );
      }
      ;
};