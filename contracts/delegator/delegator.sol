pragma solidity ^0.4.24;

contract DelegateStorage {
  function invoke(address target, bytes msgdata) public {
    target.delegatecall(msgdata);
  }
}

contract Delegator {
  address private target = 0xEEfFEEffeEffeeFFeeffeeffeEfFeEffeEFfEeff;
  DelegateStorage private ds = DelegateStorage(0xaABBaaBBAaBbaAbBaabBAaBBaAbBAabBAaBBaAbB);

  function setTarget(address _target) public {
    target = _target;
  }

  function() public {
    ds.invoke(target, msg.data);
  }
}
