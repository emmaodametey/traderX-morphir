module TraderX.TradeService.TradeOrderController exposing (..)

-- import TraderX.TradeService.Shared.Security exposing (..)
-- import TraderX.TradeService.Shared.AccountId exposing(..)
-- import TraderX.TradeService.Shared.TradeSide exposing(..)
-- import Http

type alias TradeOrder = 
    { 
        id: String,
        security: String,
        quantity: Int,
        accountId: Int,
        side: String
    }
-- type Msg
--     = Response (Result Http.Error ())
type alias Url = 
    String

-- type HttpResponse 
--     = HttpClientErrorException: {
--         code: Int,
--         msg: String
--     }
--     | OK

validateTicker : String -> (Bool, String)
validateTicker ticker =
    if String.isEmpty ticker then
        (False, "Invalid")
    else
        (True, "valid")
    -- if ticker == OK then
    --     (True, "Validate Ticker")
    -- else
    --     (False, "Invalid")
    -- case ticker of
    --     OK -> (True, "Validate Ticker")
    --     HttpClientErrorException -> (False, "Invalid")
    --         let
    --             result = 
    --                 if response.code == 404 then
    --                     (False, "Ticker Not Found in Reference Data")
    --                 else
    --                     (False, response.msg)
validateAccount : Maybe Int -> (Bool, String)
validateAccount account =
    if account == Nothing then
        (False, "Invalid")
    else
        (True, "valid")

createTradeOrder : TradeOrder -> (Bool, String)
createTradeOrder tradeOrder = 
    if not (fst (validateTicker tradeOrder.security)) then
        (False, "ResourceNotFound")
    else if not (fst (validateAccount tradeOrder.accountId)) then
        (False, "ResourceNotFound")
    else
        (True, "Resource Found")


