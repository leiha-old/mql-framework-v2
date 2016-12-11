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

#include "../Object.mqh"

template < typename T >
class ArrayAverage
   : public Object
{

T * arraySrc;

public
   :
   
   ArrayAverage
      ( T * array ) 
         : arraySrc ( array )
   {
      
   };
   
   // ---
   
   T *
      simple( int & periods [] , int start = 0 ) 
   {
      
      int tPeriods = ArraySize( periods );
      Array < T * > * dataSets = new Array < T * > ( );
      dataSets.update( pointer( ) );      
            
      for( int i = 1 ; i < tPeriods ; i++ ) 
      {
         dataSets.items[ 1 ] = new T ( );
         if( false == simple( periods[ i - 1 ] , dataSets.items[ i ] , dataSets.items[ i - 1 ] , start ) )
         {
            return NULL;
         }
      }
      return dataSets.items[ tPeriods - 1 ];
      
   };
   
   T *
      simple( int period , int start = 0 ) 
   {
      T * array = new T( );
      if( false == simple( period , pointer( ) , array , start ) )
      {
         return NULL;
      }
      return array;
      
   }; 

protected
   :
   
   bool
      simple( int period , T * arraySource , T * arrayDest , int start = 0 ) 
   {
      double result;
      for( int i = start , t = ( start + period ) ; i < t ; i++ ) 
      {
         result = 0.0;
         for( int ii = period - 1 ; ii >= start ; ii-- ) {
            result += arraySource.items[ i + ii ];
         }
         arrayDest.items[ i ] = ( result / period );
         return true;
      }
      return false;
   };

};