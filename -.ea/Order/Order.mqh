//+------------------------------------------------------------------+
//|                                                         Time.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

// ---

class Order 
{

public
   :
   
   /** 
    */
   long
      ticket (  ) 
   {
      return getInteger( ORDER_TICKET );
   };
   
   /** 
    */
   datetime
      timeSetup (  ) 
   {
      return getInteger( ORDER_TIME_SETUP );
   };
   
   /** 
    */
   ENUM_ORDER_TYPE
      type (  ) 
   {
      return getInteger( ORDER_TYPE );
   };
   
   /** 
    */
   ENUM_ORDER_STATE
      state (  ) 
   {
      return getInteger( ORDER_STATE );
   };
   
   /** 
    */
   datetime
      timeExpiration (  ) 
   {
      return getInteger( ORDER_TIME_EXPIRATION );
   };
   
   /** 
    */
   datetime
      timeDone (  ) 
   {
      return getInteger( ORDER_TIME_DONE );
   };
   
   /** 
    */
   long
      timeSetupMsc (  ) 
   {
      return getInteger( ORDER_TIME_SETUP_MSC );
   };
   
   /** 
    */
   long
      timeDoneMsc (  ) 
   {
      return getInteger( ORDER_TIME_DONE_MSC );
   };
   
   /** 
    */
   ENUM_ORDER_TYPE_FILLING
      typeFilling (  ) 
   {
      return getInteger( ORDER_TYPE_FILLING );
   };
   
   /** 
    */
   ENUM_ORDER_TYPE_TIME
      typeTime (  ) 
   {
      return getInteger( ORDER_TYPE_TIME );
   };
   
   /** 
    */
   long
      magic (  ) 
   {
      return getInteger( ORDER_MAGIC );
   };
   
   /** 
    */
   long
      orderPositionId (  ) 
   {
      return getInteger( ORDER_POSITION_ID );
   };
   
   /** 
    */
   long
      orderPositionById (  ) 
   {
      return getInteger( ORDER_POSITION_BY_ID );
   };
   
   /** 
    */
   double
      volumeInitial (  ) 
   {
      return getDouble( ORDER_VOLUME_INITIAL );
   };
   
   /** 
    */
   double
      volumeCurrent (  ) 
   {
      return getDouble( ORDER_VOLUME_CURRENT );
   };
   
   /** 
    */
   double
      priceOpen (  ) 
   {
      return getDouble( ORDER_PRICE_OPEN );
   };
   
   /** 
    */
   double
      stopLoss (  ) 
   {
      return getDouble( ORDER_SL );
   };
   
   /** 
    */
   double
      takeProfit (  ) 
   {
      return getDouble( ORDER_TP );
   };
   
   /** 
    */
   double
      priceCurrent (  ) 
   {
      return getDouble( ORDER_PRICE_CURRENT );
   };
   
   /** 
    */
   double
      priceStopLimit (  ) 
   {
      return getDouble( ORDER_PRICE_STOPLIMIT );
   };
   
   /** 
    */
   string
      symbol (  ) 
   {
      return getString( ORDER_SYMBOL );
   };
   
   /** 
    */
   string
      comment (  ) 
   {
      return getString( ORDER_COMMENT );
   };
   
protected
   :
   
   /** 
    */
   virtual string
      getString
         ( ENUM_ORDER_PROPERTY_STRING property ) 
   {
      return OrderGetString( property );
   };
   
   /** 
    */
   virtual long
      getInteger
         ( ENUM_ORDER_PROPERTY_INTEGER property ) 
   {
      return OrderGetInteger( property );        
   };
   
   /** 
    */
   virtual double
      getDouble
         ( ENUM_ORDER_PROPERTY_DOUBLE property ) 
   {
      return OrderGetDouble( property );        
   };

};