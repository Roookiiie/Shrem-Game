// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

interface Interfaces{
    struct Monster{
        uint ce;
    }

    struct Shrem{
        string name;
        uint ce;
        uint full;
        uint skill_amount;
        string comment;
        address add;
    }

    function getMce()external view returns(uint);

    function createShrem(string calldata _name)external;

    function haveShrem()external;

    function getAddress()external returns(address _add);

    //function getStruct()public returns(memory Shrem);

    function getSname()external view returns(string calldata);

    function getSce()external view returns(uint);

    function getSfull()external view returns(uint);

    function getSsa()external view returns(uint);
    
    function fight()external;

    function judge11()external returns(uint);

    function judge12()external returns(uint);
    
    function judge13()external payable returns(uint);    
}