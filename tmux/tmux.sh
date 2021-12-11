# Starts programming session if not already exist
if [ $(tmux has-session -t prg 2>/dev/null; echo $?) = 1 ]; then
    export PROJECTPATH=$1
    tmux new-session -d -s prg -n code 'cd $PROJECTPATH; nvim .; zsh'
    tmux new-window -t prg -n lazygit 'cd $PROJECTPATH; lazygit; zsh'
    tmux new-window -t prg 'cd $PROJECTPATH; zsh'
fi

tmux new-session -A -s prg
