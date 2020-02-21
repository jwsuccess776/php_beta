function searchCities(frm) {
    var data = getFrmData(frm);
    showHtmlElementLoading($('#cities-list'));
    callAjax(generateUrl('cities', 'listCities'), data, function (t) {
        $('#cities-list').html(t);
    });
}
function listPages(p) {
    var frm = document.paginateForm;
    frm.page.value = p;
    searchCities(frm);
}
$(document).ready(function () {
    searchCities(document.frmCitySearch);
});

function clearSearch() {
    document.frmCitySearch.reset();
    $("#frmCitySearch input[type=hidden]").val("");
    searchStates(document.frmCitySearch);
}
function ConfirmDelete(id, el) {
    confirmBox("Are you sure you want to delete", function () {
        callAjax(generateUrl('cities', 'delete'), 'id=' + id, function (t) {
            var ans = parseJsonData(t);
            if (ans === false) {
                ShowJsSystemMessage('Oops! There is some Error', true, true)
                return false;
            }
            ShowJsSystemMessage(ans.msg)
            if (ans.status == 0) {
                return false;
            }
            searchCities(document.frmCitySearch);
        });
    });
    return false;

}
