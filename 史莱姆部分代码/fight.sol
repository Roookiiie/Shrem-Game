// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./shremworld.sol";

contract Fight is ShremWorld{
    uint public random = 0;
    uint public randNonce = 0;
    
    function fight()public{
        random = 0;
        uint _full = 100 * monster.ce / shrems[ID].ce + shrems[ID].full;
        require(_full < 100);
        //设置史莱姆信息
        setSfull(_full);
        setSce(shrems[ID].ce + monster.ce);
        setSsa();
        // 生成一个30到70的随机数，计算战斗力倍率
        while(random<30||random>70){
            random = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % 100;
            randNonce++;
        }
        //设置怪物战斗力
        setMce(shrems[ID].ce*random/100);
    }
}