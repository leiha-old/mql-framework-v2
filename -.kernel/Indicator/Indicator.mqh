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

#include "../Array/ArrayMap.mqh"
#include "../Serie/Serie.mqh"

// -----

interface IndicatorFacade
   : public ObjectFacade
{

};

// -----

template < 
   typename TIndicator , 
   typename TIndicatorFacade ,
   typename TObjectParent ,
>
class IndicatorTemplate
   : public Object < TIndicator , TIndicatorFacade , TObjectParent >
{

ArrayMap < Serie < TIndicator > * , int > * _series;

public 
   :       
   IndicatorTemplate ( )
      : Object ( )        
   {
      _series = new ArrayMap < Serie < TIndicator > * , int > ( );      
   };
   
   // -----
   
   /**
    * Get dataSet
    */   
   Serie < TIndicator > *
      serie ( int index )
   {
      return _series.get( index );
   }; 
   
   /**
    * Attach dataSet 
    */
   TIndicator *
      serie ( int name , Serie < TIndicator > * serie )
   {  
      _series.update( name , serie );
      return pointer( );
   };

};

// -----

// -----

template < 
   typename TTimeFrameParent
>
class Indicator
   : public IndicatorTemplate < Indicator , IndicatorFacade , TTimeFrameParent >
{

public 
   :       
   Indicator ( )
      : IndicatorTemplate ( )        
   {
      
   };   

};

template < 
   typename TCurrency ,
   typename TTimeFrameParent ,
   typename TIndicator
>
class O
{

public 
   :   
   
   iFrame * static o ( string currency , ENUM_TIMEFRAMES frame ) {};    
   
};

void ttt () {
   
   //( Serie < Indicator >::instance( ) ).end( );
   
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
         
         
      
   ;
   
   
};

