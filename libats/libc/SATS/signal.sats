(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: April, 2014
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

%{#
#include \
"libats/libc/CATS/signal.cats"
%} (* %{# *)

(* ****** ****** *)

#define
ATS_PACKNAME "temptory.libc."
#define
ATS_EXTERN_PREFIX "temptory_libc_"

(* ****** ****** *)

typedef ieqz = sint

(* ****** ****** *)

abstflt signum = int

(* ****** ****** *)

abstflt
sigaction = // struct
$extype"temptory_libc_sigaction_t"
abstbox
sighandler = // function
$extype"temptory-libc_sighandler_t"

(* ****** ****** *)
//
fun
sigaction_set_handler
( SA
: &sigaction >> _
, sighandler
: (signum) -> void): void = "mac#%"
//
(* ****** ****** *)
//
// HX: succ/fail=0/-1
//
fun
sigaction
( signal
: signum
, newact
: &sigaction
, oldact
: &sigaction? >> opt(sigaction, i==0)
) : #[i:int | i <= 0] int(i) = "mac#%"
//
fun
sigaction_null
( signal: signum
, newact: &sigaction ): ieqz = "mac#%"

(* ****** ****** *)

#macdef
SIGALRM = $extval(signum, "SIGALRM") // 14

(* ****** ****** *)

(* end of [signal.sats] *)
