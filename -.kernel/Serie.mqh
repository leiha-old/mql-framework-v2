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

template < typename TParent >
class Serie
   : public Object
{

public 
   :
   
   Array             < double >          * data ;
   SerieTemplate     < TParent , Serie > * engine;
   SerieConfigurator < TParent , Serie > * config  ;
          
   Serie
      ( TParent * serieParent = NULL )
      : Object ( )
   {
      engine = new SerieTemplate     < TParent , Serie > ( serieParent );
      config = new SerieConfigurator < TParent , Serie > ( serieParent , pointer ( ) );
      data   = new Array < double >  ( true , 0 );
   };
};