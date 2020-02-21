<?php
class AngularController extends CommonController{
	
	function angularJsWebService(){
		header("Access-Control-Request-Method: *");
		header("Access-Control-Request-Headers: *");
		header("Access-Control-Allow-Origin: *");
		$pObj= new Products();
		$pObj->joinWithBrandsTable();
		$pObj->setPageSize(10);
		$pObj->setPageNumber(1);
		$pObj->selectFields(array('tp.prod_id','tp.prod_name','tp.prod_sale_price','tpb.brand_name','tp.prod_sku'));
		$products = $pObj->getProducts($criteria);
		echo json_encode($products);
	}
	
	function getShops(){
		header("Access-Control-Request-Method: *");
		header("Access-Control-Request-Headers: *");
		header("Access-Control-Allow-Origin: *");
		$sObj= new Shops();
		$arr = $sObj->getShopsByCriteria(array(),10);
		foreach($arr as $key=>$val){
			$product= new Products();
			$product->joinWithPromotionsTable();
			$product->selectFields(array('tp.*','ts.shop_id','ts.shop_user_id','ts.shop_name','ts.shop_title','tu.user_id','tu.user_name','tu.user_username','tu.user_email','IF(prod_stock >0, "1", "0" ) as available'));
			$product->setPagesize(4);
			$shop_products=$product->getProducts(array("shop"=>$val["shop_id"]));
			$arr_shop_prods=array("products"=>$shop_products);
			$arr_shops_items[]=array_merge($val,$arr_shop_prods);
		}
		echo json_encode($arr_shops_items);
	}
	
	function getProducts($name){
		header("Access-Control-Request-Method: *");
		header("Access-Control-Request-Headers: *");
		header("Access-Control-Allow-Origin: *");
		$pObj= new Products();
		$pObj->joinWithBrandsTable();
		$pObj->setPageSize(10);
		$pObj->setPageNumber(1);
		$pObj->selectFields(array('tp.prod_id','tp.prod_name','tp.prod_sale_price','tpb.brand_name','tp.prod_sku'));
		$products = $pObj->getProducts($criteria);
		echo json_encode($products);
	}
	
	function getProductsByName($name){
		header("Access-Control-Request-Method: *");
		header("Access-Control-Request-Headers: *");
		header("Access-Control-Allow-Origin: *");
		$pObj= new Products();
		$pObj->joinWithBrandsTable();
		$pObj->setPageSize(10);
		$pObj->setPageNumber(1);
		$pObj->selectFields(array('tp.prod_id','tp.prod_name','tp.prod_sale_price','tpb.brand_name','tp.prod_sku'));
		$products = $pObj->getProducts(array('name'=>$name));
		echo json_encode($products);
	}
	
	function getProduct($id){
		header("Access-Control-Request-Method: *");
		header("Access-Control-Request-Headers: *");
		header("Access-Control-Allow-Origin: *");
		$pObj= new Products();
		$pObj->joinWithBrandsTable();
		$pObj->selectFields(array('tp.prod_id','tp.prod_name','tp.prod_sale_price','tpb.brand_name','tp.prod_sku'));
		$product = $pObj->getData($id);
		echo json_encode($product);
	}
}
