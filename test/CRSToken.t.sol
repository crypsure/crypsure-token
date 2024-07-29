// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";     
// import "forge-std/console.sol"; // logging
import "../src/CRSToken.sol";

contract CRSTokenTest is Test {

    CRSToken token;

    // hardhat getSigner() -> vm.addr()
    address user1 = 0x105D9165b120B7d4d01979f35D290babC2E5fbD3;
    address user2 = 0x68B689eE9EfBB918307C6F6EA186B1652828EE84;
    address userNew = vm.addr(0x1);

    // hardhat beforeEach -> setUp
    function setUp() public {
        token = new CRSToken();
        vm.startPrank(user1);
    }

    function testInfo() public view {
        assertEq("Crypsure",token.name());
        assertEq("CRS", token.symbol());
    }

    function testBalance() public view {
        assertEq(token.totalSupply(), 10000000000e18);
        assertEq(token.balanceOf(msg.sender), 0);
        assertEq(token.balanceOf(user1), 4000000000e18);
        assertEq(token.balanceOf(user2), 2000000000e18);
    }

    function testBurn() public {        
        token.burn(1000000000e18);

        assertEq(token.totalSupply(), 9000000000e18);
        assertEq(token.balanceOf(user1), 3000000000e18);
    }

    function testApprove() public {
        assertTrue(token.approve(user2, 1e18));
        assertEq(token.allowance(user1, user2), 1e18);
    }

    function testIncreaseAllowance() external {
        assertEq(token.allowance(user1, userNew), 0);
        assertTrue(token.increaseAllowance(userNew, 2e18));
        assertEq(token.allowance(user1, userNew), 2e18);
    }

    function testDecreaseAllowance() external {
        testApprove();
        assertTrue(token.decreaseAllowance(user2, 0.5e18));
        assertEq(token.allowance(user1, user2), 0.5e18);
    }

    function testTransfer() external {
        token.transfer(userNew, 1000000000e18);
        assertEq(token.balanceOf(userNew), 1000000000e18);
        assertEq(token.balanceOf(user1), 3000000000e18);
    }

    function testTransferFrom() external {
        token.approve(userNew, 1e18);
        vm.startPrank(userNew);
        assertTrue(token.transferFrom(user1, userNew, 0.7e18));
        vm.stopPrank();
        assertEq(token.allowance(user1, userNew), 1e18 - 0.7e18);
        assertEq(token.balanceOf(user1), 4000000000e18 - 0.7e18);
        assertEq(token.balanceOf(userNew), 0.7e18);
    }

    function testFailBurnInsufficientBalance() external {
        vm.startPrank(userNew);
        token.burn(3e18);
        vm.stopPrank();
    }

    function testFailApproveToZeroAddress() external {
        token.approve(address(0), 1e18);
    }

    function testFailApproveFromZeroAddress() external {
        vm.prank(address(0));
        token.approve(user1, 1e18);
    }

    function testFailTransferToZeroAddress() external {
        token.transfer(address(0), 1e18);
    }

    function testFailTransferInsufficientBalance() external {
        vm.prank(userNew);
        token.transfer(user2 , 3e18);
    }

    function testFailTransferFromInsufficientApprove() external {
        token.approve(address(this), 1e18);
        token.transferFrom(user1, user2, 2e18);
    }

    function testFailTransferFromInsufficientBalance() external {
        token.approve(address(this), type(uint).max);

        token.transferFrom(user1, user2, 3e18);
    }
    
}   