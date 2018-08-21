// nikcoins ico smart contract

pragma solidity ^0.4.24;

contract nikcoin_ico {
   uint public max_nikcoins = 1000000;
   uint public usd_to_nikcoins = 1000;
   uint public total_nikcoins_bought = 0;
   
   mapping(address => uint) equity_nikcoins;
   mapping(address => uint) equity_usd;
   
   modifier can_buy_nikcoins(uint usd_invested){
       require(usd_invested * usd_to_nikcoins + total_nikcoins_bought <= max_nikcoins);
       _;
   }
   
   function equity_in_nikcoins(address invester) external constant returns(uint){
       return equity_nikcoins[invester];
   }
   
   function equity_in_usd(address invester) external constant returns(uint){
       return equity_usd[invester];
   }
   
   function buy_nikcoins(address invester, uint usd_invested) external
   can_buy_nikcoins(usd_invested){
        uint nikcoins_bought = usd_invested * usd_to_nikcoins;
        equity_nikcoins[invester] += nikcoins_bought;
        equity_usd[invester] = equity_nikcoins[invester] / usd_to_nikcoins;
        total_nikcoins_bought += nikcoins_bought;
   }
   
   function sell_nikcoins(address invester, uint nikcoins_to_sell) external {
        equity_nikcoins[invester] -= nikcoins_to_sell;
        equity_usd[invester] = equity_nikcoins[invester] / usd_to_nikcoins;
        total_nikcoins_bought -= nikcoins_to_sell;
   }
}