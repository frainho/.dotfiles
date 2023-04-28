function rubocurrent
bundle exec rubocop (git status | egrep modified.*rb | sed s/modified://)
end
