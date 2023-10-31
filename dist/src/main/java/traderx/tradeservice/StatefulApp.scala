package traderx.tradeservice

/** Generated based on TradeService.TradeOrderController
*/
case class StatefulApp[K, C, S, E](
  businessLogic: morphir.sdk.Maybe.Maybe[S] => C => (morphir.sdk.Maybe.Maybe[S], E)
){}