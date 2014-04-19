{-# LANGUAGE OverloadedStrings #-}

import Network.Wai.Handler.WarpTLS
import Network.Wai.Handler.Warp (defaultSettings, setPort)
import Network.Wai
import qualified Network.HTTP.Types as HT
import System.Environment (getArgs)

main :: IO ()
main = do
    (port:_) <- getArgs
    server (read port)

server :: Int -- ^ port
       -> IO ()
server port = runTLS myTlsSettings setting app
  where
    myTlsSettings = tlsSettings "./server.cert" "./server.key"
    setting = setPort port defaultSettings

app :: Application
app _req = return $ responseLBS HT.status200 [] ""
