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

// ---
template < typename TContainer >
class ArrayInjector
   : public Object
{

protected
   :

TContainer    * array;
int             prevCalculated;

public 
   :
   
   ArrayInjector
      ( )
         : prevCalculated ( 0 )        
   {
      
   };
   
   TContainer * attachTo
      ( TContainer * arrayDest )
   {
      array = arrayDest;
      return array;
   };
   
   // ---
   
   void 
      normalizeDouble
         ( int start , int toCopy )
   {
      for( int i = start , t = toCopy ; i < t ; i++ ) 
      {
         array.data.items[ i ] = NormalizeDouble( array.data.items[ i ] , 10 ) ;
      }  
   };
   
   // ---
   
   virtual void
      onCalculate
         ( int start , int toCopy ) 
   {
      populate       ( start , toCopy );
      normalizeDouble( start , toCopy );
   };
   
   virtual void
      populate( int start , int toCopy )
   {
   
   };
   
};