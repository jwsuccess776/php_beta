<?php

    /**
     * 
     * General configurations
     */
    define('CONF_DEVELOPMENT_MODE', false);
    define('CONF_LIB_HALDLE_ERROR_IN_PRODUCTION', true);
    define('CONF_URL_REWRITING_ENABLED', true);
    define('CONF_ADVANCED_URL_REWRITING_ENABLED', true);
    define('CONF_BUYER_USER_TYPE', 3);
    define('CONF_SELLER_USER_TYPE', 4);
    define('CONF_BUYER_SELLER_USER_TYPE', 5);
    define('CONF_ADVERTISER_USER_TYPE', 1);
    define('CONF_UPLOAD_MAX_FILE_COUNT', 2000);


    $conf_arr_buyer_types = array(CONF_BUYER_USER_TYPE, CONF_BUYER_SELLER_USER_TYPE);
    $conf_arr_seller_types = array(CONF_SELLER_USER_TYPE, CONF_BUYER_SELLER_USER_TYPE);
    $conf_arr_advertiser_types = array(CONF_ADVERTISER_USER_TYPE);
    $conf_arr_buyer_seller_types = array(CONF_BUYER_USER_TYPE, CONF_SELLER_USER_TYPE, CONF_BUYER_SELLER_USER_TYPE);
    $conf_arr_buyer_seller_advertiser_types = array(CONF_ADVERTISER_USER_TYPE => "Advertiser", CONF_BUYER_USER_TYPE => "Buyer", CONF_SELLER_USER_TYPE => "Seller", CONF_BUYER_SELLER_USER_TYPE => "Buyer+Seller");


    define('CONF_HTML_EDITOR', 'innova');
    define('CONF_CKEDITOR_PATH', CONF_WEBROOT_URL . 'js/LiveEditor');
//define('CONF_PROFILE_PATH', CONF_SERVER_PATH."profile/");
    define('CONF_DATE_FIELD_TRIGGER_IMG', CONF_WEBROOT_URL . 'images/cal_icon.png');
    define('PASSWORD_SALT', 'multivendor');
    define('CONF_CRONSCRIPT_PASSKEY', 'fatbit2014');
    define('CONF_ADD_MAX_CART_QTY', 100);
    define('CONF_PAPYAL_ADAPTIVE_KEY', 'PaypalAdaptive');
    define('CONF_CONTRIBUTION_FILE_UPLOAD_SIZE', 10);
    //define('AUTO_CANCELLED_DAYS', 4);
    define('AUTO_CANCELLED_DAYS', 2);//14 sep 2018

    $user_status = array(0 => 'In-Active', 1 => 'Active');
    $nav_page_type = array(0 => 'CMS Page', 1 => 'Custom HTML', 2 => 'External Page');

    $prod_inventory_status = array(0 => 'Do not track', 1 => 'Track');
    $one_to_ten_array = array();
    for ($k = 1; $k <= 10; $k++)
    {
        $one_to_ten_array[$k] = $k;
    }
    $conf_option_types = array("select" => "Select/Listbox/Dropdown", "radio" => "Radio", "checkbox" => "Checkbox", "text" => "Text", "textarea" => "Textarea", "file" => "File", "date" => "Date", "time" => "Time", "datetime" => "Date & Time");
    $admin_dashboard_layout = array(0 => 'default', 1 => 'switch_layout');
    $conf_supplier_form_field_types = array("text" => "Textbox", "textarea" => "Textarea", "file" => "File", "date" => "Date", "time" => "Time", "datetime" => "Date & Time");
    $arr_do_not_process_wallet_payments = array(CONF_PAPYAL_ADAPTIVE_KEY);

    $custom_payment_option = array(
        'payfast' => array(
            'name' => 'payfast',
            'image_url' => 'http://aonfireandsafety.co.za/wp-content/uploads/2015/12/payfast.png',
            'description' => 'Accepting payments using Payfast will give your customers added ways to pay (debit card, credit card, bitcoin etc.) which may increase your sales.<br/>
                                                It is highly recommended to provide buyers the advantage of paying through Payfast.<br/>
                                                <strong style="color:#ff0000">PLEASE NOTE:</strong> All transactions through payfast will incur an additional 4.5% payment processing fee of the total order amount.'
        ),
        'sagepay' => array(
            'name' => 'sagepay',
            'image_url' => 'https://sellsa.co.za/images/sage-pay-small.jpg',
            'description' => 'With Sage Pay you can offer your customers more ways to pay you including Instant EFT, Bank EFT, credit cards, cash payments and Masterpass™. Accepting payments through Sage Pay may increase your sales. 
<br/>It is highly recommended to provide buyers the advantage of paying through Sage Pay.<br/> 
<strong style="color:#ff0000">PLEASE NOTE:</strong> All transactions through Sage Pay will incur an additional 5% payment processing fee of the total order amount.'
        )
    );


    