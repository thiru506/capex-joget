$(document).ready( function(){
    $(".category").hover(
        function(){ 
            $(this).find(".menu-container").show();
        },
        function (){
            $(this).find(".menu-container").hide();
        }
    );
});
