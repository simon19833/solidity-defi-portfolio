pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract StakingContract {
    IERC20 public token;
    address public owner;
    mapping(address => uint256) public stakedAmount;
    mapping(address => uint256) public stakeTime;
    uint256 public rewardRate = 1;
    event Staked(address indexed user, uint256 amount);
    event Unstaked(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);

    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
        owner = msg.sender;
    }

    function stake(uint256 amount) external {
        require(amount > 0, "Cannot stake 0");
        stakedAmount[msg.sender] += amount;
        stakeTime[msg.sender] = block.timestamp;
        token.transferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    }

    function calculateReward(address user) public view returns (uint256) {
        uint256 timeStaked = block.timestamp - stakeTime[user];
        return stakedAmount[user] * timeStaked * rewardRate;
    }

    function unstake() external {
        require(stakedAmount[msg.sender] > 0, "Nothing staked");
        uint256 amount = stakedAmount[msg.sender];
        uint256 reward = calculateReward(msg.sender);
        stakedAmount[msg.sender] = 0;
        stakeTime[msg.sender] = 0;
        token.transfer(msg.sender, amount + reward);
        emit Unstaked(msg.sender, amount);
        emit RewardPaid(msg.sender, reward);
    }

    function depositRewards(uint256 amount) external {
        require(msg.sender == owner, "Not owner");
        token.transferFrom(msg.sender, address(this), amount);
    }
}
