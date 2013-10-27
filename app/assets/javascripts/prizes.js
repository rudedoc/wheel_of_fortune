$(document).ready(function () {

    $('#prize_title').keydown(function(){

        var text_count = $(this).val().length;
        console.log(text_count);
        if(text_count > 16){
             console.log($(this));
            }
    })

});