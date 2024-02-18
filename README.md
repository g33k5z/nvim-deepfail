# My nvim config, a study in deepfail
young bones heal quickly edition

Story here is my painful switch to nvim from vim, but my supprising productivity now that I don't spend all day tweaking a custom color theme

- Grabbed lunarvim as a base (shutup)
- plugins
  - Python everything (shutup)
    - LSP: pyright
    - Debugger: degubpy, DAP  
  - Copilot.nvim/.lua: suggestions are kinda garbo, grabbed the lua version, fuck the cmp integration, ghosting is better
  - ChatGPT.nvim: Has some good bones, hacking it into something useful. So far model/token max updates while I learn the package
  - Vimtex: for latex math notes, but is in some kinda fuggly state
  - bunch of random ass others 

- whichkey
  - Got ChatGPT more or less up
  - Copilot is a pita so far to remap in WK

- TODOs
  - cmp: move this spam further away from the cursor
  - copilot WK mapping
  - gippity overhaul prompt templates to suck less, rework some of the UI
  - override/add translation for vim-regex to pcre
  - obsidian connector
  - finish setting up vimtex/latex everything

  
# Keyremapping ftw? 
###(caps_lock => escape, is my norm only mapping)
Playing with Karabiner trying remap levels. Idea is ofc not move off base hand position as much as possible

now tyring
- caps_lock => fn (using fn as level 1)
  -  j => backspace_or_delete
  -  h => escape
-   - right_command => backspace_or_delete
