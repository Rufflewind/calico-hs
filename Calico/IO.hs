{-# LANGUAGE CPP #-}
#ifndef MIN_VERSION_base
#include "../dist/build/autogen/cabal_macros.h"
#endif
-- | This module is mutually exclusive with @Calico.MonadIO@.
module Calico.IO (
    -- * File I\/O
    IO.IO
  , IO.Handle
  , IO.FilePath

    -- ** Standard streams
  , IO.stdin
  , IO.stdout
  , IO.stderr
  , IO.isEOF
  , IO.getChar
  , IO.getContents
  , IO.getLine
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
  , HPrintfType
  , hPrintf

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

    -- ** Exit
  , ExitCode(..)
  , exitWith
  , exitFailure
  , exitSuccess

    -- * I\/O errors
  , IO.IOError
  , IO.ioError
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
import System.IO (Handle, IO, hFlush, hPrint, hPutStr, hPutStrLn,
                  print, putStr, putStrLn, stdout)
import Text.Printf (HPrintfType, hPrintf)
import System.Environment hiding (lookupEnv)
import System.Exit
import qualified System.Environment as Env
import qualified System.IO as IO
import qualified System.IO.Error as IO

putStr' :: String -> IO ()
putStr' = (>> hFlush stdout) . putStr

putStrLn' :: String -> IO ()
putStrLn' = (>> hFlush stdout) . putStrLn

print' :: Show a => a -> IO ()
print' = (>> hFlush stdout) . print

hPutStr' :: Handle -> String -> IO ()
hPutStr' h = (>> hFlush h) . hPutStr h

hPutStrLn' :: Handle -> String -> IO ()
hPutStrLn' h = (>> hFlush h) . hPutStrLn h

hPrint' :: Show a => Handle -> a -> IO ()
hPrint' h = (>> hFlush h) . hPrint h

lookupEnv :: String -> IO (Maybe String)
#if MIN_VERSION_base(4, 6, 0)
lookupEnv = Env.lookupEnv
#else
lookupEnv n = (Just <$> getEnv n)
  `IO.catch` \ e -> if IO.isDoesNotExistError e
                    then return Nothing
                    else IO.ioError e
#endif
