// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

  //smart contract to facilitate working of a lottery  
  contract Lottery {
      address public Manager; //Manager is the organiser of the lottery
      address payable[] public players; //addresses declared payable can receive ether into the contract
      
      constructor() public {
          Manager=msg.sender; //Deployer address of this contract will be manager
      } 

      modifier OnlyManager(){
          require(msg.sender==Manager,"Unauthorised transaction"); //To restrict usage of any function
          _;
      } 
       //Function to enter into lottery
      function enter() public payable{
          require(msg.value == 2 ether); //Player has to send 2 ethers to enter
          players.push(msg.sender); //Player address is pushed into players array
      }
       //To check balance of lottery account
       function lotteryBal() public OnlyManager view returns(uint){
          return address(this).balance;
      }
      //To generate random number using keccak256 algorithm 
      function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp, players.length))); //a random number is generated 
      }
      //To pick winner among players 
      function pickWinner() public OnlyManager returns(address){
          uint index = random() % players.length; //Random number to be less than number of players
          players[index].transfer(lotteryBal()); //Transfer all amount to winner
           return players[index]; //Show Winner
      }

  }