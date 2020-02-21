<?php
class Shippingclass extends SearchBase {
	public $instance;
	var $page = 1;
	var $pagesize = 30;
	var $countRecords = true;
	var $limitRecords = true; 
	function __construct($check_status=true,$is_owner_call=false){
		$this->db = Syspage::getdb();
		parent::__construct('tbl_shippingclass', 'tp');
        $this->joinTable('tbl_shops', 'LEFT JOIN', 'tp.shippingclass_shop=ts.shop_id', 'ts');
		$this->joinTable('tbl_users', 'INNER JOIN', 'ts.shop_user_id=tu.user_id', 'tu');
		
		$this->addCondition('tu.user_status', '=', 1,'AND');
		$this->addCondition('tu.user_is_deleted', '=', 0,'AND');
		$this->addCondition('tp.ship_class_is_deleted', '=', 0,'AND');
		$this->addCondition('tu.user_email_verified', '=', 1,'AND');

		$criteria = array();
		/*if (!Settings::getSetting("CONF_ALLOW_USED_PRODUCTS_LISTING") && ($is_owner_call!=true)){
			$criteria['condition'] = "N";
		}
		if (Settings::getSetting("CONF_ENABLE_SELLER_SUBSCRIPTION") && ($is_owner_call!=true)){	
			$criteria['subscription'] = 1;
		}*/

		$this->criteria = $criteria;
    }

	public function setSortBy($sort_by){
		$this->sort_by = $sort_by;
	}
	
	public function selectFields($select_columns){
		$this->addMultipleFields((array)$select_columns);
	}
	
	function setCountRecords($countRecords=true) {
        return $this->countRecords=$countRecords;
    }
	
	function setLimitRecords($limitRecords=true) {
        return $this->limitRecords=$limitRecords;
    }
	
	function setPageSize($pagesize=30) {
        return $this->pagesize=$pagesize;
    }
	
	function setPageNumber($page=1) {
        return $this->page=$page;
    }
	
	function getInstance() {
        return $this;
    }
	
	function getShippingClassId() {
        return $this->id;
    }
	
	function getTotalPages(){
		return $this->total_pages;
	}
	
	function getTotalRecords(){
		return $this->total_records;
	}
	
	function getError() {
        return $this->error;
    }
	
	public function applyConditions($conditions=array()){
		$conditions = array_merge($conditions,(array)$this->criteria);
		foreach($conditions as $key=>$val) {
			if(strval($val)=='') continue;
            	switch($key) {
	            case 'id':
    	            $this->addCondition('tp.id', '=', intval($val));
        	    break;
				case 'state':
					if (!empty($val)){
						$this->addCondition('tp.ship_to_state_id', 'IN', (array)$val);
					}
					break;

				case 'name':
    	            $this->addCondition('tp.class_name', 'LIKE', '%'.$val.'%');
        	    break;		
				case 'shop':
                	$this->addCondition('tp.shippingclass_shop', '=', intval($val));
                break;
				case 'added_by':
					$this->addCondition('tp.shippingclass_added_by', '=',$val);
                break;
                case 'shippingclass_added_by':
                    $this->addCondition('tp.shippingclass_added_by', '=',$val);
                 break;
            }
        }
		
	}
	

	function getData($id,$criteria=array()) {
        $id = intval($id);
        if($id>0!=true) return array();
	       	$criteria['id'] = $id;
		$this->applyConditions($criteria);
        $this->doNotLimitRecords(true);
        $this->doNotCalculateRecords(true);
		//die($this->getquery());
        $rs = $this->getResultSet();
        return $this->db->fetch($rs);
	}

    function getAssociativeArray(){
        $srch = new SearchBase('tbl_shippingclass', 'c');
        $srch->addCondition('ship_class_is_deleted', '=',0);
        $srch->addMultipleFields(array('id', 'class_name'));
        $srch->addOrder('class_name', 'ASC');
        $rs = $srch->getResultSet();
        return $this->db->fetch_all_assoc($rs);
    }


