//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


// 필요한 기능 추가
contract ghostart is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string private BaseUri;
    mapping(uint=>address) whitelist;
    address private owneraddress;

    //컨트랙트 오너만 접근할 수 있는 함수 addWhiteList, setTokenBaseUri
    modifier onlyContractOwner(){
        require(owneraddress == msg.sender);
        _;
    }

    constructor() ERC721("ghostsart", "ghostsart") {
        owneraddress = msg.sender;
    }

    function mint(address recipient, uint256 ghost_id)
        returns (uint256)
    {
        // only ghost_id owner
        require(whitelist[ghost_id] == msg.sender,"Ownable: caller is not the owner");
        // _tokenIds.increment();

        // uint256 newItemId = _tokenIds.current();
        _mint(recipient, ghost_id);
        _setTokenURI(newItemId, getTokenUri(ghost_id));

        return newItemId;
    }

    function addWhiteList(address owner, uint ghost_id) 
        private
        onlyContractOwner{
            whitelist[ghost_id] = owner;

        }

    function getTokenBaseUri()
    returns (string)
        {
            return BaseUri;
    }

    function setTokenBaseUri(string newBaseUri) 
        private 
        onlyContractOwner
        {
            BaseUril = newBaseUri;
        }

    //random ipfs file link
    //pre mint number filter
    function getTokenUri(uint ghost_id){
        getTokenBaseUri()+ ghost_id

    }


}
