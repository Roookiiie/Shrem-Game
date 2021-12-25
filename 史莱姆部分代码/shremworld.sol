// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./monsterfactory.sol";

contract ShremWorld is MonsterFactory{

    event NewShrem(string name);

    struct Shrem{
        //名称
        string name;
        //战斗力
        uint ce;
        //饱食度
        uint full;
        //技能数
        uint skill_amount;
        //地址
        address add;
    }

    Shrem[] internal shrems;
    mapping(address => uint)ownerShremCount;//确认某个地址的角色是否初次创建
    mapping(uint => string)idToSkill;//技能列表
    /*
    function loadSkill()public{
        idToSkill[0] = "捕食者";
        //后续录入
    }
    */
    //输入名称，新建存档
    function createShrem(string calldata _name)public{
        require(ownerShremCount[msg.sender]==0);
        shrems.push(Shrem(_name, 5, 0, 1, msg.sender));
        ID = shrems.length - 1;
        ownerShremCount[msg.sender]++;
        //loadSkill();
        emit NewShrem(_name);
    }
    //获取地址对应的史莱姆id
    function getShremId()public view returns(uint _id){
        for(uint i = 0; i < shrems.length; i++)
            if(shrems[i].add == msg.sender)return i;
    }
    //已有史莱姆，读取存档
    uint internal ID;
    function haveShrem()public{
        require(ownerShremCount[msg.sender]!=0);//确认有史莱姆
        ID = getShremId();
    }
    //读取地址和读取结构体
    function getAddress()public view returns(address){
        address _add = msg.sender;
        return _add;
    }
    /*
    function getStruct()public returns(memory Shrem){
        return shrems[ID];
    }
    */
    //读取数值
    function getSname()public view returns(string memory){
        string memory _name = shrems[ID].name;
        return _name;
    }
    function getSce()public view returns(uint){
        return shrems[ID].ce;
    }
    function getSfull()public view returns(uint){
        return shrems[ID].full;
    }
    function getSsa()public view returns(uint){
        return shrems[ID].skill_amount;
    }
    //设置数值
    function setSname(string calldata _name)internal{
        shrems[ID].name = _name;
    }
    function setSce(uint _ce)internal{
        shrems[ID].ce = _ce;
    }
    function setSfull(uint _full)internal{
        shrems[ID].full = _full;
    }
    //技能数＋1
    function setSsa()internal{
        shrems[ID].skill_amount++;
    }
}