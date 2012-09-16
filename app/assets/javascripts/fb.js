FB.init({appId: "241454712643631", status: true, cookie: true});

$("a.facebook").live ('click', function(e) {
  e.preventDefault();

  var obj = {
    method: 'feed',
    link: 'http://www.emquemeuvoto.com.br/',
    picture: 'http://www.emquemeuvoto.com.br/assets/logo.jpg',
    name: 'Em Quem Eu Voto?',
    caption: 'Podemos te ajudar a escolher um candidato para esta próxima eleição municipal!',
    description: 'Você já decidiu em quem vai votar nesta eleição municipal? Ainda não? Que tal conhecer um pouco mais sobre as propóstas dos candidados? Nós podemos recomendar um cadidato baseado nas propóstas que você concorda ou discorda! Venha conhecer um pouco mais!'
  };

  function callback(response) {
    //document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
  }

  FB.ui(obj, callback);
});