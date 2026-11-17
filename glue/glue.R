# Signatures of the glue package (for the version in METADATA): the functions
# that the packages using it (e.g. vctrs, tidyr) call. Same format as Rsem's
# base.R (cf. its conventions), in the `glue` namespace.

# The interpolated strings: a character vector of class `glue` (one string
# per element of the interpolated vectors, recycled). The arguments of `...`
# are the parts of the template, pasted together; the named ones (other than
# the options) are values the template can refer to.
#| glue::glue : (...: any, .sep:chr1?, .envir:env?, .open:chr1?, .close:chr1?, .na:chr1|null?, .null:any?, .comment:chr1?, .literal:lgl1?, .transformer:any?, .trim:lgl1?) -> CHR<glue, character>
# The same, with the values taken from `.x` (a list or a data frame) first.
#| glue::glue_data : (.x:any, ...: any, .sep:chr1?, .envir:env?, .open:chr1?, .close:chr1?, .na:chr1|null?, .null:any?, .comment:chr1?, .literal:lgl1?, .transformer:any?, .trim:lgl1?) -> CHR<glue, character>
# The elements of `x` collapsed into one string (none for an empty `x`).
#| glue::glue_collapse : (x:vec|null, sep:chr1?, width:dbl1?, last:chr1?) -> CHR<glue, character>

# Each element of `x`, between backticks or double quotes.
#| glue::backtick : (x:vec|null) -> CHR<>
#| glue::double_quote : (x:vec|null) -> CHR<>
