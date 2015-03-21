{-# LANGUAGE FlexibleContexts #-}
-- | This module is mutually exclusive with @Calico.IOControl@.
module Calico.MonadIOControl (
    module Calico.MonadIO
  , MonadBaseControl(..)
  , catch
  , catchIOError
  , try
  , tryIOError
  , throwIO
  ) where
import Prelude ()
import Calico.Base
import Calico.MonadIO
import Control.Exception.Lifted
import Control.Monad.Trans.Control (MonadBaseControl(..))

catchIOError :: MonadBaseControl IO m => m a -> (IOError -> m a) -> m a
catchIOError = catch

tryIOError :: MonadBaseControl IO m => m a -> m (Either IOError a)
tryIOError = try
