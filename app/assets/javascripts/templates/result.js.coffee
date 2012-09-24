result_page = "
  <div id='result-page' class='hero-unit'>
    <h1>O prefeito que mais concorda com as suas ideias é ... </h1>

    <ul id='leaders' class='{{ size }}'>
  		{{ #leaders }}
  		<li id='{{class}}'>{{ name }}</li>
  		{{ /leaders }}
	 </ul>

   {{&link}}

   <div id='explanation'></div>

  </div>

  <h2>Ajude-nos a divulgar o nosso site!</h2>
  <ul id='share'>
    <li><a href='#' class='facebook'></a></li>
    <li>
    	<a href='#' class='twitter'></a>
    </li>
  </ul>


  <div id='share-modal' class='modal hide fade'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
    <h3>Compartilhar seu candidato ...</h3>
  </div>
  <div class='modal-body'>
    <ul id='leaders' class='{{ size }}'>
      {{ #leaders }}
      <li id='{{class}}'>{{ name }}</li>
      {{ /leaders }}
   </ul>
  </div>
  <div class='modal-footer'>
    <a href='#'' class='btn' data-dismiss='modal'>Cancelar</a>
    <button id='share-candidate' class='btn btn-primary'>Compartilhar</button>
  </div>
</div>
  
 "
MyWindow().result_page = result_page
