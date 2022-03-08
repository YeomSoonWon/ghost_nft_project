//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


// 필요한 기능
/**
1.민팅 할 때 ghost의 id와 art의 id를 mapping
2.전체 발행량 30000개로 제한하는 조건
3.ghost_id 별로 남은 민팅 횟수 mapping
 */
contract ghost_community_art is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    // ghost id -> ghost_community_art mapping
    mapping(uint256 => uint256[]) private ArtGhostIdMap;

    constructor() ERC721("Ghost_Community_Art", "Ghost_Community_Art") {}

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

    function SetArtGhostIdMap(uint256 GhostId, uint256 ArtId) public {
        ArtGhostIdMap[GhostId];
    }
}
