<?php

class Cities extends Model {

    function __construct() {
        $this->db = Syspage::getdb();
    }

    function getCityId() {
        return $this->city_id;
    }

    function getTotalPages() {
        return $this->total_pages;
    }

    function getTotalRecords() {
        return $this->total_records;
    }

    function getError() {
        return $this->error;
    }

    function getAssociativeArray($state_id = 0) {
        $srch = new SearchBase('tbl_cities', 'ci');
        $srch->addCondition('city_delete', '=', 0);
        if ($state_id > 0)
            $srch->addCondition('state_id', '=', $state_id);
        $srch->addMultipleFields(array('city_id', 'city_name'));
        $srch->addOrder('city_name', 'ASC');
        $rs = $srch->getResultSet();
        return $this->db->fetch_all_assoc($rs);
    }

    function getCitiesAssoc($state_id = 0) {
        $state_id = intval($state_id);
        if ($state_id < 1)
            return array();
        $srch = new SearchBase('tbl_cities', 'ci');
        $srch->addCondition('city_delete', '=', 0);
        $srch->addCondition('state_id', '=', $state_id);
        $srch->addMultipleFields(array('city_id', 'city_name'));
        $srch->addOrder('city_name', 'ASC');
        $rs = $srch->getResultSet();
        return $this->db->fetch_all_assoc($rs);
    }

    function search($criteria, $count = '') {
        $srch = new SearchBase('tbl_cities', 'tci');
        $srch->joinTable('tbl_states', 'INNER JOIN', 'tci.state_id=tst.state_id and state_delete=0', 'tst');
        $srch->addCondition('tci.city_delete', '=', 0);
        if ($count == true) {
            $srch->addFld('COUNT(tci.city_id) AS total_rows');
        } else {
            $srch->addMultipleFields(array('tci.*', 'tst.state_name'));
        }
        foreach ($criteria as $key => $val) {
            switch ($key) {
                case 'id':
                    $srch->addCondition('tci.city_id', '=', intval($val));
                    break;
                case 'name':
                    $srch->addCondition('tci.city_name', '=', ($val));
                    break;
                case 'state':
                    if ($val > 0) {
                        $srch->addCondition('tci.state_id', '=', intval($val));
                    }
                    break;
                case 'keyword':
                    $srch->addCondition('tci.city_name', 'like', '%' . $val . '%');
                    break;
                case 'pagesize':
                    $srch->setPageSize($val);
                    break;
                case 'page':
                    $srch->setPageNumber($val);
                    break;
                case 'limit':
                    $srch->setPageSize($val);
                    break;
            }
        }
        return $srch;
    }

    function getData($id) {
        $id = intval($id);
        if ($id > 0 != true)
            return array();
        $add_criteria['id'] = $id;
        $srch = self::search($add_criteria);
        $srch->doNotLimitRecords(true);
        $srch->doNotCalculateRecords(true);
        $rs = $srch->getResultSet();
        $row = $this->db->fetch($rs);
        if ($row == false)
            return array();
        else
            return $row;
    }

    function getCities($criteria) {
        foreach ($criteria as $key => $val) {
            if (strval($val) == '')
                continue;
            $add_criteria[$key] = $val;
        }
        $srch = self::search($add_criteria);
        $srch->addOrder('tst.state_name', 'asc');
        $srch->addOrder('tci.city_name', 'asc');
        $rs = $srch->getResultSet();
        $this->total_records = $srch->recordCount();
        $this->total_pages = $srch->pages();
        if ($this->total_records < 1) {
            return false;
        }
        $row = $this->db->fetch_all($rs);
        if ($row == false)
            return array();
        else
            return $row;
    }

    function addUpdate($data) {
        $city_id = intval($data['city_id']);
        $record = new TableRecord('tbl_cities');
        $assign_fields = array();
        $assign_fields['state_id'] = intval($data['state_id']);
        $assign_fields['city_name'] = $data['city_name'];
        $record->assignValues($assign_fields);
        if ($city_id === 0 && $record->addNew()) {
            $this->city_id = $record->getId();
        } elseif ($city_id > 0 && $record->update(array('smt' => 'city_id=?', 'vals' => array($city_id)))) {
            $this->city_id = $city_id;
        } else {
            $this->error = $this->db->getError();
            return false;
        }
        return $this->city_id;
    }

    function delete($city_id) {
        $city_id = intval($city_id);
        if ($city_id < 1) {
            $this->error = Utilities::getLabel('M_INVALID_REQUEST');
            return false;
        }
        if ($this->db->update_from_array('tbl_cities', array('city_delete' => 1), array('smt' => 'city_id = ?', 'vals' => array($city_id)))) {
            return true;
        }
        $this->error = $this->db->getError();
        return false;
    }

    function getCityByName($name) {
        if ($name == "")
            return array();
        $add_criteria['name'] = $name;
        $srch = self::search($add_criteria);
        $srch->doNotLimitRecords(true);
        $srch->doNotCalculateRecords(true);
        $rs = $srch->getResultSet();
        $row = $this->db->fetch($rs);
        if ($row == false)
            return array();
        else
            return $row;
    }

}
