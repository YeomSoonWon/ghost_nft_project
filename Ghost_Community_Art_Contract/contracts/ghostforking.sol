// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./Administration.sol";
import "./GhostBase.sol";
import "./StringLib.sol";


/// @title GhostsProject contract
/// @dev Extends ERC721 Non-Fungible Token Standard basic implementation
contract GhostsProject is ERC721Enumerable, Administration, GhostBase {

    using Strings for uint256;
    using StringLib for uint256;

    /// @notice Event emitted when TokenURI base changes
    /// @param tokenUriBase the base URI for tokenURI calls
    event TokenUriBaseSet(string tokenUriBase);

    string public constant TOKEN_NAME = "GhostsProject";
    string public constant TOKEN_SYMBOL = "GHOST";
    string public constant INVALID_TOKEN_ID = "Invalid Token ID";

    string public GHOST_PROVENANCE = "";

    uint256 public ghostPrice = 0.0001 ether;

    uint256 public randomSeed;

    bool public saleIsActive = false;

    string private tokenUriBase;

    uint256 internal constant MAX_GHOSTS = 10000;

    constructor() ERC721(TOKEN_NAME, TOKEN_SYMBOL) {
        _mintTeamGhost();
    }

    modifier onlyOwner(uint256 _tokenId) {
        require(msg.sender == ownerOf(_tokenId), "Not owner");
        _;
    }

    function isGhostsProject() external pure returns (bool) {
        return true;
    }

    function setProvenanceHash(string memory provenanceHash) external onlyRole(DEFAULT_ADMIN_ROLE) {
        GHOST_PROVENANCE = provenanceHash;
    }

    function getMaxGhosts() external pure returns (uint256) {
        return MAX_GHOSTS;
    }

    function setGhostPrice(uint256 _price) external onlyRole(DEFAULT_ADMIN_ROLE) {
        ghostPrice = _price;
    }

    function flipSaleState() external onlyRole(DEFAULT_ADMIN_ROLE) {
        saleIsActive = !saleIsActive;
    }

    function setRandomSeed() external onlyRole(DEFAULT_ADMIN_ROLE) {
        _setRandomSeed();
    }

    /// @notice Set the base URI for creating `tokenURI` for each Ghost.
    /// Only invokable by system admin role, when contract is paused and not upgraded.
    /// If successful, emits an `TokenUriBaseSet` event.
    function setTokenUriBase() external onlyRole(DEFAULT_ADMIN_ROLE) {
        tokenUriBase = "ipfs://QmVpqXm7VPh4KpVFwtngDjACswsQUDWvrvEGVtxtGArzD6/";
    }

    function withdraw() public onlyRole(DEFAULT_ADMIN_ROLE) {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }

    function supportsInterface(bytes4 interfaceId)
    public view override(AccessControl, ERC721Enumerable)
    returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function mintGhost(uint256 numberOfTokens) public payable {
        require(totalSupply() + numberOfTokens <= MAX_GHOSTS, "Purchase would exceed max supply of ghosts");
        require(ghostPrice * numberOfTokens <= msg.value, "inefficient ether");

        uint256 count = 0;
        for (uint256 i = 0; i < numberOfTokens; i++) {
            if (totalSupply() < MAX_GHOSTS) {
                _safeMint(msg.sender, totalSupply());
                count += 1;
            }
        }
        if (ghostPrice * count < msg.value) {
            uint256 ethToRefund = msg.value - ghostPrice * count;
            (bool sent, ) = msg.sender.call{ value: ethToRefund }("");
            require(sent, "Failed to send Ether");
        }

        if (randomSeed == 0 && (totalSupply() == MAX_GHOSTS)) {
            _setRandomSeed();
        }
    }

    function tokenURI(uint256 _tokenId)
    public view override
    returns (string memory uri) {
        require(_exists(_tokenId), INVALID_TOKEN_ID);
        uri = bytes(tokenUriBase).length > 0 ? string(abi.encodePacked(tokenUriBase, StringLib.uint2str(_tokenId))) : "";
    }

    function _mintTeamGhost() internal onlyRole(DEFAULT_ADMIN_ROLE) {
        require(totalSupply() == 0, "Team ghost already minted");
        for (uint256 i = 0; i < 100; i++) {
            _safeMint(msg.sender, i);  // Team Ghost
        }
    }

    function _setRandomSeed() private {
        require(randomSeed == 0, "Seed number is already set");

        randomSeed = uint(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 1))));
        // Prevent default sequence
        if (randomSeed == 0) {
            randomSeed += 1;
        }
    }
}