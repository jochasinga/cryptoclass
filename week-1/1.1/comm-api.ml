(*
 * 
 * let key be a random number chosen from high min-entropy.
 * let H be a hash function.
 *
 * (highly distributed) number set.
 * Security properties:
 * - Hiding: Given H (key ^ msg), infeasible to find msg.
 * - Binding: Infeasible to find msg <> msg' such that H (key ^ msg) = H (key ^ msg')
 *)

let commit = fun msg -> H (key ^ msg), key
let verify = fun comm, key, msg -> H (key ^ msg) = comm
