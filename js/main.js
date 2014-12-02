//DOM Ready :)
$(function() {

  //find stock for a single isbn
  function currentStockOfIsbn(formInfo) {
    $.ajax({
      // Use Nodebite's magic library
      url:"libs/sql-ajax-json.php",
      // Expect json in return
      dataType: "json",
      data: {
        // Read SQL questions from this file
        sql: "sql/product-questions.sql",
        // Run the query named all products
        run: "select book by isbn",
        isbn: formInfo.isbn
      },
      success: function(data) {

      },
      error: function(data) {

      }
    });
  }

  $(".submitForm").submit(function() {
    var formInfo = {};
    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });

    console.log("formInfo: ", formInfo);

    //check if formInfo.isbn actually contains any characters 
    //(if the user is actually searching for something specific)
    if (formInfo.isbn.length) {
      //search for that specific thing
      currentStockOfIsbn(formInfo);
    } else {
      //else just find everything
      currentStockOfAll();
    }

    //always return false in a jQuery .submit() to prevent page reload
    return false;
  });

});

function myFunction() {
    document.getElementById(id="input1")
    ("FUCK YEAY SKITEN FUNKAR!");
}