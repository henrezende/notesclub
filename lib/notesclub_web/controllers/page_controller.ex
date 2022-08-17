defmodule NotesclubWeb.PageController do
  use NotesclubWeb, :controller

  @notebooks_in_home_count 7
  def notebooks_in_home_count, do: @notebooks_in_home_count

  alias Notesclub.Notebooks

  def index(conn, _params) do
    notebooks = Notebooks.list_random_notebooks(%{limit: @notebooks_in_home_count})
    render(conn, "index.html", notebooks: notebooks, all: false)
  end

  def all(conn, _params) do
    notebooks = Notebooks.list_notebooks()
    render(conn, "index.html", notebooks: notebooks, all: true)
  end
end
