defmodule KnowledgeWeb.AuthenticationEmail do
    use Bamboo.Phoenix, view: KnowledgeWeb.EmailView
  
    import Bamboo.Email
  
    @doc """
      The sign in email containing the login link.
    """
    def login_link(token_value, user) do
      new_email()
      |> to(user.email)
      |> from("info@myapp.com")
      |> subject("Your login link")
      |> assign(:token, token_value)
      |> render("email.html")
    end
  end