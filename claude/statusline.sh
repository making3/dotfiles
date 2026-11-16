#!/usr/bin/env bash
# Claude Code status line. Reads the session JSON on stdin and prints two lines:
#   [Model] 📁 dir | 🌿 branch
#   <5h-session bar> 42% (7-day %) | $0.02 | ⏱️ 0m 2s
# Point settings.json at it:
#   "statusLine": { "type": "command", "command": "~/.dotfiles/claude/statusline.sh" }
set -euo pipefail

input=$(cat)

IFS=$'\x1f' read -r model dir session week cost duration_ms < <(
  jq -r '[
    (.model.display_name // "?"),
    (.workspace.current_dir // .cwd // ""),
    (.rate_limits.five_hour.used_percentage // ""),
    (.rate_limits.seven_day.used_percentage // ""),
    (.cost.total_cost_usd // 0),
    (.cost.total_duration_ms // 0)
  ] | map(tostring) | join("\u001f")' <<<"$input"
)

CYAN=$'\033[36m'
YELLOW=$'\033[33m'
DIM=$'\033[2m'
RESET=$'\033[0m'

# Line 1: model, directory, git branch
line1="${CYAN}[${model}]${RESET} 📁 ${dir##*/}"
# Not every directory is a git repo, so a failure here is expected.
branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null || true)
if [[ -n "$branch" ]]; then
  line1+=" | 🌿 ${branch}"
fi

# Line 2: session usage bar, session %, (weekly %), cost, duration
bar() {
  local pct=$1 width=10 filled color
  filled=$(((pct * width + 50) / 100))
  if ((filled > width)); then filled=$width; fi
  if ((pct >= 90)); then
    color='38;5;203' # red
  elif ((pct >= 70)); then
    color='38;5;221' # yellow
  else
    color='38;5;114' # green
  fi
  printf '\033[%sm' "$color"
  printf '%*s' "$filled" '' | sed 's/ /█/g'
  printf '\033[2m'
  printf '%*s' "$((width - filled))" '' | sed 's/ /█/g'
  printf '\033[0m'
}

if [[ -n "$session" ]]; then
  s=$(printf '%.0f' "$session")
  usage="$(bar "$s") ${s}%"
else
  usage="${DIM}──────────${RESET} --%"
fi
if [[ -n "$week" ]]; then
  usage+=" ($(printf '%.0f' "$week")%)"
fi

secs=$((${duration_ms%.*} / 1000))
line2="${usage} | ${YELLOW}\$$(printf '%.2f' "$cost")${RESET} | ⏱️ $((secs / 60))m $((secs % 60))s"

printf '%s\n%s\n' "$line1" "$line2"
