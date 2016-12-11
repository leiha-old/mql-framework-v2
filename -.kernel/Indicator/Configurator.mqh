//+------------------------------------------------------------------+
//|                                                    Indicator.mqh |
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
template < typename T >
class IndicatorConfigurator
   : public Object
{

T                * parent;
Array < double > * levels;

protected
   :
   
   /** 
    */
   IndicatorConfigurator * 
      setString
         ( ENUM_CUSTOMIND_PROPERTY_STRING property , string value ) 
   {
      IndicatorSetString( property , value );
      return pointer( );
   };
   
   /** 
    */
   IndicatorConfigurator * 
      setInteger
         ( ENUM_CUSTOMIND_PROPERTY_INTEGER property , int value ) 
   {
      IndicatorSetInteger( property , value );  
      return pointer( );
   };
   
   /** 
    */
   IndicatorConfigurator * 
      setDouble
         ( ENUM_CUSTOMIND_PROPERTY_DOUBLE property , double value ) 
   {
      IndicatorSetDouble( property , value );  
      return pointer( );
   };
   
   /** 
    */
   void
      setLevels 
         ( )
   {
      int end = levels.total( );
      IndicatorSetInteger( INDICATOR_LEVELS , end );
      for 
         ( int i = 0 ; i < end ; i++ )
      {
         IndicatorSetDouble( INDICATOR_LEVELVALUE , i , levels.get( i ) );         
      }
   };
   
public
   :
   
   IndicatorConfigurator
      ( T * parentIndicator )
      : parent ( parentIndicator )
   {
      levels = new Array < double > ( );
   };
   
   T * end () { return parent; };
   
   /** 
    * Set levels for the Indicator
    */
   IndicatorConfigurator * 
      level
         ( double value ) 
   {
      levels.update( value );
      return pointer( );      
   };
   
   /** 
    * Set Minimum Value for the Indicator
    */
   IndicatorConfigurator * 
      minimum
         ( double value ) 
   {
      return setDouble( INDICATOR_MINIMUM , value );
   };
   
   /** 
    * Set Maximum Value for the Indicator
    */
   IndicatorConfigurator * 
      maximum
         ( double value ) 
   {
      return setDouble( INDICATOR_MAXIMUM , value );
   };
   
   /** 
    */
   IndicatorConfigurator * 
      shortName
         ( string name ) 
   {
      return setString( INDICATOR_SHORTNAME , name );
   };
   
   /** 
    * Set Number of digits for all series displayed
    */
   IndicatorConfigurator * 
      digits
         ( int digits ) 
   {
      return setInteger( INDICATOR_DIGITS , digits );
   };
};