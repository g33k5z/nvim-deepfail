# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
project="chronicle"
dev_root="/root" #"$DEV_ROOT"
project_root="${dev_root}/${project}"
tmuxifier_templates="${dev_root}/tmuxifier-layouts"
session_root "${project_root}/"

# Create session with specified name if it does not already exist.
if initialize_session ${project}; then

  # Create a "config" window and run commands
  new_window "${project}"
  window_root "${project_root}"
  
  # Split vertically and select the first pane
  split_v 30
  select_pane 0

  # python venv
  run_cmd "cd ${project_root} && nvim"
  
  # Wait for nvim to fully load, then send <Space>e, Ctrl-l, and r
  sleep 1  # Increase wait time if nvim takes longer to load
  send_keys "r"

  # Set up the second pane with a horizontal split and run commands in `nu`
  select_pane 1
  run_cmd "cd ${project_root} && opencode"

  split_h 40
  select_pane 2
  run_cmd "cd ${project_root} && cargo check"

  # Set up a new "nvim-deepfail" window and run commands
  new_window "config"
  select_window "config"
  window_root "${project_root}"
  select_pane 0
  run_cmd "cd ${dev_root} && nvim ${tmuxifier_templates}/${project}.session.sh"
  
  # Wait for nvim to load, then send <Space>e, Ctrl-l, and r
  sleep 2  # Increase wait time if needed
  send_keys " e"

  # Return to "config" window and select pane 0
  select_window "${project}"
  select_pane 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
