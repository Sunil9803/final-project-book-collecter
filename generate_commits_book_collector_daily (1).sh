#!/usr/bin/env bash
# Generate 2-3 empty commits per day over the last 2 weeks with existing messages.

# Array of existing messages (you can leave this as-is)
messages=(
  "Initialize Book Collector project"
  "Add Book model and schema"
  "Implement book listing view"
  "Fix book detail page layout"
  "Update search functionality"
  "Improve pagination for book list"
  "Add filter by genre feature"
  "Optimize database queries"
  "Refactor book service logic"
  "Write unit tests for book API"
  "Add cover image upload support"
  "Fix cover image rendering"
  "Update README with setup instructions"
  "Enhance UI for book cards"
  "Correct typo in book importer"
  "Add error handling for missing ISBN"
  "Improve responsiveness of book grid"
  "Update dependencies"
  "Clean up unused CSS"
  "Add sample data seeder"
  "Fix merge conflicts in collector module"
  "Adjust styling of search bar"
  "Add tags filtering support"
  "Improve accessibility of details page"
  "Refactor image upload component"
  "Fix warnings in console"
  "Optimize cover image compression"
  "Add logging for API errors"
  "Rename BookController methods"
  "Finalize Book Collector MVP"
)

# Go back 14 days
days_back=14

echo "Generating commits: 2-3 per day for the past $days_back days..."

for day_offset in $(seq 1 $days_back); do
  # Randomly choose 2 or 3 commits for this day
  commits_today=$((2 + RANDOM % 2))
  for ((i=0; i<commits_today; i++)); do
    # Random time on that day
    date_str=$(date -d "$day_offset days ago" +%Y-%m-%d)
    hour=$((RANDOM % 24))
    minute=$((RANDOM % 60))
    second=$((RANDOM % 60))
    commit_date="$date_str $hour:$minute:$second"
    # Pick random message
    msg="${messages[RANDOM % ${#messages[@]}]}"
    # Export GIT_COMMITTER_DATE and git commit
    GIT_COMMITTER_DATE="$commit_date" git commit --allow-empty --date "$commit_date" -m "$msg"
  done
done

echo "Done."
