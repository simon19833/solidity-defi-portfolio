pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {

    uint256 public tokenCounter;
    uint256 public maxSupply;
    uint256 public mintPrice;
    string public baseURI;

    constructor(
        uint256 _maxSupply,
        uint256 _mintPrice
    ) ERC721("MyNFT", "MNFT") Ownable(msg.sender) {
        maxSupply = _maxSupply;
        mintPrice = _mintPrice;
        tokenCounter = 0;
    }

    function setBaseURI(string memory _baseURI) external onlyOwner {
        baseURI = _baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function mint() external payable {
        require(tokenCounter < maxSupply, "Sold out");
        require(msg.value >= mintPrice, "Not enough ETH");
        tokenCounter++;
        _safeMint(msg.sender, tokenCounter);
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "Nothing to withdraw");
        (bool success, ) = payable(msg.sender).call{value: balance}("");
        require(success, "Transfer failed");
    }
}
