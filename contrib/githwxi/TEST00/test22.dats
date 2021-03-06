(* ****** ****** *)
//
// HX-2019-05-29:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

implfun
main0((*void*)) = ()

(* ****** ****** *)

abstbox
myseq(a:tflt) = ptr

extern
castfn
myseq_encode
{a:tflt}(list0(a)): myseq(a)

extern
fun
{a:tflt}
myseq_iseqz(myseq(a)): bool
extern
fun
{a:tflt}
myseq_streamize
(xs: myseq(a)): stream_vt(@(a, myseq(a)))

(* ****** ****** *)

local

absimpl
myseq(a:tflt) = list0(a)

in(*in-of-local*)

impltmp
{a}
myseq_iseqz(xs) = list0_iseqz(xs)

impltmp
(a:tflt)
gseq_streamize<gseq><myseq(a),tup(a,myseq(a))>
  (xs) =
(
  auxmain(xs, nil())
) where
{
fun
auxmain
(
xs: list0(a)
,
ys: list0(a)
) : stream_vt(@(a, myseq(a))) =
$ldelay
(
case+ xs of
| nil() =>
  stream_vt_nil()
| cons(x0, xs) =>
  stream_vt_cons
  (@(x0, revapp(ys, xs)), auxmain(xs, cons(x0, ys)))
)
} (* end of [myseq_streamize] *)

end // end of [local]

(* ****** ****** *)

fun
{a:tflt}
myseq_permute
(
xs: myseq(a)
) : list0(list0(a)) =
(
  helper(xs)
) where
{
fun
helper
(xs: myseq(a)): list0(list0(a)) =
if
myseq_iseqz(xs)
then sing(nil())
else
(
list0_concat
(
list0_vt2t
(
gseq_map_list<gseq><myseq(a),tup(a,myseq(a))><list0(list0(a))>(xs)
)
) where
{
impltmp
gseq_map$fopr<gseq><myseq(a),tup(a,myseq(a))><list0(list0(a))>(x0) = list0_mcons(x0.0, helper(x0.1))
}
)
} (* end of [myseq_permute] *)

(* ****** ****** *)

fun
{a:tflt}
list0_permute(xs: list0(a)): list0(list0(a)) = myseq_permute<a>(myseq_encode(xs))

(* ****** ****** *)

val xs =
g0ofg1
($list1{int}(1, 2, 3, 4, 5))
val xss = list0_permute<int>(xs)
val ((*void*)) = list0_foreach(xss) where { impltmp list0_foreach$work<list0(int)>(xs) = println!(xs) }

(* ****** ****** *)

(* end of [test22.dats] *)
