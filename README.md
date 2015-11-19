# gitsame
Find the same commit by author, email, time in target branch

If you want confirm the target commit is patch on the target develop, you should use this.

## Install
#### Auto install
```
git clone https://github.com/kumalee/gitsame
cd [project path]
make
```

#### Manual install
```
git clone https://github.com/kumalee/gitsame
cd [project path]
ln -s [project path]/trim /usr/local/bin/trim
ln -s [project path]/gitsame.sh /usr/local/bin/gitsame
```

## Usage
```
gitsame [commit hash] [target branch]
```
commit hash is required.

target branch is optional, default value is --all.
