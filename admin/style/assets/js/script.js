$(document).ready(function(){
    $('#password').keyup(function(index){
        let karakter = $(this).val();
        let totalkarakter = karakter.length;
        if(totalkarakter>= 6){
            $('.status').removeClass('lemah');
            $('.status').text('kuat');
            $('.status').addClass('kuat');
        }else{
            $('.status').removeClass('kuat');
            $('.status').text('lemah');
            $('.status').addClass('lemah');
        }
    });
});
