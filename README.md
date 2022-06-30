# VORP Paper (Still Work In Progress)

A resource for RedM which allows players to write and share papers and Letters in hand.

# Installation 

**Dependencies**

- [VORP-Core](https://github.com/VORPCORE/VORP-Core)
- [VORP-Character](https://github.com/VORPCORE/VORP-Character)
- [VORP-inventory (metadata version)](https://github.com/RomainJolidon/vorp_inventory-lua/tree/feat/metadata)

**Instructions**

- Extract vorp_mailbox into your resources folder
- Import init.sql into your database 
- Add the following line to your server.cfg file:
```cfg
ensure vorp_paper
```

##  How To Use

Player can receive a blank paper in his inventory. He write something on it by click the use option.
a Used paper contains the written message and the author of the person who wrote it.

Then, He can show is paper to everyone else by giving it to other players.

## Credits

This resource has been created for **Nolosha**.