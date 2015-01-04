-module(index).

data(_) ->
    #{ msg              => "Hello World!",
       from_eterm       => {eterm,    "hello.config"},
       from_json        => {json,     "hello.json"},
       from_markdown    => {markdown, "hello.md"}
     }.

site(_) ->
    #{"index.html" => {template, "tmpl/index.html"}
     }.
