// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "./Ownable.sol";
import "./zeppelin/ERC20Burnable.sol";
import "./zeppelin/SafeMath.sol";

/// @title Crypsure Token
/// @author Crypsure DeFi
/// @notice Crypsure ERC20 token (CRS)
contract CRSToken is Ownable, ERC20Burnable {
	
	constructor() ERC20("Crypsure", "CRS") {
        uint256 totalSupply = SafeMath.mul(SafeMath.pow(10, decimals()), 10000000000);
        _mint(msg.sender, totalSupply);

        transfer(0x105D9165b120B7d4d01979f35D290babC2E5fbD3, SafeMath.mul(SafeMath.pow(10, decimals()), 4000000000));
        transfer(0x68B689eE9EfBB918307C6F6EA186B1652828EE84, SafeMath.mul(SafeMath.pow(10, decimals()), 2000000000));
        transfer(0xf3b224d90BF2C0295c23dc376B4bAC9c1bddE321, SafeMath.mul(SafeMath.pow(10, decimals()), 1500000000));
        transfer(0xF2fE528b583EECBA10436BC01B5e085F7F6816F0, SafeMath.mul(SafeMath.pow(10, decimals()), 1000000000));
        transfer(0x8b04555ebb1B101C2fFA94a897ee660AC729Ac66, SafeMath.mul(SafeMath.pow(10, decimals()), 500000000));
        transfer(0x8e322626Bd18b8EEB8794eC9674885da7C8565e9, SafeMath.mul(SafeMath.pow(10, decimals()), 500000000));
        transfer(0xd2559b42cc43435D346d211aD437f1cf97f67714, SafeMath.mul(SafeMath.pow(10, decimals()), 500000000));
    }
	
}
