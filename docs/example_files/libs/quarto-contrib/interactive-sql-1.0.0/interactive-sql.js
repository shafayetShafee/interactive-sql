(function() {
  let interactive_sql = document.querySelectorAll('div.interactive-sql');
  interactive_sql.forEach(el => {
    let sqlime_output = el.querySelector('div.sqlime-example');
    el.appendChild(sqlime_output);
  });
})();