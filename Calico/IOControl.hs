-- | This module is mutually exclusive with @Calico.MonadIOControl@.
module Calico.IOControl (
    module Calico.IO
  , catch
  , catchIOError
  , try
  , tryIOError
  , throwIO
  ) where
import Prelude ()
import Calico.IO
import Control.Exception
import System.IO.Error
