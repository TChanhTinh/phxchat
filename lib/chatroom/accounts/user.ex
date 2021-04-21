defmodule Chatroom.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :encrypted_password, :string
    field :username, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :encrypted_password])
    |> validate_required([:username, :encrypted_password])
    |> unique_constraint(:username)
  end
end
