{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_monad_fun (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ben/Development/repos/personal/monad-fun/.stack-work/install/x86_64-osx/ee01546e1962cb65140a230ba51c40a9721c05077362ef3065df6a1b2ff4f439/8.6.5/bin"
libdir     = "/Users/ben/Development/repos/personal/monad-fun/.stack-work/install/x86_64-osx/ee01546e1962cb65140a230ba51c40a9721c05077362ef3065df6a1b2ff4f439/8.6.5/lib/x86_64-osx-ghc-8.6.5/monad-fun-0.1.0.0-1HW5OPwU46UAZnY9f4cHir-monad-fun"
dynlibdir  = "/Users/ben/Development/repos/personal/monad-fun/.stack-work/install/x86_64-osx/ee01546e1962cb65140a230ba51c40a9721c05077362ef3065df6a1b2ff4f439/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/ben/Development/repos/personal/monad-fun/.stack-work/install/x86_64-osx/ee01546e1962cb65140a230ba51c40a9721c05077362ef3065df6a1b2ff4f439/8.6.5/share/x86_64-osx-ghc-8.6.5/monad-fun-0.1.0.0"
libexecdir = "/Users/ben/Development/repos/personal/monad-fun/.stack-work/install/x86_64-osx/ee01546e1962cb65140a230ba51c40a9721c05077362ef3065df6a1b2ff4f439/8.6.5/libexec/x86_64-osx-ghc-8.6.5/monad-fun-0.1.0.0"
sysconfdir = "/Users/ben/Development/repos/personal/monad-fun/.stack-work/install/x86_64-osx/ee01546e1962cb65140a230ba51c40a9721c05077362ef3065df6a1b2ff4f439/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "monad_fun_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "monad_fun_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "monad_fun_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "monad_fun_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "monad_fun_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "monad_fun_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
