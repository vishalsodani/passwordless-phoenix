defmodule Knowledge.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string

    timestamps()
    # has_many :auth_tokens, AuthToken
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    
  end
end
