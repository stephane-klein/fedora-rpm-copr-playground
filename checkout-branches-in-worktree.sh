#!/bin/bash
set -euo pipefail

WORKTREE_DIR=".worktree"
BRANCHES=("bash" "golang" "bash-multifiles")

is_git_repo() {
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

check_branch_exists() {
    local branch="$1"
    if ! git show-ref --quiet "refs/heads/${branch}"; then
        echo "Error: branch '${branch}' does not exist" >&2
        exit 1
    fi
}

check_worktree_exists() {
    local path="$1"
    if [ -d "${path}" ]; then
        echo "Worktree '${path}' already exists, skipping"
        return 0
    fi
    return 1
}

main() {
    if ! is_git_repo; then
        echo "Error: not inside a Git repository" >&2
        exit 1
    fi

    for branch in "${BRANCHES[@]}"; do
        check_branch_exists "${branch}"
    done

    if [ ! -d "${WORKTREE_DIR}" ]; then
        mkdir -p "${WORKTREE_DIR}"
        echo "Created directory '${WORKTREE_DIR}/'"
    fi

    for branch in "${BRANCHES[@]}"; do
        worktree_path="${WORKTREE_DIR}/${branch}"
        if ! check_worktree_exists "${worktree_path}"; then
            git worktree add "${worktree_path}" "${branch}"
        fi
    done

    echo ""
    echo "Worktrees created:"
    for branch in "${BRANCHES[@]}"; do
        echo "  - ${WORKTREE_DIR}/${branch} (branch: ${branch})"
    done
}

main "$@"
