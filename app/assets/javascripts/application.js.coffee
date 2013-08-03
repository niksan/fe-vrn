//= require jquery
//= require jquery_ujs
//= require bootstrap-alert
//= require_tree ../../../vendor/assets/javascripts/fancybox

jQuery ->
  $('a.fancybox').fancybox()
  $('.field_with_errors').parent().parent().addClass('error')
  $(".alert").alert()
