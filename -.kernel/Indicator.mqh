//+------------------------------------------------------------------+
//|                                                    Indicator.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./WorkSpace.mqh"
#include "./Indicator/Configurator.mqh"
#include "./Serie.mqh"
#include "./Serie/Injector.mqh"
#include "./Indicators.mqh"


class Indicator
   : public WorkSpace < 
                                  Indicator   ,
      Indicators                < Indicator > ,
      IndicatorConfigurator     < Indicator > ,
      Serie                     < Indicator > ,  
      SerieConfigurator < Serie < Indicator > >    
   >
{

public
   :
   
   Indicator
      ( ) 
      : WorkSpace ( )
   {
   
   };
};