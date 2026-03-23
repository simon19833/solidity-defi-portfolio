// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function transfer(address to, uint256 value) external returns (bool);
}

contract CrowdfundERC20 {

    IERC20 public token;
    address public creator;
    uint256 public goal;
    uint256 public deadline;
    uint256 public totalRaised;
    bool public claimed;

    mapping(address => uint256) public contributions;

    event Contributed(address indexed user, uint256 amount);
    event Refunded(address indexed user, uint256 amount);
    event Claimed(uint256 amount);

    constructor(address tokenAddress, uint256 goalAmount, uint256 durationSeconds) {
        token = IERC20(tokenAddress);
        creator = msg.sender;
        goal = goalAmount;
        deadline = block.timestamp + durationSeconds;
    }

    function contribute(uint256 amount) external {
        require(block.timestamp < deadline, "Ended");
        require(amount > 0, "Zero amount");

        token.transferFrom(msg.sender, address(this), amount);

        contributions[msg.sender] += amount;
        totalRaised += amount;

        emit Contributed(msg.sender, amount);
    }

    function claim() external {
        require(msg.sender == creator, "Not creator");
        require(block.timestamp >= deadline, "Not ended");
        require(totalRaised >= goal, "Goal not reached");
        require(!claimed, "Already claimed");

        claimed = true;
        token.transfer(creator, totalRaised);

        emit Claimed(totalRaised);
    }

    function refund() external {
        require(block.timestamp >= deadline, "Not ended");
        require(totalRaised < goal, "Goal reached");

        uint256 amount = contributions[msg.sender];
        require(amount > 0, "No contribution");

        contributions[msg.sender] = 0;
        token.transfer(msg.sender, amount);

        emit Refunded(msg.sender, amount);
    }
}
