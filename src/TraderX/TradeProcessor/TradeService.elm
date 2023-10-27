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
    { id : String
    , security : String
    , quantity : Int
    , accountId : Int
    , side : TradeSide
    , state : TradeState --change back to state
    , updated : String 
    , created : String
    }
type PositionStatus 
    = Found
    | NotFound
   
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

type TradeSide 
    = Buy
    | Sell

findByAccountIdAndSecurity : TradeOrder.accountId -> TradeOrder.security -> Maybe Position
findByAccountIdAndSecurity accountId security =

selectPosition : PositionStatus -> Maybe Position
selectPosition status =
    Nothing

processTrade : TradeOrder -> Maybe TradeBookingResult
processTrade order = 
    let 
        trade = 
            { id = order.id
            , security = order.security
            , quantity = order.quantity
            , accountId = 1
            , side = order.side
            , state =  New
            , updated = "updated"
            , created = "created"
            }
    in
    Nothing
    



