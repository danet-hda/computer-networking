# Information about tmux 

Terminal Multiplexer ([tmux](https://github.com/tmux/tmux/wiki)) can split a single terminal into multiple virtual terminals (panes). This allows, for instance, to have a single login session to a computer and to use this single session with multiple virtual terminals. 

For a complete description of tmux visit the [tmux wiki](https://github.com/tmux/tmux/wiki)

There are also other tools offering terminal multiplexing, but we use tmux in the lab setting. 

# Simple Use of Tmux 

In order to start a tmux session, assuming tmux is already installed, just type *tmux* into your terminal. In the lab, we will typically provide a pre-configured script for tmux, that sets multiple virtual terminals for our usage. 

After this step tmux will just appear as a single virtual terminal. You can enter the key combination *CTRL-D* to leave the virtual terminal and to keep it running in the background. 

In order:
- to list  what tmux sessions are available with the command *tmux list-sessions*
- to attach to a running session use *tmux attach -t <session-name>*



