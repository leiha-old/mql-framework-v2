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

#include "../../Object.mqh"

int TOTAL_SLOTS = 0;

// ---
template < typename TParent , typename TSerie , typename TSerieConfigurator >
class SerieConfiguratorTemplate
   : protected Object
{

int                   serieSlot;
ENUM_INDEXBUFFER_TYPE serieType;
string                serieCurrency;
ENUM_TIMEFRAMES       serieTime;

TSerie  * serieData;
TParent * parent;

public
   :
   
   SerieConfiguratorTemplate
      ( TParent * parentObject , TSerie * data )
      : parent        ( parentObject ),
        serieData     ( data ),
        serieSlot     ( TOTAL_SLOTS++ ),
        serieType     ( INDICATOR_CALCULATIONS ),
        serieCurrency ( NULL ),
        serieTime     ( PERIOD_CURRENT )
   {
      
   };
   
   TParent * end () { return parent; };
   
    // ---
   
   TSerieConfigurator * 
      type
         ( ENUM_INDEXBUFFER_TYPE type ) 
   {
      serieType = type;
      return pointer( );
   };
   
   ENUM_INDEXBUFFER_TYPE
      type
         ( ) 
   {
      return serieType;
   };
   
   int
      slot
         ( ) 
   {
      return serieSlot;
   };
   
   ENUM_TIMEFRAMES
      time
         ( ) 
   {
      return serieTime;
   };
   
   string
      currency
         ( ) 
   {
      return serieCurrency;
   };
   
   /** 
    */
   TSerieConfigurator * 
      type
         ( ENUM_DRAW_TYPE type = DRAW_LINE ) 
   {
      return setInteger( PLOT_DRAW_TYPE, type );
   };

   /** 
    */
   TSerieConfigurator * 
      emptyValue
         ( double value = 0 ) 
   {
      return setDouble( PLOT_EMPTY_VALUE, value );
   };
   
   /** 
    */
   TSerieConfigurator * 
      label
         ( string label ) 
   {
      return setString( PLOT_LABEL, label );
   };
   
   /**
    */
   TSerieConfigurator * 
      begin
         ( int shift = 0 ) 
   {
      return setInteger( PLOT_DRAW_BEGIN, shift );
   };
   
   /**
    */
   TSerieConfigurator * 
      c0lor
         ( int c0lor ) 
   {
      return setInteger( PLOT_LINE_COLOR, c0lor );
   };      
   
   /**
    */
   TSerieConfigurator * 
      c0lor
         ( int c0lor, int i ) 
   {
      return setInteger( PLOT_LINE_COLOR, c0lor, i );      
   };
   
   /**
    */
   TSerieConfigurator * 
      width
         ( int width = 1 ) 
   {
      return setInteger( PLOT_LINE_WIDTH, width );
   };
   
   /**
    */
   TSerieConfigurator * 
      style
         ( ENUM_LINE_STYLE style = STYLE_SOLID ) 
   {
      return setInteger( PLOT_LINE_STYLE, style );
   };
   
   // ---
   
   void 
      attachToTerminal
         ( ) 
   {
      SetIndexBuffer( serieSlot , serieData.data.items , serieType );
   };
   
protected
   :
   
   /** 
    */
   TSerieConfigurator * 
      setString
         ( ENUM_PLOT_PROPERTY_STRING property, string value ) 
   {
      PlotIndexSetString( slot(), property, value );  
      return pointer( );
   };
   
   /** 
    */
   TSerieConfigurator * 
      setInteger
         ( ENUM_PLOT_PROPERTY_INTEGER property, int value ) 
   {
      PlotIndexSetInteger( slot(), property, value );  
      return pointer( );
   };
   
   /** 
    */
   TSerieConfigurator * 
      setInteger
         ( ENUM_PLOT_PROPERTY_INTEGER property, int value, int i ) 
   {
      PlotIndexSetInteger( slot(), property, value, i );  
      return pointer( );
   };
   
   /** 
    */
   TSerieConfigurator * 
      setDouble
         ( ENUM_PLOT_PROPERTY_DOUBLE property, double value ) 
   {
      PlotIndexSetDouble( slot(), property, value );  
      return pointer( );
   };
   
};