
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------

#property indicator_separate_window

#property indicator_buffers 20
#property indicator_plots   20

// ------------------------------------------------

#include "../WorkSpace/WorkSpace.mqh"

class Test 
   : public WorkSpace
{

public 
   :
   
   Test ( )
      : WorkSpace ( )
   {};

   /** 
    */
   void onInit () 
   {  
      Time * t = time( NULL , PERIOD_CURRENT );
      
      /*
      t.indicators.sar( ).plot( )
         .c0lor( clrRed       )
         .type ( DRAW_ARROW   )
         .style( STYLE_SOLID  )
         .width( 1            )
      ;*/
      
      
      t.indicators.rsi( ).plot( )
         .c0lor( clrGreen     )
         .type ( DRAW_LINE   )
         .style( STYLE_SOLID  )
         .width( 1            )
     ;
   };
};

Test * test = new Test( );

// ------------------------------------------------

#include "bootstrap.mqh"