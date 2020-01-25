# Using Libs in Dune with OCaml

## Update

Project works now that to discord channel help. Big take-away is that you have ot have a `public name` on your libraries dune file so that it can be seen by your main module. Big because the docs say that argument is optional here: <https://dune.readthedocs.io/en/latest/dune-files.html#library>.

## The Errors

I cant seem to get libs recognized by the `main.ml` file.

directoy structure is:

```sh
.
├── _build
│   ├── default
│   │   ├── lib
│   │   └── main
│   │       └── bin
│   └── install
│       └── default
│           └── lib
│               └── lib
├── lib
│   └── _build
├── main
│   ├── _build
│   │   └── default
│   └── bin
└── node_modules

16 directories

```
The `/lib` dir has two files, `math.ml` and `math2.ml`.

The `lib` `dune` file is:

```dune
(library
(name lib))
```

`main.ml` compiles and runs with a `hello world` function.

`main/dune`:

```dune
(executable
  (name main))
```

```sh
➜  using-libs main
➜  main dune clean
➜  main dune build main.exe
➜  main dune exec ./main.exe
Hello, world!
```

When I add `lib` to the `/main/dune` file I get an error saying it can't find the file.

new dune is:

```dune
(executable
  (name main)
  (libraries lib))
```

```sh
➜  using-libs [master*]main
➜  main [master*]dune clean
➜  main [master*]dune build main.exe
File "dune", line 3, characters 13-16:
3 |   (libraries lib))
                 ^^^
Error: Library "lib" not found.
Hint: try: dune external-lib-deps --missing main.exe
```
