# Starts programming session if not already exist
if [ $(tmux has-session -t prg 2>/dev/null; echo $?) = 1 ]; then
    tmux new-session -d -s prg -n code 'cd $PROJECTPATH; nvim .'
    tmux new-window -t prg -n lazygit 'cd $PROJECTPATH; lazygit'
    tmux new-window -t prg
fi

tmux new-session -A -s prg
