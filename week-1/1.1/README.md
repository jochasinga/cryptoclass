# Cryptographic Hash Function

### Hash function
+ takes any string as input
+ fixed-size output (256 bits in Bitcoin)
+ efficiently computable

### Security Properties of a Hash Function
+ collision-free
+ hiding
+ puzzle-friendly

### Property 1: Collision-free
Nobody can find `x` and `y` such that

```ocaml
x <> y && H x = H y
```
Collisions do exist, but it takes a very long time to matter.

> *How to find a collision*
> try 2<sup>130</sup> randomly chosen inputs
> 99.8% chance that they will collide.
> 
> This works no matter what H is but it takes way too long.

### Application: Hash as message digest

if we know `H x = H y`, then it's safe to assume that `x = y`.

i.e. To recognize a file that we saw before, just remember its 
hash. Useful because the hash is small (commonly a 256 bits string).

### Property 2: Hiding
Given `H x`, it is *infeasible* to find `x`.

*example:*

Flip a coin, where 

```ocaml
type coin_result = Heads | Tails
				 
let coin_hash = function
  | Heads -> H "heads"
  | Tails -> H "tails"
```
This of course is easy to guess the underlying `s` in `H s`
because *there are only 2 outcomes*.

*Important:* When there's only a couple possible value of `x`,
and adversary could guess easily by trying all values.

### Hiding property:
If `r` is chosen from a probability distribution that hash *high min-entropy*,
then given `H (r ^ x)`, it is infeasible to find `x`.

High min-entropy means that the distribution is "very spread out", so that
no particular value is chosen with more than negligible probability.

For short, concatenating `x` to `r` helps hide `x`.

### Application: Commitment
Want to "seal a value in an envelope", and "open the envelope" later.

> Commit to a value, reveal it later.

### Commitment API

```ocaml
(* commit or sign a message *)
let comm, key = commit msg
(* verify by anyone *)
let match = verify (comm, key, msg)
```

To seal `msg` in envelope ...

```ocaml
let comm, key = commit msg
```
... then publish `comm`.
This is aka putting the sealed envelope on the table.

To open envelope ...
Just publish `key, msg` and anyone can use `verify` to 
check validity.

**Security properties**

+ Hiding: Given `comm`, infeasible to find `msg` (cannot open envelope).
+ Binding: Infeasible to find `msg <> msg'` such that `verify (commit msg, msg') = true`.
(When an enveloped is committed or sealed, it can't be changed later).

### Commitment API Implementation

```ocaml
(* where `key` is a random 256-bit value *)
let commit msg = (H (key ^ msg), key)
let verify comm key msg = (H (key ^ msg) = comm)
```

**Security properties**

+ Hiding: Given `H (key ^ msg)`, infeasible to find `msg`.
+ Binding: Infeasible to find `msg <> msg'` such that
`H (key ^ msg) = H (key & msg')`.

> The `key` is similar to the `r` discussed previously.

### Puzzle-friendly property

For every possible output value `y`,
if `k` is chosen from a distribution with hign min-entropy,
then it is infeasible to find x such that `H (k ^ x) = y`.

### Application: Search puzzle

Given a "puzzle ID" `id` (from high min-entropy distrib.),
and a target hash set `Y`:
Try to find a "solution" `x` such that

```
# Hash of id + x is a member of Y
H(id | x) ∈ Y
```
**Important**: Puzzle-friendly property implies that no solving 
strategy is much better than trying random values of `x`.

### SHA-256 hash function

+ take a `msg` of arbitrary size
+ chop up into 512-bit blocks
+ since the original message isn't likely gonna be the multiple of the block size, 
a padding is added at the end of the last block.

```bash
    512 bits                                      padding
| m1 (block 1) | m1 (block 2) | ... | mn (block n) | p |
```

a padding is consist of ...

+ 64-bit field at the end, which is the message's length in bits (`C`)
+ before that, it consists of a one bit (1), followed by (`A`)
+ some number of zero bits so it fills the gap to the end of the block (`B`)

```bash
  A                B                                       C
| 1 | 00000000000 ... (until filled) | 1011100110110111100001010110101 ... (64 bits) |
```

+ initialize the hashing process with a random 256-bit number known as [IV][Initialization Vector].
+ concatenate IV with first 512-bit of the first block (becomes 768 bits)
+ pass the 768-bit result to a compression function `c`
+ the result is a new 256-bit number
+ use that as the starting number with the 512-bit of the second block, and so on

[Initialization Vector]: https://en.wikipedia.org/wiki/Initialization_vector








