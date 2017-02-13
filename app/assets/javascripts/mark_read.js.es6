$( document ).ready(function(){
  $(".read").click(markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('td').siblings('.url').children().html();
  console.log($link);

  $.ajax({
    type: "POST",
    url: "https://enigmatic-reaches-33452.herokuapp.com/api/v1/reads",
    headers: { url: $link }
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
