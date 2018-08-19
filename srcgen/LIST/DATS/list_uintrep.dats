(* ****** ****** *)
//
// HX-2018-08-16:
// For uint representation
//
(* ****** ****** *)

#staload UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

abst0ype
item_t0ype = int
abst0ype
itemlst_t0ype(n:int) = uint

(* ****** ****** *)

#include "./list.dats"

(* ****** ****** *)

absimpl
item_t0ype = intBtw(0, 10)
absimpl
itemlst_t0ype(n:int) = uint

(* ****** ****** *)
//
implement
fprint_item<>
  (out, x) = fprint(out, x)
//
(* ****** ****** *)
//
extern
fun{}
make_uint
  (xs: uint): itemlst
//
implement
make_uint<>(xs) = xs
//
(* ****** ****** *)

implement
nil<>() = 0u
implement
cons<>(x, xs) = 10u*xs + i2u(x)

(* ****** ****** *)

implement
is_nil<>(xs) =
$UN.castvwtp0(xs = 0u)
implement
is_cons<>(xs) =
$UN.castvwtp0(xs > 0u)

(* ****** ****** *)

implement
unnil<>(xs) = ()
implement
uncons<>
  (xs) = x0 where
{
  val x0 = xs % 10u
  val () = xs := xs / 10u
  val x0 = $UN.castvwtp0(x0)
}

(* ****** ****** *)

(* end of [list_uintrep.dats] *)