	function getShippingclass($conditions=array()) {
		$this->applyConditions($conditions);
		if (!$this->countRecords)
		$this->doNotCalculateRecords();
		if (!$this->limitRecords)
		$this->doNotLimitRecords();
		$this->setPageNumber($this->page);
		$this->setPageSize($this->pagesize);
		if (!empty($conditions['sort'])){
			$this->setSortBy($conditions['sort']);
		}
		if (!empty($conditions['pagesize'])){
			$this->setPageSize($conditions['pagesize']);
		}
		//$this->addSortByOnRecords();
		//echo($this->getquery()."<br/><br/>");
		/*echo($this->getquery()."<br/><br/>");
		die();*/
		$rs = $this->getResultSet();
		$this->total_records = $this->recordCount();
		$this->total_pages = $this->pages();
		//$result=$this->db->fetch_all($rs);
		
		return $this->db->fetch_all($rs);
	}

	
	function getShippingclassCount($conditions=array()) {
		$this->addSpecialPrice();
		$this->joinWithDetailTable();
		$this->selectFields(array('class_name'));
		$this->applyConditions((array)$conditions);
		$rs = $this->getResultSet();
		return $this->recordCount();
	}

	function addUpdateShippingClass($data){
			$id = intval($data['shippingclass_id']);
			$record = new TableRecord('tbl_shippingclass');
			$assign_fields = array();
		//	$assign_fields['ship_to_state_id']          = $data['ship_to_state_id'];
			$assign_fields['shippingclass_shop']        = intval($data['shippingclass_shop']);
            $assign_fields['shippingclass_added_by']    = intval($data['shippingclass_added_by']);
            $assign_fields['class_name']                = $data['class_name'];
          /*  $assign_fields['ship_company']              = $data['ship_company'];
            $assign_fields['ship_duration']             = $data['ship_duration'];
            $assign_fields['ship_charge']               = $data['ship_charge'];
			$assign_fields['ship_additional_charge']    = $data['ship_additional_charge'];*/

			$record->assignValues($assign_fields);
			if($id === 0 && $record->addNew()){
				$this->id=$record->getId();
				//$this->id=$record->getShippingClassId();
			}elseif($id > 0 && $record->update(array('smt'=>'id=?', 'vals'=>array($id)))){
				$this->id=$id;
			}else{
				$this->error = $this->db->getError();
				return false;
			}
			
			$data["id"]=$this->getShippingClassId();
			$accept_keys = array(
							'id',
							'shippingclass_shop',
							'shippingclass_added_by',
							'class_name',
							);
			foreach($data as $key => $val){
				if(in_array($key, $accept_keys, true)){
					$fields[] = "$key = ".$this->db->quoteVariable($val)."";
					$info[$key]=$val;
			  }
			}


			if(!$this->db->deleteRecords('tbl_product_shipping_rates', array('smt' => 'pship_shipping_class_id = ?', 'vals' => array($this->getShippingClassId())))){
				$this->error = $this->db->getError();
				return false;
			}

				$record = new TableRecord('tbl_product_shipping_rates');
				$cnObj=new Countries();
	            $scObj=new Shippingcompany();
				$sdObj=new Shippingduration();

				foreach($data["product_shipping"] as $key=>$val) {
                    $country = $cnObj->getData($val["country_id"]);
                    $shipping_company = $scObj->getData($val["company_id"]);
                    $shipping_duration = $sdObj->getData($val["processing_time_id"]);
                    if (($country || $val["country_id"] == -1) && $shipping_company && $shipping_duration) {
                        //$info["pship_prod_id"]=$this->getProdId();

                        $info["pship_shipping_class_id"] = $this->getShippingClassId();
                        //$info["pship_id"] = (int)$val["pship_id"];
                        $info["pship_country"] = (int)$val["country_id"];
                        $info["pship_company"] = (int)$val["company_id"];
                        $info["pship_duration"] = (int)$val["processing_time_id"];
                        $info["pship_charges"] = (float)$val["cost"];
                        $info["pship_additional_charges"] = (float)$val["additional_cost"];
                        $record->assignValues($info);
                        $sqlquery = $record->getInsertQuery();
                        $sqlquery = str_replace("INSERT", "INSERT", $sqlquery);
                        if (!$this->db->query($sqlquery)) {
                            $this->error = $this->db->getError();
                            return false;
                        }
                    }
                }


		return $this->getShippingClassId();
			
	}

