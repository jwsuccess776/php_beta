function searchCancellationRequests(frm){
	var data = getFrmData(frm);
	showHtmlElementLoading($('#cancellation-requests-list')); 
	callAjax(generateUrl('users', 'listCancellationRequests'), data, function(t){
		$('#cancellation-requests-list').html(t);
	});
}
function listPages(p){
	var frm = document.paginateForm;
	frm.page.value = p;
	searchCancellationRequests(frm);
}
$(document).ready(function(){
		searchCancellationRequests(document.frmCancellationRequests);
});
  
function clearSearch() {
	document.frmCancellationRequests.reset();
	$("#frmCancellationRequests input[type=hidden]").val("");
	searchCancellationRequests(document.frmCancellationRequests);
}
function UpdateRequestStatus(id, el, mod) {
	callAjax(generateUrl('users', 'update_user_cancellation_request_status'), 'id=' + id+'&mod=' + mod, function(t){
		var ans = parseJsonData(t);
		if (ans === false){
			ShowJsSystemMessage('Oops! There is some Error',true,true)
			return false;
		}
		ShowJsSystemMessage(ans.msg)
		if(ans.status == 0) {
			return false;
		}
		$(el).closest("td").remove()
	});
}

function ToggleForm(id)
{
	var el=document.getElementById(id);
	if(el.style.display=="none")
		el.style.display = "block";
	else
		el.style.display = "none";
}

function UpdateSellerRequestStatus(id, el, mod, commission_cancel_reason) {
	var commission_cancel_reaason_el = document.getElementById(commission_cancel_reason);
	callAjax(generateUrl('users', 'update_seller_cancellation_request_status'), 'id=' + id+'&mod=' + mod + '&commission_cancel_reaason=' + commission_cancel_reaason_el.value, function(t){
		var ans = parseJsonData(t);
		if (ans === false){
			ShowJsSystemMessage('Oops! There is some Error',true,true)
			return false;
		}
		ShowJsSystemMessage(ans.msg)
		if(ans.status == 0) {
			return false;
		}
		$(el).closest("td").remove()
	});
	
}
