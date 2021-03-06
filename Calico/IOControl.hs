{-# LANGUAGE CPP #-}
#ifndef MIN_VERSION_base
#include "../dist/build/autogen/cabal_macros.h"
#endif
-- | This module is mutually exclusive with @Calico.MonadException@ and
-- @Calico.MonadIOControl@.
module Calico.IOControl (
    module Calico.IO

    -- * Exceptions
  , Exception
  , SomeException
  , bracket
  , bracket_
  , catch
  , catchIOError
  , finally
  , mask
  , onException
  , try
  , tryIOError
  , throwIO

    -- * Concurrency
  , ThreadId
  , myThreadId
  , forkIO
  , forkIOWithUnmask
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
#if !MIN_VERSION_base(4, 6, 0)
import Calico.Base
#endif
import Calico.IO
import Control.Concurrent
import Control.Exception
import System.IO.Error

#if !MIN_VERSION_base(4, 6, 0)
{-# INLINABLE forkFinally #-}
forkFinally :: IO a -> (Either SomeException a -> IO ()) -> IO ThreadId
forkFinally action finalAct = mask $ \ restore -> forkIO $
  try (restore action) >>= finalAct
#endif
