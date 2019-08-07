# Simple [Elm](https://elm-lang.org/) project

All of the Elm code lives in `src/Main.elm` and relies on the [elm/html][html] library.

[html]: https://package.elm-lang.org/packages/elm/html/latest


## Build Instructions

Run the following command from the root of this project:

```bash
elm make src/Main.elm --output=public/elm.js
```

Then open `index.html` in your browser!
