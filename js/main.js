//DOM Ready :)
$(function() {

  $.ajax({
      url:"libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/product-questions.sql",
        run: "select book by isbn",
        isbn: $('#isbn').val()
      },
      success:output
    });


});