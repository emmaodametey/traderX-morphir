module TraderX.TradeProcessor.TradeService exposing (..)
-- trade states new, processing, settled, canceled
-- process trade (tradeorder) returns booking result
-- Enum for side: Buy and Sell
-- logic:
-- check if position is null and set to position
-- callculate for new quantity
--if order side == Buy, return orderQuantity * 1 elif sell:
-- orderQuantity * -1
--after save, update status of trade to processing
-- after processing, change state to settled
--return tradebookingresult

type alias TradeOrder =
    { id : String
    , security : String
    , quantity : Int
    , accountId : Int
    , side : TradeSide
    }

type alias TradeBookingResult =
    { trade : Trade
    , position : Position
    }

type alias Trade = 
    {id : String
    , security : String
    , quantity : Int
    , accountId : Int
    , side : TradeSide
    , state : String --change back to state
    , updated : String 
    , created : String
    }

type alias Position =
    { serialVersionUID : Int
    , accountId : Int
    , security : String
    , quantity : Int
    , updated : String 
    }

type TradeState
    = New
    | Processing
    | Settled 
    | Canceled

type alias New = String
-- type alias Processing = String
-- type alias Settled = String
-- type alias Canceled = String 

type TradeSide 
    = Buy
    | Sell

processTrade : TradeOrder -> TradeBookingResult
processTrade order = 
    let 
        trade = 
            { id = order.id
            , security = order.security
            , quantity = order.quantity
            , accountId = 1
            , side = order.side
            , state =  (TradeState New)
            , updated = "updated"
            , created = "created"
            }
    in
    order


