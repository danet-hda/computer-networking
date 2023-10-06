#!/bin/bash
SESSION="clab-sessions"
UPR="host00"
#WORKDIR="/home/p4/p4environment/"
#COMMAND="sudo python p4runner.py"

tmux start-server
tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
  tmux new-session -d -n $SESSION -s $SESSION
  tmux send-keys -t $SESSION "docker exec -it clab-rn-lab00-host00  ash" Enter
  tmux splitw -dh
  tmux splitw -dv
  tmux select-pane -R
  tmux send-keys -t $SESSION "docker exec -it clab-rn-lab00-router00  ash" Enter
  tmux splitw -dv
  tmux select-pane -L
  tmux select-pane -D
  tmux send-keys -t $SESSION "docker exec -it clab-rn-lab00-host01  ash" Enter
fi
tmux attach-session -t $SESSION

