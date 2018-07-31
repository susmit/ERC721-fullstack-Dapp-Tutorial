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
* you got a ether !!!!
  * ![wallet](https://cdn-images-1.medium.com/max/800/1*TxIvieOkIaRGDIv2ZMShYw.png)
* now, we have to the paste contracts in remix IDE [remix](http://remix.ethereum.org/)
* click on Run. Select Injected Web 3 Ropsten under environment and the account in Metamask is shown here under Account with balance ether as well.
## Frontend for smart contract and interaction with it.
Since we have made and deployed our smart contracts,we need to put a pretty face to it so that normal user can interact with it.
* Make a folder called __frontend__ in the directory.
* Make a file called __index.html__ in frontend folder and add the following code from [here](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/blob/master/frontend/index.html).
* You can add following Tajmahal images from [here](https://github.com/phunsukwangdu/ERC721-fullstack-Dapp-Tutorial/tree/master/frontend) to your frontend folder.
* Now we have frontend in place,we need this frontend to interact with our smart contract.For this we require __web3js__
* ```<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js/dist/web3.min.js"></script>``` code imports web3js in html file.
* Now lets ponder over following snippet in index.html file.
```javascript
    <script>

        if (typeof web3 !== 'undefined') {
            web3 = new Web3(web3.currentProvider);
        } else {
            // set the provider you want from Web3.providers
            web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
        }

    </script>
```
* It's saying that if web3 is not undefined, then we'll use that as our provider. If it's undefined (else), we can manually specify the provider ourselves.
* You may be wondering, how would web3 be defined? Well, if you're using the Chrome extension MetaMask (which we will use later in this course) or an Ethereum browser like Mist, the provider is automatically injected.
* Now go back to Remix IDE, click on the Compile tab and click Details. Scroll down until you see the Interface - ABI section and click the copy icon as shown below:
  * ![ABI](https://s3.amazonaws.com/coursetro/posts/content_images/02-02-1-1508872208902.png)
* In index.html in the following code snippet paste your contract adsress and abi copied in above step.
```javascript
    <script>

        // Previous if/else statement removed for brevity

        web3.eth.defaultAccount = web3.eth.accounts[0];

        //paste your abi function here
        var TajmahalContract = web3.eth.contract(YOUR ABI);
        
        //paste your contract address here.
        var Tajmahal = TajmahalContract.at('PASTE CONTRACT ADDRESS HERE');
        console.log(Tajmahal);

    </script>
```









 
