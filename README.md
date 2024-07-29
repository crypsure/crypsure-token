# Crypsure Token (CRS)

CRS is a standard Ethereum ERC20 compliant token, for the purpose of enabling the Crypsure ecosystem

### Token Allocations

CSR is initialized with a 10 billion total supply according to the following token distribution:

Name | Token Amount | Address
---- | ------------ | ---------
Ecosystem	| 4,000,000,000 | 0x105D9165b120B7d4d01979f35D290babC2E5fbD3
Development	| 2,000,000,000 | eth:0x68B689eE9EfBB918307C6F6EA186B1652828EE84
Marketing | 1,500,000,000 | 0xf3b224d90BF2C0295c23dc376B4bAC9c1bddE321
Strategic Investors and partners | 1,000,000,000 | 0xF2fE528b583EECBA10436BC01B5e085F7F6816F0
Escrow funds for protocol | 500,000,000 | 0x8b04555ebb1B101C2fFA94a897ee660AC729Ac66
Team and advisors | 500,000,000 | 0x8e322626Bd18b8EEB8794eC9674885da7C8565e9
Liquidity and reserve	| 500,000,000 | 0xd2559b42cc43435D346d211aD437f1cf97f67714


## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/CRSToken.s.sol:CRSTokenScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
