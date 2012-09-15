questions = [
	{
		title : "Pergunta 01",
		subtitle : "Subtítulo 01",
		description : "Descricao 01",
		proposers : [ "Fernando Haddad", "José Serra" ]
	},
	{
		title : "Pergunta 02",
		subtitle : "Subtítulo 02",
		description : "Descricao 02",
		proposers : [ "Celso Russomano", "José Serra" ]
	}
]

$ ->
	$("#start-now").click (e) ->
		e.preventDefault()
		render_view(questions[index++])
		
  $("#agree").live 'click', (e) ->
		e.preventDefault()
		render_next(true)
	
	$("#disagree").live 'click', (e) ->
		e.preventDefault()
		render_next(false)

	$("#dont-know").live 'click', (e) ->
		e.preventDefault()
		render_next(null)

render_next = (result) ->
	if (index < questions.lenght)
		questions[index]['answer'] = result
		render_view(questions[index++])
	else
		render_result()

render_result = () ->
	result = 
		'Fernando Haddad' : 0,
		'José Serra' : 0,
		'Celso Russomano' : 0,
		'Soninha Francine' : 0,
		'Gabriel Chalita' : 0,
	for question of questions
  	for candidate, score of result
  		if question['answer'] and question['proposers'].indexOf(candidate) != -1
  			result[candidate] += 1
  		elsif not question['answer'] and question['proposers'].indexOf(candidate) == -1
  			result[candidate] += 1
  		else
  			result[candidate] -= 1
  leader = result[0]
  for candidate, score of result
  	if score > leader['score']
  		leader = { candidate : score }
	alert(leader)

render_view = (data) ->
	$( ".hero-unit" ).html(Mustache.render(Window.show_question, data))
	$( ".hero-unit" ).effect( "slide", {}, 1500 )