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

#include "../Array/ArrayMap.mqh"

#include "./Serie.mqh"
#include "./SerieBuffer.mqh"
#include "./SerieHistory.mqh"

class Series
   : public ArrayMap < int , Serie * >
{

protected
   :
   
   string currencyName;
   
   ENUM_TIMEFRAMES timeName;

public
   :
   
   Series
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
      : ArrayMap (  ) , currencyName ( currency ) , timeName ( time )
   {};
   

   SerieBuffer * buffer
      ( int handle , int buffer = MAIN_LINE )
   {
      SerieBuffer * serie = new SerieBuffer ( handle , buffer );
      update( buffer , serie );
      
      return serie;
   };
   
};