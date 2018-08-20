(* ****** ****** *)

#staload
BASIS = "./basis.dats"

(* ****** ****** *)

#staload
"libats/ML/SATS/basis.sats"

(* ****** ****** *)
//
implement
(a:t@ype)
$BASIS.nil<list0(a)><a>() =
  list0_nil(*void*)
implement
(a:t@ype)
$BASIS.cons<list0(a)><a>
  (x0, xs) = list0_cons(x0, xs)
//
(* ****** ****** *)

implement
(a:t@ype)
$BASIS.unnil<list0(a)><a>(xs) = ()
implement
(a:t@ype)
$BASIS.uncons<list0(a)><a>(xs) =
let
//
val-
list0_cons(x0, xs1) = xs in xs := xs1; x0
//
end // end of [uncons]

(* ****** ****** *)
//
implement
(a:t@ype)
$BASIS.is_nil<list0(a)><a>(xs) =
(
case+ xs of
| list0_nil() => true | list0_cons _ => false
)
implement
(a:t@ype)
$BASIS.is_cons<list0(a)><a>(xs) =
(
case+ xs of
| list0_nil() => false | list0_cons _ => true
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
length
(xs: list0(INV(a))): intGte(0)
//
implement
{a}//tmp
length(xs) = $BASIS.length<list0(a)><a>(xs)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
append
(list0(INV(a)), list0(a)): list0(a)
implement
{a}//tmp
append(xs1, xs2) =
$BASIS.append<list0(a)><a>(xs1, xs2)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
reverse
(xs: list0(INV(a))): list0(a)
extern
fun
{a:t@ype}
rappend
(list0(INV(a)), list0(a)): list0(a)
//
implement
{a}//tmp
reverse(xs) =
rappend<a>(xs, list0_nil())
implement
{a}//tmp
rappend(xs1, xs2) =
$BASIS.rappend<list0(a)><a>(xs1, xs2)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
fprint(FILEref, list0(INV(a))): void
//
implement
(a:t@ype)
fprint<a>(out, xs) =
  $BASIS.fprint<list0(a)><a>(out, xs)
//
(* ****** ****** *)

(* end of [list0.dats] *)
