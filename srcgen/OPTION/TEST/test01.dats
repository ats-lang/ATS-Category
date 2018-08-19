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
val
opt0 =
$STROPT.none()
val
opt1 =
$STROPT.some("Hello")
//
val () = println! ("opt0 = ", opt0)
val () = println! ("opt1 = ", opt1)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
