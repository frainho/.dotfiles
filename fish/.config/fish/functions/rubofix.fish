function rubofix
git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -A
end
