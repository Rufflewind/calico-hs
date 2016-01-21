{-# LANGUAGE CPP #-}
#ifndef MIN_VERSION_base
#include "../dist/build/autogen/cabal_macros.h"
#endif
module Calico.Base (

    -- * Basic types

    -- ** Maybe
    Data.Maybe.Maybe(..)
  , Data.Maybe.maybe
  , Data.Maybe.isJust
  , Data.Maybe.isNothing
  , Data.Maybe.fromMaybe
  , Data.Maybe.listToMaybe
  , Data.Maybe.maybeToList
  , Data.Maybe.catMaybes
  , Data.Maybe.mapMaybe

    -- ** Either
  , Data.Either.Either(..)
  , Data.Either.either

    -- ** Bool
  , Data.Bool.Bool(..)
  , (Data.Bool.&&)
  , (Data.Bool.||)
  , Data.Bool.not
  , Data.Bool.otherwise

    -- ** Numeric types
#if MIN_VERSION_base(4, 8, 0)
  , Numeric.Natural.Natural
#endif
  , Prelude.Integer
  , Prelude.Int
  , Prelude.Rational
  , Prelude.Float
  , Prelude.Double

    -- ** Char
  , Data.Char.Char
  , Data.Char.toUpper
  , Data.Char.toLower
  , Data.Char.ord
  , Data.Char.chr

    -- ** Word
  , Data.Word.Word
  , Data.Word.Word8
  , Data.Word.Word16
  , Data.Word.Word32
  , Data.Word.Word64

    -- ** Ratio
  , Data.Ratio.Ratio
  , (Data.Ratio.%)
  , Data.Ratio.numerator
  , Data.Ratio.denominator
  , Data.Ratio.approxRational

    -- ** Complex
  , Data.Complex.Complex(..)
  , Data.Complex.cis
  , Data.Complex.conjugate
  , Data.Complex.imagPart
  , Data.Complex.magnitude
  , Data.Complex.mkPolar
  , Data.Complex.polar
  , Data.Complex.phase
  , Data.Complex.realPart

    -- ** List
  , (Data.List.!!)
  , Data.List.intercalate
  , Data.List.permutations
  , Data.List.zip
  , Data.List.zipWith
#if MIN_VERSION_base(4, 8, 0)
  , Data.List.uncons
#else
  , uncons
#endif
  , Data.List.unzip

    -- ** String
  , Data.String.String
  , Text.Printf.printf
  , Text.Printf.PrintfType

    -- * Basic type classes

    -- ** Ordering
  , Data.Eq.Eq(..)
  , Data.Ord.Ordering(..)
  , Data.Ord.Ord(..)

    -- ** Numerics
  , Prelude.Enum(..)
  , Prelude.Bounded(..)
  , Prelude.Num(..)
  , Prelude.Real(..)
  , Prelude.Integral(..)
  , Prelude.Fractional(..)
  , Prelude.Floating(..)
  , Prelude.RealFrac(..)
  , Prelude.RealFloat(..)
  , Prelude.subtract
  , Prelude.even
  , Prelude.odd
  , Prelude.gcd
  , Prelude.lcm
  , (Prelude.^)
  , (Prelude.^^)
  , Prelude.fromIntegral
  , Prelude.realToFrac

    -- ** Bits
  , Data.Bits.Bits
  , (Data.Bits..&.)
  , (Data.Bits..|.)
  , Data.Bits.xor
  , Data.Bits.complement
  , Data.Bits.shift
  , Data.Bits.rotate
  , Data.Bits.bit
  , Data.Bits.setBit
  , Data.Bits.clearBit
  , Data.Bits.complementBit
  , Data.Bits.testBit
  , Data.Bits.isSigned
  , Data.Bits.shiftL
  , Data.Bits.shiftR
  , Data.Bits.rotateL
  , Data.Bits.rotateR

    -- ** Read
  , Text.Read.ReadS
  , Text.Read.Read
  , Text.Read.readsPrec
  , Text.Read.readList
  , Text.Read.reads
  , Text.Read.readParen
  , Text.Read.read
  , maybeRead
  , Text.Read.lex

    -- ** Show
  , Text.Show.ShowS
  , Text.Show.Show(..)
  , Text.Show.shows
  , Text.Show.showChar
  , Text.Show.showString
  , Text.Show.showParen
  , Text.Show.showListWith

    -- ** Monoid
  , Data.Monoid.Monoid(..)
  , (Data.Monoid.<>)

    -- ** Foldable
  , Data.Foldable.Foldable(..)
#if !MIN_VERSION_base(4, 8, 0)
  , Data.Foldable.toList
  , null
  , length
  , Data.Foldable.elem
  , Data.Foldable.maximum
  , Data.Foldable.minimum
  , Data.Foldable.sum
  , Data.Foldable.product
#endif
  , Data.Foldable.foldlM
  , Data.Foldable.foldrM
  , Data.Foldable.traverse_
  , Data.Foldable.for_
  , Data.Foldable.sequenceA_
  , Data.Foldable.asum
  , Data.Foldable.concatMap
  , Data.Foldable.and
  , Data.Foldable.or
  , Data.Foldable.any
  , Data.Foldable.all
  , sum'
  , prod'
  , Data.Foldable.maximumBy
  , Data.Foldable.minimumBy
  , Data.Foldable.notElem
  , Data.Foldable.find

    -- ** Traversable
  , Data.Traversable.Traversable(..)
  , Data.Traversable.for
  , Data.Traversable.forM
  , Data.Traversable.mapAccumL
  , Data.Traversable.mapAccumR
  , Data.Traversable.fmapDefault
  , Data.Traversable.foldMapDefault

    -- ** Category
  , Control.Category.id
  , (Control.Category..)

    -- ** Arrow
  , Control.Arrow.first
  , Control.Arrow.second

    -- ** Functor
  , Data.Functor.Functor(..)
  , (Data.Functor.<$>)
#if MIN_VERSION_base(4, 7, 0)
  , (Data.Functor.$>)
#else
  , ($>)
#endif
  , Data.Functor.void

    -- ** Applicative
  , Control.Applicative.Applicative(..)
  , Control.Applicative.Alternative(..)
  , Control.Applicative.Const(..)
  , (Control.Applicative.<**>)
  , Control.Applicative.optional

    -- ** Monad
  , Control.Monad.Monad(..)
  , Control.Monad.MonadPlus(..)
  , (Control.Monad.=<<)
  , (Control.Monad.<=<)
  , (Control.Monad.>=>)
  , Control.Monad.join
  , Control.Monad.forever
  , Control.Monad.guard
  , Control.Monad.when
  , Control.Monad.unless

    -- ** Generic
  , GHC.Generics.Generic

    -- ** Typeable
  , Data.Typeable.Typeable

    -- ** Type-level programming
#if MIN_VERSION_base(4, 7, 0)
  , Data.Proxy.Proxy(Proxy)
  , Data.Proxy.asProxyTypeOf
  , Data.Proxy.KProxy(KProxy)
#endif

    -- * Functions

    -- ** Tuples
  , Data.Tuple.fst
  , Data.Tuple.snd
  , Data.Tuple.curry
  , Data.Tuple.uncurry
  , Data.Tuple.swap

    -- ** Utility
  , (Data.Function.$)
  , Data.Function.flip
  , Data.Function.fix
  , Prelude.seq
  , (Prelude.$!)
  , Prelude.asTypeOf
  , Data.Function.on
  , Prelude.until
  , Prelude.error

    -- ** Debugging
  , Prelude.undefined
  , Debug.Trace.trace
  , Debug.Trace.traceShow
  , Debug.Trace.traceStack
#if MIN_VERSION_base(4, 7, 0)
  , Debug.Trace.traceId
  , Debug.Trace.traceShowId
#else
  , traceId
  , traceShowId
#endif

  ) where
import qualified Prelude
import qualified Control.Applicative
import qualified Control.Arrow
import qualified Control.Category
import qualified Control.Monad
import qualified Data.Bits
import qualified Data.Bool
import qualified Data.Char
import qualified Data.Complex
import qualified Data.Either
import qualified Data.Eq
import qualified Data.Foldable
import qualified Data.Functor
import qualified Data.Function
import qualified Data.List
import qualified Data.Maybe
import qualified Data.Monoid
import qualified Data.Ord
#if MIN_VERSION_base(4, 7, 0)
import qualified Data.Proxy
#endif
import qualified Data.Ratio
import qualified Data.String
import qualified Data.Traversable
import qualified Data.Typeable
import qualified Data.Word
import qualified Data.Tuple
import qualified Debug.Trace
import qualified GHC.Generics
#if MIN_VERSION_base(4, 8, 0)
import qualified Numeric.Natural (Natural)
#endif
import qualified Text.Read
import qualified Text.Show
import qualified Text.Printf
import Data.Maybe (Maybe(..))
import Data.String (String)
import Text.Read (Read, reads)

#if !MIN_VERSION_base(4, 7, 0)
infixl 4 $>
($>) :: Functor f => f a -> b -> f b
($>) = Data.Functor.flip (Data.<$)
#endif

#if !MIN_VERSION_base(4, 8, 0)
-- | Note: if base is older than 4.8, this may not be very efficient.
null :: Data.Foldable.Foldable t => t a -> Data.Bool.Bool
null = Data.Foldable.foldr (\_ _ -> Data.Bool.False) Data.Bool.True

-- | Note: if base is older than 4.8, this will always be /O(n)/.  If
--   performance is critical, consider explicitly importing from
--   @Data.Foldable@ or use the specialized versions.
length :: Data.Foldable.Foldable t => t a -> Prelude.Int
length = Data.Foldable.foldr (\_ x -> Prelude.succ x) 0
#endif

-- | Strict version of 'sum'.
sum' :: (Data.Foldable.Foldable t, Prelude.Num a) => t a -> a
sum' = Data.Foldable.foldl' (Prelude.+) 0

-- | Strict version of 'prod'.
prod' :: (Data.Foldable.Foldable t, Prelude.Num a) => t a -> a
prod' = Data.Foldable.foldl' (Prelude.*) 1

#if !MIN_VERSION_base(4, 7, 0)
traceId :: Show a => a -> a
traceId a = Debug.Trace.trace a a

traceShowId :: Show a => a -> a
traceShowId a = Debug.Trace.traceShow a a
#endif

#if !MIN_VERSION_base(4, 8, 0)
uncons :: [a] -> Maybe (a, [a])
uncons []       = Nothing
uncons (x : xs) = Just (x, xs)
#endif

maybeRead :: Read a => String -> Maybe a
maybeRead s = do
  case reads s of
    [(x, "")] -> Just x
    _         -> Nothing
