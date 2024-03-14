## My Personal dotfiles

Managed with gnu stow.

# Instructions

1. Copy configuration file into ~/dotfiles directory following the same structure as the home folder.
2. Before running stow . make sure to commit any unsaved changes.

# For dealing with directories

1. Copy the whole directory to the corresponding ~/dotfiles location.
2. Run stow with the --adopt flag: stow -adopt .

# New files/directories (plugins, extra configuration...)

New files cannot be added directly to the dotfiles directory, instead:

1. Make sure to create the file on the default config location.
2. Copy the file/directory into ~/dotfiles.
3. Run stow with the adopt files (this will create the new symlinks).
