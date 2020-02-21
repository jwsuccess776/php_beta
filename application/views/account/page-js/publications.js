function listPages(p){
	$('input[name=page]').val(p);
	var keyword = $('input[name=keyword]').val();

	loadPage(p, keyword);
}

$(document).ready(function() {	
	loadPage(1, '');

	$('input[name=page]').val(1);
	$('input[name=keyword]').val('');

	$('form').submit(function(event) {
		var keyword = $('input[name=keyword]').val();
		var page = 1;
		$('input[name=page]').val(page);

		loadPage(page, keyword);
		
		event.preventDefault();
	});
});

function loadPage(page, keyword)
{
	var data = 'page=' + page + '&keyword=' + encodeURIComponent(keyword);

	$('#loader').remove();
	showCssElementLoading($("div.tbl-listing"), 1);
	callAjax(generateUrl('account', 'ajax_product_list'), data, function(t){
		$('#loader').remove();		

		var ret = t.split('&&');		
		$("div.left-txt").html(ret[0]);
		$("div.tbl-listing").html(ret[1]);
	});
}


