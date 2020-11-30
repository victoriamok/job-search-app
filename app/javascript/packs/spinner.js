function loadSpinner() {
	var submit = document.getElementById('search');
  	submit.hidden = true;
  	var div = document.getElementById('button');
	var button = '<button class="btn btn-primary" type="button" disabled>\n\
	<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>\n\
	Request is being processed and results will be available shortly\n\
	</button>';
	div.innerHTML += button;
}
window.onload = function() {
	document.getElementById('search').onclick = loadSpinner;
}