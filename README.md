# Lottery
DESCRIPTION

A smart contract to facilitate working of a lottery.

Features of the application:

I. A function for players to enter/participate it lottery
           1. msg.value of the function is set to 2 ethers. (function caller 
           has to spend 2 ethers to call this function & enter into lottery)
           2. msg.sender address i.e, the address of function caller is pushed
            into players array

II. A function to check the lottery account balance [accesible by 
    lottery organiser only]

III. A function to generate random number using keccak256 algorithm [accesible by 
    lottery organiser only] 

IV. A function to pick winner among the players
    1. A winner is picked randomly among the players
    2. All the amount in lottery account is transferred to this winner
    3. This winner address is shown
