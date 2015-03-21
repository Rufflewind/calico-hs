module Calico.ByteString
  ( ByteString.ByteString
  , ByteStringL
  ) where
import Prelude ()
import qualified Data.ByteString as ByteString
import qualified Data.ByteString.Lazy as ByteStringL

-- | Lazy 'ByteStringL.ByteString'.
type ByteStringL = ByteStringL.ByteString
