$(document).ready(function(){
  $('.search-option').on("click", function(e){
    e.preventDefault();
    $('.active').removeClass('active').addClass('hidden');
    var id = "#" + this.id + "-list"
    $(id).show();
    $(id).removeClass('hidden').addClass("active");
  });
  $('body').on("click", '.show-more', function(e){
    e.preventDefault();
    if ($(this).parent().parent().parent().find('.job-description').hasClass("active")){
      $(this).html('<span class="glyphicon glyphicon-chevron-down"></span> More Info');
      $(this).parent().parent().parent().find('.job-description').removeClass("active").hide();
    }
    else {
      $(this).html('<span class="glyphicon glyphicon-chevron-up"></span> Less Info');
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

