module Calico.Text.IO
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
import Calico.Text
import Calico.IO
import qualified Data.Text.IO as IO

putText :: Text -> IO ()
putText = IO.putStr

putText' :: Text -> IO ()
putText' = (>> hFlush stdout) . putText

putTextLn :: Text -> IO ()
putTextLn = IO.putStrLn

putTextLn' :: Text -> IO ()
putTextLn' = (>> hFlush stdout) . putTextLn

hPutText :: Handle -> Text -> IO ()
hPutText = IO.hPutStr

hPutText' :: Handle -> Text -> IO ()
hPutText' h = (>> hFlush h) . hPutText h

hPutTextLn :: Handle -> Text -> IO ()
hPutTextLn = IO.hPutStrLn

hPutTextLn' :: Handle -> Text -> IO ()
hPutTextLn' h = (>> hFlush h) . hPutTextLn h
