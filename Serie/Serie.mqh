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

#include "../Array/Array.mqh"
#include "../Plot/Plot.mqh"

// ---
class Serie
   : public Array < double >
{

int slot;

static int TOTAL_BUFFERS;

Plot * seriePlot;

public 
   :
   
   Serie
      ( ENUM_INDEXBUFFER_TYPE type = INDICATOR_DATA )
      : slot      ( TOTAL_BUFFERS++ )        
   {
      SetIndexBuffer( slot , items , type );
   };
   
    /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      
   };
   
   Plot * plot() 
   {
      if( seriePlot == NULL ){
         seriePlot = new Plot( slot );
      }
      return seriePlot;
   }
  
};
int Serie::TOTAL_BUFFERS = 0;