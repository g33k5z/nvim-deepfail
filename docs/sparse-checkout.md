# Sparse Checkout

## Step-by-Step Instructions

1. **Clone the repo (as you wrote):**
    ```sh
    git clone --filter=blob:none --no-checkout https://github.com/g33k5z/nvim-deepfail.git ~/.config/nvim-deepfail-git/

    cd ~/.config/nvim-deepfail-git/
    ```

2. **Enable sparse-checkout:**
    ```sh
    git sparse-checkout init --cone
    ```

3. **Set sparse-checkout to `nvim` subfolder only:**
    ```sh
    git sparse-checkout set nvim
    ```

4. **Check out the main branch:**
    ```sh
    git checkout main
    ```

5. **Sync the nvim config folder:**

    **Option A: Symlink (recommended if you want automatic updates)**
    ```sh
    ln -sfn ~/.config/nvim-deepfail-git/nvim ~/.config/nvim
    ```
    

    That symlink output:

    ```
    lrwxr-xr-x g33k5z staff  44 B  Mon May 12 15:27:03 2025  nvim ⇒ /Users/g33k5z/.config/nvim-deepfail-git/nvim
    ```

    means your setup is **exactly correct**:

    - `~/.config/nvim` is a symlink to your Git-controlled folder.
    - Neovim will read your config with no issues.
    - Updating the git repo (in `nvim-deepfail-git`) will instantly update your live Neovim config.

    You have the **best of both worlds:**  
    - Clean config folder not cluttered with `.git`
    - Easy `git pull/push` for updates/sharing
    - Works perfectly with your SSH GitHub account(s)


    - Now `~/.config/nvim` always points to the up-to-date sparse-checked-out git working directory.
    - To update, do:
      ```sh
      cd ~/.config/nvim-deepfail-git/

      git pull
      ```
      ...and your live config updates immediately.

    **Option B: Copy (if you don’t want a symlink)**
    ```sh
    rsync -a --delete ~/.config/nvim-deepfail-git/nvim/ ~/.config/nvim/
    ```
    - You must repeat this command after every `git pull` to refresh your live config.

---

## **Summary**

- **Your directory `~/.config/nvim-deepfail-git`** is the actual sparse Git repo.
- **Your live Neovim config** at `~/.config/nvim` is either a symlink to `.../nvim-deepfail-git/nvim` or a traditional copy; your choice.

You will **never** make `~/.config/` itself a Git repo, so the rest of your configs remain unaffected and safe.

---

If you ever want to change configs, test a new setup, or roll back, just swap the symlink—**it’s super flexible**.

If you need a one-liner or alias for updating, or tips for managing multiple configs, just ask!  
Happy hacking with Neovim 🚀
