package traderx.tradeprocessor

/** Generated based on TradeProcessor.TradeService
*/
case class StatefulApp[K, C, S, E](
  businessLogic: morphir.sdk.Maybe.Maybe[S] => C => (morphir.sdk.Maybe.Maybe[S], E)
){}