# Digital Signature

Only **you can sign**, but **anyone can verify**.

## API for digital signatures

### Key generation

`generateKeys` generates two keys by providing the `keysize`. (Usually RSA)
These keys must be randomized / seeded from highly distributed set.

```
(sk, pk) := generateKeys(keysize)
```

where...
*sk*: secret signing key
*pk*: public verification key


### Signing

`sign` outputs a "signature" by "signing" a secret key `sk` and any message `msg` that needs signing.
Only the owner of the message can sign.

```
sig := sign(sk, msg)
```

### Verification

`verify` outputs a boolean(?) representing the validity of the provided `pk`, `msg`, and `sig`.
Anyone with access to the public key (`pk`), message (`msg`), and signature (`sig`) can verify.

```
isValid := verify(pk, msg, sig) 
```

## Requirements for signatures

**valid signatures verify**
```
verify( pk, msg, sign(sk, msg) ) == true
```

**can't forge signatures**
adversary who:

+ knows `pk`
+ gets to see signatures on messages of his choice

can't produce a verifiable signature on another message

## Practical stuff

- algorithms are randomized -> need good source of randomness (high min-entropy set)
- limit on message size -> fix: use Hash(message) rather than message
- fun trick: sign a hash pointer; signature "covers" the whole structure

## Bitcoin 

Bitcoin uses [ECDSA][1] (Elliptic Curve Digital Signature Algorithm), NIST standard

relies on hairy math

Again, good source of randomness is important.


[1]: https://en.bitcoin.it/wiki/Elliptic_Curve_Digital_Signature_Algorithm


