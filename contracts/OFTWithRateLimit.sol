// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@layerzerolabs/solidity-examples/contracts/token/oft/v2/OFTV2.sol";

contract OFTWithRateLimit is Ownable, OFTV2 {
    uint256 public dailyLimit;
    uint256 public spentToday;
    uint256 public lastReset;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _sharedDecimals,
        address _lzEndpoint,
        uint256 _dailyLimit
    ) OFTV2(_name, _symbol, _sharedDecimals, _lzEndpoint) {
        dailyLimit = _dailyLimit;
        lastReset = block.timestamp;
    }

    function _debitFrom(
        address _from,
        uint16 _dstChainId,
        bytes32 _toAddress,
        uint _amount
    )
        internal
        override
        returns (uint256 amountDebitedLD)
    {
        // daily reset
        if (block.timestamp > lastReset + 1 days) {
            spentToday = 0;
            lastReset = block.timestamp;
        }

        require(spentToday + _amount <= dailyLimit, "Daily limit exceeded");
        spentToday += _amount;

        amountDebitedLD = super._debitFrom(_from, _dstChainId, _toAddress, _amount);
    }

    function mint(address _to, uint256 _amount) external onlyOwner {
    _mint(_to, _amount);
}

}
