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

#include "./ExpertWhenTemplate.mqh"

// -----
/**
 * CLASS  : ExpertPositionWhen
 * --------------------
 */
template < 
   typename TPositionParent
>
class ExpertPositionWhen
   : public ExpertWhenTemplate < 
                                  ExpertPositionWhen < TPositionParent >   ,
      ExpertWhenClause < Signal , ExpertPositionWhen < TPositionParent > > ,
      TPositionParent , 
      TPositionParent
   >
{

public 
   :       
   ExpertPositionWhen ( )
      : ExpertWhenTemplate ( )        
   {
      
   };
   
   // -  
   
   
          
};