$ ->
	$("#start-now").click (e) ->
		e.preventDefault()
		$( "#hero-unit" ).effect( "slice", {}, 1500, null );

callback = ->
	setTimeout ->
		data =
			title : "Pergunta 01"
			subtitle : "Subtitle 01"
			description : "Description 01"
		$( "#hero-unit" ).html(Mustache.render(show_question, data))
	, 1000

