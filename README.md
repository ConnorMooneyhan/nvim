# GETTING SET UP
- install node and gcc
  - `sudo apt install nodejs gcc`
  - may need to install nvm and find the latest version of node to install
- install java
  - `sudo apt install openjdk-{LATEST_VERSION}-jdk`
- install treesitter
  - `cargo install --locked tree-sitter-cli`
- install packer
  - for UNIX, run: `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
- source packer.lua && run :PackerSync
- `sudo apt install ripgrep fd-find`

You should be all set and ready to write code ***blazingly fast***!!! 
