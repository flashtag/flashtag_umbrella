defmodule Flashtag.Blog.Post do
  use Ecto.Schema

  import Ecto.Changeset

  alias Flashtag.Blog.Post

  schema "posts" do
    field :body, :string, default: nil
    field :cover_photo, :string, default: nil
    field :description, :string, size: 200
    field :is_published, :boolean, default: false
    field :photo, :string, default: nil
    field :published_at, :naive_datetime, default: nil
    field :unpublished_at, :naive_datetime, default: nil
    field :slug, :string
    field :subtitle, :string
    field :title, :string
    field :category_id, :id
    field :user_id, :id

    timestamps()
  end

  @required_fields [:title, :slug]
  @optional_fields [
    :subtitle, :body, :description, :cover_photo, :photo, :is_published,
    :published_at, :unpublished_at,
  ]

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
  end
end
