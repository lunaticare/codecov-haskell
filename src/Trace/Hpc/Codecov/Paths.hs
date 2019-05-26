-- |
-- Module:      Trace.Hpc.Codecov.Paths
-- Copyright:   (c) 2014 Guillaume Nargeot
-- License:     BSD3
-- Maintainer:  Guillaume Nargeot <guillaume+hackage@nargeot.com>
-- Stability:   experimental
--
-- Paths constants and functions for hpc coverage report output.

module Trace.Hpc.Codecov.Paths where

import Trace.Hpc.Tix
import Trace.Hpc.Codecov.Config 
import System.FilePath

defaultHpcDir :: FilePath
defaultHpcDir = "dist/hpc/"

defaultTixDir :: FilePath
defaultTixDir = defaultHpcDir </> "tix/"

defaultMixDir :: FilePath
defaultMixDir = defaultHpcDir </> "mix/"

getMixPaths :: Config -> String -> TixModule -> [FilePath]
getMixPaths config testSuiteName tix = do _dirName <- dirName
                                          return $ mixDir config </> _dirName </> ""
    where dirName = case span (/= '/') modName of
              (_, [])        -> [ testSuiteName ]
              (packageId, _) -> [ "", packageId ]
          TixModule modName _ _ _ = tix

getTixPath :: Config -> String -> FilePath
getTixPath config testSuiteName = tixDir config ++ testSuiteName </> getTixFileName testSuiteName
