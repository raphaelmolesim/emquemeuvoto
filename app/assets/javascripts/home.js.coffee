$ ->
	$("#start-now").click (e) ->
		e.preventDefault()
		data =
			title : "Pergunta 01"
			subtitle : "Subtitle 01"
			description : "Description 01"
    $( ".hero-unit" ).html(Mustache.render(Window.show_question, data))
		$( ".hero-unit" ).effect( "slide", {}, 1500 )
