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
$list{int}
(
0,1,2,3,4,5,6,7,8,9
)
val xs = g0ofg1(xs)
val ys = reverse_<int>(xs)
//
val xsys = append_<int>(xs, ys)
//
val () =
println!
("|xs| = ", length_(xs))
//
val () =
println!
("|ys| = ", length_(ys))
//
val () = print! ("|xsys| = ")
val () = fprint_(stdout_ref, xsys)
val () = print_newline((*void*))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
