defmodule CockpitWeb.Auth.LoginRequired do
  use CockpitWeb, :controller

  def init(_params) do

  end

  def call(conn, _params) do
    case get_session(conn, :uid) do
      nil ->
        conn
        |> put_flash(:info, "You must be logged in.")
        |> redirect(to: Routes.page_path(conn, :index))
      uid ->
        user = Cockpit.Accounts.get_user!(uid)
        policy_document = Cockpit.Roles.get_policy_document(user.role.id)
        conn |> assign(:user, user) |> assign(:auth, user.role.id) |> assign(:auth_policy, policy_document)
    end
  end
end
