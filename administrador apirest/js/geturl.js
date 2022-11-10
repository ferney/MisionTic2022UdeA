function getUrlVal() {
	var val = [], hash;
	var dir = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	for (var i = 0; i < dir.length; i++) {
		hash = dir[i].split('=');
		val.push(hash[0]);
		val[hash[0]] = hash[1];
	}
	return val;
}