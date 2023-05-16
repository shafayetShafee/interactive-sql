
local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = "interactive-sql",
    version = "1.0.0",
    scripts = {
        {path = "resources/js/sqlite3.js" },
        {path = "resources/js/sqlime-db.js" },
        {path = "resources/js/sqlime-examples.js" },
        {path = "resources/js/sqlite3.wasm" }
      },
    stylesheets = {"resources/css/interactive-sql.css"}
  })
end


ensureHtmlDeps()