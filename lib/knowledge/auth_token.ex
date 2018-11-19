defmodule Knowledge.AuthToken do
  use Ecto.Schema
  import Ecto.Changeset
  alias Phoenix.Token

  schema "auth_tokens" do
    field :token_value, :string
    field :user_id, :id

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(auth_token, attrs) do
    auth_token
    |> cast(attrs, [:token_value, :user_id])
    |> validate_required([:token_value, :user_id])
    |> unique_constraint(:token_value)
  end

end