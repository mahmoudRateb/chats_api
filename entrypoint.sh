#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Scriopt to make sure that web waits for the containers that it depends on until they are ready
./../wait

# If the database exists, migrate. Otherwise setup (create and migrate)
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:create db:migrate
echo "Done!"


# Then exec the container's main process (what's set as CMD in the Dockerfile).
# exec "$@"
bundle exec rails s -p 3000 -b '0.0.0.0'
