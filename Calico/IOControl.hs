-- | This module is mutually exclusive with @Calico.MonadIOControl@.
module Calico.IOControl (
    module Calico.IO
  , catch
  , catchIOError
  , try
  , tryIOError
  , throwIO
  , ThreadId
  , forkIO
  ) where
import Prelude ()
import Calico.IO
import Control.Concurrent
import Control.Exception
import System.IO.Error
