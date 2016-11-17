//+------------------------------------------------------------------+
//|                                                  SerieBuffer.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./Serie.mqh"

// ---
class SerieBuffer
   : public Serie
{

protected
   :

   int serieHandle;
   int serieBuffer;
   int prevCalculated;

public
   :
   
   SerieBuffer
      ( int handle , int buffer = MAIN_LINE )
      : Serie          (        ) ,
        serieHandle    ( handle ) ,
        serieBuffer    ( buffer ) ,
        prevCalculated ( 0 )
   {};
   
   virtual int 
      calculated( ) 
   {
      return prevCalculated;
   };
   
   virtual int 
      totalOfHistory( ) 
   {
      return BarsCalculated( serieHandle );
   };
   
   bool 
      copy( int start , int count , int buffer ) 
   {
      return ( CopyBuffer( serieHandle , buffer , start , count , items ) <= 0 );
   };
   
   bool 
      copy( int start , int count ) 
   {
      return ( CopyBuffer( serieHandle , serieBuffer , start , count , items ) <= 0 );
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      CopyBuffer( serieHandle , serieBuffer , 0 , toCopy , items );
      for( int i = 0 , t = toCopy ; i < t ; i++ ) 
      {
         items[ i ] = NormalizeDouble( items[ i ] , 10 ) ;
      }
      prevCalculated = total( );
   };

};