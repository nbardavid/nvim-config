tar -xvf ./nvim.tar.xz
tar -xvf ./nvim-linux64.tar.gz
mv ./nvim ~/.config/ 
cp ~/.zshrc ~/.old_zshrc
echo "alias vim=\"/tmp/nba/nvim-linux64/bin/nvim\"" >> ~/.zshrc
exec zsh
