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

#include "./Configurator/Template.mqh"

// ---

template < typename TSerie >
class SerieConfigurator
   : public SerieConfiguratorTemplate < TSerie , SerieConfigurator < TSerie > >
{

public
   :
   
   SerieConfigurator
      ( TSerie * parentSerie )
      : SerieConfiguratorTemplate ( parentSerie )        
   {
      
   };
   
};