$("a.twitter").live('click', function(e) {
	host_path = encodeURIComponent(window.location.href);
	text = "Podemos te ajudar a escolher um candidato para esta próxima eleição municipal! http://bit.ly/NwAEFU #EmQuemEuVoto";

	params = "original_referer=" + host_path;
	params += "&url=" + host_path;
	params += "&text=" + encodeURIComponent(text);

	twitter_url = "https://twitter.com/intent/tweet?" + params;

	$(this).attr("href", twitter_url);
	$(this).attr("target", "_blank");
});