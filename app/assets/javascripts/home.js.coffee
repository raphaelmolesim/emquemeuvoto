index = 0
ranking = new Ranking()
   
$ ->
  $("#start-now").click (e) ->
    e.preventDefault()
    view = Mustache.render(MyWindow().choose_method, {})
    $( "#content" ).html(view)
    $( "div.hero-unit" ).effect( "slide", {}, 1500 )
  
  $("#iterative-mode").live 'click', (e) ->
    e.preventDefault()
    render_iterative_mode()  
  
  $("#by_priority").live 'click', (e) ->
    e.preventDefault()
    index = 0
    ranking = new Ranking()
    render_questions_by_priority()

  $("a.question").live 'click', (e) ->
    e.preventDefault()
    question = questions[$(this).attr('id')]
    view = Mustache.render(MyWindow().desc_question, question)
    $('#question_modal').html(view)
    $('#question_modal').modal('show')

  $("button#rank_by_priority").live 'click', (e) ->
    e.preventDefault()
    links = $("ul#questions li a.question")
    i = links.length
    for item in links
      $link = $(item)
      id = $link.attr('id')
      console.log("-> #{id}")
      ranking.compute_priority(questions[id].proposers, i--)
    render_result()

  $("#agree").live 'click', (e) ->
    e.preventDefault()
    compute_vote_and_render_next(true)
  
  $("#disagree").live 'click', (e) ->
    e.preventDefault()
    compute_vote_and_render_next(false)

  $("#dont-know").live 'click', (e) ->
    e.preventDefault()
    render_next()

  $("a.priority").live 'click', (e) ->
    e.preventDefault()
    $element = $(this)
    if $element.hasClass("selected")
      $element.removeClass("selected")
      $element.addClass("unselected")
    else
      $element.removeClass("unselected")
      $element.addClass("selected")

render_next = ->
  if (index < questions.length - 1)
    render_question(questions[++index])
  else
    render_result()

compute_vote_and_render_next = (vote) ->
  question = questions[index]
  priority = $("a.priority").hasClass("selected")
  question.my_vote = if vote then 'like' else 'dislike'
  ranking.compute_vote(vote, priority, question.proposers, question.opponents)
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
    "<h3><a href='#' class='toggle-modal'>Compartilhe o seu candidato!</a></h3>"
  else
    "<h3><a href='#' id='by_priority'>Quer desempatar? Tente por prioridade!</a></h3>"
  $("#content").html(Mustache.render(MyWindow().result_page, 
    leaders : leaders
    size : "size-#{leaders.length}",
    link : h3,
  ))
  $("ul#leaders").fadeIn(1500, ->
    if leaders.length == 1
      if mode == "iterative"
        for question in questions
          if question.proposers.indexOf(leaders[0].class) != -1 
            question.candidate_opnion = 'like' 
          else 
            question.candidate_opnion = 'dislike'
        $("#explanation").html(Mustache.render(MyWindow().explanation, 
          questions : questions))
      setTimeout(->
        $('#share-modal').modal()
      , 2000)
  )

render_question = (data) ->
  $( "div.question" ).replaceWith(Mustache.render(MyWindow().show_question, data))
  $( "div.question" ).effect( "slide", {}, 1500 )

render_iterative_mode = ->
  mode = "iterative"
  $( "#content" ).html(Mustache.render(window.candidates_list, {}))
  question_view = Mustache.render(MyWindow().show_question, questions[0])
  $( "#candidates" ).before(question_view)
  $( "div.question" ).effect( "slide", {}, 1500 )

render_questions_by_priority = ->
  mode = "by_priority"
  question.id = index++ for question in questions
  view = Mustache.render(MyWindow().priorize_questions, { questions : questions })
  $( "#content" ).html(view)
  $( "ul#questions" ).sortable
    revert: true
  $( "ul#questions" ).draggable
    connectToSortable: "ul#questions"
    helper: "clone"
    revert: "invalid"
  $("ul li").disableSelection()
