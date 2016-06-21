module Text.HTML.Parser.Array where

import Data.Foldable
import Data.List

import Text.HTML.Parser.Types

-- Helpers to make writing ASTs easier.

element
  :: forall f g. (Foldable f, Foldable g)
  => String -> f Attribute -> g HTML -> HTML
element name attrs children = Element name (fromFoldable attrs) (fromFoldable children)

voidElement
  :: forall f. (Foldable f)
  => String -> f Attribute -> HTML
voidElement name attrs = VoidElement name (fromFoldable attrs)

textNode = TextNode

commentNode = CommentNode

