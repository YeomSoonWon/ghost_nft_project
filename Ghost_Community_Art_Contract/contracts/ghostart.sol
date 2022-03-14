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
    address[] whitelist = new address[](100);
    
    constructor() ERC721("Ghost_Community_Art", "Ghost_Community_Art") {
        mint(msg.sender, "aaaaa");

    }
// ghost owner 체크하기.
// 시간 기준으로 토큰 오너들 화이트 리스트 storage에 추가.
// mapping 
//     modifier onlyGhostOwner(uint256 _tokenId) {
//         require(msg.sender == ownerOf(_tokenId), "Not owner");
//         _;
//     }

    function mint(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
