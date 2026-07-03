# Tmuxifier Setup

#### tmuxifier
Allows you to create layouts with w/e apps running and split windows you like

```shell
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

export PATH="$HOME/.tmuxifier/bin:$PATH"


# https://github.com/jimeh/tmuxifier
```

Add to .zshrc
```shell
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

#used for root of tmuxifier layouts
export DEV_ROOT="~/dev/github"

# https://github.com/jimeh/tmuxifier
```

##### Example tmuxifier layout (the one I use for this repo)
https://github.com/g33k5z/nvim-deepfail/blob/4ea6e3b941e14d41fd006a6983763b24528ed5b6/tmuxifier/layouts/nvim-deepfail.session.sh#L1-L52