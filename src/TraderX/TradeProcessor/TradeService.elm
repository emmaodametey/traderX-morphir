module TraderX.TradeProcessor.TradeService exposing (..)
-- trade states new, processing, settled, canceled
-- process trade (tradeorder) returns booking result
-- Enum for side: Buy and Sell
-- logic:
-- check if position is null and set to position
-- callculate for new quantity
--if order side == Buy, return orderQuantity * 1 elif sell:
-- orderQuantity * -1
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
    , state : TradeState
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
    }

type TradeState
    = New
    | Processing
    | Settled 
    | Canceled

type TradeSide 
    = Buy
    | Sell

calculateQuantity: TradeSide -> Int -> Int
calculateQuantity side tradeQuantity = 
    if side == Buy then
        tradeQuantity * 1
    else
        tradeQuantity * -1


processTrade : TradeOrder -> TradeBookingResult
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

        position = 
            { serialVersionUID = 1
            , accountId = order.accountId
            , security = order.security
            , quantity = calculateQuantity order.side order.quantity
            }
    in
    { trade = trade
    , position = position
    }






