(* ****** ****** *)
//
// HX-2018-08-16:
// For string option values
//
(* ****** ****** *)

#staload UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

abst0ype
item_t0ype = string
abst0ype
itemopt_t0ype(bool) = stropt

(* ****** ****** *)

#include "./option.dats"

(* ****** ****** *)

absimpl
item_t0ype = string
absimpl
itemopt_t0ype(b:bool) = stropt

(* ****** ****** *)

implement
none<>() = stropt_none()
implement
some<>(x) = stropt_some(x)

(* ****** ****** *)

implement
is_none<>(x) =
$UN.castvwtp0(stropt_is_none(x))
implement
is_some<>(x) =
$UN.castvwtp0(stropt_is_some(x))

(* ****** ****** *)

implement
unnone<>(x) = ()
implement
unsome<>(x) =
stropt_unsome{0}($UN.castvwtp0(x))

(* ****** ****** *)

(* end of [option_string.dats] *)
