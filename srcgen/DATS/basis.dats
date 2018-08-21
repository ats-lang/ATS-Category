(* ****** ****** *)

extern
fun
{xs:t@ype}
{x0:t@ype}
nil(): xs
extern
fun
{xs:t@ype}
{x0:t@ype}
cons(x0, xs): xs

(* ****** ****** *)

extern
fun
{xs:t@ype}
{x0:t@ype}
unnil(xs: xs): void
extern
fun
{xs:t@ype}
{x0:t@ype}
uncons(xs: &xs >> _): x0

(* ****** ****** *)

extern
fun
{xs:t@ype}
{x0:t@ype}
is_nil(xs: xs): bool
extern
fun
{xs:t@ype}
{x0:t@ype}
is_cons(xs: xs): bool

(* ****** ****** *)

(*
extern
fun
{xs:t@ype}
{x0:t@ype}
{ys:t@ype}
{y0:t@ype}
listmap(xs: xs): ys
*)

(* ****** ****** *)
//
extern
fun
{xs:t@ype}
{x0:t@ype}
foreach(xs: xs): void
extern
fun
{x0:t@ype}
foreach$work(x0: x0): void
//
(* ****** ****** *)

implement
{xs}
{x0}//tmp
foreach(xs) = let
//
fun
loop
(xs: &xs >> _): void =
  if
  is_cons<xs><x0>(xs)
  then let
    val x0 = uncons<xs><x0>(xs)
  in
    foreach$work<x0>(x0); loop(xs)
  end else () // end of [if]
//
in
  let var xs = xs in loop(xs) end
end (* end of [foreach] *)

(* ****** ****** *)
//
extern
fun
{xs:t@ype}
{x0:t@ype}
iforeach(xs: xs): void
extern
fun
{x0:t@ype}
iforeach$work(i: int, x0: x0): void
//
(* ****** ****** *)

implement
{xs}
{x0}//tmp
iforeach(xs) = let
//
fun
loop
(xs: &xs >> _, i: int): void =
  if
  is_cons<xs><x0>(xs)
  then let
    val x0 = uncons<xs><x0>(xs)
  in
    iforeach$work<x0>(i, x0); loop(xs, i+1)
  end else () // end of [if]
//
in
  let var xs = xs in loop(xs, 0) end
end (* end of [iforeach] *)

(* ****** ****** *)
//
extern
fun
{xs:t@ype}
{x0:t@ype}
{res:vt@ype}
foldleft(xs: xs, r0: res): res
extern
fun
{x0:t@ype}
{res:vt@ype}
foldleft$fopr(r0: res, x0: x0): res
//
extern
fun
{xs:t@ype}
{x0:t@ype}
{res:vt@ype}
foldright(xs: xs, r0: res): res
extern
fun
{x0:t@ype}
{res:vt@ype}
foldright$fopr(x0: x0, r0: res): res
//
(* ****** ****** *)

implement
{xs}
{x0}
{res}
foldleft(xs, r0) = let
//
fun
loop
(xs: &xs >> _, r0: res): res =
  if
  is_cons<xs><x0>(xs)
  then loop(xs, r0) where
  {
    val x0 = uncons<xs><x0>(xs)
    val r0 = foldleft$fopr<x0><res>(r0, x0)
  } else r0 // end of [if]
//
in
  let var xs = xs in loop(xs, r0) end
end (* end of [foldleft] *)

(* ****** ****** *)

implement
{xs}
{x0}
{res}
foldright(xs, r0) = let
//
fun
auxlst
(xs: &xs >> _, r0: res): res =
  if
  is_cons<xs><x0>(xs)
  then let
    val x0 = uncons<xs><x0>(xs)
  in
    foldright$fopr<x0><res>(x0, auxlst(xs, r0))
  end else r0 // end of [if]
//
in
  let var xs = xs in auxlst(xs, r0) end
end (* end of [foldright] *)

(* ****** ****** *)
//
extern
fun
{xs:t@ype}
{x0:t@ype}
length(xs: xs): intGte(0)
//
implement
{xs}{x0}//tmp
length(xs) =
foldleft<xs><x0><res>(xs, 0) where
{
  typedef
  res = intGte(0)
  implement
  foldleft$fopr<x0><res>(r0, _) = r0 + 1
}
//
(* ****** ****** *)
//
extern
fun
{xs:t@ype}
{x0:t@ype}
append(xs1: xs, xs2: xs): xs
//
extern
fun
{xs:t@ype}
{x0:t@ype}
reverse(xs: xs): xs
extern
fun
{xs:t@ype}
{x0:t@ype}
rappend(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)

implement
{xs}{x0}
append(xs1, xs2) = let
//
typedef res = xs
//
in
//
foldright<xs><x0><xs>
  (xs1, xs2) where
{
  implement
  foldright$fopr<x0><res>(x0, r0) = cons<res><x0>(x0, r0)
}
//
end // end of [append]

(* ****** ****** *)
//
implement
{xs}{x0}
reverse(xs) =
rappend<xs><x0>
(xs, nil<xs><x0>())
//
implement
{xs}{x0}
rappend(xs1, xs2) = let
//
typedef res = xs
//
in
//
foldleft<xs><x0><res>
  (xs1, xs2) where
{
  implement
  foldleft$fopr<x0><res>(r0, x0) = cons<res><x0>(x0, r0)
}
//
end // end of [rappend]

(* ****** ****** *)

extern
fun
{xs:t@ype}
{x0:t@ype}
fprint : fprint_type(xs)
extern
fun{}
fprint$sep(FILEref): void
//
implement
{xs}{x0}
fprint(out, xs) =
iforeach<xs><x0>(xs) where
{
//
implement
iforeach$work<x0>
  (i, x0) =
(
if i > 0
  then fprint$sep<>(out);
// end of [if]
  fprint_val<x0>(out, x0)
)
//
} (* end of [iforeach] *)
//
implement
{}(*tmp*)
fprint$sep(out) = fprint_string(out, ",")
//
(* ****** ****** *)

(* end of [basis.dats] *)
