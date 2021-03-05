defmodule AccountBook.Repo do
  use Ecto.Repo,
    otp_app: :account_book,
    adapter: Ecto.Adapters.Postgres
end
