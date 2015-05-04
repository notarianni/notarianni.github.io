-module(index).

data(_) ->
    #{ mvp_bash    => {markdown, "articles/mvp_bash.md"}
     }.

site(_) ->
    #{"index.html" => {template, "tmpl/index.html"}
     }.
