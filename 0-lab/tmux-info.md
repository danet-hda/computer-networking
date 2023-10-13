# Information about tmux 

Terminal Multiplexer ([tmux](https://github.com/tmux/tmux/wiki)) can split a single terminal into multiple virtual terminals (panes). This allows, for instance, to have a single login session to a computer and to use this single session with multiple virtual terminals. 

For a complete description of tmux visit the [tmux wiki](https://github.com/tmux/tmux/wiki)

There are also other tools offering terminal multiplexing, but we use tmux in the lab setting. 

# Simple Use of Tmux 

In order to start a tmux session, assuming tmux is already installed, just type *tmux* into your terminal. In the lab, we will typically provide a pre-configured script for tmux, that sets multiple virtual terminals for our usage. 

After this step tmux will just appear as a single virtual terminal. You can enter the key combination ```CTRL-b``` and ```d``` to leave the virtual terminal and to keep it running in the background. 

In order:
- to list  what tmux sessions are available with the command ```tmux list-sessions```
- to attach to a running session use ```tmux attach -t <session-name>```
- to close a pane use ```CTRL-d```

You can create virtual terminal panes by using this command ```CTRL-b``` and depending on how to split:
- ```"```for a horizontal split of the current pane
- ```%```for a vertical split of the current pane

# Good to Know

If you run a tmux session and your ssh connection breaks down: no worry. 
Reconnect to the host and attach again to the tmux session


