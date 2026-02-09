# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
project="pids-arcanum"
tmuxifier_templates="$(eval echo ~/.tmux/plugins/tmuxifier/layouts)"
session_root "'$(eval echo $DEV_ROOT)'/${project}/"

# Create session with specified name if it does not already exist.
if initialize_session ${project}; then

  # Create a "config" window and run commands
  new_window "${project}"

  # First split: Create top (70%) and bottom (30%) panes
  split_v 30

  # Set up top pane (pane 0) with lvim
  select_pane 0
  run_cmd "source env/${project}/bin/activate || mkdir -p env && python3.12 -m venv env/${project} && source env/${project}/bin/activate"
  run_cmd "lvim"

  # Wait for nvim to fully load, then send keys
  sleep 1
  send_keys "r"

  # Set up bottom pane (pane 1) - split it horizontally into left and right sections
  select_pane 1
  run_cmd "source env/${project}/bin/activate || mkdir -p env && python3.12 -m venv env/${project} && source env/${project}/bin/activate"
  run_cmd opencode

  # Split bottom-left pane horizontally to create bottom-right section (60/40 split)
  split_h 40

  # Now we have 3 panes: 0 (top), 1 (bottom-left), 2 (bottom-right)
  # Split the bottom-right pane (pane 2) into 3 vertical panes
  select_pane 2
  run_cmd "pnpm dev:tracker"

  # Split pane 2 vertically to create pane 3
  split_v 50
  select_pane 3
  run_cmd "pnpm dev:cullable"

  # Split pane 3 vertically to create pane 4
  split_v 50
  select_pane 4
  run_cmd "pnpm dev:readysuite"
  
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

