# Tmuxifier Layouts

This directory contains various [tmuxifier](https://github.com/jimeh/tmuxifier) layouts used for 
managing different development environments and project-specific window/pane configurations. 

Each `.session.sh` file defines a unique tmuxifier layout. To use a layout, ensure tmuxifier is installed and sourced in your shell, 
then navigate to your project directory and run `tmuxifier load-session <layout_name>` 
(where `<layout_name>` is the filename without the `.session.sh` extension).

For example, to load the `nvim-deepfail` layout:
```bash
tmuxifier load-session nvim-deepfail
```

For more details on setup, refer to the [Tmuxifier Setup documentation](../docs/tmuxifier.md).

