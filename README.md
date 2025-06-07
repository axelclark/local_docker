# LocalDocker

## Docker Development Setup

This project is configured for local development using Docker. The setup includes:

- Phoenix application container
- PostgreSQL database container
- Live code reloading
- Persistent database storage

### Starting the Application

```bash
# Start the application and database
docker-compose up

# Or run in background
docker-compose up -d
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Running Commands

The project includes a justfile for convenient command shortcuts:

```bash
# Main commands
just mix deps.get        # Install dependencies
just mix ecto.create     # Create database
just mix ecto.migrate    # Run migrations
just mix phx.server      # Start Phoenix server
just test               # Run tests
just test path/to/file   # Run specific test file

# Container management
just up                 # Start application and database
just upd                # Start in background
just down               # Stop application and database
```

You can also use `docker-compose run` directly:

```bash
# Install dependencies
docker-compose run --rm app mix deps.get

# Database commands
docker-compose run --rm app mix ecto.create
docker-compose run --rm app mix ecto.migrate
docker-compose run --rm app mix ecto.reset

# Run tests (requires MIX_ENV=test)
docker-compose run --rm -e MIX_ENV=test app mix test

# Interactive Elixir shell
docker-compose run --rm app iex -S mix

# Get a shell inside the container
docker-compose run --rm app sh
```

### Configuration Changes for Docker

The following files were modified for Docker development:

- `config/dev.exs`: Changed HTTP binding from `127.0.0.1` to `0.0.0.0` and database hostname to use `DB_HOST` environment variable
- `config/test.exs`: Updated database hostname to use `DB_HOST` environment variable

### Files Added

- `Dockerfile`: Application container configuration
- `docker-compose.yml`: Service orchestration for app and database
- `.dockerignore`: Optimizes Docker builds

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
