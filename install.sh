tar -xvf nvim-linux64.tar.xz
tar -xvf nvim.tar.xz
mv -R nvim-linux64 ~/
mv -R ~/.config
echo "alias vim='~/nvim-linux64/bin/nvim'" >> ~/.zshrc
echo "alias nvimconfig='cd ~/.config/nvim/lua/custom/'"
exec zsh
