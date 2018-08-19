(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
//
// HX: for internal testing
//
#include "./../mylibies.hats"
//
(* ****** ****** *)

#staload U = $UINTREP

(* ****** ****** *)

extern
fun
my_fprint_uint:
fprint_type(uint)
implement
my_fprint_uint
  (out, u0) =
  fprint(out, ys) where
{
  val xs = $U.encode_uint(u0)
  val ys = $U.reverse(xs)
  val u1 = $U.decode_uint(ys)
  implement $U.fprint_sep<>(out) = ()
}

(* ****** ****** *)

implement
main0() =
{
//
val () =
println!
"Hello from [test01]!"
//
val () =
my_fprint_uint(stdout_ref, 12345u)
//
val () = fprint_newline(stdout_ref)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
