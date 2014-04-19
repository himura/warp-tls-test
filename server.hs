{-# LANGUAGE OverloadedStrings #-}

import Network.Wai.Handler.WarpTLS
import Network.Wai.Handler.Warp (defaultSettings)
import Network.Wai
import qualified Network.HTTP.Types as HT

main :: IO ()
main = runTLS myTlsSettings defaultSettings app
  where
    myTlsSettings = tlsSettings "./server.cert" "./server.key"

app :: Application
app _req = return $ responseLBS HT.status200 [] ""
