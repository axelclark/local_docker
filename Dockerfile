FROM elixir:1.16-alpine

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    git \
    nodejs \
    npm \
    inotify-tools

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Copy mix files and install dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get

# Copy all source files
COPY . .

# Install dependencies and compile assets
RUN mix deps.compile

# Expose the port
EXPOSE 4000

# Default command for development
CMD ["mix", "phx.server"]