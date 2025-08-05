# The next line updates PATH for CLI.
if [ -f '/home/eveloth/yandex-cloud/path.bash.inc' ]; then source '/home/eveloth/yandex-cloud/path.bash.inc'; fi

if ! [[ -v SKIP_COMPLETIONS ]] || [[ $- != *i* ]]; then
  if [ -f '/home/eveloth/yandex-cloud/completion.zsh.inc' ]; then source '/home/eveloth/yandex-cloud/completion.zsh.inc'; fi
fi

