$(document).ready(function(){

  // hide expense rows
  $('[class^=expensetable]').hide();
  $('.statementheader').on('click', function() {
    var num = $(this).attr('class').split(" ").pop();
    // var expenseclass = "'tr.expensetable " + num + "'"
      $('tr.expensetable' + num).toggle();
 });

  // show expense rows if coming from show link on statement view page
  var url = window.location.pathname
  if (!isNaN(url.charAt(url.length-1)))
    {
      var num = url.charAt(url.length-1);
      $('tr.expensetable' + num).toggle();
    };

  $.tablesorter.addParser({
        id: 'input',
        is: function(s, table, node) {
            return false;
        },
        format: function(s,table,node) {
              return ($(node).find('[id^=expense_]').attr('value'));
        },
    });

  // make expense table sortable
  
    $(".myTable").tablesorter({

        headers: { 0: { sorter:'input'},
                    1: { sorter:'input'},
                    2: { sorter:'input'},
                    3: { sorter:'input'},
                    4: { sorter:'input'},
                    5: { sorter:'input'},
                  }
      }); 
 

// figure out whether reset or submit was selected
  var buttonpressed;
  $('.expensebutton').click(function(){
     buttonpressed = $(this).attr('name')
  });

  // update expenses without refreshing
  $('form.edit_expense').submit(function(event){
      event.preventDefault();
      if (buttonpressed == 'resetform')
        {
          $.ajax({
              url: $(this).attr('action') + '/reset',
              type: 'POST',
              success: function(json){
                var id = $(this).attr('url').split('/')[2];
                $('#' + id).find('#expense_receipt_sent').val(json.receipt_sent);
                $('#' + id).find('#expense_receipt_sent').prop("checked", false);
                $('#' + id).find('#expense_description').val(json.description);
                $('#' + id).find('#expense_client').val(json.client);
                $('#' + id).find('#expense_splits').val(json.splits);
                $('#' + id).removeClass('submitted');
              }
          });
        }
      else
        {
          var id = $(this).attr('action').split('/')[2];
          var choices = $('#' + id).find('#splits option');
           var valuesToSubmit = $(this).serialize();
           console.log(choices.length);
          $.ajax({
              url: $(this).attr('action'),
              type: 'PUT',
              data: valuesToSubmit,
              dataType: 'json',
              success: function(json){
                var id = this.url.split("/").pop();
                $('#' + id).addClass('submitted');
                $('#' + id).removeClass('failed');
              },
              error: function(json){
                console.log(json);
                // alert(json.responseText);
                var id = this.url.split("/").pop();
                $('#' + id).addClass('failed');
                
              }
          });
        }; 
    });
});