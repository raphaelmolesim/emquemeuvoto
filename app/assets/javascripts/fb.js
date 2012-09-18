FB.init({appId: "241454712643631", status: true, cookie: true});

$("a.facebook").live ('click', function(e) {
  e.preventDefault();

  var obj = {
    method: 'feed',
    link: 'http://www.emquemeuvoto.com.br/',
    picture: 'http://www.emquemeuvoto.com.br/assets/logo.jpg',
    name: 'Em Quem Eu Voto?',
    caption: 'Podemos te ajudar a escolher um candidato para esta próxima eleição municipal!',
    description: 'Você já decidiu em quem vai votar nesta eleição municipal? Ainda não? Que tal conhecer um pouco mais sobre as propostas dos candidados? Nós podemos recomendar um candidato baseado nas propostas que você concorda ou discorda! Venha conhecer um pouco mais!'
  };

  function callback(response) { }

  FB.ui(obj, callback);
});


$("#share-candidate").live('click', function(e) {
  e.preventDefault();

  var id = $("ul#leaders li:first").attr("id");
  var photo = "http://www.emquemeuvoto.com.br/assets/" + id + ".jpg";
  var ranking = new Ranking();
  var article_and_name = null;
  if (id == "soninha")
    article_and_name = 'a ' + ranking.get_name(id);
  else
    article_and_name = 'o ' + ranking.get_name(id);

  var obj = {
    method: 'feed',
    link: 'http://www.emquemeuvoto.com.br/',
    picture: photo,
    name: 'Em Quem Eu Voto?',
    caption: 'Meu candidato é ' + article_and_name + '!',
    description: 'Você já decidiu em quem vai votar nesta eleição municipal? Ainda não? Que tal conhecer um pouco mais sobre as propostas dos candidados? Nós podemos recomendar um candidato baseado nas propostas que você concorda ou discorda! Venha conhecer um pouco mais!'
  };

  function callback(response) { }

  FB.ui(obj, callback);

});

$(".toggle-modal").live('click', function(e) {
  e.preventDefault();
  $("#share-modal").modal('toggle');
});
