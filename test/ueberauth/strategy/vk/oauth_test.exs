defmodule Ueberauth.Strategy.VK.OAuthTest do
  use ExUnit.Case

  import Ueberauth.Strategy.VK.OAuth, only: [client: 1]

  setup do
    config = Ueberauth.Config.get(%Plug.Conn{}, Ueberauth.Strategy.VK.OAuth)
    {:ok, %{client: client(config)}}
  end

  test "creates correct client", %{client: client} do
    # Provided via settings:
    assert client.client_id == "appid"
    assert client.client_secret == "secret"
    assert client.redirect_uri == "/callback"

    # Defaults:
    assert client.authorize_url == "https://oauth.vk.com/authorize"
    assert client.token_url == "https://oauth.vk.com/access_token"
    assert client.site == "https://api.vk.com/method"
  end
end
