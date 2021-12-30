//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

contract Transactions{
    //Variable
    uint256  transactionCounter;

    //Events we can emit
    event Transfer(address from, address receiver, uint amount, string message, string keyword, uint256 timestamp);

    //Struct is like an Object
    struct TransferStruct {
        address from;
        address receiver;
        uint amount;
        string message;
        string keyword;
        uint256 timestamp;
    }

    //Array of TransferStruct/Object
    TransferStruct[] transactions;

    //Public Functions Below

    //
    function getAllTransactions() public view returns(TransferStruct[] memory){
        return transactions;
    }

    //
    function getTransactionsCount() public view returns(uint256){
        return transactionCounter;
    }

    //Add Transaction to Blockchain/ Transactions Array
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public{
        //increment transaction counter
        transactionCounter ++;
        //add new transaction struct/object to transactions array
        transactions.push(TransferStruct(msg.sender,receiver,amount,message,keyword,block.timestamp));
        //Emit Transfer Event
        emit Transfer(msg.sender,receiver,amount,message,keyword,block.timestamp);
        
    }    
}