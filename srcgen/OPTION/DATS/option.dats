(* ****** ****** *)
//
// HX-2018-08-16:
// For generic option values
//
(* ****** ****** *)

stadef tt = true
stadef ff = false

(* ****** ****** *)
//
(*
abst0ype item_t0ype
abst0ype itemopt_t0ype(bool)
*)
//
(* ****** ****** *)

typedef
item = item_t0ype
typedef
itemopt(b:bool) = itemopt_t0ype(b)
typedef
itemopt = [b:bool] itemopt_t0ype(b)

(* ****** ****** *)
//
extern
fun{}
none(): itemopt(ff)
extern
fun{}
some(item): itemopt(tt)
//
(* ****** ****** *)
//
extern
fun{}
unnone
  (itemopt(ff)): void
extern
fun{}
unsome
  (opt: itemopt(tt)): item
//
(* ****** ****** *)
//
extern
fun{}
is_none
  {b:bool}
  (itemopt(b)): bool(~b)
extern
fun{}
is_some
  {b:bool}
  (itemopt(b)): bool( b)
//
overload iseqz with is_none
overload isneqz with is_some
//
(* ****** ****** *)
//
implement
{}(*tmp*)
is_none
  (opt) =
  not(is_some<>(opt))
implement
{}(*tmp*)
is_some
  (opt) =
  not(is_none<>(opt))
//
(* ****** ****** *)
//
extern
fun{}
print_itemopt(itemopt): void
extern
fun{}
prerr_itemopt(itemopt): void
//
extern
fun{}
fprint_item(FILEref, item): void
extern
fun{}
fprint_itemopt(FILEref, itemopt): void
//
(* ****** ****** *)

implement
print_itemopt<>(x) =
fprint_itemopt<>(stdout_ref, x)
implement
prerr_itemopt<>(x) =
fprint_itemopt<>(stderr_ref, x)
implement
fprint_itemopt<>(out, x) =
(
if
iseqz(x)
then
fprint!(out, "none(", ")")
else
fprint!
(out, "some(", unsome(x), ")")
) where
{
  implement
  fprint_item<> = fprint_val<item>
  overload fprint with fprint_item
}

(* ****** ****** *)
//
extern
fun{}
foreach(itemopt): void
extern
fun
{a:t0p}
foreach$fwork(item): void
//
implement
{}(*tmp*)
foreach
  (opt) =
(
  if
  isneqz(opt)
  then foreach$fwork(unsome(opt))
  else ((*void*))
) (* end of [foreach] *)
//
(* ****** ****** *)

(* end of [option.dats] *)
