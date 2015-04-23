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

$(function(){
  $('#country-signup2').autocomplete({
    source:[signupcountries]
  });
});

$(function(){
  $('#cunt-signup').autocomplete({
    style:{width:'50%',margin:'auto'},
    source:[signupcountries]
  });
});