    function getShippingClassShippingRates($shipping_class_id,$criteria=array()){
        $shipping_class_id = intval($shipping_class_id);
        if($shipping_class_id>0!=true) return array();
        $srch = new SearchBase('tbl_product_shipping_rates', 'tpsr');
        //$srch->joinTable('tbl_prod_details', 'LEFT JOIN', 'tpsr.pship_prod_id=tpd.prod_id', 'tpd');
        $srch->joinTable('tbl_countries', 'LEFT JOIN', 'tpsr.pship_country=tc.country_id and tc.country_delete=0', 'tc');
        $srch->joinTable('tbl_shipping_companies', 'INNER JOIN', 'tpsr.pship_company=tsc.scompany_id and tsc.scompany_is_deleted=0', 'tsc');
        $srch->joinTable('tbl_shipping_durations', 'INNER JOIN', 'tpsr.pship_duration=tsd.sduration_id and tsd.sduration_is_deleted=0', 'tsd');
        $srch->addCondition('tpsr.pship_shipping_class_id', '=', intval($shipping_class_id));
        $srch->addOrder('(`pship_country` = -1),country_name');
        $srch->addMultipleFields(array('tpsr.*','tc.*','tsc.*','tsd.*'));

        foreach($criteria as $key=>$val) {
            switch($key) {
                case 'id':
                    $srch->addCondition('tpsr.pship_id', '=', intval($val));
                    break;
                case 'country':
                    $cnd=$srch->addCondition('tpsr.pship_country', '=', intval($val));
                    $cnd->attachCondition('tpsr.pship_country', '=','-1','OR');
                    break;
            }
        }
        //die($srch->getquery());
        $srch->doNotLimitRecords(true);
        $srch->doNotCalculateRecords(true);
        $rs = $srch->getResultSet();
        $row = $this->db->fetch_all($rs);
        if($row==false) return array();
        else return $row;
    }

	
	function getProductShippingRates($product_id,$criteria=array()){
		$product_id = intval($product_id);
        if($product_id>0!=true) return array();
		$srch = new SearchBase('tbl_product_shipping_rates', 'tpsr');
		$srch->joinTable('tbl_prod_details', 'LEFT JOIN', 'tpsr.pship_prod_id=tpd.prod_id', 'tpd');
		$srch->joinTable('tbl_countries', 'LEFT JOIN', 'tpsr.pship_country=tc.country_id and tc.country_delete=0', 'tc');
		$srch->joinTable('tbl_shipping_companies', 'INNER JOIN', 'tpsr.pship_company=tsc.scompany_id and tsc.scompany_is_deleted=0', 'tsc');
		$srch->joinTable('tbl_shipping_durations', 'INNER JOIN', 'tpsr.pship_duration=tsd.sduration_id and tsd.sduration_is_deleted=0', 'tsd');
		$srch->addCondition('tpsr.pship_prod_id', '=', intval($product_id));
		$srch->addOrder('(`pship_country` = -1),country_name');
		$srch->addMultipleFields(array('tpsr.*','tc.*','tsc.*','tsd.*','tpd.prod_ship_free'));
		
		foreach($criteria as $key=>$val) {
            switch($key) {
         	   case 'id':
            	    $srch->addCondition('tpsr.pship_id', '=', intval($val));
    	            break;
			   case 'country':
			   		$cnd=$srch->addCondition('tpsr.pship_country', '=', intval($val));
					$cnd->attachCondition('tpsr.pship_country', '=','-1','OR');
	                break;
            }
        }
		//die($srch->getquery());
        $srch->doNotLimitRecords(true);
        $srch->doNotCalculateRecords(true);
       	$rs = $srch->getResultSet();
        $row = $this->db->fetch_all($rs);
        if($row==false) return array();
        else return $row;
	}
	
	function getProductTags($product_id) {
		$srch = new SearchBase('tbl_product_to_tags', 'tprot');
		$srch->joinTable('tbl_product_tags', 'INNER JOIN', 'tprot.pt_tag_id=tpt.ptag_id', 'tpt');
		$srch->addCondition('pt_product_id', '=', intval($product_id));
		$srch->addOrder('ptag_name', 'asc');
		$rs = $srch->getResultSet();
		$product_tag_data = array();
       	while ($row=$this->db->fetch($rs)){
			$product_tag_data[] = $row['ptag_id'];
		}
		return $product_tag_data;
	}
	
