defmodule LocalDocker.Repo do
  use Ecto.Repo,
    otp_app: :local_docker,
    adapter: Ecto.Adapters.Postgres
end
