show_question = "
<div class='question'>
<h1>{{title}}</h1>
<p>{{subtitle}}</p>
<p>{{description}}</p>

<p>
	<a id=\"agree\" class=\"btn btn-success btn-large\">Concordo</a>
	<a id=\"disagree\" class=\"btn btn-danger btn-large\">Discordo</a>
	<a id=\"dont-know\" class=\"btn btn-primary btn-large\">Não tenho uma opnião formada</a>
</p>
</div>

<ul id='candidates'>
  <li id='russomano'><label class='score'>0</label>Celso Russomano</li>
  <li id='serra'><label class='score'>0</label>José Serra</li>
  <li id='haddad'><label class='score'>0</label>Fernando Haddad</li>
  <li id='chalita'><label class='score'>0</label>Gabriel Chalita</li>
  <li id='soninha'><label class='score'>0</label>Soninha Francine</li>
</ul>


"
MyWindow().show_question = show_question

