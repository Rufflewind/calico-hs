module Calico.IO (
    -- * File I\/O
    System.IO.IO
  , System.IO.Handle

    -- ** Standard streams
  , System.IO.stdin
  , System.IO.stdout
  , System.IO.stderr
  , System.IO.isEOF
  , System.IO.getContents
  , System.IO.getLine
  , System.IO.putStr
  , System.IO.putStrLn
  , System.IO.readIO
  , System.IO.readLn
  , System.IO.print

    -- ** Simple I/O
  , System.IO.readFile
  , System.IO.writeFile
  , System.IO.appendFile

    -- ** Open/close
  , System.IO.IOMode(..)
  , System.IO.withFile
  , System.IO.openFile
  , System.IO.withBinaryFile
  , System.IO.openBinaryFile
  , System.IO.openBinaryTempFile
  , System.IO.hClose

    -- ** Read/write
  , System.IO.getChar
  , System.IO.hGetBuf
  , System.IO.hGetBufSome
  , System.IO.hGetBufNonBlocking
  , System.IO.putChar
  , System.IO.hPutBuf
  , System.IO.hPutBufNonBlocking
  , System.IO.hPrint
  , Text.Printf.hPrintf
  , Text.Printf.HPrintfType
  , System.IO.hWaitForInput
  , System.IO.hReady
  , System.IO.hGetChar
  , System.IO.hLookAhead

    -- ** Position
  , System.IO.hFileSize
  , System.IO.hSetFileSize
  , System.IO.hIsEOF
  , System.IO.hTell
  , System.IO.SeekMode(..)
  , System.IO.hSeek

    -- ** Buffering
  , System.IO.BufferMode(..)
  , System.IO.hGetBuffering
  , System.IO.hSetBuffering
  , System.IO.hFlush

    -- ** Encoding
  , System.IO.TextEncoding
  , System.IO.latin1
  , System.IO.utf8
  , System.IO.utf16
  , System.IO.hGetEncoding
  , System.IO.hSetEncoding
  , System.IO.hSetBinaryMode

    -- ** Miscellaneous attributes
  , System.IO.hIsReadable
  , System.IO.hIsWritable
  , System.IO.hIsSeekable
  , System.IO.hIsTerminalDevice

    -- * I\/O errors
  , System.IO.Error.ioError
  , System.IO.Error.IOError
  , System.IO.Error.mkIOError
  , System.IO.Error.catchIOError
  , System.IO.Error.tryIOError
  , System.IO.Error.modifyIOError
  , System.IO.Error.annotateIOError
  , System.IO.Error.ioeGetErrorType
  , System.IO.Error.ioeGetLocation
  , System.IO.Error.ioeGetErrorString
  , System.IO.Error.ioeGetHandle
  , System.IO.Error.ioeGetFileName
  , System.IO.Error.ioeSetErrorType
  , System.IO.Error.ioeSetErrorString
  , System.IO.Error.ioeSetLocation
  , System.IO.Error.ioeSetHandle
  , System.IO.Error.ioeSetFileName
  , System.IO.Error.isAlreadyExistsError
  , System.IO.Error.isDoesNotExistError
  , System.IO.Error.isAlreadyInUseError
  , System.IO.Error.isFullError
  , System.IO.Error.isEOFError
  , System.IO.Error.isIllegalOperation
  , System.IO.Error.isPermissionError
  , System.IO.Error.isUserError
  , System.IO.Error.IOErrorType
  , System.IO.Error.alreadyExistsErrorType
  , System.IO.Error.doesNotExistErrorType
  , System.IO.Error.alreadyInUseErrorType
  , System.IO.Error.fullErrorType
  , System.IO.Error.eofErrorType
  , System.IO.Error.illegalOperationErrorType
  , System.IO.Error.permissionErrorType
  , System.IO.Error.userErrorType
  , System.IO.Error.isAlreadyExistsErrorType
  , System.IO.Error.isDoesNotExistErrorType
  , System.IO.Error.isAlreadyInUseErrorType
  , System.IO.Error.isFullErrorType
  , System.IO.Error.isEOFErrorType
  , System.IO.Error.isIllegalOperationErrorType
  , System.IO.Error.isPermissionErrorType
  , System.IO.Error.isUserErrorType

  ) where
import qualified System.IO
import qualified System.IO.Error
import qualified Text.Printf
