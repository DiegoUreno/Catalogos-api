defmodule Catalogos.Repo.Migrations.Nivel do
  use Ecto.Migration

  def change do
    create_query = "alter table Dependencias add column nivel enum('DIR', 'SEC') default null;"
    drop_query = "alter table Dependencias drop column nivel enum('DIR', 'SEC');"
    execute(create_query, drop_query)

  end
end
