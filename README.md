# purescript-choku

[Chalk](https://github.com/chalk/chalk) bindings for PureScript.

([Chōku][9] means chalk in Japanese.)

[![ci][1]][2]
[![release][3]][4]
[![pursuit][5]][6]
[![maintainer][7]][8]

[1]: https://github.com/m15a/purescript-choku/actions/workflows/ci.yml/badge.svg
[2]: https://github.com/m15a/purescript-choku/actions/workflows/ci.yml
[3]: https://img.shields.io/github/release/m15a/purescript-choku.svg
[4]: https://github.com/m15a/purescript-choku/releases
[5]: https://pursuit.purescript.org/packages/purescript-choku/badge
[6]: https://pursuit.purescript.org/packages/purescript-choku
[7]: https://img.shields.io/badge/maintainer-m15a-teal.svg
[8]: https://github.com/m15a/
[9]: https://en.wiktionary.org/wiki/%E3%83%81%E3%83%A7%E3%83%BC%E3%82%AF

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

[MIT](LICENSE)
