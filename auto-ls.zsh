auto-ls() {
	emulate -L zsh
	echo
  if command -v colorls &>/dev/null; then
    colorls -A --group-directories-first
  else
    ls -AG
  fi
}

# Check if auto-ls has already been added to the chpwd_functions array. This
# ensures that resourcing the zshrc file doesnt cause ls to be run twice.
if [[ ! " ${array[*]} " =~ " ${value} " ]]; then
  chpwd_functions=(auto-ls $chpwd_functions)
fi