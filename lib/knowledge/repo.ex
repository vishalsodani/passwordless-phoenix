defmodule Knowledge.Repo do
  use Ecto.Repo,
    otp_app: :knowledge,
    adapter: Ecto.Adapters.Postgres
end
