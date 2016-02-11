$(document).ready(function(){
  collapseTable('.platform-admin-tables')
  collapseTable('.sales-data-tables')
  collapseTable('.user-data-tables')
  slider()
  $('select:not([multiple])').material_select();
});

function collapseTable(id) {
   $(id).on('click', function() {
     $(this).next().toggleClass('hidden');
   });
 };
