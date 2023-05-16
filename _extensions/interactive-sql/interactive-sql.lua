p = quarto.log.output
str = pandoc.utils.stringify


local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = "interactive-sql",
    version = "1.0.0",
    scripts = {
        {path = "resources/js/sqlite3.js" },
        {path = "resources/js/sqlime-db.js" },
        {path = "resources/js/sqlime-examples.js" },
        {path = "resources/js/sqlite3.wasm" },
        {
          path = "resources/js/interactive-sql.js",  
          afterBody = true
        }
      },
    stylesheets = {"resources/css/interactive-sql.css"}
  })
end


ensureHtmlDeps()

function get_dbs(databases)
  return {
    Meta = function(m)
      for key, val in ipairs(m.databases) do
        local db = {
          ["name"] = str(val.name),
          ["path"] = str(val.path),
          ["class"] = str(val.name)
        }
        table.insert(databases, db)
      end
    end
  }
end


function CodeBlock(cb)
  if cb.classes:includes('interactive') then
    local div = pandoc.Div(cb, {class = "interactive-sql"})
    return div
  end
end

function Pandoc(doc)
  local databases = {}
  doc:walk(get_dbs(databases))
  for key, val in ipairs(databases) do
    local sqlime_db = "<sqlime-db name=\"" 
                      .. val.name 
                      .. "\" path=\"" 
                      .. val.path
                      .. "\"></sqlime-db>"
    local sqlime_exm = "<sqlime-examples db=\""
                       .. val.name 
                       .. "\" selector=\"div.interactive-sql pre."
                       .. val.class .. " code"
                       .. "\" editable></sqlime-examples>"
    p(sqlime_db)
    p(sqlime_exm)
    local sqlime_db_html = pandoc.RawInline('html', sqlime_db)
    local sqlime_exm_html = pandoc.RawInline('html', sqlime_exm)
    table.insert(doc.blocks, sqlime_db_html)
    table.insert(doc.blocks, sqlime_exm_html)
  end
  return doc
end
