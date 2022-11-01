// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract modulus
{
	
	uint firstnum ;
	uint secondnum ;
	
	function Setfirstnum(uint x) public
	{
		firstnum = x;
	}
	
	function Setsecondnum(uint y) public
	{
		secondnum = y;
	}
	
	function Modulus() view public returns (uint)
	{
		uint answer = firstnum % secondnum ;
		return answer;
	}
}
