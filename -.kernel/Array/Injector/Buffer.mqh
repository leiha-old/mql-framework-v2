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

#include "./Injector.mqh"

// ---
template < typename T >
class ArrayInjectorBuffer
   : public ArrayInjector
{

int   bufferHandle;
int   bufferLine;

protected
   :

public 
   :
   
   ArrayInjectorBuffer
      ( T * array , int handle , int buffer = MAIN_LINE )
         : ArrayInjector( arrayDest ),
           bufferHandle  ( handle ) ,
           bufferLine    ( buffer )            
   {
      
   };
   
   // ---
   
   virtual void
      populate( int start , int toCopy ) 
   {
      CopyBuffer( bufferHandle , bufferLine , 0 , toCopy , array.items );
          
   };
};