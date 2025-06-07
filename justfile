# Docker-based Phoenix development commands

# Run any mix command (usage: just mix deps.get)
mix *args:
    docker-compose run --rm app mix {{args}}

# Run tests
test:
    docker-compose run --rm -e MIX_ENV=test app mix test

# Start the application
up:
    docker-compose up

# Start in background
upd:
    docker-compose up -d

# Stop the application
down:
    docker-compose down

# Interactive Elixir shell
iex:
    docker-compose run --rm app iex -S mix

# Get shell inside container
shell:
    docker-compose run --rm app sh

# Show available commands
help:
    @just --list