	function getProductFilters($product_id) {
		$product_filter_data = array();
		$srch = new SearchBase('tbl_product_filter', 'tpf');
		$srch->joinTable('tbl_filters', 'INNER JOIN', 'tpf.filter_id=tf.filter_id', 'tf');
		$srch->addCondition('product_id', '=', intval($product_id));
		$srch->addOrder('filter_group', 'asc');
		$rs = $srch->getResultSet();
		$product_filter_data = array();
       	while ($row=$this->db->fetch($rs)){
			$product_filter_data[] = $row['filter_id'];
		}
		return $product_filter_data;
	}
	
	
	function getProductAttributes($product_id) {
		$product_attribute_data = array();
		$srch = new SearchBase('tbl_product_attributes', 'tpa');
		$srch->joinTable('tbl_attributes', 'INNER JOIN', 'tpa.attribute_id=ta.attribute_id', 'ta');
		$srch->addCondition('product_id', '=', intval($product_id));
		$srch->addOrder('attribute_group', 'asc');
		$rs = $srch->getResultSet();
		$product_attribute_data = array();
       	while ($row=$this->db->fetch($rs)){
			$product_attribute_data[] = array('id' => $row['attribute_id'],'text'=> $row['attribute_text']);
		}
		return $product_attribute_data;
	}
	
