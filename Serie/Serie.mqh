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

int                     slot;
ENUM_INDEXBUFFER_TYPE   type;
Plot                  * seriePlot;

static int              TOTAL_BUFFERS;

public 
   :
   
   Serie
      ( )
      : slot ( TOTAL_BUFFERS++ ) , 
        type ( INDICATOR_DATA  )
   {
      enableReverse( true ) ;
   };
   
   virtual void 
      end 
         ( ) 
   {
      SetIndexBuffer( slot , items , type );
   };
   
   virtual void
      onCalculate
         ( int start , int toCopy ) 
   {
      
   };
   
   Serie * setType
      ( ENUM_INDEXBUFFER_TYPE serieType = INDICATOR_DATA ) 
   {
      type = serieType;
      return GetPointer( this );
   };
   
   // ---
   
   Plot * 
      plot
         ( ) 
   {
      if( seriePlot == NULL ){
         seriePlot = new Plot( slot );
      }
      return seriePlot;
   };
   
   // ---
   
   bool 
      isCrossDown
         ( double value , int candle = 0 ) 
   {
      return (
            items[ candle + 1 ] > value 
         && items[ candle     ] < value 
      );
   };

   bool 
      isCrossDown
         ( Serie * serie , int candle = 0 ) 
   {
      return (
            items[ candle + 1 ] > serie.items[ candle + 1 ] 
         && items[ candle     ] < serie.items[ candle     ] 
      );
   };
   
   // ---
   
   bool 
      isCrossUp
         ( double value , int candle = 0 ) 
   {
      return (
            items[ candle + 1 ] < value
         && items[ candle     ] > value
      );
   };
   
   bool 
      isCrossUp
         ( Serie * serie , int candle = 0 ) 
   {
      return (
            items[ candle + 1 ] < serie.items[ candle + 1 ] 
         && items[ candle     ] > serie.items[ candle     ] 
      );
   };
   
   // ---
   
   bool 
      isInferior
         ( double value , int candle = 0 ) 
   {
      return ( items[ candle ] < value );
   };
   
   bool 
      isInferior
         ( Serie * serie , int candle = 0 ) 
   {
      return ( items[ candle ] < serie.items[ candle ] );
   };
   
   // ---
   
   bool 
      isInferiorOrEqual  
         ( double value , int candle = 0 ) 
   {
      return ( items[ candle ] <= value );
   };
   
   bool 
      isInferiorOrEqual  
         ( Serie * serie , int candle = 0 ) 
   {
      return ( items[ candle ] <= serie.items[ candle ] );
   };
   
   // ---
   
   bool 
      isEqual            
         ( double value , int candle = 0 ) 
   {
      return ( items[ candle ] == value );
   };
   
   bool 
      isEqual            
         ( Serie * serie , int candle = 0 ) 
   {
      return ( items[ candle ] == serie.items[ candle ] );
   };
   
   // ---
   
   bool 
      isSuperiorOrEqual  
         ( double value , int candle = 0 )
   {
      return ( items[ candle ] >= value );
   };
   
   bool 
      isSuperiorOrEqual  
         ( Serie * serie , int candle = 0 ) 
   {
      return ( items[ candle ] >= serie.items[ candle ] );
   };
   
   // ---
   
   bool
      isSuperior
         ( double value , int candle = 0 )
   {
      return ( items[ candle ] > value );
   };
   
   bool
      isSuperior
         ( Serie * serie , int candle = 0 ) 
   {
      return ( items[ candle ] > serie.items[ candle ] );
   }; 
  
};
int Serie::TOTAL_BUFFERS = 0;