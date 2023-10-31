package traderx.tradeservice.shared

/** Generated based on TradeService.Shared.TradeSide
*/
case class StatefulApp[K, C, S, E](
  businessLogic: morphir.sdk.Maybe.Maybe[S] => C => (morphir.sdk.Maybe.Maybe[S], E)
){}