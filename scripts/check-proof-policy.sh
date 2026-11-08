#!/usr/bin/env bash
set -euo pipefail

# Run from the checkout root even when invoked from another directory.
cd "$(git rev-parse --show-toplevel)"

# This deliberately conservative text lint also rejects these words in comments.
# It is a review guard, not an audit of transitive theorem dependencies.
if git grep -n -w -E 'sorry|admit|axiom|sorryAx' -- '*.lean'; then
  echo 'Proof policy failed: remove proof placeholders or project axioms.' >&2
  exit 1
else
  search_status=$?
  # Exit 1 means no matches; other statuses indicate a failed search.
  if [ "$search_status" -ne 1 ]; then
    exit "$search_status"
  fi
fi

echo 'Proof policy passed.'
