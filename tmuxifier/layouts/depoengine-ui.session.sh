# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
project="depoengine-ui"
tmuxifier_templates="$(eval echo ~/.tmux/plugins/tmuxifier/layouts)"
session_root "'$(eval echo $DEV_ROOT)'/${project}/"

# Create session with specified name if it does not already exist.
if initialize_session ${project}; then

  # Create a "config" window and run commands
  new_window "${project}"
  
  # Split vertically and select the first pane
  split_v 30
  select_pane 0

  # python venv — uv sync creates .venv, resolves the interpreter named in
  # .python-version, and installs from uv.lock. Idempotent, ~20ms once warm, so
  # it replaces the create-if-missing dance rather than guarding it.
  run_cmd "uv sync && source .venv/bin/activate"
  run_cmd "nvim"
  
  # Wait for nvim to fully load, then send <Space>e, Ctrl-l, and r
  sleep 1  # Increase wait time if nvim takes longer to load
  send_keys "r"

  # Set up the second pane with a horizontal split and run commands in `nu`
  select_pane 1
  # Kept rather than a bare `source`: pane order is not guaranteed, and uv locks
  # the venv so a concurrent sync serialises instead of colliding.
  run_cmd "vite"

  split_h 40
  select_pane 2

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
