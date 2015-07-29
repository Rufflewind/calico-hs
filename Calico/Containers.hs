module Calico.Containers
  ( Data.IntMap.Strict.IntMap
  , IntMapL
  , Data.IntSet.IntSet
  , Data.Map.Strict.Map
  , MapL
  , Data.Sequence.Seq
  , Data.Set.Set
  ) where
import Prelude ()
import qualified Data.IntMap.Strict
import qualified Data.IntMap.Lazy
import qualified Data.IntSet
import qualified Data.Map.Strict
import qualified Data.Map.Lazy
import qualified Data.Sequence
import qualified Data.Set

type IntMapL a = Data.IntMap.Lazy.IntMap a

type MapL k a = Data.Map.Lazy.Map k a
