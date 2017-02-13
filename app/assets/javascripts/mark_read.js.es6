$( document ).ready(function(){
  $("#read").click(markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('td').siblings('.url').children().html();
  console.log($link);

  // var linkId = $link.data('link-id');
  //
  // $.ajax({
  //   type: "PATCH",
  //   url: "/api/v1/links/" + linkId,
  //   data: { read: true },
  // }).then(updateLinkStatus)
  //   .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
