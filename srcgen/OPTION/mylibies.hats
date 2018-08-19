(* ****** ****** *)
//
// HX-2018-08-16:
// For downstream staloading
//
(* ****** ****** *)
//
#staload
STROPT =
"./DATS/option_string.dats"
//
absreimpl $STROPT.item_t0ype
//
overload
print with $STROPT.print_itemopt
overload
prerr with $STROPT.prerr_itemopt
overload
fprint with $STROPT.fprint_itemopt
//
(* ****** ****** *)

(* end of [mylibies.hats] *)
