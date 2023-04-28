function ls --wraps='lsd -la' --description 'alias ls=lsd -la'
  exa -la $argv; 
end
