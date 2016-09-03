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

#include "./Array.mqh"

template < typename T >
class ArraySelector
   //: public 
{

int indexOfRealData;
Array < Array < T > * > * items;

public :
   
   ArraySelector
      ( )
      : items ( new Array < Array < T > * > ( ) ) ,
        indexOfRealData( 0 )
   {
      items.update( new Array < T > ( ) ); 
   };
   
   Array < T > * select ( int index = -1 ) 
   {
      return items.dataOf( index == -1 ? indexOfRealData : index );
   };
      
};