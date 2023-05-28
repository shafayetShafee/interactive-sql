(function() {
  let interactive_sql = document.querySelectorAll('div.interactive-sql');
  interactive_sql.forEach(el => {
    let sqlime_output = el.querySelector('div.sqlime-example');
    el.appendChild(sqlime_output);
  });
  
  // for revealjs, removing the `numberSource` from <pre> from when 
  // `contenteditable="true"` in <code>, so that line numbers doesnot show
  // up.
  
  let reveal_sqldiv = document.querySelectorAll('.reveal div.interactive-sql');
  reveal_sqldiv.forEach(el => {
    let pre = el.querySelector('pre.sourceCode');
    let code = el.querySelector('code.sourceCode');
    if (code.hasAttribute('contenteditable')) {
      if (pre.classList.contains('numberSource')) {
        pre.classList.remove('numberSource');
      };
    };
  });
})();