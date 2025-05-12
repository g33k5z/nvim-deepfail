# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
project="pids-langsmith-sandbox"
tmuxifier_templates="$(eval echo ~/.tmux/plugins/tmuxifier/layouts)"
session_root "'$(eval echo $DEV_ROOT)'/${project}/"

# Create session with specified name if it does not already exist.
if initialize_session ${project}; then

  # Create a "config" window and run commands
  new_window "${project}"
  
  # Split vertically and select the first pane
  split_v 30
  select_pane 0

  # python venv
  # run_cmd "[ -f "env/${project}/bin/activate" ] && source env/${project}/bin/activate || mkdir -p env && python3.12 -m venv env/${project} && source env/${project}/bin/activate"
  run_cmd "source env/${project}/bin/activate || mkdir -p env && python3.12 -m venv env/${project} && source env/${project}/bin/activate"
  run_cmd "nvim"
  
  # Wait for nvim to fully load, then send <Space>e, Ctrl-l, and r
  sleep 1  # Increase wait time if nvim takes longer to load
  send_keys "r"

  # Set up the second pane with a horizontal split and run commands in `nu`
  select_pane 1
  run_cmd "source env/${project}/bin/activate || mkdir -p env && python3.12 -m venv env/${project} && source env/${project}/bin/activate"

  split_h 40
  select_pane 2
  run_cmd "nu"
  send_keys "ls"  # Instead of `run_cmd ls` in case `ls` is a command to run in `nu`

  # Set up a new "nvim-deepfail" window and run commands
  new_window "config"
  select_window "config"
  select_pane 0
  run_cmd "cd '$(eval echo $DEV_ROOT)'/ && nvim ${tmuxifier_templates}/${project}.session.sh"
  
  # Wait for nvim to load, then send <Space>e, Ctrl-l, and r
  sleep 2  # Increase wait time if needed
  send_keys " e"

  # Return to "config" window and select pane 0
  select_window "${project}"
  select_pane 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
