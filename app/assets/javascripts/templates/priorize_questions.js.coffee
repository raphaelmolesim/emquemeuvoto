priorize_questions = "
<div class='priorize_questions'>
	<h1>Quais são suas prioridades?</h1>
	<p class='lead'>Ordene as propostas de acordo com o que você acredita ser prioriotário para a Cidade de São Paulo</p>
	<ul id='questions' class='nav nav-tabs nav-stacked'>
		{{ #questions }}
 	 		<li><a id='{{ id }}' class='question' href='#'>{{ title }}</a></li>
 	 	{{ /questions }}
 	</ul>

 	<button class='btn btn-success btn-large' id='rank_by_priority'>Concluir</button>

 	<div id='question_modal' class='modal hide fade'>
 	</div>
</div>
"
MyWindow().priorize_questions = priorize_questions

