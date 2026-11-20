# r-typeshed

Type signatures of R packages from CRAN, for [tyr](https://github.com/PRL-PRG/tyr)
and the tools built on its type algebra (Rsem for R code, NativeSem for C code).


This repository holds type signatures for the functions of CRAN packages, including 
the native ones (the ones you would call with `.Call` for instance).

When type checking a package, `tyr` uses those signatures for dependencies that
do not carry type signatures already.

## Layout

One directory per package in `packages/`, named after it:

```
packages/rlang/
  METADATA   # the package and the version the signatures are written for
  EXPORTS    # the names the package exports (generated)
  rlang.R    # signatures of the R functions
  rlang.ty   # signatures of the native routines (optional)
```

- `packages/<pkg>/<pkg>.R`: the signatures of the package's R functions, in Rsem's
  annotation format (the format of Rsem's `sigs/base.R` and `sigs/stats.R`):
  one `#|` line per signature, in the package's namespace.

  ```r
  #| rlang::caller_env : (n:dbl1?) -> env
  #| rlang::is_null : (x:null) -> tt<>
  #| rlang::is_null : (x:~null) -> ff<>
  ```

  Successive signatures of a name are overloads; the conventions (classes,
  scalars, overloads grouped with `&&`) are those described at the top of
  Rsem's `sigs/base.R`.

- `packages/<pkg>/<pkg>.ty`: the signatures of the package's native routines (what its
  R code reaches with `.Call`, `.External`, ...), in NativeSem's format (the
  format of NativeSem's `types/*.ty`). Needed only where tyr does not infer
  them from the package's C sources.

- `packages/<pkg>/METADATA`: the package and the released version the signatures are
  written for, in the `Field: value` format of R's `DESCRIPTION` files (DCF,
  read in R with `read.dcf()`):

  ```
  Package: rlang
  Version: 1.2.0
  ```

- `packages/<pkg>/EXPORTS`: the names the package exports at that version, one per
  line. A package that imports `<pkg>` whole (`import(pkg)` in its NAMESPACE)
  can use them all: tyr binds those without a signature to an unbound
  `pkg::name`, so that they are reported as missing signatures of `<pkg>`
  rather than looked up in base. Generated with the package installed at the
  version of METADATA:

  ```sh
  Rscript scripts/exports.R rlang   # all the packages without argument
  ```

  The script also lists the signatures of `<pkg>.R` for names the package
  does not export.


## Using the signatures

Give tyr the checkout: it loads the signatures of the packages the checked
package imports (its NAMESPACE) or calls qualified (`pkg::f`):

```sh
tyr --prelude base.R --prelude stats.R --typeshed r-typeshed <package-dir>
```

Or load one package's signatures as an extra prelude, after base and stats:

```sh
tyr --prelude base.R --prelude stats.R --prelude r-typeshed/packages/rlang/rlang.R <package-dir>
```


## Packages

| Package | Version | R | Native |
|---|---|---|---|
| rlang | 1.2.0 | the functions vctrs and tidyr use | – |
| glue | 1.8.1 | the functions vctrs and tidyr use | – |
| lifecycle | 1.0.5 | the functions vctrs and tidyr use | – |
| cli | 3.6.6 | the functions vctrs and tidyr use | – |
| vctrs | 0.7.3 | none yet (EXPORTS only, for tidyr's `import(vctrs)`) | – |
| zoo | 1.9-1 | none yet (EXPORTS only, for sandwich's `import(zoo)`) | – |

## License

The signatures are distributed under the GNU General Public License, version 3
(see [LICENSE](LICENSE)). Tools that read them, and the packages they describe,
are not affected; modified signatures must be shared under the same license.
