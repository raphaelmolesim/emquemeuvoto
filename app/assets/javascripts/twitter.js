$("a.twitter").live('click', function(e) {
	e.preventDefault();

	host_path = encodeURIComponent(window.location.href);
	text = "Podemos te ajudar a escolher um candidato para esta próxima eleição municipal! http://bit.ly/NwAEFU #EmQuemEuVoto";

	params = "original_referer=" + host_path;
	params += "&url=" + host_path;
	params += "&text=" + encodeURIComponent(text);

	twitter_url = "https://twitter.com/intent/tweet?" + params;

	window.location = twitter_url;
});