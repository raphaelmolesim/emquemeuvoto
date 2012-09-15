
index = 0

result =
  'Fernando Haddad' : 0,
  'José Serra' : 0,
  'Celso Russomano' : 0,
  'Soninha Francine' : 0,
  'Gabriel Chalita' : 0,
   
$ ->
  $("#start-now").click (e) ->
    e.preventDefault()
    render_view(questions[index])
    
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
  questions[index].answer = result
  calculate_scores(questions[index])
  if (index < questions.length - 1)
    render_view(questions[++index])
  else
    render_result()

calculate_scores = (question) ->
  for candidate, score of result
    if question.answer and question.proposers.indexOf(candidate) != -1
      result[candidate] += 1
    else if not question.answer and question.proposers.indexOf(candidate) == -1
      result[candidate] += 1
    else
      result[candidate] -= 1
    id = {
      'Fernando Haddad' : "haddad",
      'José Serra' : "serra",
      'Celso Russomano' : "russomano",
      'Soninha Francine' : "soninha",
      'Gabriel Chalita' : "chalita"
    }[candidate]
    $("ul#candidates li##{id} label.score").effect( 'bounce', {}, 500 )
    $("ul#candidates li##{id} label.score").css( 'display', "block" )
    if result[candidate] <= 0
      $("ul#candidates li##{id} label.score").css( 'color', "red" )
    else
      $("ul#candidates li##{id} label.score").css( 'color', "green" )
    $("ul#candidates li##{id} label.score").html( result[candidate] )

render_result = () ->
  leader = ''
  max_score = 0
  for candidate, score of result
    console.log("#{candidate} => #{score}")
    if score > max_score
      leader = candidate
      max_score = score
  $("#content").html(Mustache.render(MyWindow().result_page, { candidate : leader}))

render_view = (data) ->
  $( ".hero-unit" ).html(Mustache.render(MyWindow().show_question, data))
  $( ".hero-unit" ).effect( "slide", {}, 1500 )
