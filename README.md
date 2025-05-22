# zobweyt's dotfiles

Add symlinks to parent dir

```bash
stow -v .
```

Remove symlinks from home

```bash
stow -R -v -t ~ .
```

Remove symlinks from parent dir

```bash
stow -R -v ~ .
```
