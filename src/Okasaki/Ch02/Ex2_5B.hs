module Okasaki.Ch02.Ex2_5B
  ( complete
  ) where

import Okasaki.Ch02.Data.Tree (Tree(..))

complete :: Ord a => a -> Int -> Tree a
complete _ 0 = error "Zero depth given"
complete x 1 = T E x E
complete x m = T (complete x (m - 1)) x E

-- λ> complete 'x' 5
-- T (T (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E)))
--      'x'
--      (T (T E 'x' (T E 'x' E))
--         'x'
--         (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E)))))
--   'x'
--   (T (T (T E 'x' (T E 'x' E))
--         'x'
--         (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E))))
--      'x'
--      (T (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E)))
--         'x'
--         (T (T E 'x' (T E 'x' E))
--            'x'
--            (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E))))))
