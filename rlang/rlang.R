# Signatures of the rlang package (for the version in METADATA): the functions
# that the packages importing it (e.g. vctrs, tidyr) use. Same format as
# Rsem's base.R (cf. its conventions), in the `rlang` namespace.

# ========== Environments ==========

#| rlang::caller_env : (n:dbl1?) -> env
#| rlang::current_env : () -> env
#| rlang::global_env : () -> env
# The namespace of a package (given by name, or by an environment or a
# function in it).
#| rlang::ns_env : (x:any?) -> env
#| rlang::env : (...: any) -> env
#| rlang::new_environment : (data:list?, parent:env?) -> env

# ========== Conditions ==========

# `abort` signals an error: it never returns. Its other arguments (`call`,
# `body`, `parent`, ...) are named, and go in `...` here.
#| rlang::abort : (message:chr|null?, class:chr|null?, ...: any) -> empty
#| rlang::error_cnd : (class:chr|null?, ...: any) -> { any }<rlang_error, error, condition>
#| rlang::cnd_signal : (cnd:any, ...: any) -> null
#| rlang::cnd_header : (cnd:any, ...: any) -> CHR<>
#| rlang::names_inform_repair : (old:chr|null, new:chr|null) -> null
#| rlang::local_use_cli : (...: any, format:lgl1?, inline:lgl1?, frame:env?) -> null

# ========== Argument checks ==========

# They return (invisibly) when the check passes, and signal an error
# otherwise.
#| rlang::check_dots_empty0 : (...: any, call:env?) -> null
#| rlang::check_dots_unnamed : (env:env?, error:any?, call:env?, action:any?) -> null
#| rlang::check_dots_used : (env:env?, call:env?, error:any?, action:any?) -> null
#| rlang::check_required : (x:any, arg:chr1?, call:env?) -> tt<>
#| rlang::check_installed : (pkg:chr, reason:chr1|null?, ...: any) -> null
#| rlang::is_installed : (pkg:chr, ...: any) -> LGL1<>
# The label of the expression passed as `arg` (e.g. "`x`").
#| rlang::caller_arg : (arg:any) -> CHR1<>
# One of `values` (several with `multiple = TRUE`).
#| rlang::arg_match0 : (arg:chr, values:chr, arg_nm:chr1?, error_call:env?) -> CHR1<>
#| rlang::arg_match : (arg:chr|null, values:chr|null?, ...: any, multiple:ff?) -> CHR1<>
#|                 && (arg:chr|null, values:chr|null?, ...: any, multiple:lgl1?) -> CHR<>

# ========== Predicates ==========

# Like base's: the type of `x` decides the result when it can. `n` asks for a
# length as well.
#| rlang::is_null : (x:null) -> tt<>
#| rlang::is_null : (x:~null) -> ff<>
# A string: a character vector of length 1 (and not `NA`).
#| rlang::is_string : (x:CHR1, string:chr|null?) -> LGL1<>
#| rlang::is_string : (x:~CHR1, string:chr|null?) -> ff<>
#| rlang::is_true : (x:~lgl) -> ff<>
#|               && (x:any) -> LGL1<>
#| rlang::is_false : (x:~lgl) -> ff<>
#|                && (x:any) -> LGL1<>
#| rlang::is_bool : (x:LGL1) -> LGL1<>
#| rlang::is_bool : (x:~LGL1) -> ff<>
#| rlang::is_list : (x:list, n:dbl1|null?) -> LGL1<>
#| rlang::is_list : (x:~list, n:dbl1|null?) -> ff<>
#| rlang::is_logical : (x:LGL, n:dbl1|null?) -> LGL1<>
#| rlang::is_logical : (x:~LGL, n:dbl1|null?) -> ff<>
#| rlang::is_character : (x:CHR, n:dbl1|null?) -> LGL1<>
#| rlang::is_character : (x:~CHR, n:dbl1|null?) -> ff<>
#| rlang::is_integer : (x:INT, n:dbl1|null?) -> LGL1<>
#| rlang::is_integer : (x:~INT, n:dbl1|null?) -> ff<>
#| rlang::is_double : (x:DBL, n:dbl1|null?, finite:lgl1|null?) -> LGL1<>
#| rlang::is_double : (x:~DBL, n:dbl1|null?, finite:lgl1|null?) -> ff<>
#| rlang::is_atomic : (x:vec, n:dbl1|null?) -> LGL1<>
#| rlang::is_atomic : (x:~vec, n:dbl1|null?) -> ff<>
#| rlang::is_vector : (x:vec|list, n:dbl1|null?) -> LGL1<>
#| rlang::is_vector : (x:~(vec|list), n:dbl1|null?) -> ff<>
#| rlang::is_named : (x:any) -> LGL1<>
# Whether the class of `x` is exactly `class`.
#| rlang::inherits_only : (x:any, class:chr) -> LGL1<>

# ========== Vectors ==========

#| rlang::chr : (...: any) -> CHR<>
#| rlang::int : (...: any) -> INT<>
# Like `list`, with the splicing of `!!!`.
#| rlang::list2 : (...: 'a, ( #l_i : 'a_i )_i ) -> { ( #l_i : 'a_i )_i, 'a }<>
#| rlang::set_names : (x:'a, nm:any?, ...: any) -> 'a
# `x` with its missing values replaced by those of `y`.
#| rlang::(%|%) : (x:v('a), y:v('a)) -> v('a)
#| rlang::new_data_frame : (.x:list?, ...: any, .size:dbl1|null?, .class:chr|null?) -> { any }<data.frame, ...> with { names: CHR, any }
# A sentinel, e.g. to remove an element in `list_modify`.
#| rlang::zap : () -> { }<rlang_zap>
#| rlang::hash : (x:any) -> CHR1<>

# ========== Symbols, quoting and functions ==========

# Symbols are `sym`. A quosure is a call (`lang`) with the `quosure` class
# and its environment. The results that are evaluated or called
# (`as_function`, `inject`) are `dyn`.
#| rlang::sym : (x:chr1) -> sym
#| rlang::syms : (x:chr|list) -> { sym }<>
#| rlang::ensym : (arg:any) -> sym
#| rlang::enquo : (arg:any) -> lang<quosure, formula>
#| rlang::enquos : (...: any) -> { lang<quosure, formula> }<quosures, list>
#| rlang::as_label : (x:any) -> CHR1<>
#| rlang::missing_arg : () -> any
#| rlang::maybe_missing : (x:'a, default:any?) -> 'a
#| rlang::as_function : (x:any, env:env?, ...: any) -> dyn
#| rlang::inject : (expr:any, env:env?) -> dyn
# The previous values of the options, invisibly.
#| rlang::local_options : (...: any, .frame:env?) -> { any }<>
#| rlang::run_on_load : (ns:any?) -> null
