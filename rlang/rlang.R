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
#| rlang::get_env : (env:any?, default:env?) -> env
#| rlang::env_inherits : (env:env, ancestor:env) -> LGL1<>
# The values of bindings, of which the type says nothing (`default` when there
# is no binding).
#| rlang::env_get : (env:env?, nm:chr1, default:any?, inherit:lgl1?, last:env?) -> dyn
#| rlang::env_get_list : (env:env?, nms:chr|null, default:any?, inherit:lgl1?, last:env?) -> { dyn }<>
# Whether there are bindings of these names, named after them.
#| rlang::env_has : (env:env?, nms:chr1, inherit:lgl1?) -> LGL1<>
#|               && (env:env?, nms:chr|null, inherit:lgl1?) -> LGL<>
# They return the previous values of the bindings (invisibly).
#| rlang::env_bind : (.env:env, ...: any) -> { any }<>
#| rlang::local_bindings : (...: any, .env:env?, .frame:env?) -> { any }<>

# ========== Conditions ==========

# `abort` signals an error: it never returns. Its other arguments (`call`,
# `body`, `parent`, ...) are named, and go in `...` here.
#| rlang::abort : (message:chr|null?, class:chr|null?, ...: any) -> empty
#| rlang::error_cnd : (class:chr|null?, ...: any) -> { any }<rlang_error, error, condition>
#| rlang::cnd_signal : (cnd:any, ...: any) -> null
#| rlang::cnd_header : (cnd:any, ...: any) -> CHR<>
#| rlang::names_inform_repair : (old:chr|null, new:chr|null) -> null
#| rlang::local_use_cli : (...: any, format:lgl1?, inline:lgl1?, frame:env?) -> null
# They signal a warning or a message, and return `NULL` (invisibly).
#| rlang::warn : (message:chr|null?, class:chr|null?, ...: any) -> null
#| rlang::inform : (message:chr|null?, class:chr|null?, ...: any) -> null
# The bullets (named after their kind: "i", "x", "*", ...) as a single string.
#| rlang::format_error_bullets : (x:chr|list) -> CHR1<>
# The value of `expr`, or the result of the handler (in `...`) of the
# condition it signals, as `tryCatch`.
#| rlang::try_fetch : (expr:any, ...: any) -> dyn
# The call to report in an error, from a call or an environment.
#| rlang::error_call : (call:any) -> any

# ========== Argument checks ==========

# They return (invisibly) when the check passes, and signal an error
# otherwise.
#| rlang::check_dots_empty0 : (...: any, call:env?) -> null
#| rlang::check_dots_empty : (env:env?, error:any?, call:env?, action:any?) -> null
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
#| rlang::inherits_any : (x:any, class:chr) -> LGL1<>
#| rlang::is_environment : (x:env) -> tt<>
#| rlang::is_environment : (x:~env) -> ff<>
#| rlang::is_function : (x:(empty -> any)) -> tt<>
#| rlang::is_function : (x:~(empty -> any)) -> ff<>
# A primitive is a function, but not a closure.
#| rlang::is_closure : (x:(empty -> any)) -> LGL1<>
#| rlang::is_closure : (x:~(empty -> any)) -> ff<>
#| rlang::is_symbol : (x:sym, name:chr|null?) -> LGL1<>
#| rlang::is_symbol : (x:~sym, name:chr|null?) -> ff<>
#| rlang::is_call : (x:any, name:chr|null?, n:dbl1|null?, ns:chr|null?) -> LGL1<>
#| rlang::is_formula : (x:any, scoped:lgl1|null?, lhs:lgl1|null?) -> LGL1<>
#| rlang::is_quosure : (x:any) -> LGL1<>
# Whether the argument was not supplied.
#| rlang::is_missing : (x:any) -> LGL1<>
#| rlang::is_zap : (x:any) -> LGL1<>
# Whether `x` has length 0 (`n`).
#| rlang::is_empty : (x:null) -> tt<>
#|                && (x:any) -> LGL1<>
#| rlang::has_length : (x:any, n:dbl1|null?) -> LGL1<>
# A scalar `NA` (`are_na`: elementwise).
#| rlang::is_na : (x:any) -> LGL1<>
#| rlang::are_na : (x:vec) -> LGL<>
# A double without a fractional part counts as an integer.
#| rlang::is_integerish : (x:any, n:dbl1|null?, finite:lgl1|null?) -> LGL1<>
# Bare: without a class.
#| rlang::is_bare_list : (x:list, n:dbl1|null?) -> LGL1<>
#| rlang::is_bare_list : (x:~list, n:dbl1|null?) -> ff<>
#| rlang::is_bare_string : (x:CHR1, n:dbl1|null?) -> LGL1<>
#| rlang::is_bare_string : (x:~CHR1, n:dbl1|null?) -> ff<>
#| rlang::is_interactive : () -> LGL1<>
# Whether the elements have names (`have_name`, one per element), whether `x`
# has elements of these names (`has_name`, one per name).
#| rlang::have_name : (x:any) -> LGL<>
#| rlang::has_name : (x:any, name:chr1) -> LGL1<>
#|                && (x:any, name:chr) -> LGL<>

