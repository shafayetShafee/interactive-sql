# Interactive-sql Extension For Quarto

Run sql queries interactively from Quarto html document.

[`View Live Demo`](https://shafayetshafee.github.io/interactive-sql/example.html)

## Installing

```bash
quarto add shafayetShafee/interactive-sql
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

*Note: It is recommended to use latest quarto version for using this extension.*

## Using

At first use the filter `interactive-sql` in the document yaml,

```
---
filters:
  - interactive-sql
```

Then list the binary SQLite file or SQL script under the `databases` yaml key, where you are required to provide a `name` of the database which will be used later to create interactive sql code chunk and a `path` to the SQL script or SQLite binary file that must be served from a server.


And then create non executable sql code chunk using `{.sql}` along with two classes. One is `.interactive` and another will be the name of the databases, `.<database-name>` for which you want to queries in this code chunk.

So for example, you have added a SQL script containing code for creating a SQLite database with the name `hr`. Then When you create the code chunk use the class `.hr` so that the queries are executed for this database.

~~~
---
filters:
  - interactive-sql
databases:
  - name: hr
    path: "https://raw.githubusercontent.com/shafayetShafee/interactive-sql/main/hr.sql"
---


```{.sql .interactive .hr}
select * from regions;
```
~~~

### `editable` option

Use this option in the yaml under the `databases` key to make the code chunk associated with that databases un-editable.

### Using multiple databases

You can use multiple databases too. Just list them under the `databases` key. See the example file to check how to.


## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).


## Acknowledgement

This extension is simply a wrapper around the amazing [`sqlime`](https://sqlime.org/about.html). So thanks to the [`sqlime`](https://github.com/nalgeon/sqlime) project and the maintainer [`Anton Zhiyanov`](https://twitter.com/ohmypy).
