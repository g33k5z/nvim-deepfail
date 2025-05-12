# Sparse Checkout


## Only Clone the `nvim` Subfolder into `~/.config/nvim` (via sparse-checkout)

### 1. Clone the repository into `~/.config/` -- but **do not** check out files:
```sh
git clone --filter=blob:none --no-checkout https://github.com/g33k5z/nvim-deepfail.git ~/.config
cd ~/.config
```

### 2. Enable sparse-checkout:
```sh
git sparse-checkout init --cone
```

### 3. Select only the `nvim` directory to check out:
```sh
git sparse-checkout set nvim
```

### 4. Check out the `main` branch:
```sh
git checkout main
```

---

Now, your `~/.config/nvim/` contains the repo’s `nvim` folder—and that’s all you’ll have from the repo.

- **To update from upstream:**  
  ```
  git pull
  ```
- **To commit and push changes:**  
  Edit files in `~/.config/nvim/`, then:
  ```sh
  git add nvim/*
  git commit -m "Describe your changes"
  git push
  ```

---

**Resulting structure:**
```
~/.config/
└── nvim/
    ├── init.lua
    ├── README.md
    ├── lua/
    └── ... (etc.)
```

---

**You are now set!**  
You are tracking *only* the `nvim` subdirectory from the repo, with full Git capability.  
