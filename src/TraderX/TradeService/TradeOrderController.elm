module TraderX.TradeService.TradeOrderController exposing (..)

type alias TradeOrder = 
    { 
        id: String,
        security: String,
        quantity: Int,
        accountId: Int,
        side: String
    }

type alias Url = 
    String

validateTicker : String -> Result String Bool
validateTicker ticker =
    if String.isEmpty ticker then
        Err "Invalid"
    else
        Ok True

validateAccount : Int -> Result String Bool
validateAccount accountId =
    case accountId of
        0 -> Ok True
        _ -> Err "Resource not found not : in Account service"

trying : String -> String -> String
trying str1 str2 = 
    str1 ++ str2
      

createTradeOrder : TradeOrder -> Result String Bool
createTradeOrder tradeOrder =
    let 
        validTicker = validateTicker tradeOrder.security
    in
    case validTicker of
        Err _ -> validTicker
        Ok _ -> validateAccount tradeOrder.accountId