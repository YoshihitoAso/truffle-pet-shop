pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    // Adopting pet：ペットを飼う
    //  ・petIdとmsg.senderを紐づける
    //  ・petIdは0以上15以下を指定する必要がある
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }

    // Retrieving the adopters：飼い主リスト
    //  ・adoptersリストが全て返る
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
