# Word Packing

```k
syntax Int ::= "#WordPackAddrUInt8" "(" Int "," Int ")" [function]
// ----------------------------------------------------------
// takes address X, uint8 Y and packs them into a single 32 byte word
// Note that this corresponds to solidity storage packing if the addr is declared before the bool
// {11 bytes empty}{1 byte Y}{20 bytes X}
rule #WordPackAddrUInt8(X, Y) => Y *Int pow160 +Int X
  requires #rangeAddress(X)
  andBool #rangeUInt(8, Y)
```
