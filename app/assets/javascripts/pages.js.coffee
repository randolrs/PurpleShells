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
				textInput = $('body').find('input.modal-text-input')
				coverPage = $(@).parent().parent().parent()
				coverPage.hide()
				textInput.val("")

			$('form').on 'click', 'p.dismiss-course-session', (event) ->
				alert("nowhere")
				destroyBox = $(@).parent().find('.destroyer')
				destroyBox.val('true')
				alert(destroyBox.html())
				courseSessionContainer = $(@).parent().parent()
				courseSessionContainer.hide()
				event.preventDefault()

			$("p.teacher-dashboard-add-class-cta").click (event), ->
				courseModal = $('body').find('div.course-name-modal')
				courseModal.show()
				event.preventDefault()

			$("p.modal-submit#courses").click (event), ->
				courseNameInput = $(@).parent().find('input.modal-text-input#title')
				courseDescriptionInput = $(@).parent().find('textarea.modal-text-input#description')
				courseName = courseNameInput.val()
				courseDescription = courseDescriptionInput.val()
				$.ajax
					url: "/course/create/#{courseName}/#{courseDescription}", format: 'js'
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
    			sessionsField = $('body').find('input.number-of-sessions#number-of-sessions')
    			numberOfSessions = parseInt(sessionsField.val(), 10)
    			newNumberOfSessions = numberOfSessions + 1
    			sessionsField.val(newNumberOfSessions)
    			sessionLabelString = "Session #" + newNumberOfSessions 
    			submitContainer = $('body').find('.course-form-submit')
    			container = $('body').find('.course-form-session-container')
    			container.addClass("empty")
    			time = new Date().getTime()
    			regexp = new RegExp($(this).data('id'), 'g')
    			$(this).before($(this).data('fields').replace(regexp, time))
    			newSessionLabel = $(@).prev(".course-session-container").find('.session-number-label').html(sessionLabelString)
    			submitContainer.slideDown()
    			event.preventDefault()

    		$('form').on 'click', '.add_fields.course_sessions', (event) ->
    			alert("addition")
    			event.preventDefault()

    		$('a.add-profile-image-button').click (event), ->
    			profileImageModal = $('body').find('div.add-profile-image-modal')
    			profileImageModal.show()

    		$('div.course-name-modal-content').click (event), ->
    			event.stopPropagation()

    		$('div.add-profile-image-modal').click (event), ->
    			$(@).hide()

			$('div.course-name-modal').click (event), ->
				textInput = $('body').find('input.modal-text-input')
				textInput.val("")
				$(@).hide()

			$('p.modal-submit#user-profile-image').click (event), ->
				alert("hoi")

			$('p.menu-button').click (event), ->
				sidebarMenu = $('body').find('.sidebar-fixed-container.default-off')
				sidebarMenu.show()
				event.preventDefault()

			$('div.sidebar-fixed-container').click (event), ->
				$(@).hide()

			$('div.sidebar-fixed-content').click (event), ->
				event.stopPropagation()

$(document).ready(ready)
$(document).on('page:load', ready)