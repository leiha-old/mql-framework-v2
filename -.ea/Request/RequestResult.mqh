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

class RequestResult
{

public
   :
   
   MqlTradeResult  result;
   
   /**
    * Code du résultat de l'opération
    */
   uint
      code( ) 
   {
      return result.retcode;
   }
   
   /**
    * Ticket du marché, s'il est exécuté
    */
   ulong
      deal( ) 
   {
      return result.deal;
   }
   
   /**
    * Ticket de l'ordre, s'il est exposé
    */
   ulong
      order( ) 
   {
      return result.order;
   }
   
   /**
    * Volume du marché confirmé par le broker
    */
   double
      volume( ) 
   {
      return result.volume;
   }
   
   /**
    * Prix dans le marché, confirmé par le broker
    */
   double
      price( ) 
   {
      return result.price;
   }
   
   /**
    * Prix courant en cours de l'offre (prix de recours)
    */
   double
      bid( ) 
   {
      return result.bid;
   }
   
   /**
    * Prix courant en cours de la requête (prix de recours)
    */
   double
      ask( ) 
   {
      return result.ask;
   }
   
   /**
    * Commentaire du broker pour l'opération 
    * (par défaut il est rempli par la description le code du retour du serveur commercial)
    */
   string
      comment( ) 
   {
      return result.comment;
   }
   
   /**
    * l'identificateur de la demande, s'établit par le terminal à l'envoi
    */
   uint
      id( ) 
   {
      return result.request_id;
   }
   
   /**
    * Code de retour d'un système de trading externe
    */
   uint
      codeExternal( ) 
   {
      return result.retcode_external;
   }   

};