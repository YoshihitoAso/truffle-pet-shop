pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // 正常系1
    //  adopt() function の機能確認
    function testUserCanAdoptPet() public {
        uint returned = adoption.adopt(8);

        uint expected = 8;

        Assert.equal(returned, expected, "Adoption of pet ID 8 should be recorded.");
    }

    // 正常系2
    //  adoptersリストのID指定検索
    function testGetAdopterAddressByPetId() public {
        // Expected owner is this contract
        address expected = address(this);

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

    // 正常系3
    //  getAdopters() function の機能確認
    function testGetAdopterAddressByPetIdInArray() public {
        // Expected owner is this contract
        address expected = address(this);

        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    }

}