	function getProductDetailedAttributes($product_id) {
		$product_attribute_group_data = array();
		$srch = new SearchBase('tbl_product_attributes', 'tpa');
		$srch->joinTable('tbl_attributes', 'LEFT JOIN', 'tpa.attribute_id=ta.attribute_id', 'ta');
		$srch->joinTable('tbl_attribute_groups', 'LEFT JOIN', 'tag.attribute_group_id=ta.attribute_group', 'tag');
		$srch->addMultipleFields(array('tag.attribute_group_id, tag.attribute_group_name'));
		$srch->addCondition('tpa.product_id', '=', intval($product_id));
		$srch->addCondition('tag.attribute_group_is_deleted', '=',0);
		$srch->addCondition('ta.attribute_is_deleted', '=',0);
		$srch->addGroupBy('tag.attribute_group_id');
		$srch->addOrder('tag.attribute_group_display_order', 'asc');
		$srch->addOrder('tag.attribute_group_name', 'asc');
		$rsAttributeGroup = $srch->getResultSet();
		$product_attribute_group_data = array();
       	while ($product_attribute_group=$this->db->fetch($rsAttributeGroup)){
			$product_attribute_data = array();
			$srch = new SearchBase('tbl_product_attributes', 'tpa');
			$srch->joinTable('tbl_attributes', 'LEFT JOIN', 'tpa.attribute_id=ta.attribute_id', 'ta');
			$srch->addMultipleFields(array('ta.attribute_id, ta.attribute_name, tpa.attribute_text'));
			$srch->addCondition('tpa.product_id', '=', intval($product_id));
			$srch->addCondition('ta.attribute_group', '=',(int)$product_attribute_group['attribute_group_id']);
			$srch->addOrder('ta.attribute_display_order', 'asc');
			$srch->addOrder('ta.attribute_name', 'asc');
			$rsAttribute = $srch->getResultSet();
			$product_attribute_data = array();
			while ($product_attribute=$this->db->fetch($rsAttribute)){
				$product_attribute_data[] = array(
					'attribute_id' => $product_attribute['attribute_id'],
					'name'         => $product_attribute['attribute_name'],
					'text'         => $product_attribute['attribute_text']
				);
			}
			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['attribute_group_name'],
				'attribute'          => $product_attribute_data
			);
		}
		return $product_attribute_group_data;
	}
	
	function getProductRelated($product_id) {
		$related_products = array();
		$uObj= new User();
		$user_id = $uObj->getLoggedUserId();
		$this->joinWithPromotionsTable();
		$this->addSpecialPrice();
		$this->applyConditions(array("favorite"=>$user_id));
		$this->selectFields(array('tp.*','ts.shop_id','ts.shop_user_id','ts.shop_name','ts.shop_title','tu.user_id','tu.user_name','tu.user_username','tu.user_email','IF(prod_stock >0, "1", "0" ) as available'));
		$this->doNotCalculateRecords();
		$this->doNotLimitRecords();
		$srch_related_query = $this->getQuery();
		
		$srch = new parent('tbl_product_relations', 'tpr');
		$srch->joinTable('(' . $srch_related_query  . ')', 'INNER JOIN', 'tpr.relation_to_id = p.prod_id', 'p');
		$srch->addCondition('tpr.relation_source_id', '=', intval($product_id));
		//die($srch->getquery());
		$rs = $srch->getResultSet();
		$related_products=$this->db->fetch_all($rs);
		return $related_products;
	}
	
	function getProductDiscounts($product_id,$criteria=array()) {
		$current_date = date('Y-m-d');
		$srch = new SearchBase('tbl_product_discounts', 'tpd');
		$srch->addCondition('tpd.pdiscount_product_id', '=', intval($product_id));
		foreach($criteria as $key=>$val) {
            switch($key) {
         	   case 'id':
            	    $srch->addCondition('tpd.pdiscount_id', '=', intval($val));
    	            break;
			   case 'date':
			   		$cnd=$srch->addDirectCondition('((pdiscount_start_date = \'0000-00-00\' OR pdiscount_start_date <= "'.$current_date.'") AND (pdiscount_end_date = \'0000-00-00\' OR pdiscount_end_date >= "'.$current_date.'"))');
	                break;
			   case 'qty':
            	    $srch->addCondition('tpd.pdiscount_qty', '<=', intval($val));
    	            break;	
            }
        }
		$srch->addOrder('tpd.pdiscount_priority', 'asc');
        $srch->doNotLimitRecords(true);
        $srch->doNotCalculateRecords(true);
        $rs = $srch->getResultSet();
        $row = $this->db->fetch_all($rs);
		return $row;
	}
	
	function getProductOptions($product_id) {
		$product_option_data = array();
		$srch = new SearchBase('tbl_product_option', 'po');
		$srch->joinTable('tbl_options', 'INNER JOIN', 'po.option_id=o.option_id', 'o');
		$srch->addCondition('po.product_id', '=', intval($product_id));
		$srch->addCondition('o.option_is_deleted', '=',0);
		$srch->addOrder('o.option_display_order', 'asc');
		$rsOptGroup = $srch->getResultSet();
		$product_option_data = array();
       	while ($product_option=$this->db->fetch($rsOptGroup)){	
			$product_option_value_data = array();
			$srchOpt = new SearchBase('tbl_product_option_value', 'tpov');
			$srchOpt->joinTable('tbl_option_values', 'INNER JOIN', 'tpov.option_value_id=tov.option_value_id', 'tov');
			$srchOpt->addCondition('product_option_id', '=', (int)$product_option['product_option_id']);
			$srchOpt->addOrder('tov.option_value_display_order', 'ASC');
			$srchOpt->addOrder('tov.option_value_name', 'ASC');
			$rsOpt = $srchOpt->getResultSet();
			$product_option_value_data = array();
    	   	while ($product_option_value=$this->db->fetch($rsOpt)){	
		
				$product_option_value_data[] = array(
					'product_option_value_id' => $product_option_value['product_option_value_id'],
					'option_value_id'         => $product_option_value['option_value_id'],
					'name'                    => $product_option_value['option_value_name'],
					'quantity'                => $product_option_value['quantity'],
					'subtract'                => $product_option_value['subtract'],
					'price'                   => $product_option_value['price'],
					'price_prefix'            => $product_option_value['price_prefix'],
					'weight'                  => $product_option_value['weight'],
					'weight_prefix'           => $product_option_value['weight_prefix']
				);
			}
			$product_option_data[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['option_name'],
				'type'                 => $product_option['option_type'],
				'value'                => $product_option['value'],
				'required'             => $product_option['required']
			);
		}
		return $product_option_data;
	}
	
	function deleteProduct($prod_id){
		$prod_id = intval($prod_id);
		if($prod_id < 1){
			$this->error = Utilities::getLabel('M_INVALID_REQUEST');
			return false;
		}
		if($this->db->update_from_array('tbl_products', array('prod_is_deleted' => 1), array('smt'=>'`prod_id`=?', 'vals'=>array($prod_id)))){	
			$this->db->deleteRecords('tbl_url_alias', array('smt'=>'url_alias_query=? ', 'vals'=>array('products_id='.$prod_id)));
			return true;
		}
		$this->error = $this->db->getError();
		return false;
	}

    function deleteShippingClass($id){
        $id = intval($id);
        if($id < 1){
            $this->error = Utilities::getLabel('M_INVALID_REQUEST');
            return false;
        }
        if($this->db->update_from_array('tbl_shippingclass', array('ship_class_is_deleted' => 1), array('smt'=>'`id`=?', 'vals'=>array($id)))){
            return true;
        }
        $this->error = $this->db->getError();
        return false;
    }
	
}