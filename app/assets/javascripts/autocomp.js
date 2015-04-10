$(function(){
  $('#country-input').autocomplete({
    source:[countries]
  });
});

$(function(){
  $('#country-signup').autocomplete({
    source:[signupcountries]
  });
});
