# Token functions

### View functions

pass\_rough pass
fail\_rough pass
```act
behaviour totalSupply of DSToken
interface totalSupply()

types
    Supply : uint256
storage
    supply |-> Supply
iff
    VCallValue == 0

returns Supply
```

pass\_rough pass
fail\_rough pass
```act
behaviour balanceOf of DSToken
interface balanceOf(address who)

types
    Bal : uint256
storage
    balances[who] |-> Bal
iff
    VCallValue == 0

returns Bal
```

pass\_rough pass
fail\_rough pass
```act
behaviour allowance of DSToken
interface allowance(address src, address for)

types
    Amt : uint256
storage
    approvals[src][for] |-> Amt
iff
    VCallValue == 0

returns Amt
```

### State transition functions

TODO: prove the case where dst == caller or find a way to make this
cover that case. Note that the fail\_rough spec fails if the check
is included as an iff  
pass\_rough pass
fail\_rough pass
```act
behaviour transfer of DSToken
interface transfer(address dst, uint amt)

types
    SrcBal  : uint256
    DstBal  : uint256
    Owner   : address
    Stopped : bool
storage
    balances[CALLER_ID] |-> SrcBal => SrcBal - amt
    balances[dst]       |-> DstBal => DstBal + amt
    owner_stopped       |-> #WordPack20x1(Owner, Stopped)
iff in range uint256
    SrcBal - amt
    DstBal + amt
iff
    Stopped == 0
    VCallValue == 0
if
    dst =/= CALLER_ID

returns 1
```

# Stop functions

### View functions

pass\_rough pass
fail\_rough pass
```act
behaviour stopped of DSToken
interface stopped()

types
    Owner   : address
    Stopped : bool
storage
    owner_stopped |-> #WordPack20x1(Owner, Stopped)
iff
    VCallValue == 0

returns Stopped
```

### State transition functions

TODO: need to either modify the auth contract or verify the call to canCall  
pass\_rough ?
fail\_rough ?
```act
behaviour stop of DSToken
interface stop()

types
    Owner   : address
    Stopped : bool
storage
    stopped |-> #WordPack20x1(Owner, Stopped) => #WordPack20x1(Owner, 1)
iff
    Caller == Owner
    VCallValue == 0
```
