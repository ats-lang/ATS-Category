(* ****** ****** *)

#staload
BASIS = "./basis.dats"

(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
abst0ype
  uintrep = uint
//
(* ****** ****** *)
//
local
absimpl uintrep = uint
in
  // nothing
end // end of [local]
//
(* ****** ****** *)

typedef x0 = uint
typedef xs = uintrep

(* ****** ****** *)
//
extern
fun{}
encode_uint(uint): uintrep
extern
fun{}
decode_uint(uintrep): uint
//
implement
{}(*tmp*)
encode_uint
  (xs) = xs where
{
  absreimpl uintrep  
}
implement
{}(*tmp*)
decode_uint
  (xs) = xs where
{
  absreimpl uintrep  
}
//
(* ****** ****** *)
//
implement
$BASIS.nil<xs><x0>
(
) =
(
  0u
) where
{
  absreimpl uintrep  
}
//
implement
(a:t@ype)
$BASIS.cons<xs><x0>
  (x0, xs) =
(
  10u*xs + x0
) where
{
  absreimpl uintrep  
}
//
(* ****** ****** *)
//
implement
$BASIS.unnil<xs><x0>
  (xs) = ()
//
implement
$BASIS.uncons<xs><x0>
  (xs) = let
//
absreimpl uintrep  
//
val x0 = xs % 10u in xs := xs / 10u; $UN.cast(x0)
//
end // end of [uncons]
//
(* ****** ****** *)
//
implement
$BASIS.is_nil<xs><x0>
(
  xs
) =
(
  xs = 0u
) where
{
  absreimpl uintrep  
}
implement
$BASIS.is_cons<xs><x0>
(
  xs
) =
(
  xs > 0u
) where
{
  absreimpl uintrep  
}
//
(* ****** ****** *)
//
extern
fun{}
reverse(uintrep): uintrep
implement
reverse<>(xs) =
$BASIS.reverse<xs><x0>(xs)
//
(* ****** ****** *)

(* end of [uintrep.dats] *)
