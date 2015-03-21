module Calico.ByteString.IO
  ( module Calico.ByteString
  , readFileB
  , writeFileB
  , appendFileB
  ) where
import Prelude ()
import Calico.ByteString
import Calico.IO
import qualified Data.ByteString as IO

readFileB :: FilePath -> IO ByteString
readFileB = IO.readFile

writeFileB :: FilePath -> ByteString -> IO ()
writeFileB = IO.writeFile

appendFileB :: FilePath -> ByteString -> IO ()
appendFileB = IO.appendFile
