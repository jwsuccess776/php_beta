<?php
class DataController extends CommonController{
function signups(){
$cnt=rand(1,1000);
$inc=500;
$uObj=new User();
$arr_usernames=array("justin","peter","aleena","melvin","joshina","joseph","alisha","martina","johnson","george","aspen","amya","zahara","maya","kiara","austin","anya","brayden","carlson","noel","hannah","marriah","alexa","alex","rob","ron","tony","devon","mark","gary","anna","aabir","kabir","aabhas","aadesh","abha","adhya","aadanya","jenny","fred","aaron","abner","abraham","adom","addison","andrew","baron","barret","benedict");
for($j=$cnt*$inc+1; $j<$cnt*$inc+$inc+1; $j++){
$random = array_rand($arr_usernames, 1);
$arr=array(
"user_username"=>$arr_usernames[$random].$j,
"user_email"=>$arr_usernames[$random].$j."@dummyid.com",
"user_password"=>"welcome",
"user_name"=>ucfirst($arr_usernames[$random]),
);
if(!$uObj->addUser($arr)){
Message::addErrorMessage($uObj->getError());
}
}
echo Message::getHtml();
}
function shops(){
$uObj=new User();
$sObj=new Shops();
$shop_names="UniversalWorks,AtsukoKudo,RigbyPeller,JuiceBar,WhistleBlower,PersephoneBooks,LaCoqueta,Floris,ThehackneyShop";
$arr_shop_names=explode(",",$shop_names);
$shop_names=array("SquareShop","PosteMistress","DesignMuseum","DavidSaxby","Bowflex","Bazooka","BeanieBabies","BeaverBuzz","BellAtlantic","Benadryl","Acrobat","Acura","ZohraFashionStore","AldoShoes","Aeropostale","BananaBoat","BananaRepublic","Josse","MasalaLounge","Bombardier","BostonMarket","CassArt","CalvinKlein","CanadaDry","CandyLand","Capezio","CaptialOne","CocoaKrispies","CocoaPuffs","CaptainMorgan");
$arr_shop_names=array_merge($shop_names,$arr_shop_names);
for($j=1; $j < 5000; $j++){
$user_id=$j;
$user_details=$uObj->getUser(array('user_id'=>$user_id, 'get_flds'=>array('user_id','user_name','user_username')));
$random = array_rand($arr_shop_names, 1);
$shop_name=$arr_shop_names[$random].$user_details["user_username"].$j;
$shop_title=$arr_shop_names[$random]." By ".$user_details["user_username"];
$arr=array(
"shop_name"=>$shop_name,
"shop_title"=>$shop_title,
"shop_slogan"=>$arr_shop_names[$random]." - Shop Slogan will go here",
"shop_description"=>ucfirst($shop_name." Shop Description will go here"),
"shop_city" => $shop_name." city",
"shop_announcement" => $shop_name." announcement will go here",
"shop_general_message" => $shop_name." general message will go here",
"shop_welcome_message" => $shop_name." welcome message will go here",
"shop_payment_policy" => $shop_name." payment policy will go here",
"shop_delivery_policy" => $shop_name." delivery policy will go here",
"shop_refund_policy" => $shop_name." refund policy will go here",
"shop_additional_info" => $shop_name." additional information will go here",
"shop_seller_info" => $shop_name." seller info will go here",
"shop_page_title" => $shop_title." Page Title",
"shop_meta_keywords" => $shop_name." meta keywords",
"shop_meta_description" => $shop_name." meta description will go here",
"shop_contact_person"=>$shop_name,
"shop_address_line_1"=>$shop_name .' Address line 1',
"shop_address_line_2"=>$shop_name .' Address line 2',
"shop_postcode"=>'123456',
"shop_vendor_display_status" => 1,
"shop_status" => 1,
"ua_state" => 1272,
"shop_country" => 105,
"seo_url_keyword" => $shop_name,
"shop_user_id"=>$user_id,
);
if(!$sObj->updateUserShopInfoDetails($arr)){
Message::addErrorMessage("Shop ".$shop_name." not saved");
}
}
echo Message::getHtml();
}
function brands(){
$bObj=new Brands();
for($j=1; $j < 5001; $j++){
$arr=array(
"brand_name"=>"Brand Name ".$j,
"brand_description"=>"Brand description will go here ".$j,
"seo_url_keyword"=>"brand-name-".$j,
"brand_meta_title"=>"Brand Name ".$j." - Page Title",
"brand_meta_keywords" => "Brand Name ".$j." - Meta Keywords",
"brand_meta_description" => "Brand Name ".$j." - Meta Description",
);
if(!$bObj->addUpdate($arr)){
Message::addErrorMessage("Brand - Brand Name ".$j." not saved");
}
}
echo Message::getHtml();
}
function products(){
$sObj=new Shops();
$prodObj=new Products();
$conditions=array("N","U","R");
$arr_category=array("72","81","79","383","378","277","278","280","304","336","319","341","331","134","129");
for($j=5001; $j < 8000; $j++){
$random_brand=rand(1,5000);
$random_shop=rand(1,4999);
$shop = $sObj->getData($random_shop);
$product_name="Product Name ".$j;
$product_stock=rand(1,100);
$threshold_stock=min(rand(1,10),$product_stock);
$random_condition = array_rand($conditions, 1);
$random_category= array_rand($arr_category, 1);
$arr=array(
"prod_type"=>1,
"prod_category" => $arr_category[$random_category],
"prod_added_by" => $shop["shop_user_id"],
"prod_sku"=>Utilities::slugify($product_name),
"prod_name"=>$product_name,
"prod_brand"=>$random_brand,
"prod_model"=>Utilities::slugify($product_name),
"prod_shop" => $random_shop,
"prod_retail_price" => rand(1,5000),
"prod_sale_price" => rand(1,5000),
"prod_shipping" => 1,
"prod_stock" => $product_stock,
"prod_shipping_country" => rand(1,239),
"prod_min_order_qty" => 1,
"prod_subtract_stock" => rand(0,1),
"prod_requires_shipping" => 1,
"prod_track_inventory" => rand(0,1),
"prod_threshold_stock_level" => $threshold_stock,
"prod_condition" => $conditions[$random_condition],
"prod_display_order" => rand(1,5000),
"prod_status" => 1,
"seo_url_keyword" => Utilities::slugify($product_name),
"prod_long_desc" => "<p>Lorem ipsum dolor sit amet, ex duo odio volumus deleniti, pro audire reformidans te. Et rebum facilis voluptatibus vel, ei assum mazim pri. Nam oratio sensibus in. Has mutat appetere et, no duo solet offendit atomorum, in pro natum nulla. Vix rebum iisque aliquip ad, nullam ancillae id has.</p>
<p>Cu wisi vocent sadipscing per, unum interesset per an, vix ne nemore tractatos. Adipisci recteque intellegam cum ut, hinc interesset vel cu. Purto nominati cum ne, eos ea vitae voluptua. Nostro molestie insolens mel et, an quas omnes verear mei, no duo habeo minimum moderatius. Virtute copiosae delectus sit id, aliquip feugait urbanitas id pri, vocibus interesset mea ei.</p>",
"prod_meta_title" => $product_name. " - Page Title" ,
"prod_meta_keywords" => $product_name. " - Meta Keywords will go here",
"prod_meta_description" => $product_name. " - Meta Description will go here",
"prod_featuered" => rand(0,1),
"prod_ship_free" => rand(0,1),
"prod_tax_free" => rand(0,1)
);
if(!$prodObj->addUpdateProduct($arr)){
Message::addErrorMessage($product_name. "Not Added");
}
}
echo Message::getHtml();
}
function tags(){
$ptOBj=new Producttags();
for($j=1; $j < 5000; $j++){
$ptag_name="Tag Name ".$j;
$arr=array(
"ptag_name"=>$ptag_name,
"seo_url_keyword"=>Utilities::slugify($ptag_name),
);
if(!$ptOBj->addUpdate($arr)){
Message::addErrorMessage($tag_name. "Not Added");
}
}
echo Message::getHtml();
}
function products_browsing(){
$prodObj=new Products();
for($j=5001; $j < 10000; $j++){
$prodObj->addUpdateProductBrowsingHistory($j,array(
"visits"=>1,
'session_id'=>rand(1000,5000),
"user_id"=>rand(1,500),
'seconds'=>rand(1,500),
'returned'=>rand(0,1),
'cancelled'=>rand(0,1),
'favorite'=>rand(0,1),
'wishlist'=>rand(0,1),
'cart'=>rand(0,1),
'cart_removed'=>rand(0,1)
));
}
}
function products_tags(){
$ptObj=new Producttags();
$this->db = Syspage::getdb();
for($j=1001; $j < 5000; $j++){
if (!$this->db->deleteRecords('tbl_product_to_tags', array('smt' => 'pt_product_id = ?', 'vals' => array($j)))){
$this->error = $this->db->getError();
return false;
}
for($t=1;$t<rand(5,50);$t++){
$product_id = rand(1,10000);
if (!$this->db->query("INSERT INTO tbl_product_to_tags SET pt_product_id = '" . $product_id . "', pt_tag_id = '" . $j . "'"))	{
$this->error = $this->db->getError();
return false;
}
}
$ptObj->recordTagWeightage($j);	
}
}
}?>
<script language="javascript" type="text/javascript">
  //setTimeout(function(){location.reload(); }, 3000);
</script>
