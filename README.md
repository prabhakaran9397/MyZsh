## Custom shell theme
### BASH

```
echo "PS1='╭─\[\033[01;33m\]⚡\[\033[00m\] \[\033[01;31m\]\u\[\033[00m\] \[\033[01;33m\]⚡\[\033[00m\] \[\033[01;32m\]\h\[\033[00m\] [\[\033[01;34m\]\w\[\033[00m\]]\n╰─\[\033[01;33m\]⚡\[\033[00m\] '" >> ~/.bashrc
```

`source ~/.bashrc`

![BASH](assets/2.png "Screenshot 2")

Note: Supports Current directoty view.

### ZSH

#### If ZSH not installed

`sudo apt-get install zsh`

`chsh -s /bin/zsh`

#### Installing this theme

`cd ~`

`git clone https://github.com/prabhakaran9397/MyZsh.git`

`cp ~/MyZsh/prabhakaran9397.zsh-theme ~/.oh-my-zsh/themes/`
 
`gedit .zshrc`
 
##### prabhakaran9397

###### Note: Supports Current directoty view, Git Branch view.

Change it to ZSH_THEME="prabhakaran9397"

![ZSH](assets/1.png "Screenshot 1")

##### myagnoster

###### Note: Supports Current directoty view, Git Branch view, was there any error, are there background jobs?, am I root.

Change it to ZSH_THEME="prabhakaran9397"

![ZSH](assets/3.png "Screenshot 3")
