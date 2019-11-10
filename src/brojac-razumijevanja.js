// Matija Nalis <mnalis-git@voyager.hr> started 20191029 under GPLv3+
// on https://github.com/mnalis/brojac-razumijevanja

function initHandlers() {
	// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode
	'use strict';
	//console.log ("start initHandlers");

	// svaki click neka updatea countere
	document.getElementById('smileyhappy').onclick		= function() { return incrementCounter('count_happy'); };
	document.getElementById('smileyneutral').onclick	= function() { return incrementCounter('count_neutral'); };
	document.getElementById('smileysad').onclick		= function() { return incrementCounter('count_sad'); };

	// skrivanje countera
	document.getElementById('sakrij').onchange		= hideCounters;

	// initialize counters to 0
	document.getElementById('count_total').innerHTML	= '0';
	document.getElementById('count_happy').innerHTML	= '0';
	document.getElementById('count_neutral').innerHTML	= '0';
	document.getElementById('count_sad').innerHTML		= '0';

	//console.log ("end initHandlers");
	return true;
}

function hideCounters() {
	'use strict';
	var display;
	if (this.checked) {
		display = 'none';
	} else {
		display = 'table-cell';
	}

	document.getElementById('count_happy').style.display = display;
	document.getElementById('count_neutral').style.display = display;
	document.getElementById('count_sad').style.display = display;
}

function incrementCounter(id) {
	'use strict';
	//console.log(id);

	var count_id = +document.getElementById(id).innerHTML;		// convert string to number
	document.getElementById(id).innerHTML = count_id + 1;

	var count_total = +document.getElementById('count_total').innerHTML;
	document.getElementById('count_total').innerHTML = count_total + 1;

	return false;							// important: so submit button does nothing
}

initHandlers();
