-- | This module is mutually exclusive with @Calico.IOControl@.
{-# LANGUAGE CPP, FlexibleContexts #-}
module Calico.MonadIOControl (
    module Calico.MonadIO
  , MonadBaseControl(..)

    -- * Exceptions
  , catch
  , catchIOError
  , try
  , tryIOError
  , throwIO

    -- * Concurrency
  , ThreadId
  , myThreadId
  , fork
  , forkWithUnmask
  , forkFinally
  , killThread
  , throwTo
  , forkOn
  , forkOnWithUnmask

    -- ** Scheduling
  , getNumCapabilities
  , setNumCapabilities
  , threadCapability
  , yield

    -- ** Waiting
  , threadDelay
  , threadWaitRead
  , threadWaitWrite

    -- ** Bound threads
  , rtsSupportsBoundThreads
  , forkOS
  , isCurrentThreadBound
  , runInBoundThread
  , runInUnboundThread

    -- ** 'MVar'
  , MVar
  , newEmptyMVar
  , newMVar
  , takeMVar
  , putMVar
  , readMVar
  , swapMVar
  , tryTakeMVar
  , tryPutMVar
  , isEmptyMVar
  , withMVar
  , modifyMVar_
  , modifyMVar

  ) where
import Prelude ()
import Calico.Base
import Calico.MonadIO
import Control.Concurrent.Lifted
import Control.Exception.Lifted
import Control.Monad.Trans.Control (MonadBaseControl(..))

{-# INLINABLE catchIOError #-}
catchIOError :: MonadBaseControl IO m => m a -> (IOError -> m a) -> m a
catchIOError = catch

{-# INLINABLE tryIOError #-}
tryIOError :: MonadBaseControl IO m => m a -> m (Either IOError a)
tryIOError = try

#if !(MIN_VERSION_base(4, 6, 0) && MIN_VERSION_lifted_base(0, 2, 0))
{-# INLINABLE forkFinally #-}
forkFinally :: MonadBaseControl IO m =>
               m a -> (Either SomeException a -> m ()) -> m ThreadId
forkFinally action finalAct = mask $ \ restore -> fork $
  try (restore action) >>= finalAct
#endif
