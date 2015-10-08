$(document).ready(function() {
	$(".icpf").mask("999.999.999-99");
	$(".icnpj").mask("99.999.999/9999-99");
	$(".icep").mask("99999-999");
	$(".idatebirth").mask("99-99-9999");
	$('.imoney').mask('000.000.000.000.000,00', {reverse: true});


	var masks = ['00000-0000', '0000-00009'],
		maskBehavior = function(val, e, field, options) {
			return val.length > 9 ? masks[0] : masks[1];
		};

});
