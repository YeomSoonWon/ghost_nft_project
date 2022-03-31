// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./Administration.sol";
import "./StringLib.sol";

/// @title GhostsCops contract
/// @dev Extends ERC721 Non-Fungible Token Standard basic implementation
contract GhostCops is ERC721Enumerable, Administration {

    using Strings for uint256;
    using StringLib for uint256;

    /// @notice Event emitted when TokenURI base changes
    /// @param tokenUriBase the base URI for tokenURI calls
    event TokenUriBaseSet(string tokenUriBase);


    string public constant TOKEN_NAME = "GhostCops";
    string public constant TOKEN_SYMBOL = "GhostCops";
    string public constant INVALID_TOKEN_ID = "Invalid Token ID";

    uint256 public maxPurchasePerMint = 1;
    uint256 public ghostPrice = 0.2 ether;

    uint256 public randomSeed;

    bool public saleIsActive = false;
    string private tokenUriBase = "https://ipfs.io/ipfs/QmXtta23KaWfq9nxbqxtLxfwWn8pfbXksALWjKPqck843h/";

    uint256 internal constant MAX_GHOSTS = 100;
    uint256 internal constant MAX_PIONEER_ROUND = 200;

    uint256[MAX_PIONEER_ROUND] internal _pioneerRoundExpire;
    mapping(address => uint256)[MAX_PIONEER_ROUND] private _pioneerClaimable;
    mapping(address => uint256)[MAX_PIONEER_ROUND] private _pioneerClaimed;


    constructor() ERC721(TOKEN_NAME, TOKEN_SYMBOL) {
        _mintTeamGhost();
    }

    modifier onlyOwner(uint256 _tokenId) {
        require(msg.sender == ownerOf(_tokenId), "Not owner");
        _;
    }

    modifier onlyOnSale() {
        require(saleIsActive, "Not in public sale period");
        _;
    }

    function isGhostsProject() external pure returns (bool) {
        return true;
    }

    function setMaxPurchasePerMint(uint256 _maxPurchasePerMint) external onlyRole(MODERATOR_ROLE) {
        maxPurchasePerMint = _maxPurchasePerMint;
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
    /// @param _tokenUriBase base for the ERC721 tokenURI
    function setTokenUriBase(string calldata _tokenUriBase) external onlyRole(DEFAULT_ADMIN_ROLE) {
        tokenUriBase = _tokenUriBase;
        emit TokenUriBaseSet(_tokenUriBase);
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

    function mintGhost() public payable onlyOnSale {
        require(totalSupply() + 1 <= MAX_GHOSTS, "Purchase would exceed max supply of ghosts");
        require(ghostPrice  <= msg.value, "inefficient ether");

        _safeMint(msg.sender, totalSupply());

        if (ghostPrice < msg.value) {
            uint256 ethToRefund = msg.value - ghostPrice;
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
        for (uint256 i = 1; i < 4; i++) {
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