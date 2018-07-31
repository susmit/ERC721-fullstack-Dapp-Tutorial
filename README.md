# Let's put Taj Mahal on sale !! 
Yes i am not out of my mind and it is completely possible with the help of blockchain technology.Of course Blockchian will protect us from intervention of third parties ie government,bank and police.
What we will be building is a digital asset (ERC721 token) on blockchain with the help of solidity(by writing smart contracts).We will then use IPFS to deploy our Dapp.

## Setup Environment 
We need to get hold of truffle,get it via ```npm install -g truffle```.You need to have Node.js v6+ LTS and npm (comes with Node) and Git too.This tutorial is best suited for unix environment. 
We would also be needing ganache or testrpc for local deployment.

## Let's conspire to sell Taj Mahal
* Open Terminal 
* Make a suitable folder with ```mkdir tajmahal``` and navigate into folder ```cd tajmahal```
* Now initialize the project with ```truffle init``` .
  * You will notice ***contracts  migrations  test  truffle-config.js  truffle.js*** directories and files being added to folder.
  * __contracts/:__ Contains the Solidity source files for our smart contracts. There is an important contract in here called Migrations.sol.
  * __migrations/:__ Truffle uses a migration system to handle smart contract deployments. A migration is an additional special smart contract that keeps track of changes.
  * __test/:__ Contains both JavaScript and Solidity tests for our smart contracts
  * __truffle.js:__ Truffle configuration file
* In __truffle.js__ replace the stuff with following code. 
```javascript
// Allows us to use ES6 in our migrations and tests.
// require('babel-register')
// require('babel-polyfill')

module.exports = {
  networks: {
    development: {
        host: '127.0.0.1',
        port: 7545,
        network_id: '*', // Match any network id
    }
},
};
```
* Now add the following contracts in the **contracts** directory and then hit ```truffle compile```
  * I have created Tajmahal.sol (because written in soilidty) that contains buisness logic.According to this contract ONLY ONE Tajmahal can be created.It will be non fungible an unique as it implement erc721 standards.Since we do not want some overflow in our arithmetic operations we have used __safemath.sol__ library from openzepplin.__ownable.sol__ is again from openzepplin for restricting use of some contract functions to owners.
  * [Tajmahal.sol](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/blob/master/contracts/Tajmahal.sol)
  * [erc721.sol](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/blob/master/contracts/erc721.sol)
  * [ownable.sol](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/blob/master/contracts/ownable.sol)
  * [safemath.sol](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/blob/master/contracts/safemath.sol)
* Since we have smart contracts in place we need to migrate these contract.But before we proceed to this step we need to install and run [**ganache**](https://github.com/trufflesuite/ganache-cli) in background.
![ganache](https://truffleframework.com/tutorials/images/pet-shop/ganache-initial.png)
* After installing ganache and running in backgroud navigate to folder **migrations** and create a file named ```2_deploy_contracts.js``` and add the following code in it.[link](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/tree/master/migrations) 
```javascript
var Tajmahal = artifacts.require("Tajmahal");

module.exports = function(deployer) {
  deployer.deploy(Tajmahal);
}
```
* After following the above steps hit ```truffle migrate``` (make sure ganache is running in background).
* In Ganache, note that the state of the blockchain has changed. The blockchain now shows that the current block, previously 0, is now 4. In addition, while the first account originally had 100 ether, it is now lower, due to the transaction costs of migration.
  ![ganache](https://truffleframework.com/tutorials/images/pet-shop/ganache-migrated.png)
* Hola your contract is deployed on local blockchain!!! But we still have long way to go.
* Ok those following genuinely till here have a homework to do.Try testing smart contracts with truffle framework.
## Deploy smart contracts 
Logicaly speaking there are tons of way to deploy smart contract on tons of network(ropsten,rinkbey,mainnet,private).We could
use truffle also to deploy our network.In this i will be discussing deployment of smart contracts on ropsten network.
* First we will be needing a wallet.Go and install chrome extension called Metamask.
* Once installed, you'll see the MetaMask fox icon next to your address bar. Click the icon and you'll see this screen appear:
  ![wallet](https://truffleframework.com/tutorials/images/pet-shop/metamask-privacy.png)
* Click Accept to accept the Privacy Notice.
* Then you'll see the Terms of Use. Read them, scrolling to the bottom, and then click Accept there too.
  * ![wallet](https://truffleframework.com/tutorials/images/pet-shop/metamask-terms.png)
* Now you'll see the initial MetaMask screen. Set your password.
  * ![wallet](https://truffleframework.com/tutorials/images/pet-shop/metamask-initial.png)
* Now we need to connect MetaMask to the blockchain.Connect to Ropsten network.
  * ![wallet](https://cdn-images-1.medium.com/max/800/1*VFh3DPD30tJdPZl5WKqNmw.png)
* Create an Account
  * ![wallet](https://cdn-images-1.medium.com/max/800/1*VVf3CVoA4z7bdoOT1Fqhuw.png)
* Copy Account Address
  * ![wallet](https://cdn-images-1.medium.com/max/800/1*8VEep9up0Y40S6-yO_OlPw.png)
* Request Free ether from here or here. Paste the copied account address in text box and click on send me 1 test ether.
  * ![wallet](https://cdn-images-1.medium.com/max/800/1*AjharO8gF4Xzr9ufy4iYLg.png)






 
