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

#include "./Serie.mqh"

// ---
class SerieHistory
   : public Serie
{

protected
   :
   
   string currencyName;
   
   ENUM_TIMEFRAMES timeName;

public
   :
   
   SerieHistory
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
      : Serie (  ) , currencyName ( currency ) , timeName ( time )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {};

};

class SerieLow
   : public SerieHistory
{

public
   :
   
   SerieLow
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
      : SerieHistory ( currency , time )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      CopyLow( currencyName , timeName , start , toCopy , items );
   };

};

class SerieHigh
   : public SerieHistory
{

public
   :
   
   SerieHigh
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
      : SerieHistory ( currency , time )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      CopyHigh( currencyName , timeName , start , toCopy , items );
   };

};

class SerieClose
   : public SerieHistory
{

public
   :
   
   SerieClose
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
      : SerieHistory ( currency , time )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      CopyClose( currencyName , timeName , start , toCopy , items );
   };

};

class SerieOpen
   : public SerieHistory
{

public
   :
   
   SerieOpen
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
      : SerieHistory ( currency , time )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      CopyOpen( currencyName , timeName , start , toCopy , items );
   };

};