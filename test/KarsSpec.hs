module KarsSpec (spec) where

import Test.Hspec

spec :: Spec
spec = do
{-
main :: IO ()
main = hspec spec
-}
    describe "Probando sumas" $ do
        it "1+1 es 2" $ do
            1+1 `shouldBe` 2
