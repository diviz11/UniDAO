# UniDAO
## DIY Smart Contract: **Deadman's switch**

- A well-known problem for cryptocurrency holders is that all funds are lost if the owner is incapacitated and has not shared his/her private key with anyone else.
- A smart contract that will send all of its balance to a pre-set address if the owner of that contract has not called a still_alive function on the contract in the last 10 blocks.

Design, write and deploy a deadman’s switch to goerli 

The contract has a public function called check_alive() which can be called to check whether the owner is incapacitated, if conditions are met, the balance is transfered to the beneficiary.

<img width="1680" alt="Screenshot 2023-09-16 at 11 12 24 PM" src="https://github.com/diviz11/UniDAO/assets/97678842/30bb05c9-62ee-4912-b41f-e89daed2c611">
