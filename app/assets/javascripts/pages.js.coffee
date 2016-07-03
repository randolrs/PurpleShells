# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	$(document).ready ->
		
		jQuery ->

			$("a.dismiss-cover-page").click (event), ->
				coverPage = $(@).parent().parent()
				coverPage.hide()

			$("p.location-city-option").click (event), ->
				cityPanel = $(@).parent().parent().parent().parent()
				cityID = $(@).attr('id')
				$.ajax
					url: "/user/city/#{cityID}", format: 'js'
					type: "GET"
					success: (data) ->
						console.log(data)
						alert("success")
						cityPanel.hide()
						location.reload(true)
						


$(document).ready(ready)
$(document).on('page:load', ready)