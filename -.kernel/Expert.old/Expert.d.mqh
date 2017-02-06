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

#include "./Position.mqh"
#include "./ExpertWhen.mqh"
#include "./Signal.mqh"

// -----
/**
 * FACADE : ExpertFacade
 * --------------------
 */
interface ExpertFacade
   : public ObjectFacade
{

};

// -----
/**
 * CLASS : Expert
 * --------------------
 */
class Expert
   : public Object < Expert , ExpertFacade , Null >
{

public 
   :       
   Expert ( )
      : Object ( )        
   {
      
   };
   
   // -
   
   ExpertWhen < Expert > *
      when ( bool state , Signal * signal ) 
   {
      return new ExpertWhen < Expert > ( );
   };
   
};


void ttt () {

   Expert * expert = new Expert( );
   expert
      .when             ( true , ( new Signal( ) ) )
         .or            ( true , ( new Signal( ) ) )
         .and           ( true , ( new Signal( ) ) )
         .or            ( true , ( new Signal( ) ) )
         .Long          ( )
            .limit      ( -50 , 300 )
            .open       ( 0.1 )
               .when    ( true , ( new Signal( ) ) )
                  .close( )
            .end        ( )
         .end           ( )
      .end              ( )
   ;

   

   
   //( Serie < Indicator >::instance( ) ).end( );
   
   /*
   iFrame * d1 = ( O::o( "EUR/USD" , PERIOD_D1 ) );
   
   iSerie * serie  = d1.rsi( 14 ).main( )      
      .expert( )         
         .when             ( true  , ( new Signal( ) ).attach( serie2 ) )
            .or            ( false , ( new Signal( ) ).attach( serie2 ) )
            .buy           ( 0.1 )
               .limit      ( -50 , 300 )
               .when       ( false , ( new Signal( ) ).attach( serie2 ) )
                  .or      ( false , ( new Signal( ) ).attach( serie2 ) )
                  .modify  ( )
                     .limit( -50 , 300 )
                  .end     ( )
               .end        ( )
               
               .when       ( true  , ( new Signal( ) ).attach( 80 ) )
                  .and     ( false , ( new Signal( ) ).attach( 20 ) )
                  .close   ( )            
               .end        ( )
            .end           ( )
         .end              ( )
     */    
         
      
   ;
   
   
};
