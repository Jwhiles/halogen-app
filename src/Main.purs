module Main where

import Halogen (liftAff, liftEffect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Data.Maybe (Maybe(..))
import Effect (Effect(..))
import Halogen.VDom.Driver (runUI)

import Prelude

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI component unit body

data SomeThing a = SomeThing a
type State = Boolean

component :: forall m. H.Component HH.HTML SomeThing Unit Void m
component =
  H.component
    { initialState: const initialState -- functiomn taking props maybe??
    , render
    , eval
    , receiver: const Nothing
    }
  where
  initialState :: State
  initialState = false

  render :: State -> H.ComponentHTML SomeThing
  render state =
    HH.div_
    [ HH.h1_ [ HH.text "text renderer in halogen. wow" ] ]

  eval :: SomeThing ~> H.ComponentDSL State SomeThing Void m
  eval (SomeThing a) = pure a
