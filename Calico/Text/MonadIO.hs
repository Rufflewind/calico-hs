module Calico.Text.MonadIO
  ( module Calico.Text
  , putText
  , putText'
  , putTextLn
  , putTextLn'
  , hPutText
  , hPutText'
  , hPutTextLn
  , hPutTextLn'
  ) where
import Prelude ()
import Calico.Base
import Calico.MonadIO
import Calico.Text
import qualified Calico.Text.IO as IO

putText :: MonadIO m => Text -> m ()
putText = liftIO . IO.putText

putText' :: MonadIO m => Text -> m ()
putText' = liftIO . IO.putText'

putTextLn :: MonadIO m => Text -> m ()
putTextLn = liftIO . IO.putTextLn

putTextLn' :: MonadIO m => Text -> m ()
putTextLn' = liftIO . IO.putTextLn'

hPutText :: MonadIO m => Handle -> Text -> m ()
hPutText h = liftIO . IO.hPutText h

hPutText' :: MonadIO m => Handle -> Text -> m ()
hPutText' h = liftIO . IO.hPutText' h

hPutTextLn :: MonadIO m => Handle -> Text -> m ()
hPutTextLn h = liftIO . IO.hPutTextLn h

hPutTextLn' :: MonadIO m => Handle -> Text -> m ()
hPutTextLn' h = liftIO . IO.hPutTextLn' h
