# Change kitty colors when entering directories that contain a .kitty-theme file.
#
# .kitty-theme can contain either:
# - an absolute path to a kitty theme file
# - a relative path from the directory containing .kitty-theme
# - a theme filename from $KITTY_THEME_DIR

typeset -g KITTY_THEME_BY_PWD_DEFAULT="${KITTY_THEME_BY_PWD_DEFAULT:-/Users/zaccaria/dotfiles/kitty-themes-master/themes/Brogrammer.conf}"
typeset -g KITTY_THEME_DIR="${KITTY_THEME_DIR:-/Users/zaccaria/dotfiles/kitty-themes-master/themes}"
typeset -g _KITTY_THEME_BY_PWD_ACTIVE=""

_kitty_theme_by_pwd_find_marker() {
  local dir="$PWD"

  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.kitty-theme" ]]; then
      printf '%s\n' "$dir/.kitty-theme"
      return 0
    fi
    dir="${dir:h}"
  done

  return 1
}

_kitty_theme_by_pwd_resolve() {
  local marker="$1"
  local theme
  theme="$(<"$marker")"
  theme="${theme#"${theme%%[![:space:]]*}"}"
  theme="${theme%"${theme##*[![:space:]]}"}"

  [[ -n "$theme" ]] || return 1

  if [[ "$theme" = /* ]]; then
    printf '%s\n' "$theme"
  elif [[ -f "${marker:h}/$theme" ]]; then
    printf '%s\n' "${marker:h}/$theme"
  else
    printf '%s\n' "$KITTY_THEME_DIR/$theme"
  fi
}

_kitty_theme_by_pwd_apply() {
  [[ "$TERM" == "xterm-kitty" ]] || return 0
  [[ -n "$KITTY_WINDOW_ID" ]] || return 0
  command -v kitten >/dev/null 2>&1 || return 0

  local marker theme
  if marker="$(_kitty_theme_by_pwd_find_marker)"; then
    theme="$(_kitty_theme_by_pwd_resolve "$marker")" || return 0
  else
    theme="$KITTY_THEME_BY_PWD_DEFAULT"
  fi

  [[ -f "$theme" ]] || return 0
  [[ "$theme" != "$_KITTY_THEME_BY_PWD_ACTIVE" ]] || return 0

  kitten @ set-colors --match "id:$KITTY_WINDOW_ID" "$theme" >/dev/null 2>&1
  _KITTY_THEME_BY_PWD_ACTIVE="$theme"
}

autoload -Uz add-zsh-hook
add-zsh-hook -d chpwd _kitty_theme_by_pwd_apply >/dev/null 2>&1
add-zsh-hook chpwd _kitty_theme_by_pwd_apply
_kitty_theme_by_pwd_apply
