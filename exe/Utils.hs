module Utils where

import qualified GHC.Paths (libdir)
import System.Environment  (lookupEnv)
import Data.Maybe          (fromMaybe)
import Data.Foldable       (asum)

-- Set the GHC libdir to the nix libdir if it's present.
getLibdir :: IO FilePath
getLibdir = fromMaybe GHC.Paths.libdir . asum <$>
  sequence [ lookupEnv "GHC_LIBDIR"
           , lookupEnv "NIX_GHC_LIBDIR"
           ]
