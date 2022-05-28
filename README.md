# Reentrency Attack


This is a basic hardhat project made to simulate a Reentrency attack.
The attacker contract will be able to drain the bank contract if reentrency vulnerabilities are left in. It won't be possible to do so if either -

1: Reentrency modifier is implemented by inheriting the reentrency contract from openzeppelin
2: The balance of the user is updated before sending in the transaction