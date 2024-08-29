defmodule Kisiwo.Repo do
  use Ecto.Repo,
    otp_app: :kisiwo,
    adapter: Ecto.Adapters.Postgres
end
