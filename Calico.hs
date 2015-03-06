{-# LANGUAGE CPP #-}
module Calico (

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
  , Data.List.unzip

    -- ** String
  , Data.String.String
  , Text.Printf.printf
  , Text.Printf.PrintfType

    -- ** Text
  , Data.Text.Text
  , TextL

    -- ** ByteString
  , Data.ByteString.ByteString
  , ByteStringL

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

    -- ** Read
  , Text.Read.ReadS
  , Text.Read.Read
  , Text.Read.readsPrec
  , Text.Read.readList
  , Text.Read.reads
  , Text.Read.readParen
  , Text.Read.read
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

    -- ** Category
  , Control.Category.id
  , (Control.Category..)

    -- ** Functor
  , Data.Functor.Functor
  , (Data.Functor.<$>)
  , (Data.Functor.<$)
#if MIN_VERSION_base(4, 7, 0)
  , (Data.Functor.$>)
#else
  , ($>)
#endif

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
  , Debug.Trace.traceIO
  , Debug.Trace.traceShow
  , Debug.Trace.traceStack

    -- * I\/O
  , Calico.IO.IO
  , Calico.IO.getContents
  , Calico.IO.getLine
  , Calico.IO.putStr
  , Calico.IO.putStrLn
  , Calico.IO.readLn
  , Calico.IO.print
  , Calico.IO.readFile
  , Calico.IO.writeFile
  , Calico.IO.appendFile
  ) where
import qualified Prelude
import qualified Control.Applicative
import qualified Control.Arrow
import qualified Control.Category
import qualified Control.Monad
import qualified Control.Monad.Fix
import qualified Data.Bool
import qualified Data.ByteString
import qualified Data.ByteString.Lazy
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
import qualified Data.Ratio
import qualified Data.String
import qualified Data.Text
import qualified Data.Text.Lazy
import qualified Data.Traversable
import qualified Data.Word
import qualified Debug.Trace
import qualified Data.Tuple
import qualified System.Environment
import qualified System.Exit
import qualified System.IO
import qualified System.IO.Error
import qualified Text.Read
import qualified Text.Show
import qualified Text.Printf
import qualified Calico.IO

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

-- | Lazy @'Data.Text.Lazy.Text'@.
type TextL = Data.Text.Lazy.Text

-- | Lazy @'Data.ByteString.Lazy.ByteString'@.
type ByteStringL = Data.ByteString.Lazy.ByteString
