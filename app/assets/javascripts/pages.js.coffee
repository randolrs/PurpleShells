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
			
			$("span.dismiss-modal").click (event), ->
				coverPage = $(@).parent().parent().parent()
				coverPage.hide()

			$('a.dismiss-course-session-container').click (event), ->
				alert("nowhere")
				courseSessionContainer = $(@).parent()
				courseSessionContainer.hide()

			$("p.teacher-dashboard-add-class-cta").click (event), ->
				courseModal = $('body').find('div.course-name-modal')
				courseModal.show()
				event.preventDefault()

			$("p.modal-submit").click (event), ->
				courseNameInput = $(@).parent().find('input.modal-text-input#title')
				courseName = courseNameInput.val()
				$.ajax
					url: "/course/create/#{courseName}", format: 'js'
					type: "GET"
					success: (data) ->
						console.log(data)
						if data.redirect_url
							window.location.replace(data.redirect_url);
			
			$("p.form-continue").click (event), ->
				ajaxLoading = $('body').find('.ajax-loading')
				ajaxLoading.show()

			$('form').on 'click', '.remove_fields', (event) ->
    			$(this).prev('input[type=hidden]').val('1')
    			$(this).closest('fieldset').hide()
    			event.preventDefault()

  			$('form').on 'click', '.add_fields', (event) ->
    			$(@).parent().removeClass("empty")
    			container = $('body').find('.course-form-session-container')
    			container.addClass("empty")
    			time = new Date().getTime()
    			regexp = new RegExp($(this).data('id'), 'g')
    			$(this).before($(this).data('fields').replace(regexp, time))
    			$('body').find('.course-submit-for-approval').slideDown()
    			event.preventDefault()

    		$('form').on 'click', '.add_fields.course_sessions', (event) ->
    			alert("addition")
    			event.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)