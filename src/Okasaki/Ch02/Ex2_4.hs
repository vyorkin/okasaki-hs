{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Okasaki.Ch02.Ex2_4
  ( Ex2_4(..)
  ) where

import Okasaki.Ch02.Data.Set.Class (Set(..))
import Okasaki.Ch02.Data.UnbalancedSet (UnbalancedSet(..))

newtype Ex2_4 a = Ex2_4 { un :: UnbalancedSet a }
