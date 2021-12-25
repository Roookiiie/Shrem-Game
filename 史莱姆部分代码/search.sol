// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./fight.sol";

contract Search is Fight{
    //减少饱食度
    function decrease(uint _full)internal {
        if(getSfull() > _full)setSfull(getSfull() - _full);
        else setSfull(0);
    }
    //ab随机数，_ab是1则选择a事件，_ab是2则选择b事件
    function aOrb()internal view returns(uint){
        uint _ab;
        //100以内随机数
        uint randNonce = 0;
        uint random = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % 99;
        if(random <50)_ab = 1;
        else _ab = 2;
        return _ab;
    }
    //多条路线
    function judge11()public returns(uint){
        uint i = aOrb();
        decrease(15);
        return i;
    }
    function judge12()public returns(uint){
        uint i = aOrb();
        if(i == 1)decrease(20);
        else decrease(10);
        return i;
    }
    //13路线涉及转账，临时地址0x90863e4e471178d73394aba407255e33470b4Ab0
    function judge13()public payable returns(uint){
        address payable _add = payable(0x90863e4e471178d73394aba407255e33470b4Ab0);
        _add.transfer(100000000 gwei);
        decrease(70);
        uint i = aOrb();
        return i;
    }
}