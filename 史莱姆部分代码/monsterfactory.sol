// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./ownable.sol";

contract MonsterFactory is Ownable{
    //本质是同一只怪物，只是名称，战斗力和外型都会随着每一次挑战变化
    struct Monster{
        //战斗力
        uint ce;
    }
    //初始化怪物
    Monster public monster = Monster(3);
    //读取数值
    function getMce()public view returns(uint){
        return monster.ce;
    }
    //设置数值
    function setMce(uint _ce)internal{
        monster.ce = _ce;
    }
}