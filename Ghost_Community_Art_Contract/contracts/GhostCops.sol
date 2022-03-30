// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

//희귀도 : 계급
//고스트 홀더만 민팅할 수 있다.
//컨트랙트의 기본적인 요소에 컨트랙트 홀더가 접근할 수 있도록 한다.(화이트리스트-고스트 홀더, baseuri)
//modifier - 컨트랙트 홀더만 접근할 수 있는 영역

//var : whitelist, Baseuri, _tokenIds, owneraddress
//modifier : onlyContractOwner
//function : mint, addWhiteList, setTokenBaseUri
//          getTokenBaseUri, getTokenUri,


// 필요한 기능 추가
contract GhostCops is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string private BaseUri;
    mapping(address=>bool) whitelist;
    address private owneraddress;

    //컨트랙트 오너만 접근할 수 있는 함수 addWhiteList, setTokenBaseUri
    modifier onlyContractOwner(){
        require(owneraddress == msg.sender);
        _;
    }

    constructor() ERC721("GhostCops", "GhostCops") {
        owneraddress = msg.sender;
    }

    function mint(address recipient, uint256 ghost_id)
        public
        returns (uint256)
    {
        // only ghost owner
        require(whitelist[ msg.sender], "Ownable: caller is not the owner");

        // _tokenIds.increment();
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
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
    public 
        {
            return BaseUri;
    }

    function setTokenBaseUri(string calldata newBaseUri) 
        private 
        onlyContractOwner
        {
            BaseUri = newBaseUri;
        }

    //random ipfs file link
    //pre mint number filter
    function getTokenUri()
        public
    {
        getTokenBaseUri();
        return "ddd";
    }
}
