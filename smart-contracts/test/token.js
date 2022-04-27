const { expect } = require('chai')
const { ethers } = require('hardhat')

describe('Mint token', function () {
  it('Should mint DBV tokens', async function () {
    const DBVToken = await ethers.getContractFactory('DBVToken')
    const token = await DBVToken.deploy(1000)
    await token.deployed()

    const [owner] = await ethers.getSigners()
    const ownerBalance = await token.balanceOf(owner.address)

    const supply = await token.totalSupply()
    const ethValue = ethers.utils.formatEther(supply)

    console.log(ethValue)

    expect(await token.totalSupply()).to.equal(ownerBalance)
  })

  it('Mint additional DBV tokens', async function () {
    const DBVToken = await ethers.getContractFactory('DBVToken')
    const token = await DBVToken.deploy(1000)
    await token.deployed()

    const [owner] = await ethers.getSigners()

    await token.mint(owner.address, 100)
    const ownerBalance = await token.balanceOf(owner.address)

    const supply = await token.totalSupply()
    const ethValue = ethers.utils.formatEther(supply)

    console.log(ethValue)

    expect(await token.totalSupply()).to.equal(ownerBalance)
  })
})
