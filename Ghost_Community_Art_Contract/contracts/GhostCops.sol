// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

//경찰 별 회귀도 : 계급(순경, 경장, 경사, 경위, 치안총감, 경찰 청장)
//ipfs에 미리 기록해 두고 이때 순서를 랜덤하게 한다.
//민팅할 때는 번호가 순서대로 증가

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
    function getTokenUri(uint ghost_id)
        public
    {
        getTokenBaseUri()+ ghost_id;
        return "ddd";
    }
}
