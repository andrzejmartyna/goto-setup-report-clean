# Concept

The idea behind these small tools is actually BIG.  
Wouldn't it be great to goto/do/setup/report/start/etc. being like simple commands with ALL details hidden behind?  
Also it should not matter who and where runs the comand from?  
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
1. Can all this tools be part of some agent-driven console? Possibly. But still there are situation that you do not have access to your beloved shiny AI-powered console. That's the area where small, simple tools will be useful for a few years still, I believe.  

# Disclaimer

Some code was generated using AI.  
Honestly, I once decided I would never write in Bash again!  
But with AI, I’m back in the game.  
Now I can handle all the different combinations of hashes, braces, path resolutions, encoding, decoding, flavors, and countless other details — and **still stay sane**.  
In my opinion, scripting without AI is only for people with years of experience, or for those with a beautiful mind who can see bits dancing behind every line.  
An average person, without AI, could only dream of joining this elite group.  
Is this good or bad?  
Honestly, I wish everyone could choose their own specialty—whether it’s scripting, blacksmithing, welding, or even being an influencer — and have a fair chance to make a living until retirement.  
That seems fair to me.  
You spend time and effort to learn something. It’s hard and takes dedication, but eventually you become a respected expert in your field. You feel secure, because no one can match your skills without years of hard work.  
Unfortunately, that’s no longer true.  
The world has changed.  
Now, I support a world where anyone can quickly switch between different tools and technologies with ease.  
Why?  
Because there is the only way a random guy has a chance to stay productive and not to feel guilty that she/he can no longer "unlearn a thing and learn the other one" (what a beautiful but painful and ruthless phrase!).  
