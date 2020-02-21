<?php
class CmsController extends CommonController{
	function view($id,$start_letter=""){
		
		$this->set('page_id', $id);
		$letters=array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
		$this->set('letters', $letters);
		$this->set('start_letter', $start_letter);
		
		/*$navObj=new Navigation();
		$this->set('pages', $navObj->getNavigationPages(2));
		$categories=Categories::getCategoriesAssocArrayFront(0,1);
		$this->set('categories', $categories);
		*/
		
	$this->Shops=new Shops();
	$page = 1;
			 
	$pagesize = 40;
	$arr=$this->Shops->getShopsByCriteria(array("status"=>1,"page"=>$page,"pagesize"=>$pagesize,"start"=>$start_letter));
	$this->set('shops', $arr);
	$this->set('pages', $this->Shops->getTotalPages());
	$this->set('page', $page);
	$this->set('start_record', ($page-1)*$pagesize + 1);
	$end_record = $page * $pagesize;
	$total_records = $this->Shops->getTotalRecords();
	if ($total_records < $end_record) $end_record = $total_records;
	$this->set('end_record', $end_record);
	$this->set('total_records', $total_records);
	$this->set('letter', $start_letter);
	
	
		
		$hide_header_footer=Utilities::isHideHeaderFooter();
		$cmsPage = $this->Cms->getData($id);
		if (!$cmsPage && !$hide_header_footer)
			Utilities::show404();
		$this->set('row', $cmsPage);
		if($hide_header_footer){
			$this->set('hide_header_footer',$hide_header_footer);		
			$this->_template->render(false,false);	
		}else{
			$this->_template->render();	
		}
	}
}
