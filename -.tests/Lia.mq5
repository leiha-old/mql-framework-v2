
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------

#property indicator_separate_window 
//#property indicator_chart_window 
#property indicator_buffers 20
#property indicator_plots   20

// ------------------------------------------------

#include "../-.kernel/Indicator.mqh"
#include "../-.kernel/WorkSpace.mqh"
#include "../-.kernel/Candle.mqh"

class Lia
   : public Indicator 
{

public 
   :
   
   /** 
    */
   void onInit () 
   {      
      
      Candle * candle = indicators( NULL , PERIOD_CURRENT )
         .candle( )
            .configurator.digits( 2 ).end( ).serie( Candle::SERIE_CLOSE ).emptyValue( 0 ).end( )
      ;
     
   }
};

Lia * test = new Lia ( );

// ------------------------------------------------

#include "bootstrap.mqh"