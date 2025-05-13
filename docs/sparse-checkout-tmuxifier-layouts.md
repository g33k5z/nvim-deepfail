# Sparse Checkout: Only `tmuxifier/layouts` from nvim-deepfail

## 1. Clone the Repo (do only once)

```sh
git clone --filter=blob:none --no-checkout https://github.com/g33k5z/nvim-deepfail.git ~/.tmux/plugins/tmuxifier/.tmuxifier-deepfail-git
cd ~/.tmuxifier-deepfail-git
```

---

## 2. Enable Sparse Checkout

```sh
git sparse-checkout init --cone
```

---

## 3. Set Checkout to Only `tmuxifier/layouts`

```sh
git sparse-checkout set tmuxifier/layouts
```

---

## 4. Check Out the Main Branch

```sh
git checkout main
```

---

## 5. Sync the layouts directory

### **Option A: Symlink (recommended)**
This keeps your layouts always up-to-date whenever you do a `git pull`.

```sh
# Remove any old folder or symlink at the layouts target (backup first if needed)
rm -rf ~/.tmux/plugins/tmuxifier/layouts

# Use a symlink so Tmuxifier instantly sees the latest layouts from your Git working directory
ln -sfn ~/.tmux/plugins/tmuxifier/.tmuxifier-deepfail-git/tmuxifier/layouts ~/.tmux/plugins/tmuxifier/layouts
```

- After running `ls -l ~/.tmux/plugins/tmuxifier/layouts` you should see something like:
  ```
  lrwxr-xr-x ... layouts -> /Users/g33k5z/.tmuxifier-deepfail-git/tmuxifier/layouts
  ```
- **Now, when you `git pull` in `~/.tmuxifier-deepfail-git` your layouts are instantly updated.**

---

### **Option B: Copy (if you don't want a symlink)**
```sh
rsync -a --delete ~/.tmuxifier-deepfail-git/tmuxifier/layouts/ ~/.tmux/plugins/tmuxifier/layouts/
```
- You'll need to repeat this command every time you update (`git pull`) the repo.

---

## **Summary Recap**

- Your actual Git repo is at: `~/.tmuxifier-deepfail-git`
- The directory seen by tmuxifier: `~/.tmux/plugins/tmuxifier/layouts`  
  (served by symlink or copy).
- To update:  
  ```sh
  cd ~/.tmuxifier-deepfail-git
  git pull
  # (symlink mode: done!  copy mode: repeat the rsync step)
  ```

---

### **Why This is Smart**
- **Keeps tmuxifier “clean”**—no `.git` or extra files in your plugin/layouts folder.
- **Easily switch branches**, rollback, experiment.
- **Sync across machines** quickly, keeping your IDE and terminal layouts reproducible.

