#!/bin/bash
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME

tox

RESULT=$?

echo $RESULT

STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi
