# Concept

The idea behind these small tools is actually BIG.  
Wouldn't it be great to goto/do/setup/report/start/etc. being like simple commands with ALL details hidden behind?  
Also it should not matter who and where from runs the comand?  
As big and right it might be - let's start with a few commands and experiment with them :)  

# How to use it?

1. Clone the repo
2. Add PATH to the repo in your shell
3. Just run a script of your choice - it will provide you with available commands
4. Now use a script with correct parameters

# Actual status/compatibility

|Environment|Status|
|-|-|
|zsh on macOS|works|
|bash|not tested yet|

# Ideas for the future

1. Maybe Makefile could be better then scripts? It would be nice to type "make help" and see what is there inside.
2. How to integrate scripts with the shell even better (not by PATH but by having alias or something)?
3. How to provide auto completion to commands and arguments? (note that even without completion you may achieve instant reuse by Ctrl-R and its incremental search)

# Maintenance

In case you need to modify anything within the common part of scripts (all from the begining up to the line containing "COMMON PART ENDS HERE").
1. Modify `tools/common.txt` file instead of any of other scripts
1. `cd tools`
1. `./replace_all.sh`
1. Review changes `git diff` - should be applied to all scripts
