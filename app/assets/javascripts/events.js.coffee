# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$('#new_tag_button').popover
  html : true
  placement: 'bottom'
  content: ->
    $('.new_tag_form').html()