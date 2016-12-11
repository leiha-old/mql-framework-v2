// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

template < typename T >
class Plot
{
   T * parent;
   int _slot;

public 
   :   

   /** 
    */
   Plot( int slot , T * parentSerie )
      : _slot ( slot ) , parent ( parentSerie )
      {
      
      }
      ;  

   /** 
    */
   Plot < T > * 
      type
         ( ENUM_DRAW_TYPE type = DRAW_LINE ) 
   {
      return setInteger( PLOT_DRAW_TYPE, type );
   };

   /** 
    */
   int 
      slot
         (  ) 
   {
      return _slot;
   };
   
   /** 
    */
   Plot < T > * 
      emptyValue
         ( double value = 0 ) 
   {
      return setDouble( PLOT_EMPTY_VALUE, value );
   };
   
   /** 
    */
   Plot < T > * 
      label
         ( string label ) 
   {
      return setString( PLOT_LABEL, label );
   };
   
   /**
    */
   Plot < T > * 
      begin
         ( int shift = 0 ) 
   {
      return setInteger( PLOT_DRAW_BEGIN, shift );
   };
   
   /**
    */
   Plot < T > * 
      c0lor
         ( int c0lor ) 
   {
      return setInteger( PLOT_LINE_COLOR, c0lor );
   };      
   
   /**
    */
   Plot < T > * 
      c0lor
         ( int c0lor, int i ) 
   {
      return setInteger( PLOT_LINE_COLOR, c0lor, i );      
   };
   
   /**
    */
   Plot < T > * 
      width
         ( int width = 1 ) 
   {
      return setInteger( PLOT_LINE_WIDTH, width );
   };
   
   /**
    */
   Plot < T > * 
      style
         ( ENUM_LINE_STYLE style = STYLE_SOLID ) 
   {
      return setInteger( PLOT_LINE_STYLE, style );
   };

protected 
   :
      
   /** 
    */
   Plot < T > * 
      setString
         ( ENUM_PLOT_PROPERTY_STRING property, string value ) 
   {
      PlotIndexSetString( slot(), property, value );  
      return GetPointer( this );
   };
   
   /** 
    */
   Plot < T > * 
      setInteger
         ( ENUM_PLOT_PROPERTY_INTEGER property, int value ) 
   {
      PlotIndexSetInteger( slot(), property, value );  
      return GetPointer( this );
   };
   
   /** 
    */
   Plot < T > * 
      setInteger
         ( ENUM_PLOT_PROPERTY_INTEGER property, int value, int i ) 
   {
      PlotIndexSetInteger( slot(), property, value, i );  
      return GetPointer( this );
   };
   
   /** 
    */
   Plot < T > * 
      setDouble
         ( ENUM_PLOT_PROPERTY_DOUBLE property, double value ) 
   {
      PlotIndexSetDouble( slot(), property, value );  
      return GetPointer( this );
   };
};