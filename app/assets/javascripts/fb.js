FB.init({appId: "241454712643631", status: true, cookie: true});

$("a.facebook").live ('click', function(e) {
  e.preventDefault();
  
  var obj = {
    method: 'feed',
    link: 'http://www.emquemeuvoto.com.br/',
    picture: 'http://fbrell.com/f8.jpg',
    name: 'Facebook Dialogs',
    caption: 'Reference Documentation',
    description: 'Using Dialogs to interact with users.'
  };

  function callback(response) {
    document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
  }

  FB.ui(obj, callback);
});