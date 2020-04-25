defmodule CockpitWeb.PageController do
  use CockpitWeb, :controller

  def index(conn, _params) do
    render(conn, "login.html")
  end

  def login(conn, %{"username" => username, "password" => password}) do
    user = Cockpit.Accounts.get_user_by_username(username)
    cond do
      user == nil ->
        conn
        |> put_flash(:error, "Username or password incorrect")
        |> render("login.html")
      Argon2.verify_pass(password, user.password) == false ->
        conn
        |> put_flash(:error, "Username or password incorrect")
        |> render("login.html")
      true ->
        conn
        |> put_session(:uid, user.id)
        |> configure_session(renew: true)
        |> redirect(to: Routes.page_path(conn, :index))
    end

  end
end
