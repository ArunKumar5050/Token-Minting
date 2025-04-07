
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenMint {
    string public name = "MintToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    uint256 public maxSupply;

    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);

    constructor(uint256 _initialSupply, uint256 _maxSupply) {
        require(_initialSupply <= _maxSupply, "Initial supply exceeds max supply");
        owner = msg.sender;
        maxSupply = _maxSupply * 10 ** uint256(decimals);
        _mint(owner, _initialSupply * 10 ** uint256(decimals));
    }

    function _mint(address _to, uint256 _amount) internal {
        require(totalSupply + _amount <= maxSupply, "Mint exceeds max supply");
        balanceOf[_to] += _amount;
        totalSupply += _amount;
        emit Transfer(address(0), _to, _amount);
        emit Mint(_to, _amount);
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount * 10 ** uint256(decimals));
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }
}
