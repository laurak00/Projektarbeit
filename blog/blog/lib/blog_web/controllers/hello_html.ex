defmodule BlogWeb.HelloHTML do
  use BlogWeb, :html

  embed_templates "hello_html/*"
end
