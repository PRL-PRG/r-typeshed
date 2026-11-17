# Signatures of the lifecycle package (for the version in METADATA): the
# functions that the packages using it (e.g. vctrs, tidyr) call. Same format
# as Rsem's base.R (cf. its conventions), in the `lifecycle` namespace.

# Signal that `what` is deprecated since version `when`: a warning (always or
# once per session) or nothing (`deprecate_soft`, unless called from the
# global environment or a package's tests), returning `NULL` invisibly;
# `deprecate_stop` signals an error.
#| lifecycle::deprecate_warn : (when:chr1, what:chr1, with:chr1|null?, details:chr|null?, id:chr1|null?, always:lgl1?, env:env?, user_env:env?) -> null
#| lifecycle::deprecate_soft : (when:chr1, what:chr1, with:chr1|null?, details:chr|null?, id:chr1|null?, env:env?, user_env:env?) -> null
#| lifecycle::deprecate_stop : (when:chr1, what:chr1, with:chr1|null?, details:chr|null?, env:env?) -> empty
# The default of a deprecated argument: the missing argument, a symbol.
#| lifecycle::deprecated : () -> sym
# The documentation badge of a stage (Rd markup).
#| lifecycle::badge : (stage:chr1) -> CHR1<>
