module TraderX.TradeService.TradeOrderController exposing (..)

type alias TradeOrder = 
    { 
        id: String,
        security: Ticker,
        quantity: Int,
        accountId: Account,
        side: String
    }
type Ticker
    = Valid String
    | Invalid

type Account
    = Valid Int
    | Invalid

type ResourceNotFound
    = AccountNotFound
    | TickerNotFound

type alias Url = 
    String

createTradeOrder : TradeOrder -> Result ResourceNotFound TradeOrder
createTradeOrder tradeOrder =
    let 
        validTicker =
            case tradeOrder.security of
                Valid _ -> Ok TradeOrder
                Invalid -> Err TickerNotFound
        validAccount =
            case tradeOrder.accountId of
                Valid _ -> Ok TradeOrder
                Invalid -> Err AccountNotFound

    in
    case validTicker of
        Err _ -> validTicker
        Ok _ -> validAccount 

-- validateTicker : String -> Result String Bool
-- validateTicker ticker =
--     if String.isEmpty ticker then
--         Err "Invalid"
--     else
--         Ok True

-- validateAccount : Int -> Result String Bool
-- validateAccount accountId =
--     case accountId of
--         0 -> Ok True
--         _ -> Err "Resource not found in Account service"     

-- createTradeOrder : TradeOrder -> Result String Bool
-- createTradeOrder tradeOrder =
--     let 
--         validTicker = validateTicker tradeOrder.security
--     in
--     case validTicker of
--         Err _ -> validTicker
--         Ok _ -> validateAccount tradeOrder.accountId