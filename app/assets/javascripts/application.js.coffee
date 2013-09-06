#= require jquery
#= require jquery_ujs
#= require bootstrap-alert
#= require_tree ../../../vendor/assets/javascripts/fancybox
#= require ../../../vendor/assets/javascripts/jquery.lazyload
#= require_tree .

jQuery ->
  $('a.fancybox').fancybox()
  $('.field_with_errors').parent().parent().addClass('error')
  $(".alert").alert()
  $('ul#products .img img').click ->
    window.location = $(@).parent().parent().find('.name a').attr('href')
    return false
  $('ul#products .img img, img.photo').lazyload({
    effect : "fadeIn"
  })
