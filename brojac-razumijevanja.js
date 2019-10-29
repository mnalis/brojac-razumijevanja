// Matija Nalis <mnalis-git@voyager.hr> started 20191029 under GPLv3+
// on https://github.com/mnalis/brojac-razumijevanja

function initHandlers() {
        // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode
        'use strict';
	//console.log ("start initHandlers");

        // svaka izmjena podataka neka radi novi izracun
        document.getElementById('smileyhappy').onclick		= function(){return incrementCounter('count_happys')}; 
        document.getElementById('smileyneutral').onclick	= function(){return incrementCounter('count_neutral')};
        document.getElementById('smileysad').onclick		= function(){return incrementCounter('count_sad')};

	// initialize counters to 0
        document.getElementById('count_total').innerHTML	= '0';
        document.getElementById('count_happy').innerHTML	= '0';
        document.getElementById('count_neutral').innerHTML	= '0';
        document.getElementById('count_sad').innerHTML		= '0';

	//console.log ("end initHandlers");
	return true;
}

function incrementCounter(id) {
        'use strict';
	console.log(id);
	alert('increment!');
	return false;   // important: so submit button does nothing
}

initHandlers();
