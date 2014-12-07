//DOM Ready :)
$(function() {
 

  function currentStockOfIsbn(formInfo) {
    $.ajax({
      url:"libs/sql-ajax-json.php",
      dataType: "json",
      data: {
        sql: "sql/bookstore_questions.sql",
        run: "select book by isbn",
        isbn: JSON.stringify(formInfo.ISBN)
      },
      success: function(data) {
        printStockInfo(data);
      },
      error: function(data) {
        console.log("currentStockOfIsbn ERROR: ", data.responseText);
      }
    });
  }

  function printStockInfo(data) {
    $(".currPrice").val(data[0].f_price);
  }

  $(".submitForm").submit(function() {
    var formInfo = {};
    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });
    if (formInfo.ISBN.length) {
      currentStockOfIsbn(formInfo);
    } else {
      currentStockOfAll();
    }
    return false;
  });

});





//function myFunction() {
  //  document.write("FUCK YEAY SKITEN FUNKAR!");
  //}
