{-# LANGUAGE CPP #-}
-- | This module is mutually exclusive with @Calico.IOControl@.
module Calico.MonadException (
    module Calico.MonadIO
  , module Control.Monad.Catch
  , tryIOError
  ) where
import Prelude ()
import Calico.Base
import Calico.MonadIO
import Control.Monad.Catch

{-# INLINABLE tryIOError #-}
tryIOError :: MonadCatch m => m a -> m (Either IOError a)
tryIOError = try
