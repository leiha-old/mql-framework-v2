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

public
   :
   
   SerieBuffer
      ( int handle , int buffer = MAIN_LINE )
      : serieHandle ( handle ) ,
        serieBuffer ( buffer )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      CopyBuffer( serieHandle , serieBuffer , start , toCopy , items );
   };

};