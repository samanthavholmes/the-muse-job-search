$(document).ready(function(){
    var locations = $('.location-list').data('locations');
    $('#location-search-form').tokenfield({
        autocomplete: {
        source: locations,
        delay: 100
      },
      beautify: false
    })
});