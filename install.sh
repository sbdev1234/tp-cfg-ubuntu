#!/usr/bin/env bash

if ! [ -d $HOME/.oh-my-bash ]; then
  echo "Installing oh-my-bash"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
fi

if ! [ -d $HOME/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

rsync -a ./home/ $HOME/
