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
    mapping(address=>bool) whitelist;

    constructor() ERC721("Ghost_Community_Art", "Ghost_Community_Art") {

    }

    function mint(address recipient, string memory tokenURI)
        returns (uint256)
    {
        // onlyowner
        require(msg.sender == owner, "Ownable: caller is not the owner");
        // onlyWhitelist
        require(condition);
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
    function addWhiteList(address ){
        // onlycontractOwner
        require(condition);

    }
}
