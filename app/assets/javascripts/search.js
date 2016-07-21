$(document).ready(function(){
  $('.active').hide();
  $('.search-option').on("click", function(e){
    e.preventDefault();
    $('.active').hide();
    $('.active').removeClass('active');
    var id = "#" + this.id + "-list"
    $(id).show();
    $(id).addClass("active");
  });
  $('body').on("click", '.show-more', function(e){
    e.preventDefault();
    if ($(this).parent().parent().parent().find('.job-description').hasClass("active")){
      $(this).text("Show More");
      $(this).parent().parent().parent().find('.job-description').removeClass("active").hide();
    }
    else {
      $(this).text("Hide");
      $(this).parent().parent().parent().find('.job-description').removeClass("hidden").addClass("active").show()
    }
  });
  $('#form-div').on("submit", "form", function(e){
    e.preventDefault();
    var companies = $('#company-search-form').tokenfield('getTokensList').split(',');
    var levels = $(':checked.level').map(function() {
      return this.name;
    });
    var categories = $(':checked.category').map(function() {
      return this.name;
    });
    var locations = $('#location-search-form').tokenfield('getTokensList', ';').split(';');
    var search_queries = {companies: companies, levels: $.makeArray(levels), categories: $.makeArray(categories), locations: locations}
    $.ajax({
      url: '/search',
      method: 'POST',
      data: search_queries
    }).done(function(response){
      $('.container').replaceWith(response)
    });
 });
});

