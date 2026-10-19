// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

contract CarbonStrategyVault {
    struct StrategyRange {
        uint128 buyPriceLow;
        uint128 buyPriceHigh;
        uint128 sellPriceLow;
        uint128 sellPriceHigh;
    }

    mapping(bytes32 => StrategyRange) public strategies;

    event StrategyCreated(bytes32 indexed id, uint128 buyLow, uint128 sellHigh);

    function createStrategy(bytes32 id, uint128 bLow, uint128 bHigh, uint128 sLow, uint128 sHigh) external {
        require(bLow <= bHigh && bHigh <= sLow && sLow <= sHigh, "Invalid Carbon asymmetric price range");
        strategies[id] = StrategyRange(bLow, bHigh, sLow, sHigh);
        emit StrategyCreated(id, bLow, sHigh);
    }
}
