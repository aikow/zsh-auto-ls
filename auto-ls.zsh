auto_ls() {
	emulate -L zsh
	echo
  if command -v colorls &>/dev/null; then
    colorls -A --group-directories-first
  else
    ls -AG --color=always
  fi
}

# Check if auto-ls has already been added to the chpwd_functions array. This
# ensures that resourcing the zshrc file doesnt cause ls to be run twice.
if [[ ! " ${chpwd_functions[*]} " =~ "auto_ls" ]]; then
  chpwd_functions=(auto_ls $chpwd_functions)
fi
