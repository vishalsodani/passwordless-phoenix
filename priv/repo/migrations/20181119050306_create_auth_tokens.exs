defmodule Knowledge.Repo.Migrations.CreateAuthTokens do
  use Ecto.Migration

  def change do
    create table(:auth_tokens) do
      add :token_value, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(updated_at: false)
    end

    create index(:auth_tokens, [:user_id])
    create unique_index(:auth_tokens, [:token_value])
  end
end
