# Public Keys as Identities

## Useful trick: public key == an identity

if you see *sig* such that `verify(pk, msg, sig) == true`,
think of it as 

> `pk` says, "[msg]".

to "speak for" `pk`, you must know matching secret key `sk`.
In a way, `sk` is a permit to express `msg`.

## How to make a new identity

create a new, random key-pair `sk` and `pk`
`pk` is the public "name" you can use (usually better to use `Hash(pk)`)
`sk` lets you "speak for" the identity

you control the identity, because only you know `sk`
if `pk` "looks random", nobody needs to know who you are.

## Decentralized identity management

anybody can make a new identity at any time
make as many as you want!
no central point of coordination

**These identities are called "addresses" in Bitcoin.**

## Privacy

Addresses not directly connected to real-world identiy.

But observer can link together an address's activity over time, make inferences.




