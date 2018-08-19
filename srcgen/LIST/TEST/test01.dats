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

implement
main0() =
{
//
val () =
println!
"Hello from [test01]!"
//
val xs =
$UINTREP.make_uint(12345u)
//
val () = println! ("xs = ", xs)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
