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
      $('body').replaceWith(response)
    })
 })
  })


