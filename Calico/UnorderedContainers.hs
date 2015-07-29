module Calico.UnorderedContainers
  ( Data.HashMap.Strict.HashMap
  , HashMapL
  , Data.HashSet.HashSet
  ) where
import Prelude ()
import qualified Data.HashMap.Strict
import qualified Data.HashMap.Lazy
import qualified Data.HashSet

type HashMapL k a = Data.HashMap.Lazy.HashMap k a
