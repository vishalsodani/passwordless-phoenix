defmodule Knowledge.AuthToken do
  use Ecto.Schema
  import Ecto.Changeset
  alias Phoenix.Token
  alias Knowledge.User
  alias KnowledgeWeb.Endpoint

  schema "auth_tokens" do
    field :token_value, :string
    belongs_to :user, User

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(struct, user) do
    struct
    |> cast(%{}, [])
    |> put_assoc(:user, user)
    |> put_change(:token_value, generate_token(user))
    |> validate_required([:token_value, :user])
    |> unique_constraint(:token_value)
  end

  defp generate_token(nil), do: nil
  defp generate_token(user) do
    Token.sign(Endpoint, "user", user.id)
  end

end