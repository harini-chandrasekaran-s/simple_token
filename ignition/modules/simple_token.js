const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("simple_tokenModule", (m) => {
  const token=m.contract("Sample_Token");

  return { token };
});
