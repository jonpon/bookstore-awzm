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
        sql: "sql/bookstore_questions.sql",
        // Run the query named all products
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
    console.log("got data yeaaay: ", data);
    $(".submitForm .currPrice").val(data[0].price);
  }

  $(".submitForm").submit(function() {
    var formInfo = {};
    $(this).find("input").not("input[type='submit']").each(function() {
      formInfo[this.name] = $(this).val();
    });

    console.log("formInfo: ", formInfo);

    //check if formInfo.isbn actually contains any characters 
    //(if the user is actually searching for something specific)
    if (formInfo.ISBN.length) {
      //search for that specific thing
      currentStockOfIsbn(formInfo);
    } else {
      //else just find everything
      //currentStockOfAll();
    }

    //always return false in a jQuery .submit() to prevent page reload
    return false;
  });

});





function myFunction() {
    document.write("FUCK YEAY SKITEN FUNKAR!");
  }



//create new button

//function myFunction() {
  //  var btn = document.createElement("BUTTON");
   // document.body.appendChild(btn);
//}

//change bg color

//function myRed() {
//document.body.style.backgroundColor = "red";
//}
