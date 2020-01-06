{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE InstanceSigs #-}

module Main where
import Control.Monad.State.Lazy

data MockState = MockState { outputs :: [String]} deriving (Show, Eq)
type SimpleMockedIO = State MockState

runMockIO :: SimpleMockedIO a -> MockState -> (a, MockState)
runMockIO = runState

type NewIO = IO

class Monad m => MonadCustomLogger m where
  logDebug :: String -> m ()

instance MonadCustomLogger IO where
  logDebug x = putStrLn ("Debug!: " <> x)

instance MonadCustomLogger SimpleMockedIO where
  logDebug msg = do
    curState <- get
    let newState = curState { outputs = msg:outputs curState}
    put newState
    return ()

main :: MonadCustomLogger m => m ()
main = logDebug "hello world"

test :: MockState
test = do
  let env = MockState []
  let internalTest :: MonadCustomLogger m => m ()
      internalTest = do
        logDebug "1"
        logDebug "2"
        logDebug "3"
  let (res, finalState) = runMockIO internalTest env
  finalState
