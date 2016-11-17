//+------------------------------------------------------------------+
//|                                                        Serie.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./SerieEngine.mqh"

// ---
class Serie
   : public SerieEngine < double >
{

protected
   :

Plot                  * seriePlot;

public 
   :
   
   Serie
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
         :  SerieEngine ( currency , time )
            
   {
      
   };
   
   virtual void 
      end  
         ( ) 
   {
      SetIndexBuffer( slot( ) , items , type );
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
         ( bool displayData = true ) 
   {
      if( seriePlot == NULL ){
         seriePlot = new Plot( slot( ) );
         if( displayData == true ) {
            this.setType( INDICATOR_DATA );
         }
      }
      return seriePlot;
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
         ( Array < double > * array , int candle = 0 ) 
   {
      return ( items[ candle ] < array.items[ candle ] );
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
         ( Array < double > * array , int candle = 0 ) 
   {
      return ( items[ candle ] <= array.items[ candle ] );
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
         ( Array < double > * array , int candle = 0 ) 
   {
      return ( items[ candle ] == array.items[ candle ] );
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
         ( Array < double > * array , int candle = 0 ) 
   {
      return ( items[ candle ] >= array.items[ candle ] );
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
         ( Array < double > * array , int candle = 0 ) 
   {
      return ( items[ candle ] > array.items[ candle ] );
   }; 
  
};