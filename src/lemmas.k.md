# Word Packing

```k
syntax Int ::= "#WordPack20x1" "(" Int "," Int ")" [function]
// ----------------------------------------------------------
// takes 20-byte X, 1-byte Y and packs them into a single 32 byte word
// Note that this corresponds to solidity storage packing if an addr is declared before a bool
// {11 bytes empty}{1 byte Y}{20 bytes X}
rule #WordPack20x1(X, Y) => Y *Int pow160 +Int X
  requires #rangeAddress(X)
  andBool #rangeUInt(8, Y)
```
