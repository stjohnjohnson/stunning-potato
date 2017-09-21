# stunning-potato
Bootstrap script to restore a new Mac

## Flow

1. Install Homebrew
2. Restore files from backup
3. Restore local settings
4. Install software
5. Install programming languages
6. Setup OSX settings
7. Reboot

## Usage

```bash
$ curl -L -o potato.zip https://github.com/stjohnjohnson/stunning-potato/archive/master.zip
$ unzip potato.zip
$ pushd stunning-potato-master
$ ./restore.sh
```

## Todo

- [ ] Start restore from Arq
- [ ] Restore dock
- [ ] Restore application settings
- [ ] Restore wallpaper / screensaver
