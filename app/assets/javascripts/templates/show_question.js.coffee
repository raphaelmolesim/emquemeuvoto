show_question = "

<h1>{{title}}</h1>
<p>{{subtitle}}</p>
<p>{{description}}</p>

<p>
	<a id=\"agree\" class=\"btn btn-success btn-large\">Concordo</a>
	<a id=\"disagree\" class=\"btn btn-danger btn-large\">Discordo</a>
	<a id=\"dont-know\" class=\"btn btn-primary btn-large\">Não tenho uma opnião formada</a>
</p>
"
try
  Window.show_question = show_question
catch err
  window.show_question = show_question

