Run the following commands with an admin. account:

```bash
# mkfs.btrfs -f -L 'freepius2' /dev/sdb1

# btrfs subvolume create /mnt/backup

# btrfs subvolume create /mnt/backup/latest

# rsync -axv --inplace --delete /home/freepius/ /mnt/backup/latest

# btrfs subvolume snapshot -r /mnt/backup/latest /mnt/backup/`date +'%Y-%m-%d'`
```
