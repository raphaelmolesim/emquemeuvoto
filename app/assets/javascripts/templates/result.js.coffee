result_page = "
  <div class='hero-unit'>
    <h1>O prefeito que mais concorda com as suas ideias é ... </h1>

    <ul id='leaders' class='{{ size }}'>
  		{{ #leaders }}
  		<li id='{{class}}'>{{ name }}</li>
  		{{ /leaders }}
	</ul>
  </div>

  <h2>Ajude-nos a divulgar o nosso site!</h2>
  <ul id='share'>
    <li><a href='#' class='facebook'></a></li>
    <li>
    	<a href='#' class='twitter'></a>
    </li>
  </div>
  
 "
MyWindow().result_page = result_page
