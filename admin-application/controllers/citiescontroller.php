<?php

class CitiesController extends BackendController {

    private $admin;
    private $admin_id = 0;

    function __construct($model, $controller, $action) {
        parent::__construct($model, $controller, $action);
        $admin_id = Admin::getLoggedId();
        $this->canview = Admin::getAdminAccess($admin_id, CITIES);
        $this->set('canview', $this->canview);
        $this->b_crumb = new Breadcrumb();
        $this->b_crumb->add("Cities Management", Utilities::generateUrl("cities"));
    }

    protected function getSearchForm() {
        $cnObj = new States();
        $frm = new Form('frmCitySearch', 'frmCitySearch');
        $frm->setFieldsPerRow(3);
        $frm->setExtra('class="web_form last_td_nowrap"');
        $frm->setMethod('GET');
        $frm->captionInSameCell(true);
        $frm->setRequiredStarWith('not-required');
        $frm->addHiddenField('', 'mode', "search");
        $frm->addTextBox('Keyword', 'keyword', '', '', ' class="small"');
        $frm->addSelectBox('State', 'state', $cnObj->getNewAsscociativeArray(), '', 'class="small"');
        $fld1 = $frm->addButton('', 'btn_cancel', 'Clear Search', '', '  onclick="clearSearch()"');
        $fld = $frm->addSubmitButton('', 'btn_submit', 'Search', 'btn_submit')->attachField($fld1);
        $frm->setTableProperties('width="100%" border="0" cellspacing="0" cellpadding="0" class="table_form_vertical"');
        $frm->addHiddenField('', 'page', 1);
        $frm->setOnSubmit('searchCities(this); return false;');
        return $frm;
    }

    function default_action() {
        if ($this->canview != true) {
            $this->notAuthorized();
        }
        $frm = $this->getSearchForm();
        $frm->fill(getQueryStringData());
        $this->set('frmPost', $frm);
        $this->set('breadcrumb', $this->b_crumb->output());
        $this->_template->render();
    }

    function listCities($page = 1) {
        if ($this->canview != true) {
            $this->notAuthorized();
        }
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btn_submit'])) {
            $stObj = new Cities();
            $post = Syspage::getPostedVar();
            $page = 1;
            if (isset($post['page']) && intval($post['page']) > 0) {
                $page = intval($post['page']);
            } else {
                $post['page'] = $page;
            }
            if (!empty($post)) {
                $this->set('srch', $post);
            }
            $pagesize = Settings::getSetting("CONF_DEF_ITEMS_PER_PAGE_ADMIN");
            $post['pagesize'] = $pagesize;
            $this->set('records', $stObj->getCities($post));
            $this->set('pages', $stObj->getTotalPages());
            $this->set('page', $page);
            $this->set('start_record', ($page - 1) * $pagesize + 1);
            $end_record = $page * $pagesize;
            $total_records = $stObj->getTotalRecords();

            if ($total_records < $end_record)
                $end_record = $total_records;
            $this->set('end_record', $end_record);
            $this->set('total_records', $total_records);
            $this->_template->render(false, false);
        }
    }

    function form($city_id) {
        if ($this->canview != true) {
            $this->notAuthorized();
        }
        $this->b_crumb->add("City Setup", Utilities::generateUrl("cities"));
        $this->set('breadcrumb', $this->b_crumb->output());

        $stObj = new Cities();
        $city_id = intval($city_id);
        $frm = $this->getForm();

        if ($city_id > 0) {
            $data = $stObj->getData($city_id);
            $frm->fill($data);
        }
        $post = Syspage::getPostedVar();
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (!$frm->validate($post)) {
                Message::addErrorMessage($frm->getValidationErrors());
            } else {
                if ($post['city_id'] != $city_id) {
                    Message::addErrorMessage('Error: Invalid Request!!');
                    Utilities::redirectUser(Utilities::generateUrl('cities'));
                } else {
                    $state = $stObj->getCityByName($post['city_name']);
                    if (($state == true) && ($state["city_id"] != $post["city_id"]) && ($state["state_id"] == $post["state_id"])) {
                        Message::addErrorMessage('City with this name already exists in selected state');
                    } else {
                        if ($stObj->addUpdate($post)) {
                            Message::addMessage('Success: City details added/updated successfully.');
                            Utilities::redirectUser(Utilities::generateUrl('cities'));
                        } else {
                            Message::addErrorMessage($stObj->getError());
                        }
                    }
                }
            }
            $frm->fill($post);
        }

        $this->set('frm', $frm);
        $this->_template->render(true, true);
    }

    protected function getForm() {
        $cnObj = new States();
        $frm = new Form('frmCities');
        $frm->setExtra(' validator="CitiesfrmValidator" class="web_form"');
        $frm->setValidatorJsObjectName('CitiesfrmValidator');
        $frm->addHiddenField('', 'city_id');
        $frm->addSelectBox('State', 'state_id', $cnObj->getNewAsscociativeArray(), '', 'class="medium"')->requirements()->setRequired();
        $frm->addRequiredField('Name', 'city_name', '', '', ' class="medium"');
        $frm->addSubmitButton('&nbsp;', 'btn_submit', 'Save changes');
        $frm->setJsErrorDisplay('afterfield');
        $frm->setTableProperties('width="100%" border="0" cellspacing="0" cellpadding="0" class="table_form_horizontal"');
        $frm->setLeftColumnProperties('width="20%"');
        return $frm;
    }

    function delete() {
        if ($this->canview != true) {
            dieJsonError("Unauthorized Access");
        }
        $post = Syspage::getPostedVar();
        $stObj = new Cities();
        $city_id = intval($post['id']);
        $city = $stObj->getData($city_id);
        if ($city == false) {
            Message::addErrorMessage('Error: Please perform this action on valid record.');
            dieJsonError(Message::getHtml());
        }
        if ($stObj->delete($city_id)) {
            Message::addMessage('Success: Record has been deleted.');
            dieJsonSuccess(Message::getHtml());
        } else {
            Message::addErrorMessage($stObj->getError());
            dieJsonError(Message::getHtml());
        }
    }

}
