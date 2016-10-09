
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

#include "../WorkSpace/WorkSpace.mqh"

class Test 
   : public WorkSpace
{

public 
   :
   
   /** 
    */
   void onInit () 
   {  
      Time * tf                 = time                      ( NULL , PERIOD_CURRENT );      
      BullsVsBears * BvsB       = tf.indicators.bullsVsBears( 89 );
      BullsVsBears * BvsBSignal = BvsB.signal               ( 55 , 34 );
      // ---      
      
      BvsB.average( 5 ).get( BullsVsBears::LINE_MAIN )
         .plot(  )
            .emptyValue( 0 )
            .c0lor( clrBlue     )
            .type ( DRAW_LINE    )
            .style( STYLE_DOT  )
            .width( 1            )
      ;
   
      /*
      BvsB.get( BullsVsBears::LINE_BEARS ).plot(  )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      BvsB.get( BullsVsBears::LINE_BULLS ).plot(  )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
      
     
      
      BvsBSignal.get( BullsVsBears::LINE_UP ).plot(  )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      BvsBSignal.get( BullsVsBears::LINE_DOWN ).plot(  )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      
      /*
      dow
         .plot( SignalDow::PEAK_TOP_TREND )
            .emptyValue ( 0 )
            .c0lor( clrGreen       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 3            )
      ;
      
      dow
         .plot( SignalDow::PEAK_BOTTOM_TREND )
            .emptyValue ( 0 )
            .c0lor( clrRed     )
            .type ( DRAW_LINE   )
            .style( STYLE_SOLID  )
            .width( 2            )
      ;*/
      
   };
      
};

Test * test = new Test( );

// ------------------------------------------------

#include "bootstrap.mqh"