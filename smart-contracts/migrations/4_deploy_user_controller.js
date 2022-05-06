const UserController = artifacts.require('UserController')
const UserStorage = artifacts.require('UserStorage')
const ContractManager = artifacts.require('ContractManager')

module.exports = async (deployer) => {
  await deployer.deploy(UserController)
  const userController = await UserController.deployed()

  userController.setManagerAddress(ContractManager.address)

  const [manager, storage] = await Promise.all([
    ContractManager.deployed(),
    UserStorage.deployed(),
  ])

  return await Promise.all([
    manager.setAddress('UserController', UserController.address),
    storage.setControllerAddress(UserController.address),
  ])
}
