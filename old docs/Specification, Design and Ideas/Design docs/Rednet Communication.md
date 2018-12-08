# Security Options
## Signed Messages
Make sure that messages recived are actually from who the message claims. 
This is not the same as message encryption, anyone can read the message, this just authenticates 
the source fo the message.

Has different levels:
* All messages - every message will be signed
* Orders only - only messages which change the state of the turtle will be signed
* None - don't sign messages, this may give better performace at the cost of security

## Encryption
The content of the message is hidden to all but the intended recipient and the sender. Implies its signiture equivulent.

Also has multiple levels:
* All messages - every message will be encrypted
* Orers only - only messages which change the state of the turtle will be signed
* None - don't sign messages, this may give better performace at the cost of security
