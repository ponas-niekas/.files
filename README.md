# Files
```bash
cd
git clone https://github.com/ponas-niekas/.files.git
```

# Emacs
```bash
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt install emacs26-nox
sudo pip install rope jedi flake8 autopep8 yapf

cd
ln -s -f .files/emacs/.emacs
```

# tmux
```bash
cd
git clone https://github.com/gpakosz/.tmux.git

ln -s -f .tmux/.tmux.conf
ln -s -f .files/tmux/.tmux.conf.local
```

# i3
```bash
ln -s -f -t ~/.config/i3 ~/.files/i3/spawn_term.sh
```
