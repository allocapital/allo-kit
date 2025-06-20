//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/proxy/Clones.sol";
import { IPool, Pool, PoolConfig } from "./Pool.sol";

contract PoolFactory {
    event Created(address indexed strategy, address indexed pool, PoolConfig config,  bytes data);

    function deploy(
        address implementation,
        PoolConfig calldata config,
        bytes calldata data
    ) external returns (address) {
        address poolAddress = Clones.clone(implementation);
        IPool(poolAddress).initialize(config, data);
        emit Created(implementation, poolAddress, config,  data);
        return poolAddress;
    }
}
