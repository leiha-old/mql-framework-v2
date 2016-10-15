//+------------------------------------------------------------------+
//|                                                      SerieMA.mqh |
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

Serie * serieSrc;

Array < int > * periods;
Array < Serie * > * dataSets;

public 
   :
   
   SerieMA
      ( Serie * serie )
      : serieSrc ( serie )
   {
      periods = new Array < int > ( );
   };
   
   SerieMA * addPeriod ( int periodMa = 13 )
   {
      periods.update( periodMa );
      return GetPointer( this );
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      if ( dataSets == NULL ){
         dataSets = new Array < Serie * > ( );
         dataSets.update( serieSrc );
         for( int i = 0 , t = periods.total( ) - 1 ; i < t ; i++ ) 
         {
            Serie * s = new Serie ( );
            s.resize( serieSrc.total( ) );            
            dataSets.update( s );
         }
         dataSets.update( GetPointer( this ) );
      }
   
      for( int i = 1 , t = dataSets.total( ) ; i < t ; i++ ) 
      {
        onCalculate( periods.items[ i - 1 ] , dataSets.items[ i ] , dataSets.items[ i - 1 ] , start , toCopy ) ;
      }
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int period , Serie * dest , Serie * src , int start , int toCopy ) 
   {
      double result;
      for( int i = 0 , t = ( toCopy == 1 ? 1 : toCopy - period ) ; i < t ; i++ ) 
      {
         result = 0.0;
         for( int ii = period - 1 ; ii >= start ; ii-- ) {
            result += src.items[ i + ii ];
         }
         dest.items[ i ] = ( result / period );
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