function inflate --wraps='ruby -r zlib -e "puts Zlib::Inflate.inflate(STDIN.read)"' --description 'alias inflate=ruby -r zlib -e "puts Zlib::Inflate.inflate(STDIN.read)"'
  ruby -r zlib -e "puts Zlib::Inflate.inflate(STDIN.read)" $argv
        
end
