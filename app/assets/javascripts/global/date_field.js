$(document).ready(
  
  /* This is the function that will get executed after the DOM is fully loaded */
  function () {
    $( "#id_to_date" ).datepicker({
      changeMonth: true,//this option for allowing user to select month
      changeYear: true,
       beforeShow: function (input, inst) {
         var offset = $(input).offset();
         var height = $(input).height();
         window.setTimeout(function () {
             inst.dpDiv.css({ top: (offset.top + height + 4) + 'px', left: offset.left + 'px' })
         }, 1);
     } //this option for allowing user to select from year range
    });




    $( "#id_from_date" ).datepicker({
	 beforeShow: function (input, inst) {
         var offset = $(input).offset();
         var height = $(input).height();
         window.setTimeout(function () {
             inst.dpDiv.css({ top: (offset.top + height + 4) + 'px', left: offset.left + 'px' })
         }, 1);
     },
      changeMonth: true,//this option for allowing user to select month
      changeYear: true //this option for allowing user to select from year range
    });




  }

);
