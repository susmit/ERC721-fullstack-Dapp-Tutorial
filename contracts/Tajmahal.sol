pragma solidity ^0.4.24;

//author susmit susmit9370@gmail.com


import "./ownable.sol";
import "./erc721.sol";
import "./safemath.sol";

contract Tajmahal is ERC721,Ownable {
    
    using SafeMath for uint256;
    
    struct TajmahalStruct{
        string nameId;
        string lctn;      //location of Tajmahal
        address owner;    //Owner of Tajmahal
        uint price;       // price of Tajmahal in ether
    }
    
    uint private count = 0;
    
    TajmahalStruct public tajmahal;
    mapping(uint => address) TajApproval;


    //only one tajmahal can be created ever    
    function mintToken() public onlyOwner{
        require(count < 1);
        tajmahal.nameId = "Taj Mahal";
        tajmahal.lctn = "India,Agra";
        tajmahal.owner = msg.sender;
        tajmahal.price = 3;
        count = count.add(1);
    }
    
    
    //function to sell tajmahal
    function buyTajmahal() public payable {
        require(msg.value == tajmahal.price * 10**18);
        tajmahal.owner = msg.sender;
    }
    
    function setTajmahalPrice(uint _prc) public {
        require(msg.sender == tajmahal.owner);
        tajmahal.price = _prc;
    } 
    
    function withdraw() external onlyOwner {
    owner.transfer(address(this).balance);
  }
  
  function balanceOf(address _owner) public view returns (uint256 _balance){
      return 1;
  }
  
  function ownerOf(uint256 _tokenId) public view returns (address _owner){
      return tajmahal.owner;
  }
  
  function transfer(address _to, uint256 _tokenId) public{
      require( msg.sender == tajmahal.owner );
      tajmahal.owner = _to;
      emit Transfer(msg.sender,_to,_tokenId);
  }
  
  //no implementation added 
  function approve(address _to, uint256 _tokenId) public{ 
  }
  
  //no implementation added
  function takeOwnership(uint256 _tokenId) public {
  }
    

    
}