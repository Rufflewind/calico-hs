{-# LANGUAGE CPP, FlexibleContexts #-}
#ifndef MIN_VERSION_base
#include "../dist/build/autogen/cabal_macros.h"
#endif
-- | This module is mutually exclusive with @Calico.IOControl@.
module Calico.MonadIOControl (
    module Calico.MonadIO
  , MonadBaseControl(..)

    -- * Concurrency
  , ThreadId
  , myThreadId
  , B.fork
  , fork_
  , B.forkWithUnmask
  , forkFinally
  , killThread
  , throwTo
  , B.forkOn
  , B.forkOnWithUnmask

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
  , C.rtsSupportsBoundThreads
  , B.forkOS
  , isCurrentThreadBound
  , B.runInBoundThread
  , B.runInUnboundThread

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
  , B.withMVar
  , B.modifyMVar_
  , B.modifyMVar

  ) where
import Prelude ()
import Calico.Base
import Calico.MonadIO
import Control.Concurrent (MVar, ThreadId)
import Control.Exception (Exception, SomeException)
import Control.Monad.Trans.Control (MonadBaseControl(..))
import System.Posix.Types (Fd)
import qualified Control.Concurrent as C
import qualified Control.Concurrent.Lifted as B

myThreadId :: MonadIO m => m ThreadId
myThreadId = liftIO C.myThreadId

killThread :: MonadIO m => ThreadId -> m ()
killThread = liftIO . C.killThread

throwTo :: (Exception e, MonadIO m) => ThreadId -> e -> m ()
throwTo x = liftIO . C.throwTo x

isCurrentThreadBound :: MonadIO m => m Bool
isCurrentThreadBound = liftIO C.isCurrentThreadBound

getNumCapabilities :: MonadIO m => m Int
getNumCapabilities = liftIO C.getNumCapabilities

setNumCapabilities :: MonadIO m => Int -> m ()
setNumCapabilities = liftIO . C.setNumCapabilities

threadCapability :: MonadIO m => ThreadId -> m (Int, Bool)
threadCapability = liftIO . C.threadCapability

yield :: MonadIO m => m ()
yield = liftIO C.yield

threadDelay :: MonadIO m => Int -> m ()
threadDelay = liftIO . C.threadDelay

threadWaitRead :: MonadIO m => Fd -> m ()
threadWaitRead = liftIO . C.threadWaitRead

threadWaitWrite :: MonadIO m => Fd -> m ()
threadWaitWrite = liftIO . C.threadWaitWrite

newEmptyMVar :: MonadIO m => m (MVar a)
newEmptyMVar = liftIO C.newEmptyMVar

newMVar :: MonadIO m => a -> m (MVar a)
newMVar = liftIO . C.newMVar

takeMVar :: MonadIO m => MVar a -> m a
takeMVar = liftIO . C.takeMVar

putMVar :: MonadIO m => MVar a -> a -> m ()
putMVar x = liftIO . C.putMVar x

readMVar :: MonadIO m => MVar a -> m a
readMVar = liftIO . C.readMVar

swapMVar :: MonadIO m => MVar a -> a -> m a
swapMVar x = liftIO . C.swapMVar x

tryTakeMVar :: MonadIO m => MVar a -> m (Maybe a)
tryTakeMVar = liftIO . C.tryTakeMVar

tryPutMVar :: MonadIO m => MVar a -> a -> m Bool
tryPutMVar x = liftIO . C.tryPutMVar x

isEmptyMVar :: MonadIO m => MVar a -> m Bool
isEmptyMVar = liftIO . C.isEmptyMVar

fork_ :: MonadBaseControl IO m => m () -> m ()
fork_ = void . B.fork

{-# INLINABLE forkFinally #-}
forkFinally :: MonadBaseControl IO m =>
               m a -> (Either SomeException a -> m ()) -> m ThreadId
#if !(MIN_VERSION_base(4, 6, 0) && MIN_VERSION_lifted_base(0, 2, 0))
forkFinally action finalAct = B.mask $ \ restore -> B.fork $
  B.try (B.restore action) >>= finalAct
#else
forkFinally = B.forkFinally
#endif
