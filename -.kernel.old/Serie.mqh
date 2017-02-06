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

#include "./Serie/Template.mqh"
#include "./Serie/Configurator.mqh"

template < typename TParent , typename TSerie , typename TSerieConfigurator >
class Serie
   : public SerieTemplate < TParent , Serie , TSerieConfigurator >
{

public 
   :
   
   Serie
      ( TParent * serieParent )
      : SerieTemplate ( serieParent )
   {
      
   };
};