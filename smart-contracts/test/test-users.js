const { expect } = require('chai')
const { ethers } = require('hardhat')

describe('Create User', function () {
  it('Should not create user without controller', async function () {
    const UserStorage = await ethers.getContractFactory('UserStorage')
    const storage = await UserStorage.deploy()
    await storage.deployed()

    const username = ethers.utils.hexZeroPad(
      ethers.utils.hexlify(ethers.utils.toUtf8Bytes('karan')),
      32
    )
    const firstName = ethers.utils.hexZeroPad(
      ethers.utils.hexlify(ethers.utils.toUtf8Bytes('Karan')),
      32
    )
    const lastName = ethers.utils.hexZeroPad(
      ethers.utils.hexlify(ethers.utils.toUtf8Bytes('Shetty')),
      32
    )
    const [owner] = await ethers.getSigners()

    expect(
      storage.createUser(owner.address, username, firstName, lastName)
    ).to.be.revertedWith('Only the controller is allowed to call this function')
  })
})
