# Storage locations for token

DSTokenBase
0. uint \_supply
1. mapping(address => uint) \_balances
2. mapping(address => mapping(address => uint)) \_approvals

DSAuth
3. DSAuthority authority
4. address owner (packed)

DSStop
4. bool stopped (packed)

DSToken
6. bytes32 public symbol
7. uint public decimals
8. bytes32 public name

```k
syntax Int ::= "#DSToken.supply" [function]
// -----------------------------------------------
rule #DSToken.supply => 0

syntax Int ::= "#DSToken.balances" "[" Int "]" [function]
// -----------------------------------------------
rule #DSToken.balances[Src] => #hashedLocation("Solidity", 1, Src)

syntax Int ::= "#DSToken.approvals" "[" Int "]" "[" Int "]" [function]
// -----------------------------------------------
rule #DSToken.approvals[Src][For] => #hashedLocation("Solidity", 2, Src For)

syntax Int ::= "#DSToken.authority" [function]
// -----------------------------------------------
rule #DSToken.authority => 3

syntax Int ::= "#DSToken.owner_stopped" [function]
// -----------------------------------------------
// address owner and bool stopped are packed into a single slot
// {11 bytes empty}{1 byte stopped}{20 bytes owner}
rule #DSToken.owner_stopped => 4
```
