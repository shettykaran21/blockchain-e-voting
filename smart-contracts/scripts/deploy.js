async function main() {
  // We get the contract to deploy
  const Migrations = await ethers.getContractFactory('Migrations')
  const migrations = await Migrations.deploy()
  await migrations.deployed()

  const UserStorage = await ethers.getContractFactory('UserStorage')
  const userStorage = await UserStorage.deploy()
  const deployedUserStorage = await userStorage.deployed()

  const ContractManager = await ethers.getContractFactory('ContractManager')
  const contractManager = await ContractManager.deploy()
  const deployedContractManager = await contractManager.deployed()
  await Promise.all([
    deployedContractManager.setAddress('UserStorage', userStorage.address),
  ])

  const UserController = await ethers.getContractFactory('UserController')
  const userController = await UserController.deploy()
  const deployedUserController = await userController.deployed()
  deployedUserController.setManagerAddress(contractManager.address)

  const [manager, storage] = await Promise.all([
    contractManager.deployed(),
    userStorage.deployed(),
  ])
  await Promise.all([
    manager.setAddress('UserController', userController.address),
    storage.setControllerAddress(userController.address),
  ])
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
