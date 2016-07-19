$(document).ready(function(){
  $('.active').hide();
  $('.search-option').on("click", function(e){
    e.preventDefault();
    $('.active').hide();
    $('.active').removeClass('active');
    var id = "#" + this.id + "-list"
    $(id).show();
    $(id).addClass("active");
  })
});