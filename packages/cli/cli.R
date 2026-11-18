# Signatures of the cli package (for the version in METADATA): the functions
# that the packages using it (e.g. vctrs, tidyr) call. Same format as Rsem's
# base.R (cf. its conventions), in the `cli` namespace.

# ========== Conditions ==========

# `message` is a character vector of bullets, formatted with cli's inline
# markup; the named arguments of `...` are fields of the condition.
#| cli::cli_abort : (message:chr, ...: any, call:any?, .envir:env?, .frame:env?) -> empty
#| cli::cli_warn : (message:chr, ...: any, .envir:env?) -> null
#| cli::format_error : (message:chr, .envir:env?) -> CHR1<>

# ========== Formatting ==========

# The text of `...`, pasted together and formatted (one string, unless
# `collapse = FALSE`).
#| cli::format_inline : (...: any, .envir:env?, collapse:lgl1?, keep_whitespace:lgl1?) -> CHR<>
#| cli::format_bullets_raw : (text:chr, id:chr1|null?, class:chr|null?) -> CHR<>
#| cli::pluralize : (...: any, .envir:env?, .transformer:any?) -> CHR<>
# `x` with the style to collapse it with (in the `cli_style` attribute).
#| cli::cli_vec : (x:'a, style:list?) -> 'a
# The quantity that pluralization uses, printing nothing itself.
#| cli::qty : (expr:any) -> <cli_noprint>
