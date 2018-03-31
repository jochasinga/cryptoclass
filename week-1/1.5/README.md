# A Simple Cryptocurrency

## Goofy coins

**Rules**
- Goofy can create new coins
- New coins belong to Goofy
- A coin's owner can spend it

```ascii
# This coin belongs to Goofy
=========================
|  signed by pk(Goofy)  | <--- signature
-------------------------
|  CreateCoin [udid]    | <--- message
=========================
```

How coins are spent.
Coins are just a concept of ownership and how it can be transfered.


```ascii
# Now Alice owns the coin
=========================
|  signed by pk(Goofy)  |        # Goofy owns this coin
-------------------------      =========================
|Pay to pk(Alice) : H( )|----> |  signed by pk(Goofy)  |
=========================      -------------------------
                               |  CreateCoin [udid]    |
                               =========================
							   
```

```ascii
# Now Alice owns the coin
=========================
|  signed by pk(Goofy)  |        # Goofy owns this coin
-------------------------      =========================
|Pay to pk(Alice) : H( )|----> |  signed by pk(Goofy)  |
=========================      -------------------------
                               |  CreateCoin [udid]    |
                               =========================

```




