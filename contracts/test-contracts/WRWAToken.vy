# @version ^0.3.10
# (c) Crayon Protocol Authors
# This is only used for testing

event Transfer:
    sender: indexed(address)
    receiver: indexed(address)
    value: uint256

event Approval:
    owner: indexed(address)
    spender: indexed(address)
    value: uint256

NAME: constant(String[32]) = "Wrapped RWA Token"
SYMBOL: constant(String[32]) = "WRWA"

name : public(String[32])
symbol : public(String[32])
decimals : public(uint8)
balanceOf : public(HashMap[address, uint256])
allowance : public(HashMap[address, HashMap[address, uint256]])
totalSupply: public(uint256)

@external
def __init__(
    _decimals : uint8
):
    self.name = NAME
    self.symbol = SYMBOL
    self.decimals = _decimals
    # give deployer a billion tokens
    self.balanceOf[msg.sender] = 10  ** (9 + convert(_decimals, uint256))
    self.totalSupply = 10  ** (9 + convert(_decimals, uint256))

@external
def transfer(
    _to: address,
    _am: uint256
) -> bool:

    self.balanceOf[msg.sender] -= _am
    self.balanceOf[_to] += _am

    log Transfer(msg.sender, _to, _am)
    return True

@external
def transferFrom(
    _from : address,
    _to : address,
    _am : uint256
) -> bool:

    self.balanceOf[_from] -= _am
    self.balanceOf[_to] += _am
    self.allowance[_from][_to] -= _am

    log Transfer(msg.sender, _to, _am)
    return True

@external
def approve(
    _to : address,
    _am : uint256
) -> bool:
    self.allowance[msg.sender][_to] = _am

    log Approval(msg.sender, _to, _am)
    return True