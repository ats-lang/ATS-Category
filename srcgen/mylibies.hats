(* ****** ****** *)
//
// HX-2018-08-18:
// For downstream staloading
//
(* ****** ****** *)
//
#staload
BASIS = "./DATS/basis.dats"
//
#staload
LIST0 = "./DATS/list0.dats"
#staload
UINTREP = "./DATS/uintrep.dats"
//
(* ****** ****** *)
//
overload
fprint_ with $BASIS.fprint of 00
overload
fprint_ with $LIST0.fprint of 10
//
(* ****** ****** *)
//
overload
length_ with $BASIS.length of 00
overload
length_ with $LIST0.length of 10
//
(* ****** ****** *)
//
overload
append_ with $BASIS.append of 00
overload
append_ with $LIST0.append of 10
//
overload
reverse_ with $BASIS.reverse of 00
overload
reverse_ with $LIST0.reverse of 10
overload
rappend_ with $BASIS.rappend of 00
overload
rappend_ with $LIST0.rappend of 10
//
(* ****** ****** *)

(* end of [mylibies.hats] *)
