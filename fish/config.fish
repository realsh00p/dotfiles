if status is-interactive
   set fish_greeting
   theme_gruvbox dark hard
end

if test -d ~/bin
   set -gx PATH ~/bin $PATH 
end

if test -d ~/.local/bin
   set -gx PATH ~/.local/bin $PATH 
end

if test -d ~/.dotfiles/bin
  set -gx PATH ~/.dotfiles/bin $PATH
end
