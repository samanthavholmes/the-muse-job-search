$(document).ready(function(){
  var companies = $('.company-list').data('companies');
    $('#company-search-form').tokenfield({
        autocomplete: {
        source: companies,
        delay: 100
      },
      beautify: false
    })
});