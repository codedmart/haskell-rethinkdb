module Database.RethinkDB.Wire.Response where
import Prelude (Maybe(..), Eq, Show)
import Database.RethinkDB.Wire
data ResponseType = SUCCESS_ATOM | SUCCESS_SEQUENCE | SUCCESS_PARTIAL | WAIT_COMPLETE | CLIENT_ERROR | COMPILE_ERROR | RUNTIME_ERROR
  deriving (Eq, Show)
instance WireValue ResponseType where
  toWire SUCCESS_ATOM = 1
  toWire SUCCESS_SEQUENCE = 2
  toWire SUCCESS_PARTIAL = 3
  toWire WAIT_COMPLETE = 4
  toWire CLIENT_ERROR = 16
  toWire COMPILE_ERROR = 17
  toWire RUNTIME_ERROR = 18
  fromWire 1 = Just SUCCESS_ATOM
  fromWire 2 = Just SUCCESS_SEQUENCE
  fromWire 3 = Just SUCCESS_PARTIAL
  fromWire 4 = Just WAIT_COMPLETE
  fromWire 16 = Just CLIENT_ERROR
  fromWire 17 = Just COMPILE_ERROR
  fromWire 18 = Just RUNTIME_ERROR
  fromWire _ = Nothing


data ResponseNote = SEQUENCE_FEED | ATOM_FEED | ORDER_BY_LIMIT_FEED | UNIONED_FEED | INCLUDES_STATES
  deriving (Eq, Show)
instance WireValue ResponseNote where
  toWire SEQUENCE_FEED = 1
  toWire ATOM_FEED = 2
  toWire ORDER_BY_LIMIT_FEED = 3
  toWire UNIONED_FEED = 4
  toWire INCLUDES_STATES = 5
  fromWire 1 = Just SEQUENCE_FEED
  fromWire 2 = Just ATOM_FEED
  fromWire 3 = Just ORDER_BY_LIMIT_FEED
  fromWire 4 = Just UNIONED_FEED
  fromWire 5 = Just INCLUDES_STATES
  fromWire _ = Nothing


