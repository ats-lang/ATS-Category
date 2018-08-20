(* ****** ****** *)

#include
"share\
/atspre_staload.hats"

#staload
"libats/ML/SATS/basis.sats"
#staload
"libats/ML/SATS/list0.sats"

(* ****** ****** *)
//
// HX: for internal testing
//
#include
"./../mylibies.hats"
//
(* ****** ****** *)

#staload U = $UINTREP

(* ****** ****** *)

fun
fprint_uint_
(out: FILEref, u0: uint): void =
$BASIS.fprint<$U.xs><$U.x0>
(
out
,
$U.reverse<>($U.encode_uint<>(u0))
) where
{
implement
$BASIS.fprint$sep<>(out) = ((*void*))
}

(* ****** ****** *)

implement
main0() =
{
//
val () =
println!
"Hello from [test02]!"
//
val () =
  fprint_uint_(stdout_ref, 12345u)
//
val () = fprint_newline(stdout_ref)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test02.dats] *)
