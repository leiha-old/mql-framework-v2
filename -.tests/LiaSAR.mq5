
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

#include "../-.kernel/WorkSpace/WorkSpace.mqh"
#include "../Indicators.mqh"

template < typename T >
class LiaSAR 
   : public WorkSpace < T >
{

public 
   :
   
   /** 
    */
   void onInit () 
   {  
      Time                  < T >    * tf          = time                      ( NULL , PERIOD_CURRENT );   
      ParabolicSARIndicator < T * >  * Psar        = tf.indicators.parabolicSAR ( 0.02 , 0.2 , 89 , 21 );
      ParabolicSARSignal    < T * >  * PsarSignal  = Psar.signal                (  );
      
      // ---      
      
      /*
      Psar
         .plot( ParabolicSAR::LINE_MAIN )
            //.emptyValue( 0 )
            .c0lor( clrSilver    )
            .type ( DRAW_ARROW   )
            .style( STYLE_DOT  )
            .width( 1            )
      ;*/
      
      Psar
         .plot( ParabolicSAR::LINE_AVERAGE )
            //.emptyValue( 0 )
            .c0lor( clrBrown     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Psar
         .plot( ParabolicSAR::LINE_PRICE )
            //.emptyValue( 0 )
            .c0lor( clrOrange    )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Psar
         .plot( ParabolicSAR::LINE_TRENDUP , false )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Psar
         .plot( ParabolicSAR::LINE_TRENDDOWN , false )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      PsarSignal
         .plot( ParabolicSAR::LINE_PEAKUP , false )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      PsarSignal
         .plot( ParabolicSAR::LINE_PEAKDOWN , false )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
   }
};

LiaSAR < Indicators > * test = new LiaSAR < Indicators >( );

// ------------------------------------------------

#include "bootstrap.mqh"