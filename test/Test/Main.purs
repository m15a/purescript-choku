module Test.Main (main) where

import Prelude (Unit, (<>), (=<<))
import Effect (Effect)
import Effect.Console (log)

import Choku

main :: Effect Unit
main = do

  let
    space = reset :& " "
    cr = reset :& "\n"
    end = reset :& ""

  log =<< bold :& "bold"
    <> space
    <> dim :& "dim"
    <> space
    <> italic :& "italic"
    <> space
    <> underline :& "underline"
    <> space
    <> inverse :& "inverse"
    <> space
    <> strikethrough :& "strikethrough"
    <> space
    <> black :& "black"
    <> cr

    <> red :& "red"
    <> space
    <> green :& "green"
    <> space
    <> yellow :& "yellow"
    <> space
    <> blue :& "blue"
    <> space
    <> magenta :& "magenta"
    <> space
    <> cyan :& "cyan"
    <> space
    <> white :& "white"
    <> space
    <> gray :& "gray"
    <> space
    <> bgBlack :& "bgBlack"
    <> cr

    <> bgRed :& "bgRed"
    <> space
    <> bgGreen :& "bgGreen"
    <> space
    <> bgYellow :& "bgYellow"
    <> space
    <> bgBlue :& "bgBlue"
    <> space
    <> bgMagenta :& "bgMagenta"
    <> space
    <> bgCyan :& "bgCyan"
    <> space
    <> bgWhite :& "bgWhite"
    <> end

