# workspace_building

This repo is used to setup the workspace (environments, tools, configurations, etc)  for the daily dev work with macOS system. Of which, 

* Some tasks can be done automatically. For this part, some scripts are there for this.
* Some tasks need to do manually. For this part, there are some descriptions which can be helpful.

## Automatic Tasks

It's sample, just use 

```
./main.sh pre-sshkey   
./main.sh post-sshkey
```


## Manual Tasks

For the manual part, the follow work may need to do.

* iTerm2

  ```
  Change the color setting. Refer to:
  1. https://stackoverflow.com/questions/14056007/oh-my-zsh-themes-dont-show-properly-background-stays-white#:~:text=You%20need%20to%20change%20the,settings%2C%20not%20the%20zsh%20settings.&text=The%20Z%2DShell%20does%20have,use%20a%20non%2Dbold%20font.
  2. https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/README.md
  Usually, the `Solarized` preset should be there with the latest `iIterm2` version
  ```

* golang

  * May need install the `gopls` package for `vim-go` or other IDE
  * for go 1.18 the latest version is gopls@v0.14.2 refer to: https://pkg.go.dev/golang.org/x/tools/gopls#readme-supported-go-versions
