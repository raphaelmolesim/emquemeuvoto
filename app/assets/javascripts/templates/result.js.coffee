result_page = "
  <div class='hero-unit'>
    <h1>O prefeito que mais concorda com as suas ideias é ... </h1>

    <ul id='leaders' class='{{ size }}'>
  		{{ #leaders }}
  		<li id='{{class}}'>{{ name }}</li>
  		{{ /leaders }}
	</ul>
  </div>

  <div id='share'>
    
  </div>
  
 "
MyWindow().result_page = result_page
