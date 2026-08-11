# Identify remote shells

Show a colored hostname badge in the shared Zsh prompt when `SSH_CONNECTION` is present, while leaving local shells unchanged. The prompt is a more reliable context indicator than a Ghostty-specific profile because Ghostty remains a local process during SSH, and the SSH environment also carries into tmux sessions started remotely.
