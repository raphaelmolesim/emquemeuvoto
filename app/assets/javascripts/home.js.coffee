index = 0
ranking = new Ranking()
   
$ ->
  $("#start-now").click (e) ->
    e.preventDefault()
    $( "#content" ).html(Mustache.render(window.candidates_list, {}))
    question_view = Mustache.render(MyWindow().show_question, questions[0])
    $( "#candidates" ).before(question_view)
    $( "div.question" ).effect( "slide", {}, 1500 )
    
  $("#agree").live 'click', (e) ->
    e.preventDefault()
    compute_vote_and_render_next(true)
  
  $("#disagree").live 'click', (e) ->
    e.preventDefault()
    compute_vote_and_render_next(false)

  $("#dont-know").live 'click', (e) ->
    e.preventDefault()
    render_next()

render_next = ->
  if (index < questions.length - 1)
    render_question(questions[++index])
  else
    render_result()

compute_vote_and_render_next = (vote) ->
  question = questions[index]
  ranking.compute_vote(vote, question.proposers, question.opponents)
  show_ranking(ranking, render_next)

show_ranking = (ranking, callback) ->
  setTimeout(callback, 300)
  for candidate_key, score of ranking.get_score()
    label = $("ul#candidates li##{candidate_key} label.score")
    continue if score.toString() == label.html()
    color = if score <= 0 then "red" else "green"
    label.css( 'color',  color)
    label.effect( 'bounce', {}, 500 )
    label.html( score )

render_result = () ->
  leaders = ranking.leaders()
  h3 = if leaders.length == 1 
    "<h3><a href='#' class='toggle-modal'>Compartilhe o seu candidato!</a><h3>" 
  else
    "<h3 style='color:red;'>Você escolheu muitas vezes \"Não tenho opinião formada\", que tal estudar um pouco?<h3>"
  $("#content").html(Mustache.render(MyWindow().result_page, 
    leaders : leaders
    size : "size-#{leaders.length}",
    link : h3,
  ))
  $("ul#leaders").fadeIn(1500, ->
    if leaders.length == 1
      setTimeout(->
        $('#share-modal').modal()
      , 2000)
  )

render_question = (data) ->
  $( "div.question" ).replaceWith(Mustache.render(MyWindow().show_question, data))
  $( "div.question" ).effect( "slide", {}, 1500 )