# ========== Vectors ==========

#| rlang::chr : (...: any) -> CHR<>
#| rlang::int : (...: any) -> INT<>
#| rlang::new_logical : (n:dbl1, names:chr|null?) -> LGL<>
# The missing values of each type.
#| rlang::na_lgl : (LGL1 \ ^LGL1)<>
#| rlang::na_int : (INT1 \ ^INT1)<>
#| rlang::na_dbl : (DBL1 \ ^DBL1)<>
#| rlang::na_chr : (CHR1 \ ^CHR1)<>
# Like `list`, with the splicing of `!!!`.
#| rlang::list2 : (...: 'a, ( #l_i : 'a_i )_i ) -> { ( #l_i : 'a_i )_i, 'a }<>
#| rlang::set_names : (x:'a, nm:any?, ...: any) -> 'a
# The names of `x`, `""` for the elements without one (never `NULL`).
#| rlang::names2 : (x:any) -> CHR<>
# `x` recycled to the length of `names` (`along`), and named after them.
#| rlang::rep_named : (names:chr|null, x:v('a)) -> v('a)<>
#| rlang::rep_named : (names:chr|null, x:{'a}) -> {'a}<>
#| rlang::rep_along : (along:any, x:v('a)) -> v('a)<>
#| rlang::rep_along : (along:any, x:{'a}) -> {'a}<>
# The sequence from `from` to `to`, empty (rather than decreasing) when `to`
# is less than `from`; as `:`, integers when `from` is one.
#| rlang::seq2 : (from:int1, to:dbl1) -> INT<>
#|            && (from:dbl1, to:dbl1) -> (INT|DBL)<>
#| rlang::as_utf8_character : (x:any) -> CHR<>
# `x` with its missing values replaced by those of `y`.
#| rlang::(%|%) : (x:v('a), y:v('a)) -> v('a)
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
#| rlang::quo : (expr:any) -> lang<quosure, formula>
#| rlang::quos : (...: any, .named:lgl1?, .ignore_empty:chr1?, .unquote_names:lgl1?) -> { lang<quosure, formula> }<quosures, list>
#| rlang::as_quosure : (x:any, env:env?) -> lang<quosure, formula>
#| rlang::new_quosure : (expr:any, env:env?) -> lang<quosure, formula>
#| rlang::quo_get_expr : (quo:lang<quosure, ...>) -> any
#| rlang::quo_is_null : (quo:lang<quosure, ...>) -> LGL1<>
#| rlang::quo_is_symbol : (quo:lang<quosure, ...>, name:chr|null?) -> LGL1<>
# Expressions: a symbol, a call or a constant, which the type does not say.
#| rlang::expr : (expr:any) -> any
#| rlang::enexpr : (arg:any) -> any
#| rlang::get_expr : (x:any, default:any?) -> any
#| rlang::expr_text : (expr:any, width:dbl1?, nlines:dbl1?) -> CHR1<>
# The name of a symbol, or a string.
#| rlang::as_string : (x:any) -> CHR1<>
# The expressions, named after their text when they have no name.
#| rlang::exprs_auto_name : (exprs:{'a}<`c>, ...: any, repair_auto:chr1?, repair_quiet:lgl1?) -> {'a}<`c>
# The number of arguments in `...`.
#| rlang::dots_n : (...: any) -> INT1<>
#| rlang::as_label : (x:any) -> CHR1<>
#| rlang::missing_arg : () -> any
#| rlang::maybe_missing : (x:'a, default:any?) -> 'a
#| rlang::as_function : (x:any, env:env?, ...: any) -> dyn
#| rlang::inject : (expr:any, env:env?) -> dyn
#| rlang::exec : (.fn:any, ...: any, .env:env?) -> dyn
#| rlang::eval_bare : (expr:any, env:env?) -> dyn
#| rlang::eval_tidy : (expr:any, data:any?, env:env?) -> dyn
# The previous values of the options, invisibly.
#| rlang::local_options : (...: any, .frame:env?) -> { any }<>
#| rlang::run_on_load : (ns:any?) -> null

# ========== Operators ==========

# The default value `y` when `x` is `NULL` (as base's, since R 4.4.0).
#| rlang::(%||%) : (x:null, y:'b) -> 'b
#| rlang::(%||%) : (x:~null & 'a, y:any) -> 'a
