module Calico.Text
  ( Text.Text
  , TextL
  ) where
import Prelude ()
import qualified Data.Text as Text
import qualified Data.Text.Lazy as TextL

-- | Lazy 'TextL.Text'.
type TextL = TextL.Text
