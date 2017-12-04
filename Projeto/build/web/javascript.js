function notUser() {
    $.ajax({
        type: "get",
        url: "./UsuarioLogado?id=" + $("#user_id").val(),
        dataType: "json",
        success: function (data) {                
        }
    });
}