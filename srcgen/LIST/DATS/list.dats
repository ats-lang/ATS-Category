(* ****** ****** *)
//
// HX-2018-08-16:
// For generic option values
//
(* ****** ****** *)
//
(*
abst0ype item_t0ype
abst0ype itemlst_t0ype(int)
*)
//
(* ****** ****** *)
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

typedef
item = item_t0ype
typedef
itemlst(n:int) = itemlst_t0ype(n)
typedef
itemlst = [n:int] itemlst_t0ype(n)

(* ****** ****** *)

extern
prfun
lemma_param
{n:int}(itemlst(n)): [n >= 0] void

(* ****** ****** *)
//
extern
fun{}
nil(): itemlst(0)
extern
fun{}
cons{n:int}
  (x0: item, xs: itemlst(n)): itemlst(n+1)
//
(* ****** ****** *)
//
extern
fun{}
unnil
  (itemlst(0)): void
extern
fun{}
uncons{n:pos}
  (xs: &itemlst(n) >> itemlst(n-1)): item
//
(* ****** ****** *)
//
extern
fun{}
is_nil
  {n:int}
  (itemlst(n)): bool(n==0)
extern
fun{}
is_cons
  {n:int}
  (itemlst(n)): bool(n > 0)
//
overload iseqz with is_nil
overload isneqz with is_cons
//
(* ****** ****** *)
//
implement
{}(*tmp*)
is_nil
  (xs) =
(
  not(is_cons<>(xs))
) where
{
  prval () = lemma_param(xs)
}
implement
{}(*tmp*)
is_cons
  (xs) =
(
  not(is_nil<>(xs))
) where
{
  prval () = lemma_param(xs)
}
//
(* ****** ****** *)
//
extern
fun{}
print_itemlst(itemlst): void
extern
fun{}
prerr_itemlst(itemlst): void
//
extern
fun{}
fprint_sep(FILEref): void
extern
fun{}
fprint_item(FILEref, item): void
extern
fun{}
fprint_itemlst(FILEref, itemlst): void
//
(* ****** ****** *)

implement
print_itemlst<>
(
  xs
) =
fprint_itemlst<>(stdout_ref, xs)
implement
prerr_itemlst<>
(
  xs
) =
fprint_itemlst<>(stderr_ref, xs)
//
implement
fprint_sep<>(out) = fprint(out, ",")
//
implement
fprint_itemlst<>
  (out, xs) =
  loop(xs, 0) where
{
//
var xs: itemlst = xs
//
fun
loop
(xs: &itemlst >> _, n: int): void =
(
  if
  isneqz(xs)
  then let
    val x0 = uncons(xs)
  in
    if n > 0
      then fprint_sep<>(out);
    // end of [if]
    fprint_item(out, x0); loop(xs, n+1)
  end // end of [if]
) (* end of [loop] *)
//
} (* end of [fprint_itemlst] *)

(* ****** ****** *)
//
extern
fun{}
streamize
(itemlst): stream_vt(item)
//
implement
{}(*tmp*)
streamize
  (xs) = loop(xs) where
{
//
var xs: itemlst = xs
//
fun
loop
(
xs: &itemlst >> _
) : stream_vt(item) =
$ldelay(
  if
  isneqz(xs)
  then
  let
    val x0 =
      uncons<>(xs)
  in
    stream_vt_cons{item}(x0, loop(xs))
  end
  else stream_vt_nil(*void*)
) : stream_vt_con(item)
}
//
(* ****** ****** *)
//
extern
fun{}
foreach(itemlst): void
extern
fun{}
foreach$fwork(item): void
//
implement
{}(*tmp*)
foreach
  (xs) = loop(xs) where
{
//
var xs: itemlst = xs
//
fun
loop(xs: &itemlst >> _): void =
(
  if
  isneqz(xs)
  then let
    val x0 = uncons(xs)
  in
    foreach$fwork<>(x0); loop(xs)
  end // end of [if]
) (* end of [loop] *)
//
} (* end of [foreach] *)
//
(* ****** ****** *)
//
extern
fun
{res:vt0p}
foldleft(itemlst, res): res
extern
fun
{res:vt0p}
foldleft$fopr(res, item): res
//
(* ****** ****** *)
//
extern
fun
{res:vt0p}
foldright(itemlst, res): res
extern
fun
{res:vt0p}
foldright$fopr(item, res): res
//
(* ****** ****** *)

implement
{res}//tmp
foldleft(xs, r0) =
  loop(xs, r0) where
{
  var xs: itemlst = xs
  fun
  loop
  (xs: &itemlst >> _, r0: res): res =
  (
    if
    isneqz(xs)
    then
    let
      val x0 = uncons<>(xs)
    in
      loop(xs, foldleft$fopr(r0, x0))
    end
    else r0 // end of [if]
  )
} (* end of [foldleft] *)

(* ****** ****** *)

extern
fun{}
length{n:int}(itemlst(n)): int(n)

implement
{}(*tmp*)
length(xs) =
$UN.castvwtp0(foldleft<int>(xs, 0))

(* ****** ****** *)

extern
fun{}
append{n1,n2:int}
(itemlst(n1), itemlst(n2)): int(n1+n2)

(* ****** ****** *)

extern
fun{}
reverse{n:int}(itemlst(n)): itemlst(n)
extern
fun{}
rappend{n1,n2:int}
(itemlst(n1), itemlst(n2)): itemlst(n1+n2)

(* ****** ****** *)

implement
{}(*tmp*)
append(xs, ys) =
$UN.castvwtp0
(foldright<itemlst>(xs, ys)) where
{
implement
foldright$fopr<itemlst>(x0, ys) = cons<>(x0, ys)
}

(* ****** ****** *)

implement
{}(*tmp*)
reverse(xs) = rappend<>(xs, nil<>())
implement
{}(*tmp*)
rappend(xs, ys) =
$UN.castvwtp0
(foldleft<itemlst>(xs, ys)) where
{
  implement
  foldleft$fopr<itemlst>(ys, x0) = cons<>(x0, ys)
}

(* ****** ****** *)

(* end of [list.dats] *)
