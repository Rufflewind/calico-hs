{-# LANGUAGE CPP, NoMonomorphismRestriction #-}
#ifndef MIN_VERSION_base
#include "../dist/build/autogen/cabal_macros.h"
#endif
-- | This module is mutually exclusive with @Calico.IO@.
module Calico.MonadIO (
    -- * File I\/O
    MonadIO(..)
  , IO
  , Handle
  , IO.FilePath

    -- ** Standard streams
  , IO.stdin
  , IO.stdout
  , IO.stderr
  , IO.isEOF
  , IO.getChar
  , IO.getContents
  , getLine
  , IO.readIO
  , IO.readLn
  , IO.putChar
  , putStr
  , putStr'
  , putStrLn
  , putStrLn'
  , print
  , print'

    -- ** Simple I/O
  , IO.readFile
  , IO.writeFile
  , IO.appendFile

    -- ** Open/close
  , IO.IOMode(..)
  , IO.withFile
  , IO.openFile
  , IO.withBinaryFile
  , IO.openBinaryFile
  , IO.openBinaryTempFile
  , IO.hClose

    -- ** Read/write
  , IO.hGetBuf
  , IO.hGetBufSome
  , IO.hGetBufNonBlocking
  , IO.hWaitForInput
  , IO.hReady
  , IO.hGetChar
  , IO.hGetContents
  , IO.hGetLine
  , IO.hLookAhead
  , IO.hPutBuf
  , IO.hPutBufNonBlocking
  , IO.hPutChar
  , hPutStr
  , hPutStr'
  , hPutStrLn
  , hPutStrLn'
  , hPrint
  , hPrint'

    -- ** Position
  , IO.hFileSize
  , IO.hSetFileSize
  , IO.hIsEOF
  , IO.hTell
  , IO.SeekMode(..)
  , IO.hSeek

    -- ** Buffering
  , IO.BufferMode(..)
  , IO.hGetBuffering
  , IO.hSetBuffering
  , hFlush

    -- ** Encoding
  , IO.TextEncoding
  , IO.latin1
  , IO.utf8
  , IO.utf16
  , IO.hGetEncoding
  , IO.hSetEncoding
  , IO.hSetBinaryMode

    -- ** Miscellaneous attributes
  , IO.hIsReadable
  , IO.hIsWritable
  , IO.hIsSeekable
  , IO.hIsTerminalDevice

    -- * Environment
  , getArgs
  , withArgs
  , getProgName
  , withProgName
#if MIN_VERSION_base(4, 6, 0)
  , getExecutablePath
#endif
  , lookupEnv
  , getEnv
#if MIN_VERSION_base(4, 7, 0)
  , setEnv
  , unsetEnv
#endif
  , getEnvironment

    -- * I\/O errors
  , IOError
  , ioError
  , IO.userError
  , IO.mkIOError
  , IO.modifyIOError
  , IO.annotateIOError
  , IO.ioeGetErrorType
  , IO.ioeGetLocation
  , IO.ioeGetErrorString
  , IO.ioeGetHandle
  , IO.ioeGetFileName
  , IO.ioeSetErrorType
  , IO.ioeSetErrorString
  , IO.ioeSetLocation
  , IO.ioeSetHandle
  , IO.ioeSetFileName
  , IO.isAlreadyExistsError
  , IO.isDoesNotExistError
  , IO.isAlreadyInUseError
  , IO.isFullError
  , IO.isEOFError
  , IO.isIllegalOperation
  , IO.isPermissionError
  , IO.isUserError
  , IO.IOErrorType
  , IO.alreadyExistsErrorType
  , IO.doesNotExistErrorType
  , IO.alreadyInUseErrorType
  , IO.fullErrorType
  , IO.eofErrorType
  , IO.illegalOperationErrorType
  , IO.permissionErrorType
  , IO.userErrorType
  , IO.isAlreadyExistsErrorType
  , IO.isDoesNotExistErrorType
  , IO.isAlreadyInUseErrorType
  , IO.isFullErrorType
  , IO.isEOFErrorType
  , IO.isIllegalOperationErrorType
  , IO.isPermissionErrorType
  , IO.isUserErrorType

  ) where
import Prelude ()
import Calico.Base
import Calico.IO (Handle, IO, IOError)
import Control.Monad.IO.Class (MonadIO, liftIO)
import qualified Calico.IO as IO

getLine :: MonadIO m => m String
getLine = liftIO IO.getLine

putStr :: MonadIO m => String -> m ()
putStr = liftIO . IO.putStr

putStr' :: MonadIO m => String -> m ()
putStr' = liftIO . IO.putStr'

putStrLn :: MonadIO m => String -> m ()
putStrLn = liftIO . IO.putStrLn

putStrLn' :: MonadIO m => String -> m ()
putStrLn' = liftIO . IO.putStrLn'

print :: (MonadIO m, Show a) => a -> m ()
print = liftIO . IO.print

print' :: (MonadIO m, Show a) => a -> m ()
print' = liftIO . IO.print'

hPutStr :: MonadIO m => Handle -> String -> m ()
hPutStr h = liftIO . IO.hPutStr h

hPutStr' :: MonadIO m => Handle -> String -> m ()
hPutStr' h = liftIO . IO.hPutStr' h

hPutStrLn :: MonadIO m => Handle -> String -> m ()
hPutStrLn h = liftIO . IO.hPutStrLn h

hPutStrLn' :: MonadIO m => Handle -> String -> m ()
hPutStrLn' h = liftIO . IO.hPutStrLn' h

hPrint :: (MonadIO m, Show a) => Handle -> a -> m ()
hPrint h = liftIO . IO.hPrint h

hPrint' :: (MonadIO m, Show a) => Handle -> a -> m ()
hPrint' h = liftIO . IO.hPrint' h

hFlush :: MonadIO m => Handle -> m ()
hFlush = liftIO . IO.hFlush

getArgs :: MonadIO m => m [String]
getArgs = liftIO IO.getArgs

withArgs :: MonadIO m => [String] -> IO a -> m a
withArgs = (liftIO .) . IO.withArgs

getProgName :: MonadIO m => m String
getProgName = liftIO IO.getProgName

withProgName :: MonadIO m => String -> IO a -> m a
withProgName = (liftIO .) . IO.withProgName

#if MIN_VERSION_base(4, 6, 0)
getExecutablePath :: MonadIO m => m String
getExecutablePath = liftIO IO.getExecutablePath
#endif

lookupEnv :: MonadIO m => String -> m (Maybe String)
lookupEnv = liftIO . IO.lookupEnv

getEnv :: MonadIO m => String -> m String
getEnv = liftIO . IO.getEnv

#if MIN_VERSION_base(4, 7, 0)
setEnv :: MonadIO m => String -> String -> m ()
setEnv = (liftIO .) . IO.setEnv

unsetEnv :: MonadIO m => String -> m ()
unsetEnv = liftIO . IO.unsetEnv
#endif

getEnvironment :: MonadIO m => m [(String, String)]
getEnvironment = liftIO IO.getEnvironment

ioError :: MonadIO m => IOError -> m a
ioError = liftIO . ioError
