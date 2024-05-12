// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract main {
    struct admin {
        address adminaddress;
        string name;
    }
    
    struct fund{
        string title;
        string description;
        address fundaddress;
        address[] crew;
        uint amountcol;
        string image;
        address[] contributors;
        uint[] donation;
     }
    
    struct crew{
        address crewaddress;
        string name;
    }

    mapping(uint => crew) public crews;
    mapping(uint => fund) public funds;
    mapping(uint => admin) public admins;

    uint public crewid=0;
    uint public fundid=0;
    uint public adminid=0 ;

function registeradmin(string memory _name) public {
    admin storage admin = admins[adminid];
    bool isadmin = true;
for(uint i;i<adminid;i++){
    if(admins[i].adminaddress==msg.sender){
        isadmin = false ;
        break;
    }
    require(isadmin,"you are already registered");
}
    admin.name=_name;
    admin.adminaddress = msg.sender;
    adminid++;

}
 
function creatfund(string memory _title,string memory _description,string memory _image) public {
    admin storage admin = admins[adminid];
bool isadmin = false;
for(uint i;i<adminid;i++){
    if(admins[i].adminaddress==msg.sender){
        isadmin = true ;
        break;
    }
    require(isadmin,"you are not registered as admin");
}
fund storage fund = funds[fundid];
fund.title = _title;
fund.description = _description;
fund.fundaddress = msg.sender;
fund.amountcol=0;
fund.image = _image;
fundid++;
}

function registercrew(string memory _name) public  {
crew storage crew = crews[crewid];
bool isadmin = true;
for(uint i;i<adminid;i++){
    if(admins[i].adminaddress==msg.sender){
        isadmin = false ;
        break;
    }
}
    require(isadmin,"admin cannot register as a crew");
bool iscrew = true;
for(uint i;i<crewid;i++){
    if(crews[i].crewaddress==msg.sender){
        iscrew=false;
        break;
    }
}
require(iscrew,"you have already registered");
crew.crewaddress = (msg.sender);
crewid++;
}

function joinfund(address _fundaddress) public  {
    bool isfund = false;
    uint newfundid;
    for(uint i=0;i<fundid;i++){
    if(funds[i].fundaddress==_fundaddress){
        isfund=true;
        newfundid = i;
        break;
    }
}
    require(isfund,"fund does not exists or invalid fund address");
    bool iscrewreg = false;
for(uint i;i<crewid;i++){
    if(crews[i].crewaddress==msg.sender){
        iscrewreg=true;
        break;
    }
    
}
require(iscrewreg,"you have not registered as crew");
  bool iscrewjoin = true;
for(uint i=0;i<funds[newfundid].crew.length;i++){
    if(funds[newfundid].crew[i]==msg.sender){
        iscrewjoin=false;
        break;
    }
}
require(iscrewjoin,"you have already joined the fund");
    funds[newfundid].crew.push(msg.sender);
  
}
function contribute(address _fundaddress,uint _amount) public {
    uint fundsid;
for(uint i=0;i<fundid;i++){
if(funds[i].fundaddress == _fundaddress){
    fundsid=i;
    break;
}
}
 bool iscrewjoin = false ;
for(uint i=0;i<funds[fundsid].crew.length;i++){
    if(funds[fundsid].crew[i]==msg.sender){
        iscrewjoin=true;
        break;
    }
}
require(iscrewjoin,"you have not joined the fund");
fund storage fund = funds[fundsid];
fund.amountcol += _amount ;
fund.contributors.push(msg.sender);
fund.donation.push(_amount);
}

function getfunds(address _fundaddress) public view returns(string memory,string memory,uint,address[] memory,address[] memory){
    uint fundsid;
for(uint i=0;i<fundid;i++){
if(funds[i].fundaddress == _fundaddress){
    fundsid=i;
    break;
}

}
fund storage fund = funds[fundsid];

return (fund.title,fund.description,fund.amountcol,fund.crew,fund.contributors);
}
function getadmin(uint _id) public view returns(string memory, address) {
    return (admins[_id].name, admins[_id].adminaddress);
}
}