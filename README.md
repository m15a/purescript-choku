# purescript-choku

[Chalk][chalk home] bindings for PureScript.

[![CI][ci badge]][ci status]
[![Release][release badge]][release list]
[![Pursuit][pursuit badge]][pursuit home]
[![Maintainer][maintainer badge]][maintainer home]

## Example

```purescript
main = do
  let
    space = reset :& " "
    cr = reset :& "\n"
    end = reset :& ""

  log =<< bold          :& "bold"          <> space
       <> dim           :& "dim"           <> space
       <> italic        :& "italic"        <> space
       <> underline     :& "underline"     <> space
       <> inverse       :& "inverse"       <> space
       <> strikethrough :& "strikethrough" <> space

       <> black   :& "black"   <> cr
       <> red     :& "red"     <> space
       <> green   :& "green"   <> space
       <> yellow  :& "yellow"  <> space
       <> blue    :& "blue"    <> space
       <> magenta :& "magenta" <> space
       <> cyan    :& "cyan"    <> space
       <> white   :& "white"   <> space
       <> gray    :& "gray"    <> space

       <> bgBlack   :& "bgBlack"   <> cr
       <> bgRed     :& "bgRed"     <> space
       <> bgGreen   :& "bgGreen"   <> space
       <> bgYellow  :& "bgYellow"  <> space
       <> bgBlue    :& "bgBlue"    <> space
       <> bgMagenta :& "bgMagenta" <> space
       <> bgCyan    :& "bgCyan"    <> space
       <> bgWhite   :& "bgWhite"   <> end
```

prints like

![Example](_assets/example.png)

## Installation

```console
$ npm install chalk
$ spago install choku
```

## License

See [LICENSE](./LICENSE).


[chalk home]: https://github.com/chalk/chalk
[ci badge]: https://github.com/m15a/purescript-choku/actions/workflows/ci.yml/badge.svg
[ci status]: https://github.com/m15a/purescript-choku/actions/workflows/ci.yml
[release badge]: https://img.shields.io/github/release/m15a/purescript-choku.svg
[release list]: https://github.com/m15a/purescript-choku/releases
[pursuit badge]: https://pursuit.purescript.org/packages/purescript-choku/badge
[pursuit home]: https://pursuit.purescript.org/packages/purescript-choku
[maintainer badge]: https://img.shields.io/badge/maintainer-m15a-teal.svg
[maintainer home]: https://github.com/m15a/
