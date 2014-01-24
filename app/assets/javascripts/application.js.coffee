#= require jquery
#= require jquery_ujs
#= require bootstrap-alert
#= require_tree ../../../vendor/assets/javascripts/fancybox
#= require ../../../vendor/assets/javascripts/bootstrap-transition
#= require ../../../vendor/assets/javascripts/bootstrap-alert
#= require ../../../vendor/assets/javascripts/bootstrap-carousel
#= require_tree .

jQuery ->
  $('.carousel').carousel({
    interval : 5000
    pause : 'hover'
  })
  $('a.fancybox').fancybox()
  $('.field_with_errors').parent().parent().addClass('error')
  $(".alert").alert()
  $('ul#products .img img').click ->
    window.location = $(@).parent().parent().find('.name a').attr('href')
    return false
  $('.short_article .shadow a.more').click ->
    $(@).parent().parent().addClass('active')
    return false
