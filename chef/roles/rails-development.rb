name "rails-development"
description "setup for ruby on rails core development"
run_list(
  "recipe[apt]",
  "recipe[preinstall]",
  "recipe[git]",
  "recipe[postgresql::server]",
  "recipe[postgresql::client]",
  "recipe[nodejs]",
  "recipe[nodejs::npm]",
  "recipe[npm_packages]",
  "recipe[rvm::system]",
  "recipe[rvm::vagrant]",
  "recipe[postinstall]"
)
