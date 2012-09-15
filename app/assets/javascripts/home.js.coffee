
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
  calculate_scores(questions[index], ->
  if (index < questions.length - 1)
    render_view(questions[++index])
  else
    render_result()
  )

candidate_class = (candidate) ->
  {
      'Fernando Haddad' : "haddad",
      'José Serra' : "serra",
      'Celso Russomano' : "russomano",
      'Soninha Francine' : "soninha",
      'Gabriel Chalita' : "chalita"
  }[candidate]


calculate_scores = (question, callback) ->
  for candidate, score of result
    if question.answer and question.proposers.indexOf(candidate) != -1
      result[candidate] += 1
    else if not question.answer and question.proposers.indexOf(candidate) == -1
      result[candidate] += 1
    else
      result[candidate] -= 1
    id = candidate_class(candidate)
    console.log("ul#candidates li##{id} label.score")
    $("ul#candidates li##{id} label.score").css( 'display', "block" )
    $("ul#candidates li##{id} label.score").effect( 'bounce', {}, 500, callback )
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
  $("#content").html(Mustache.render(MyWindow().result_page, 
    candidate : leader 
    candidate_class : candidate_class(leader)
  ))
  $("div#candidate").fadeIn(1500)

render_view = (data) ->
  $( "#content" ).html(Mustache.render(MyWindow().show_question, data))
  $( "div.question" ).effect( "slide", {}, 1500 )
