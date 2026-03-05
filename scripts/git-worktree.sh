# Git worktree helpers for AI agent workflows
# Inspired by DHH's agent-git-trees.sh
# https://gist.github.com/dhh/18575558fc5ee10f15b6cd3e108ed844

# Create a new worktree and branch from within current git directory.
gwa() {
  if [[ -z "$1" ]]; then
    echo "Usage: gwa <branch-name>"
    return 1
  fi

  local branch="$1"
  local base="$(basename "$PWD")"
  local path="../${base}--${branch}"

  git worktree add -b "$branch" "$path"
  mise trust "$path"
  cd "$path"
}

# Remove worktree and branch from within active worktree directory.
gwd() {
  local cwd worktree root branch

  cwd="$(pwd)"
  worktree="$(basename "$cwd")"
  root="${worktree%%--*}"
  branch="${worktree#*--}"

  if [[ "$root" == "$worktree" ]]; then
    echo "Not in a worktree directory (expected format: project--branch)"
    return 1
  fi

  if gum confirm "Remove worktree and branch '$branch'?"; then
    cd "../$root"
    git worktree remove "$worktree" --force
    git branch -D "$branch"
  fi
}
