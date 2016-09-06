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

#include "./Serie.mqh"

// ---
class SerieMA
   : public Serie
{

int     period;
Serie * serieSrc;

public 
   :
   
   SerieMA
      ( Serie * serie )
      : serieSrc ( serie ) , period ( 13 )
   {
      
   };
   
   SerieMA * setPeriod ( int periodMa = 13 )
   {
      period = periodMa;
      return GetPointer( this );
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      double result;
      for( int i = start , t = ( toCopy > 1 ? toCopy - period : toCopy ) ; i < t ; i++ ) 
      {
         result = 0.0;
         for( int ii = period - 1 ; ii >= start ; ii-- ) {
            result += serieSrc.get( i + ii );
         }
         items[ i ] = ( result / period );
      }
   };
   
   /**
    *
    *//*
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      double dSmoothFactor = 2.0 / ( 1.0 + period );
      
      int t = toCopy;
      if( toCopy > 1 ) {
         t -= period;
      } else {
         
      }
      
      for( int i = start , t =  ; i < t ; i++ ) 
      {
         items[ i ] = ( serieSrc.get( i ) * dSmoothFactor ) + ( items[ i + 1] * ( 1.0 - dSmoothFactor) );
         
      }
   };*/
   
};