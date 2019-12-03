# nvim
Version control of vim script for neovim

# Required
- works with the version of neovim 0.4.0.
- pyenv
  - python2.x (this env named nvim2)
  - python3.x (this env named nvim3)

- git

# install
```
mkdir ~/.config && mkdir ~/..config/nvim
git clone https://github.com/TsuMakoto/nvim ~/.config/nvim
```

# How do I get set up?
```
### Install git
sudo apt-get install git
git --version
git version xx.yy.zz

### Install neovim.
# For ubuntu
add repos for neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
neovim --version

# For macOS (required Homebrew)
brew install neovim

### Install Python
# Install pyenv or virtualenv.
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# Install python2
pyenv install 3.7.3
pip install neovim

# Install python3
pip install 2.7.16
pip install neovim
```
