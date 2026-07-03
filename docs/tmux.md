# Tmux Setup

### tmux
```shell
brew install tmux

# https://github.com/tmux/tmux/wiki/Installing
```

https://github.com/tmux/tmux/wiki/Getting-Started#configuring-tmux

#### tmux package manager
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# https://github.com/tmux-plugins/tpm
```


#### Config
copy `.tmux.config` to `$HOME` | `~/`

Once tmux is running you can press `<LEADER> + I` to install plugins defined in .tmux.conf
tmux LEADER is defaulted to `CTRL+B`, and will be `CTRL+A` with my config


#### Movement between tmux & nvim
Point here is to navigate between tmux and nvim as naturally as possible, meaning the use of `CTRL` + one of `hjkl`.
Two parts to this
- tmux (to nvim): 
```lua
# ~/.tmux.conf

set -g @plugin 'christoomey/vim-tmux-navigator'
```
- nvim (to tmux): lazy install
```lua
# congfig.lua (lvim)
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" }, # not sure i like this one, conflicts with lvim modal term
		},
	},
```
