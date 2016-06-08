defmodule PhoenixXml.PageController do
  use PhoenixXml.Web, :controller
  import SweetXml

  def index(conn, _params) do
    doc = ~s(<game>
    <matchups>
    <matchup winner-id="1">
    <name>Match One</name>
    <teams>
    <team>
    <id>1</id>
    <name>Team One</name>
    </team>
    <team>
    <id>2</id>
    <name>Team Two</name>
    </team>
    </teams>
    </matchup>
    <matchup winner-id="2">
    <name>Match Two</name>
    <teams>
    <team>
    <id>2</id>
    <name>Team Two</name>
    </team>
    <team>
    <id>3</id>
    <name>Team Three</name>
    </team>
    </teams>
    </matchup>
    <matchup winner-id="1">
    <name>Match Three</name>
    <teams>
    <team>
    <id>1</id>
    <name>Team One</name>
    </team>
    <team>
    <id>3</id>
    <name>Team Three</name>
    </team>
    </teams>
    </matchup>
    </matchups>
    </game>)
    result = doc |> xpath(~x"//matchup/name/text()")
    {:ok, parser} = :exml.parse(doc)
    IO.inspect parser
    result2 = :exml_query.path(parser, [{:element, "matchups"}, {:element, "matchup"}, {:element, "name"}, :cdata])
    IO.inspect result2

    render conn, "index.html", [doc: doc, result: result, result2: result2]
  end
end
