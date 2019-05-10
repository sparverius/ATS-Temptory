(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2011-2019 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define
ATS_PACKNAME "temptory"
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)
//
fun
{x0:tflt}
stream_append
( stream(x0)
, stream(x0)): stream(x0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
stream_streamize
  (xs: stream(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
stream_forall
(xs: stream(INV(x0))): bool
fun
{x0:tflt}
stream_forall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
stream_foreach
(xs: stream(INV(x0))): void
fun
{x0:tflt}
stream_foreach$work(x0): void
//
(* ****** ****** *)

(* end of [stream.sats] *)