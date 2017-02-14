$( document ).ready(function(){
  $(".read").click(markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('td').siblings('.url').children().html();
  var linkId = $(this).parents('tr').data('link-id');
  $(this).parents('td').html('finished');

  $.ajax({
    type: "POST",
    url: "https://enigmatic-reaches-33452.herokuapp.com/api/v1/reads",
    headers: { url: $link }
  }).then(console.log('it worked!'))
    .fail(console.log('something went wrong!'));

  $.ajax({
    type: "POST",
    url: "/api/v1/links",
    data: { id: linkId }
  }).then(console.log('you read a thing!'))
    .fail(console.log('you didn`t read a thing!'));
}
