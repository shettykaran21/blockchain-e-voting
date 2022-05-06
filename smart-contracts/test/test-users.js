const { expect } = require('chai')
const { ethers } = require('hardhat')

const convertToHex = (str) =>
  ethers.utils.hexZeroPad(
    ethers.utils.hexlify(ethers.utils.toUtf8Bytes(str)),
    32
  )

describe('Create User', function () {
  it('Should not create user without controller', async function () {
    const UserStorage = await ethers.getContractFactory('UserStorage')
    const storage = await UserStorage.deploy()
    await storage.deployed()

    const username = convertToHex('karan')
    const firstName = convertToHex('Karan')
    const lastName = convertToHex('Shetty')
    const [owner] = await ethers.getSigners()

    expect(
      storage.createUser(owner.address, username, firstName, lastName)
    ).to.be.revertedWith('Only the controller is allowed to call this function')
  })
})
