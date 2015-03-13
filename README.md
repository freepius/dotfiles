Make links!
-----------

Make links in ~/ for the following files/dirs:

* .gitconfig
* .vimrc
* .fonts/
* .vim/
* and the **dotfiles/* directory!


oh-my-git
---------

Don't forget to:

1. install fonts: `# fc-cache -fv ~/.fonts`
2. add the following line to the `.bashrc` file: `source $HOME/dotfiles/oh-my-git/prompt.sh`


My btrfs backup
---------------

The following commands must be run in *root*.

Only the first time, run:

```bash
# mkfs.btrfs -f -L 'freepius2' /dev/sdb1

# btrfs subvolume create /mnt/backup

# btrfs subvolume create /mnt/backup/latest
```

Then, to do a backup, run:

```bash
# rsync -axv --exclude-from=/home/freepius/dotfiles/rsync-exclusion-list \
             --inplace --delete /home/freepius/ /mnt/backup/latest

# btrfs subvolume snapshot -r /mnt/backup/latest /mnt/backup/`date +'%Y-%m-%d'`
```
