module Calico.ByteString.MonadIO
  ( module Calico.ByteString
  , readFileB
  , writeFileB
  , appendFileB
  ) where
import Prelude ()
import Calico.Base
import Calico.ByteString
import Calico.MonadIO
import qualified Calico.ByteString.IO as IO

readFileB :: MonadIO m => FilePath -> m ByteString
readFileB = liftIO . IO.readFileB

writeFileB :: MonadIO m => FilePath -> ByteString -> m ()
writeFileB p = liftIO . IO.writeFileB p

appendFileB :: MonadIO m => FilePath -> ByteString -> m ()
appendFileB p = liftIO . IO.appendFileB p
