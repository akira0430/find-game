$(function(){
  $("#tel").on("click", function(){
    var $this = $(this);
    $this.find("span").text( $this.data("phone") );
  });

  $("#send-message-to-user").on("click", function(){
    var first_name = $("#message-first-name").val(),
        last_name = $("#message-last-name").val(),
        email = $("#message-email").val(),
        message = $("#message-text").val();

    $.ajax({
      url: "/user/message",
      method: "POST",
      dataType: "json",
      data: {
        first_name: first_name,
        last_name: last_name,
        email: email,
        message: message
      },
      success: function(data){
        $('#contact-modal form').remove();
        $('#send-message-to-user').remove();
        $('#contact-modal .modal-body').html("<p>メッセージを送信しました</p>");
      }
    });

  });

  $('#contact-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var modal = $(this);
  });
});
