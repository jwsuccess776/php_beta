<?php



class UserController extends CommonController {



    function default_action() {

        Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

    }



    function payfastjs() {

        echo '<script src="PayFast.js" type="text/javascript"></script>';

    }



    function payfast() {



        $merchant_id = '10005692';

        $merchant_key = 'uonebp775tvnq';

        $amount = '1';

        $item_name = 'Pass';

//$paymode='Live';

        $data1 = array(

            'merchant_id' => $merchant_id,

            'merchant_key' => $merchant_key,

            'amount' => $amount,

            'item_name' => $item_name

        );



        $data = array(

            // Merchant details

            'merchant_id' => $merchant_id,

            'merchant_key' => $merchant_key,

            'return_url' => 'https://sellsa.co.za/user/payfastreturn',

            'cancel_url' => 'https://sellsa.co.za/user/payfastreturn',

            'notify_url' => 'https://sellsa.co.za/user/payfastno',

            'name_first' => 'Rajendra',

            'name_last' => 'Patil',

            'email_address' => 'rajendra827@gmail.com',

            'm_payment_id' => '2',

            'amount' => $amount,

            'item_name' => $item_name,

            'item_description' => 'Item Description',

                //'payment_method' => 'cc', //custom integer to be passed through           

                //  'subscription_type' => 2, //'custom string to be passed through with the transaction to the notify_url page' 

                //Unique payment ID to pass through to notify_url

        );



        $pfOutput = '';

        foreach ($data as $key => $val) {

            if (!empty($val)) {

                $pfOutput .= $key . '=' . urlencode(trim($val)) . '&';

            }

        }

//echo $pfOutput;

// Remove last ampersand

//$pfOutput="merchant_id=".urlencode(trim($merchant_id))."&merchant_key=".urlencode(trim($merchant_key))."&amount=".urlencode(trim($amount))."&item_name=".urlencode(trim($item_name))."";

        $getString = substr($pfOutput, 0, -1);

//echo $getString;



        if (isset($passPhrase) && $paymode != 'sandbox') {

            $getString .= '&passphrase=' . $passPhrase;

        }



        $pfSignature = md5($getString);

        $data['signature'] = $pfSignature;

        /*

          echo "<pre>";

          print_r($data);

          exit;

         */

        // echo '<pre>';

        //  print_r($data);

        //  exit;

        // If in testing mode use the sandbox domain ?  sandbox.payfast.co.za else www.payfast.co.za

        $testingMode = true;

        //$testingMode = false;

        $pfHost = $testingMode ? 'sandbox.payfast.co.za' : 'www.payfast.co.za';

        $htmlForm = '

<form action="https://' . $pfHost . '/eng/process" method="get">';

        foreach ($data as $name => $value) {

            $htmlForm .= '<input name="' . $name . '" type="hidden" value="' . $value . '" />';

        } $htmlForm .= '<input type="submit" value="Pay Now" /></form>';

        echo $htmlForm;

    }



    function payfastreturn() {

        /**

         * Notes:

         * - All lines with the suffix "// DEBUG" are for debugging purposes and

         *   can safely be removed from live code.

         * - Remember to set PAYFAST_SERVER to LIVE for production/live site

         */

        // General defines

        define('PAYFAST_SERVER', 'TEST');

        // Whether to use "sandbox" test server or live server

        define('USER_AGENT', 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)');

        // User Agent for cURL

        // Messages

        // Error

        define('PF_ERR_AMOUNT_MISMATCH', 'Amount mismatch');

        define('PF_ERR_BAD_SOURCE_IP', 'Bad source IP address');

        define('PF_ERR_CONNECT_FAILED', 'Failed to connect to PayFast');

        define('PF_ERR_BAD_ACCESS', 'Bad access of page');

        define('PF_ERR_INVALID_SIGNATURE', 'Security signature mismatch');

        define('PF_ERR_CURL_ERROR', 'An error occurred executing cURL');

        define('PF_ERR_INVALID_DATA', 'The data received is invalid');

        define('PF_ERR_UKNOWN', 'Unkown error occurred');



        // General

        define('PF_MSG_OK', 'Payment was successful');

        define('PF_MSG_FAILED', 'Payment has failed');





        // Notify PayFast that information has been received

        header('HTTP/1.0 200 OK');

        flush();



        // Variable initialization

        $pfError = false;

        $pfErrMsg = '';

        $filename = 'notify.txt'; // DEBUG

        $output = ''; // DEBUG

        $pfParamString = '';

        $pfHost = ( PAYFAST_SERVER == 'LIVE' ) ?

                'www.payfast.co.za' : 'sandbox.payfast.co.za';



        //// Dump the submitted variables and calculate security signature

        if (!$pfError) {

            $output = "Posted Variables:\n\n"; // DEBUG

            // Strip any slashes in data

            foreach ($_POST as $key => $val)

                $pfData[$key] = stripslashes($val);



            // Dump the submitted variables and calculate security signature

            foreach ($pfData as $key => $val) {

                if ($key != 'signature')

                    $pfParamString .= $key . '=' . urlencode($val) . '&';

            }



            // Remove the last '&' from the parameter string

            $pfParamString = substr($pfParamString, 0, -1);

            $pfTempParamString = $pfParamString;



            // If a passphrase has been set in the PayFast Settings, include it in the signature string.

            $passPhrase = 'XXXXX'; //You need to get this from a constant or stored in you website

            if (!empty($passPhrase)) {

                $pfTempParamString .= '&passphrase=' . urlencode($passPhrase);

            }

            $signature = md5($pfTempParamString);



            $result = ( $_POST['signature'] == $signature );



            $output .= "Security Signature:\n\n"; // DEBUG

            $output .= "- posted     = " . $_POST['signature'] . "\n"; // DEBUG

            $output .= "- calculated = " . $signature . "\n"; // DEBUG

            $output .= "- result     = " . ( $result ? 'SUCCESS' : 'FAILURE' ) . "\n"; // DEBUG

        }



        //// Verify source IP

        if (!$pfError) {

            $validHosts = array(

                'www.payfast.co.za',

                'sandbox.payfast.co.za',

                'w1w.payfast.co.za',

                'w2w.payfast.co.za',

            );



            $validIps = array();



            foreach ($validHosts as $pfHostname) {

                $ips = gethostbynamel($pfHostname);



                if ($ips !== false)

                    $validIps = array_merge($validIps, $ips);

            }



            // Remove duplicates

            $validIps = array_unique($validIps);



            if (!in_array($_SERVER['REMOTE_ADDR'], $validIps)) {

                $pfError = true;

                $pfErrMsg = PF_ERR_BAD_SOURCE_IP;

            }

        }



        //// Connect to server to validate data received

        if (!$pfError) {

            // Use cURL (If it's available)

            if (function_exists('curl_init')) {

                $output .= "\n\nUsing cURL\n\n"; // DEBUG

                // Create default cURL object

                $ch = curl_init();



                // Base settings

                $curlOpts = array(

                    // Base options

                    CURLOPT_USERAGENT => USER_AGENT, // Set user agent

                    CURLOPT_RETURNTRANSFER => true, // Return output as string rather than outputting it

                    CURLOPT_HEADER => false, // Don't include header in output

                    CURLOPT_SSL_VERIFYHOST => 2,

                    CURLOPT_SSL_VERIFYPEER => false,

                    // Standard settings

                    CURLOPT_URL => 'https://' . $pfHost . '/eng/query/validate',

                    CURLOPT_POST => true,

                    CURLOPT_POSTFIELDS => $pfParamString,

                );

                curl_setopt_array($ch, $curlOpts);



                // Execute CURL

                $res = curl_exec($ch);

                curl_close($ch);



                if ($res === false) {

                    $pfError = true;

                    $pfErrMsg = PF_ERR_CURL_ERROR;

                }

            }

            // Use fsockopen

            else {

                $output .= "\n\nUsing fsockopen\n\n"; // DEBUG

                // Construct Header

                $header = "POST /eng/query/validate HTTP/1.0\r\n";

                $header .= "Host: " . $pfHost . "\r\n";

                $header .= "Content-Type: application/x-www-form-urlencoded\r\n";

                $header .= "Content-Length: " . strlen($pfParamString) . "\r\n\r\n";



                // Connect to server

                $socket = fsockopen('ssl://' . $pfHost, 443, $errno, $errstr, 10);



                // Send command to server

                fputs($socket, $header . $pfParamString);



                // Read the response from the server

                $res = '';

                $headerDone = false;



                while (!feof($socket)) {

                    $line = fgets($socket, 1024);



                    // Check if we are finished reading the header yet

                    if (strcmp($line, "\r\n") == 0) {

                        // read the header

                        $headerDone = true;

                    }

                    // If header has been processed

                    else if ($headerDone) {

                        // Read the main response

                        $res .= $line;

                    }

                }

            }

        }



        //// Get data from server

        if (!$pfError) {

            // Parse the returned data

            $lines = explode("\n", $res);



            $output .= "\n\nValidate response from server:\n\n"; // DEBUG



            foreach ($lines as $line) // DEBUG

                $output .= $line . "\n"; // DEBUG

        }



        //// Interpret the response from server

        if (!$pfError) {

            // Get the response from PayFast (VALID or INVALID)

            $result = trim($lines[0]);



            $output .= "\nResult = " . $result; // DEBUG

            // If the transaction was valid

            if (strcmp($result, 'VALID') == 0) {

                // Process as required

            }

            // If the transaction was NOT valid

            else {

                // Log for investigation

                $pfError = true;

                $pfErrMsg = PF_ERR_INVALID_DATA;

            }

        }



        // If an error occurred

        if ($pfError) {

            $output .= "\n\nAn error occurred!";

            $output .= "\nError = " . $pfErrMsg;

        }



        //// Write output to file // DEBUG

        file_put_contents($filename, $output); // DEBUG

    }



    function payfastreturn_() {







        echo "<pre>";

        print_r($_POST);

        print_r($_GET);

        echo "</pre>";



        define('SANDBOX', 1);



// Variable Initialization

        $pmtToken = isset($_GET['pt']) ? $_GET['pt'] : null;

        if (empty($pmtToken))

            $pmtToken = isset($_POST['pt']) ? $_POST['pt'] : null;



        if (!empty($pmtToken)) {

            // Variable Initialization

            $error = false;

            $authToken = '<YOUR_PDT_KEY-->';

            $req = 'pt=' . $pmtToken . '&at=' . $authToken;

            $data = array();

            $host = SANDBOX ? 'sandbox.payfast.co.za' : 'www.payfast.co.za';



            //// Connect to server

            if (!$error) {

                // Construct Header

                $header = "POST /eng/query/fetch HTTP/1.0\r\n";

                $header .= 'Host: ' . $host . "\r\n";

                $header .= "Content-Type: application/x-www-form-urlencoded\r\n";

                $header .= 'Content-Length: ' . strlen($req) . "\r\n\r\n";



                // Connect to server

                $socket = fsockopen('ssl://' . $host, 443, $errno, $errstr, 10);



                if (!$socket) {

                    $error = true;

                    print( 'errno = ' . $errno . ', errstr = ' . $errstr);

                }

            }



            //// Get data from server

            if (!$error) {

                // Send command to server

                fputs($socket, $header . $req);



                // Read the response from the server

                $res = '';

                $headerDone = false;



                while (!feof($socket)) {

                    $line = fgets($socket, 1024);



                    // Check if we are finished reading the header yet

                    if (strcmp($line, "\r\n") == 0) {

                        // read the header

                        $headerDone = true;

                    }

                    // If header has been processed

                    else if ($headerDone) {

                        // Read the main response

                        $res .= $line;

                    }

                }



                // Parse the returned data

                $lines = explode("\n", $res);

            }



            //// Interpret the response from server

            if (!$error) {

                $result = trim($lines[0]);



                // If the transaction was successful

                if (strcmp($result, 'SUCCESS') == 0) {

                    // Process the reponse into an associative array of data

                    for ($i = 1; $i < count($lines); $i++) {

                        list( $key, $val ) = explode("=", $lines[$i]);

                        $data[urldecode($key)] = stripslashes(urldecode($val));

                    }

                }

                // If the transaction was NOT successful

                else if (strcmp($result, 'FAIL') == 0) {

                    // Log for investigation

                    $error = true;

                    // 

                }

            }



            //// Process the payment

            if (!$error) {

                // Get the data from the new array as needed

                $nameFirst = $data['name_first'];

                $nameLast = $data['name_last'];

                $amountGross = $data['amount_gross'];



                // Once you have access to this data, you should perform a number of

                // checks to ensure the transaction is "correct" before processing it.

                // - Check the payment_status is Completed

                // - Check the pf_transaction_id has not already been processed

                // - Check the merchant_id is correct for your account

                // Process payment

                // 

            }



            // Close socket if successfully opened

            if ($socket)

                fclose($socket);

        }

    }



    function login_popup() {

        if (!Utilities::isAjaxRequest()) {

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        Utilities::setSessionRedirectUrl($_SERVER['HTTP_REFERER']);

        $frm = $this->getLoginForm();

        $frm->setAction(Utilities::generateUrl('user', 'account'));

        $this->set('frm', $frm);

        $this->_template->render(false, false);

    }



    function redirect() {

        $redirect_url = Utilities::getSessionRedirectUrl();

        Utilities::unsetSessionRedirectUrl();

        if (!empty($redirect_url))

            Utilities::redirectUser($redirect_url);

        elseif (User::isUserLogged()) {

            Utilities::redirectUser(Utilities::generateUrl('account'));

        } else

            Utilities::redirectUser(Utilities::generateUrl());

    }



    function social_media_login($oauth_provider) {

        if (isset($oauth_provider)) {

            if ($oauth_provider == 'googleplus') {

                Utilities::redirectUser(Utilities::generateUrl('user', 'login_googleplus'));

            } else if ($oauth_provider == 'facebook') {

                Utilities::redirectUser(Utilities::generateUrl('user', 'login_facebook'));

            } else {

                Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_REQUEST'));

            }

        }

        Utilities::redirectUserReferer();

    }



    function login_facebook() {

        //die(Utilities::currentPageURL());

        require_once (CONF_INSTALLATION_PATH . 'public/includes/APIs/facebook/facebook.php');

        $facebook = new Facebook(array(

            'appId' => Settings::getSetting("CONF_FACEBOOK_APP_ID"),

            'secret' => Settings::getSetting("CONF_FACEBOOK_APP_SECRET"),

        ));

        $user = $facebook->getUser();

        //Utilities::printArray($user);

        //die();

        if ($user) {

            try {

// Proceed knowing you have a logged in user who's authenticated.

                $user_profile = $facebook->api('/me?fields=id,name,email');

                Utilities::printArray($user_profile);

                die();

                /* Utilities::printArray($user_profile);

                  die(); */

            } catch (FacebookApiException $e) {

                error_log($e);

                $user = null;

            }

            if (!empty($user_profile)) {

# User info ok? Let's print it (Here we will be adding the login and registering routines)

                $facebook_name = $user_profile['name'];

                $user_facebook_id = $user_profile['id'];

                $facebook_email = $user_profile['email'];

                if (empty($facebook_email) || $facebook_email == "") {

                    Message::addErrorMessage(Utilities::getLabel('M_There_was_problem_authenticating_facebook_account'));

                    Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

                }

                $user = $this->User->getUser(array('user_email' => $facebook_email));

                if (!$user) {

                    $buyer_user_type = Settings::getSetting("CONF_ACTIVATE_SEPARATE_SIGNUP_FORM") ? CONF_BUYER_USER_TYPE : CONF_BUYER_SELLER_USER_TYPE;

                    $arr = array(

                        'user_password' => uniqid(),

                        'user_email_verified' => 1,

                        'user_name' => $facebook_name,

                        'user_email' => $facebook_email,

                        'user_username' => str_replace(" ", "", $facebook_name) . $user_facebook_id,

                        'user_facebook_id' => $user_facebook_id,

                        'user_type' => $buyer_user_type,

                        'pref' => 'B',

                    );

                    if (!$this->User->addUser($arr)) {

                        Message::addErrorMessage($this->User->getError());

                    }

                } else {

//if (!$user['user_facebook_id']) {}

                    $this->User->setUserId($user["user_id"]);

                    if (!$this->User->updateAttributes(array('user_facebook_id' => $user_facebook_id))) {

                        Message::addErrorMessage($this->User->getError());

                    }

                }

                $user = $this->User->getUser(array('facebook_id' => $user_facebook_id), true);

                if ($this->User->login($user['user_username'], $user['user_password'], true) === true) {

                    if (isset($_SESSION['go_to_referer_page']) && filter_var($_SESSION['go_to_referer_page'], FILTER_VALIDATE_URL)) {

                        $ref_url = $_SESSION['go_to_referer_page'];

                        unset($_SESSION['go_to_referer_page']);

                        Utilities::redirectUser($ref_url);

                    } else {

                        $r = Utilities::generateUrl('account');

                        Utilities::redirectUser(Utilities::generateUrl('account'));

                    }

                } else {

                    Message::addErrorMessage($this->User->getError());

                }

            } else {

                Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_REQUEST'));

            }

            Utilities::redirectUserReferer();

        } else {



//,'redirect_uri' => Utilities::generateAbsoluteUrl('api', 'login_fb',array())

            //Utilities::currentPageURL()

            $login_url = $facebook->getLoginUrl(array('scope' => 'email'), Utilities::currentPageURL());

            /* $loginUrl = $facebook->getLoginUrl(array(

              'scope'     => 'email',

              'redirect_uri'  => Utilities::currentPageURL(),

              )); */

            //die($loginUrl);

            Utilities::redirectUser($login_url);

        }

    }



    function fblogin() {

        if (!Utilities::isAjaxRequest()) {

            dieJsonError(Utilities::getLabel('M_ERROR_INVALID_ACCESS'));

        }

        $post = Syspage::getPostedVar();

        $userData = json_decode($post['userData']);

        if (empty($userData) || empty($userData->email)) {

            dieJsonError(Utilities::getLabel('M_There_was_problem_authenticating_facebook_account'));

        }

        # User info ok? Let's print it (Here we will be adding the login and registering routines)

        $facebook_name = trim($userData->first_name . ' ' . $userData->last_name);

        $user_facebook_id = $userData->id;

        $facebook_email = $userData->email;

        $user = $this->User->getUser(array('user_email' => $facebook_email));

        if (!$user) {

            $buyer_user_type = Settings::getSetting("CONF_ACTIVATE_SEPARATE_SIGNUP_FORM") ? CONF_BUYER_USER_TYPE : CONF_BUYER_SELLER_USER_TYPE;

            $arr = array(

                'user_password' => uniqid(),

                'user_email_verified' => 1,

                'user_name' => $facebook_name,

                'user_email' => $facebook_email,

                'user_username' => str_replace(" ", "", $facebook_name) . $user_facebook_id,

                'user_facebook_id' => $user_facebook_id,

                'user_type' => $buyer_user_type,

                'pref' => 'B',

            );

            if (!$this->User->addUser($arr)) {

                dieJsonError($this->User->getError());

            }

        } else {

//if (!$user['user_facebook_id']) {}

            $this->User->setUserId($user["user_id"]);

            if (!$this->User->updateAttributes(array('user_facebook_id' => $user_facebook_id))) {

                dieJsonError($this->User->getError());

            }

        }

        $user = $this->User->getUser(array('facebook_id' => $user_facebook_id), true);

        if ($this->User->login($user['user_username'], $user['user_password'], true) === true) {

            if (isset($_SESSION['go_to_referer_page']) && filter_var($_SESSION['go_to_referer_page'], FILTER_VALIDATE_URL)) {

                $ref_url = $_SESSION['go_to_referer_page'];

                unset($_SESSION['go_to_referer_page']);

                //Utilities::redirectUser($ref_url);

            }

            dieJsonSuccess('FB Logged in');

        } else {

            dieJsonError($this->User->getError());

        }

    }



    function login_googleplus() {

        require_once 'APIs/googleplus/Google_Client.php'; // include the required calss files for google login

        require_once 'APIs/googleplus/contrib/Google_PlusService.php';

        require_once 'APIs/googleplus/contrib/Google_Oauth2Service.php';

        $client = new Google_Client();

        $client->setApplicationName("Yokart"); // Set your applicatio name

        $client->setScopes(array('https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/plus.me')); // set scope during user login

        $client->setClientId(Settings::getSetting("CONF_GOOGLEPLUS_CLIENT_ID")); // paste the client id which you get from google API Console

        $client->setClientSecret(Settings::getSetting("CONF_GOOGLEPLUS_CLIENT_SECRET")); // set the client secret

        $current_page_uri = preg_replace('/\?.*$/', '', Utilities::getCurrUrl());

        $client->setRedirectUri($current_page_uri);

        $client->setDeveloperKey(Settings::getSetting("CONF_GOOGLEPLUS_DEVELOPER_KEY")); // Developer key

        $plus = new Google_PlusService($client);

        $oauth2 = new Google_Oauth2Service($client); // Call the OAuth2 class for get email address

        if (isset($_GET['code'])) {

            $client->authenticate(); // Authenticate

            $_SESSION['access_token'] = $client->getAccessToken(); // get the access token here 

            Utilities::redirectUser($current_page_uri);

        }

        if (isset($_SESSION['access_token'])) {

            $client->setAccessToken($_SESSION['access_token']);

        }

        if ($client->getAccessToken()) {

            $user = $oauth2->userinfo->get();

            $_SESSION['access_token'] = $client->getAccessToken();

            $user_googleplus_email = filter_var($user['email'], FILTER_SANITIZE_EMAIL); // get the USER EMAIL ADDRESS using OAuth2

            if (empty($user_googleplus_email) || $user_googleplus_email == "") {

                Message::addErrorMessage(Utilities::getLabel('M_There_was_problem_authenticating_googleplus_account'));

                Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

            }

            $user_googleplus_id = $user['id'];

            $user_googleplus_name = $user['name'];

            if (isset($user_googleplus_email) && (!empty($user_googleplus_email))) {

                $user = $this->User->getUser(array('user_email' => $user_googleplus_email));

                if (!$user) {

                    $buyer_user_type = Settings::getSetting("CONF_ACTIVATE_SEPARATE_SIGNUP_FORM") ? CONF_BUYER_USER_TYPE : CONF_BUYER_SELLER_USER_TYPE;

                    $arr = array(

                        'user_password' => uniqid(),

                        'user_email_verified' => 1,

                        'user_name' => $user_googleplus_name,

                        'user_email' => $user_googleplus_email,

                        'user_username' => str_replace(" ", "", $user_googleplus_name) . $user_googleplus_id,

                        'user_googleplus_id' => $user_googleplus_id,

                        'user_type' => $buyer_user_type,

                        'pref' => 'B',

                    );

                    if (!$this->User->addUser($arr)) {

                        Message::addErrorMessage($this->User->getError());

                    }

                } else {

                    if (!$user['user_googleplus_id']) {

                        $this->User->setUserId($user["user_id"]);

                        if (!$this->User->updateAttributes(array('user_googleplus_id' => $user_googleplus_id))) {

                            Message::addErrorMessage($this->User->getError());

                        }

                    }

                }

                $user = $this->User->getUser(array('googleplus_id' => $user_googleplus_id), true);

                if ($this->User->login($user['user_username'], $user['user_password'], true) === true) {

                    if (isset($_SESSION['go_to_referer_page']) && filter_var($_SESSION['go_to_referer_page'], FILTER_VALIDATE_URL)) {

                        $ref_url = $_SESSION['go_to_referer_page'];

                        unset($_SESSION['go_to_referer_page']);

                        Utilities::redirectUser($ref_url);

                    } else {

                        Utilities::redirectUser(Utilities::generateUrl('account'));

                    }

                } else {

                    Message::addErrorMessage($this->User->getError());

                }

                Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

            }

            //print($email);

        } else {

            $authUrl = $client->createAuthUrl();

        }

        Utilities::redirectUser($authUrl);

    }



    function getLoginForm() {

        $frm = new Form('frmLogin');

        $frm->setAction('?');

        $frm->setExtra('class="siteForm"');

        $frm->captionInSameCell(true);

        $redirect_url = Utilities::getSessionRedirectUrl();

        Utilities::unsetSessionRedirectUrl();

        $frm->addHiddenField('', 'redirect_url', $redirect_url);

        //$frm->setRequiredStarWith('not-required');

        $frm->addRequiredField(Utilities::getLabel('L_Username_or_Email'), 'username', '', 'username', ' autocapitalize="none"');

        $fld = $frm->addPasswordField(Utilities::getLabel('L_Password'), 'password', '', '', ' autocapitalize="none"');

        $fld->requirements()->setRequired(true);

        $frm->addHtml('', '', '<div class="remember">

            <input type="checkbox" name="remember" value="1">

            ' . Utilities::getLabel('L_Remember_Me') . ' <br>

            <p>
                <a href="' . Utilities::generateUrl('user', 'forgot_password') . '">' . Utilities::getLabel('L_FORGOT_PASSWORD') . '</a> 
                &nbsp;&nbsp; or &nbsp;&nbsp;
                <a href="' . Utilities::generateUrl('user', 'account') . '">' . Utilities::getLabel('M_SIGN_UP') . '</a>
            </p>

        </div>

        <input type="submit" name="btn_login" value="' . Utilities::getLabel('L_LOGIN_NOW') . '" class="btn primary-btn form-submit">');

        $frm->setValidatorJsObjectName('frm_validator');

        $frm->setJsErrorDisplay('afterfield');

        return $frm;

    }



    function getBuyerSellerRegistrationForm($type) {

        $frm = new Form('frmRegistration', 'frmStrengthPassword');

        //$frm->setRequiredStarWith('not-required');

        $frm->setValidatorJsObjectName('system_validator');

        $frm->setExtra('class="siteForm"');

        $frm->captionInSameCell(true);

        $frm->addHiddenField('', 'pref', 'B');

        $frm->addRequiredField(Utilities::getLabel('F_Your_Name'), 'user_name');

        $fld = $frm->addTextBox(Utilities::getLabel('F_Username'), 'user_username', '', '', ' class="check_username" autocapitalize="none"');

        $fld->requirements()->setUsername(true);

        $fld->requirements()->setRequired(true);

        $fld->html_after_field = '<span id="ajax_availability_username"></span>';

        $fld = $frm->addEmailField(Utilities::getLabel('F_Email'), 'user_email', '', '', ' class="check_email" autocapitalize="none"');

        $fld->html_after_field = '<span id="ajax_availability_email"></span>';

        $fld_password = $frm->addPasswordField(Utilities::getLabel('M_Password'), 'user_password', '', 'check-password', ' autocapitalize="none" ');

        $fld_password->requirements()->setRequired(true);

        $fld_password->requirements()->setLength(4, 20);

        $fld_password->html_before_field = '<div id="check-password-result">';

        $fld_password->html_after_field = '</div>';

        $fld = $frm->addHtml(sprintf(Utilities::getLabel('L_By_using_agree_terms_conditions'), '<a target="_blank" href="' . Utilities::generateUrl('cms', 'view', array(Settings::getSetting("CONF_ACCOUNT_TERMS"))) . '">' . Utilities::getLabel('L_Terms_Conditions') . '</a>'), '');

        $fld->merge_caption = true;

        $fld = $frm->addSubmitButton('', 'btn_signup', strtoupper(Utilities::getLabel('BTN_REGISTER')), '', ' class="btn primary-btn"');

        if (Settings::getSetting("CONF_ACTIVATE_SEPARATE_SIGNUP_FORM")) {

            $become_seller_page = str_replace('{SITEROOT}', CONF_WEBROOT_URL, Settings::getSetting("CONF_SELL_SITENAME_PAGE"));

            $fld->html_after_field = '<p class="marginLeft marginTop">' . sprintf(Utilities::getLabel('L_Please_click_here_to_signup_seller'), '<a href="' . $become_seller_page . '">' . Utilities::getLabel('L_Click_here') . '</a>') . '</p>';

        }

        $frm->setJsErrorDisplay('afterfield');

        return $frm;

    }



    function account($p) {

        $referrer = parse_url(getenv("HTTP_REFERER"));

        if (isset($p) && (strtolower($p) == "api")) {

            $hide_header_footer = true;

            $_SESSION['hide_header_footer'] = true;

        }

        if (isset($p) && ($p == "p_c")) {

            Message::addMessage(Utilities::getLabel('M_Your_password_changed_login'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        Utilities::checkIsAlreadyLoggedIn();

        $loginFrm = $this->getLoginForm();

        $registrationFrm = $this->getBuyerSellerRegistrationForm(CONF_BUYER_SELLER_USER_TYPE);

        $become_seller_page = str_replace('{SITEROOT}', CONF_WEBROOT_URL, Settings::getSetting("CONF_SELL_SITENAME_PAGE"));

        if ($referrer['path'] == $become_seller_page) {

            $registrationFrm->fill(array("pref" => "S"));

        }

        $this->set('loginFrm', $loginFrm);

        $this->set('RegistrationFrm', $registrationFrm);

        $post = Syspage::getPostedVar();

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_login'])) {

            if (!$loginFrm->validate($post)) {

                Message::addErrorMessage($loginFrm->getValidationErrors());

            } else {

                // Check how many login attempts have been made.

                $login_info = $this->User->getLoginAttempts($post['username']);

                if ($login_info && ($login_info['ulogin_total'] >= Settings::getSetting("CONF_MAX_LOGIN_ATTEMPTS")) && strtotime('-1 hour') < strtotime($login_info['ulogin_date_modified'])) {

                    Message::addErrorMessage(Utilities::getLabel('L_Warning_Max_Login_Attempts'));

                    if (Utilities::isAjaxRequest()) {

                        dieJsonError(Message::getHtml());

                    }

                    Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

                }

                $pwd = Utilities::encryptPassword($post['password']);

                if ($this->User->login($post['username'], $post['password']) === true) {

                    setcookie('uc_id', $this->User->getAttribute("user_id"), time() + 3600 * 24 * 30, '/');

                    //$this->User->expireRewardPoints($this->User->getAttribute("user_id"));

                    $this->User->deleteLoginAttempts($post['username']);

                    if (isset($post['remember'])) {

                        $remember_token = substr(md5(rand(1, 99999) . microtime()), 1, 25);

                        $data = array('user_id' => $this->User->getAttribute("user_id"), 'remember_token' => $remember_token, 'token_expiry' => date('Y-m-d H:i:s', strtotime("+10 DAYS")));

                        if ($this->User->updateRememberMeToken($data) === true) {

                            setcookie('remembertoken', $remember_token, time() + 3600 * 24 * 10, '/');

                        }

                    }

                    if (Utilities::isAjaxRequest())

                        dieJsonSuccess('');

                    if (isset($_SESSION['go_to_referer_page']) && filter_var($_SESSION['go_to_referer_page'], FILTER_VALIDATE_URL)) {

                        $ref_url = $_SESSION['go_to_referer_page'];

                        unset($_SESSION['go_to_referer_page']);

                        Utilities::redirectUser($ref_url);

                    } else {

                        Utilities::redirectUser(Utilities::generateUrl('account'));

                    }

                } else {

                    $this->User->addLoginAttempt($post['username']);

                    $loginFrm->fill($post);

                    Message::addErrorMessage($this->User->getError());

                    if (Utilities::isAjaxRequest()) {

                        dieJsonError(Message::getHtml());

                    }

                }

            }

        } elseif ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_signup'])) {

            if (!$registrationFrm->validate($post)) {

                Message::addErrorMessage($registrationFrm->getValidationErrors());

            } else {

                $buyer_user_type = Settings::getSetting("CONF_ACTIVATE_SEPARATE_SIGNUP_FORM") ? CONF_BUYER_USER_TYPE : CONF_BUYER_SELLER_USER_TYPE;

                $arr = array_merge($post, array("user_email_verified" => 0, "user_type" => $buyer_user_type));

                if ($this->User->addUser($arr)) {

                    if (Settings::getSetting("CONF_AUTO_LOGIN_REGISTRATION") && ($p != "api")) {

                        $pwd = Utilities::encryptPassword($post['user_password']);

                        if ($this->User->login($post['user_username'], $pwd, true) === true) {

                            Utilities::redirectUser(Utilities::generateUrl('account'));

                        }

                    }

                    $user_verified = $this->User->getAttribute('user_email_verified');

                    if ($user_verified == 1) {

                        Message::addMessage(Utilities::getLabel('M_SUCCESS_USER_SIGNUP_VERIFIED'));

                    } else {

                        Message::addMessage(Utilities::getLabel('M_SUCCESS_USER_SIGNUP'));

                    }

                } else {

                    $registrationFrm->fill($post);

                    Message::addErrorMessage($this->User->getError());

                }

            }

        } elseif (!isset($_SESSION['go_to_referer_page']) && isset($_SERVER['HTTP_REFERER']) && filter_var($_SERVER['HTTP_REFERER'], FILTER_VALIDATE_URL) && strpos($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) == true) {

            $_SESSION['go_to_referer_page'] = $_SERVER['HTTP_REFERER'];

        }

        if (!$hide_header_footer) {

            $hide_header_footer = Utilities::isHideHeaderFooter();

        }

        if ($hide_header_footer) {

            $this->set('hide_header_footer', $hide_header_footer);

            $this->_template->render(false, false, 'user/account_app.php');

        } else {

            $this->_template->render();

        }

    }



    function cryptPwd($str) {

        return crypt($str, 'NxhPwrR07zYijkhgdfg46M2fad9a5189454d05879a76f5e8b569xf2CVo6JpNxhPwr587988a76f5e');

    }



    function forgot_password() {

        Utilities::checkIsAlreadyLoggedIn();

        $frm = new Form('frmForgotPassword');

        $fld = $frm->addRequiredField('<label>' . Utilities::getLabel('F_EMAIL_OR_USERNAME') . '</label>', 'user_email_username', '', 'user_email_username');

        if (!empty(CONF_RECAPTACHA_SITEKEY)) {

            $frm->addHtml('', 'htmlNote', '<div class="g-recaptcha" data-sitekey="' . CONF_RECAPTACHA_SITEKEY . '"></div>');

        }

        $fld = $frm->addSubmitButton('&nbsp;', 'btn_submit', Utilities::getLabel('btn_submit'), '', ' title="' . Utilities::getLabel('btn_submit') . '" ');

        $fld->html_before_field = '<div class="fieldrw">';

        $fld->html_after_field = ' <a href="' . Utilities::generateUrl('user', 'account') . '" class="btn gray">' . Utilities::getLabel('F_Back_to_Login') . '</a></div>';

        $fld->merge_cells = 2;

        $frm->setTableProperties(' width="100%" border="0" class="tableform"');

        $frm->setExtra('class="siteForm"');

        $frm->setJsErrorDisplay('afterfield');

        $frm->setRequiredStarWith('x');

        $frm->captionInSameCell(true);

        $frm->setFieldsPerRow(1);

        $this->set('frm', $frm);

        $post = Syspage::getPostedVar();

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])) {

            $frm->fill($post);

            if (!$frm->validate($post)) {

                Message::addErrorMessage($frm->getValidationErrors());

            } else if (!Utilities::verifyCaptcha()) {

                Message::addErrorMessage(Utilities::getLabel('M_ERROR_PLEASE_VERIFY_YOURSELF'));

            } else {

                $user = $this->User->getUser(array('user_email_username' => $post['user_email_username']));

                if (!$user) {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_EMAIL_USERNAME'));

                } elseif ($user['user_status'] != 1) {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_YOUR_ACCOUNT_NOT_ACTIVE'));

                } elseif ($user['user_is_deleted'] == 1) {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_YOUR_ACCOUNT_IS_DELETED'));

                } elseif ($user['user_email_verified'] != 1) {

                    Message::addErrorMessage(sprintf(Utilities::getLabel('M_ERROR_YOU_HAVE_NOT_VERIFIED_EMAIL'), '<a href="' . Utilities::generateUrl('user', 'resend_verification_code') . '" class="greenAnchorLink">' . Utilities::getLabel('M_Click_here') . '</a>'));

                } elseif (!$this->User->canResetPassword($user['user_id'])) {

                    Message::addErrorMessage(Utilities::getLabel('M_WARNING_FORGOT_PASSWORD_DUPLICATE_REQUEST'));

                } else {

                    $reset_token = substr(md5(rand(1, 99999) . microtime()), 1, 25);

                    $data = array('user_id' => $user['user_id'], 'reset_token' => $reset_token, 'token_expiry' => date('Y-m-d H:i:s', strtotime("+24 HOUR")));

                    if ($this->User->updateForgotRequest($data) === true) {

                        $reset_url = Utilities::generateAbsoluteUrl('user', 'reset_password', array($user["user_id"] . "." . $reset_token));

                        $website_name = Settings::getSetting("CONF_WEBSITE_NAME");

                        $website_url = Utilities::getUrlScheme();

                        if (Utilities::sendMailTpl($user['user_email'], 'forgot_password', array(

                                    '{reset_url}' => $reset_url,

                                    '{website_name}' => $website_name,

                                    '{website_url}' => $website_url,

                                    '{site_domain}' => CONF_SERVER_PATH,

                                    '{user_full_name}' => htmlentities($user['user_name']),

                                ))) {

                            Message::addMessage(Utilities::getLabel('M_SUCCESS_FORGOT_PASSWORD_REQUEST'));

                            Utilities::redirectUser(Utilities::generateUrl('user', 'forgot_password'));

                        } else {

                            Message::addErrorMessage(Utilities::getLabel('M_email_not_sent_server_issue'));

                        }

                    } else {

                        Message::addErrorMessage($this->User->getError());

                    }

                }

            }

        }

        $this->_template->render();

    }



    function resend_verification_code() {

        Utilities::checkIsAlreadyLoggedIn();

        $frm = $this->getResendVerificationEmailForm();

        $post = Syspage::getPostedVar();

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])) {

            if (!$frm->validate($post)) {

                Message::addErrorMessage($frm->getValidationErrors());

            } else if (!Utilities::verifyCaptcha()) {

                Message::addErrorMessage(Utilities::getLabel('M_ERROR_PLEASE_VERIFY_YOURSELF'));

                $frm->fill($post);

            } else {

                $user = $this->User->getUser(array('user_email_username' => $post['user_email_username']));

                if (!$user) {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_EMAIL_USERNAME'));

                } elseif ($user['user_is_deleted'] == 1) {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_YOUR_ACCOUNT_IS_DELETED'));

                } elseif ($user['user_email_verified'] == 1) {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_EMAIL_OR_EMAIL_ALREADY_VERIFIED'));

                } else {

                    $emailNotObj = new Emailnotifications();

                    if (!$emailNotObj->sendVerificationEmail($user["user_id"])) {

                        Message::addErrorMessage(Utilities::getLabel('M_email_not_sent_server_issue'));

                    } else {

                        Message::addMessage(Utilities::getLabel('M_Verification_Email_Send_Successfully'));

                    }

                    Utilities::redirectUser(Utilities::getCurrUrl());

                }

            }

        }

        $this->set('frm', $frm);

        $this->_template->render();

    }



    private function getResendVerificationEmailForm() {

        $frm = new Form('frmResendVerificationCode');

        $fld = $frm->addRequiredField("<label>" . Utilities::getLabel('M_Email_or_Username') . "</label>", 'user_email_username', '', 'email');

        if (!empty(CONF_RECAPTACHA_SITEKEY)) {

            $frm->addHtml('', 'htmlNote', '<div class="g-recaptcha" data-sitekey="' . CONF_RECAPTACHA_SITEKEY . '"></div>');

        }

        $fld = $frm->addSubmitButton('&nbsp;', 'btn_submit', Utilities::getLabel('btn_submit'));

        $fld->html_before_field = '<div class="fieldrw">';

        $fld->html_after_field = '&nbsp;&nbsp;<a class="btn blue" href="' . Utilities::generateUrl('user', 'account') . '">' . Utilities::getLabel('L_Back_to_login') . '</a></div>';

        $frm->setTableProperties('width="100%" border="0" cellspacing="10" cellpadding="0" class="formTable"');

        $frm->setRequiredStarWith('x');

        $frm->setValidatorJsObjectName('system_validator');

        $frm->setExtra('class="siteForm"');

        $frm->setTableProperties(' width="100%" border="0" class="tableform"');

        $frm->captionInSameCell(true);

        $frm->setFieldsPerRow(1);

        $frm->setJsErrorDisplay('afterfield');

        return $frm;

    }



    protected function validateEmail($email) {

        return filter_var($email, FILTER_VALIDATE_EMAIL);

    }



    function reset_password($param) {

        Utilities::checkIsAlreadyLoggedIn();

        $attr = explode(".", $param);

        $user_id = intval($attr[0]);

        $token = trim($attr[1]);

        //$email=urldecode($email);

        if ($user_id < 1 || strlen($token) != 25) {

            Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_REQUEST'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        if (!$user_reset_pwd_data = $this->User->validateToken($user_id, $token)) {

            Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_TOCKEN'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        if (!$user = $this->User->getUser(array('id' => $user_reset_pwd_data["uprr_user_id"]))) {

            Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_REQUEST'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        if ($user['user_status'] != 1) {

            Message::addErrorMessage(Utilities::getLabel('M_ERROR_YOUR_ACCOUNT_NOT_ACTIVE'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        if ($user['user_is_deleted'] == 1) {

            Message::addErrorMessage(Utilities::getLabel('M_ERROR_YOUR_ACCOUNT_IS_DELETED'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        if ($user['user_email_verified'] != 1) {

            Message::addErrorMessage(sprintf(Utilities::getLabel('M_ERROR_YOU_HAVE_NOT_VERIFIED_EMAIL'), '<a href="' . Utilities::generateUrl('user', 'resend_verification_code') . '" class="greenAnchorLink">' . Utilities::getLabel('M_Click_here') . '</a>'));

            Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

        }

        $frm = $this->getResetPwdForm();

        $post = Syspage::getPostedVar();

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])) {

            if (!$frm->validate($post)) {

                Message::addErrorMessage($frm->getValidationErrors());

            } else {

                if ($this->User->updatePassword(intval($user['user_id']), $post['user_password'])) {

                    Message::addMessage(Utilities::getLabel('M_Password_successfully_updated'));

                    Utilities::redirectUser(Utilities::generateUrl('user', 'account'));

                } else {

                    Message::addErrorMessage(Utilities::getLabel('M_ERROR_INVALID_REQUEST'));

                }

            }

        }

        $frm->fill(array('user_id' => $user_id));

        $this->set('frm', $frm);

        $this->_template->render();

    }



    private function getResetPwdForm() {

        $frm = new Form('frmResetPassword', 'frmStrengthPassword');

        $frm->setTableProperties(' width="100%" border="0" class="tableform"');

        $frm->setExtra('class="siteForm"');

        $frm->captionInSameCell(true);

        //$frm->setRequiredStarWith('not-required');

        $frm->addHiddenField('', 'user_id', '', 'user_id');

        $fld = $frm->addPasswordField("<label>" . Utilities::getLabel('f_new_password') . "</label>", 'user_password', '', 'check-password');

        $fld->requirements()->setRequired();

        $fld->requirements()->setLength(4, 20);

        $fld->html_before_field = '<div id="check-password-result">';

        $fld->html_after_field = '</div>';

        $fld1 = $frm->addPasswordField("<label>" . Utilities::getLabel('f_Confirm_new_password') . "</label>", 'user_password1');

        $fld1->requirements()->setRequired();

        $fld1->requirements()->setCompareWith('user_password');

        $fld = $frm->addSubmitButton('&nbsp;', 'btn_submit', Utilities::getLabel('btn_submit'));

        $fld->html_before_field = '<div class="fieldrw">';

        $fld->html_after_field = '</div>';

        $frm->setJsErrorDisplay('afterfield');

        return $frm;

    }



    function confirm_email($code) {

        if ($this->User->confirmEmail($code)) {

            Message::addMessage(Utilities::getLabel('M_SUCCESS_USER_ACCOUNT_VERIFIED'));

            $redirect_url = Utilities::generateUrl('account');

        } else {

            Message::addErrorMessage($this->User->getError());

            $redirect_url = Utilities::generateUrl('user', 'account');

        }

        Utilities::redirectUser($redirect_url);

    }



    function check_username_availability() {

        $post = Syspage::getPostedVar();

        $username = $post["username"];

        if (preg_match('/^[A-Za-z][A-Za-z0-9_.]{3,20}$/', $username)) {

            //$user = $this->User->getUser(array('user_username'=>$username));

            $user = $this->User->getUser(array('user_username' => $username), false, true);

            if ($user) {

                $userCheck = 2;

                $message = sprintf(Utilities::getLabel('F_Username_not_available'), $username);

            } else {

                $userCheck = 1;

                $message = sprintf(Utilities::getLabel('F_Username_available'), $username);

            }

        }

        $arr = array("check" => $userCheck, "message" => $message);

        echo json_encode($arr);

    }



    function check_email_availability() {

        $post = Syspage::getPostedVar();

        $email = $post["email"];

        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {

            $user = $this->User->getUser(array('user_email' => $email), false, true);

            if ($user) {

                $userCheck = 2;

                $message = sprintf(Utilities::getLabel('F_Email_not_available'), $email);

            } else {

                $userCheck = 1;

                $message = sprintf(Utilities::getLabel('F_Email_available'), $email);

            }

        }

        $arr = array("check" => $userCheck, "message" => $message);

        echo json_encode($arr);

    }



    function become_seller() {

        $extraPageObj = new Extrapage();

        $arr_contact_content = $extraPageObj->getExtraBlockData(array('identifier' => 'BECOME_SELLER_CONTENT_BLOCK'));

        $become_seller_content = $arr_contact_content["epage_content"];

        $become_seller_content = str_replace('{SITEROOT}', CONF_WEBROOT_URL, $become_seller_content);

        $this->set('become_seller_content', $become_seller_content);

        $this->_template->render();

    }



    private function getAdvertiserLoginForm() {

        $frm = new Form('frmLogin');

        $frm->setAction('?');

        $frm->setExtra('class="siteForm"');

        $frm->captionInSameCell(true);

        $redirect_url = Utilities::getSessionRedirectUrl();

        Utilities::unsetSessionRedirectUrl();

        $frm->addHiddenField('', 'redirect_url', $redirect_url);

        $fld = $frm->addRequiredField(Utilities::getLabel('L_Advertiser_Username_or_Email'), 'username', '', 'username', 'placeholder="' . Utilities::getLabel('L_Advertiser_Username_or_Email') . '"');

        $fld = $frm->addPasswordField(Utilities::getLabel('L_Advertiser_Password'), 'password', '', 'password', 'placeholder="' . Utilities::getLabel('L_Advertiser_Password') . '"');

        $fld->requirements()->setRequired(true);

        $frm->addHtml('', '', '<div class="remember">

            <input type="checkbox" name="remember" value="1">

            ' . Utilities::getLabel('L_Remember_Me') . ' <br>

            <p><a href="' . Utilities::generateUrl('user', 'forgot_password') . '">' . Utilities::getLabel('L_FORGOT_PASSWORD') . '</a></p>

        </div>

        <input type="submit" name="btn_login" value="' . Utilities::getLabel('L_LOGIN_NOW') . '" class="form-submit">');

        $frm->setValidatorJsObjectName('frm_validator');

        $frm->setJsErrorDisplay('afterfield');

        return $frm;

    }



    function advertise($p) {

        $loginFrm = $this->getAdvertiserLoginForm();

        $post = Syspage::getPostedVar();

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_login'])) {

            if (!$loginFrm->validate($post)) {

                Message::addErrorMessage($loginFrm->getValidationErrors());

            } else {

                // Check how many login attempts have been made.

                $login_info = $this->User->getLoginAttempts($post['username']);

                if ($login_info && ($login_info['ulogin_total'] >= Settings::getSetting("CONF_MAX_LOGIN_ATTEMPTS")) && strtotime('-1 hour') < strtotime($login_info['ulogin_date_modified'])) {

                    Message::addErrorMessage(Utilities::getLabel('L_Warning_Max_Login_Attempts'));

                    Utilities::redirectUser(Utilities::generateUrl('user', 'advertise'));

                }

                $pwd = Utilities::encryptPassword($post['password']);

                if ($this->User->login($post['username'], $post['password']) === true) {

                    $this->User->deleteLoginAttempts($post['username']);

                    if (isset($post['remember'])) {

                        $remember_token = substr(md5(rand(1, 99999) . microtime()), 1, 25);

                        $data = array('user_id' => $this->User->getAttribute("user_id"), 'remember_token' => $remember_token, 'token_expiry' => date('Y-m-d H:i:s', strtotime("+10 DAYS")));

                        if ($this->User->updateRememberMeToken($data) === true) {

                            setcookie('remembertoken', $remember_token, time() + 3600 * 24 * 10, '/');

                        }

                    }

                    Utilities::redirectUser(Utilities::generateUrl('account'));

                } else {

                    $this->User->addLoginAttempt($post['username']);

                    $loginFrm->fill($post);

                    Message::addErrorMessage($this->User->getError());

                }

                Utilities::redirectUserReferer();

            }

        }

        $this->set('loginFrm', $loginFrm);

        $this->_template->render(true, true, '', false, true, false);

    }



    private function getRegistrationForm() {

        $frm = new Form('frmRegistration', 'frmRegistration');

        $frm->setFieldsPerRow(2);

        $frm->setAction('?');

        $frm->setValidatorJsObjectName('system_validator');

        $frm->setExtra('class="siteForm form-double-cell"');

        $frm->captionInSameCell(true);

        $frm->addHtml('<span class="panelTitleHeading">' . Utilities::getLabel('L_Your_Personal_Details') . '</span>', 'htmlNote', '')->merge_cells = 2;

        $fld = $frm->addTextBox('<label>' . Utilities::getLabel('F_Username') . '</label>', 'user_username', '', '', ' class="check_username"');

        $fld->requirements()->setUsername(true);

        $fld->requirements()->setRequired(true);

        $fld->html_after_field = '<span id="ajax_availability_username"></span>';

        $fld = $frm->addEmailField('<label>' . Utilities::getLabel('F_Email') . '</label>', 'user_email', '', '', ' class="check_email"');

        $fld->html_after_field = '<span id="ajax_availability_email"></span>';

        $frm->addRequiredField('<label>' . Utilities::getLabel('F_Name') . '</label>', 'user_name');

        $fld_phn = $frm->addRequiredField('<label>' . Utilities::getLabel('F_Phone') . '</label>', 'user_phone');

        $fld_phn->requirements()->setRegularExpressionToValidate('^[\s()+-]*([0-9][\s()+-]*){5,20}$');

        $frm->addHtml('<span class="panelTitleHeading">' . Utilities::getLabel('L_Your_Company_Details') . '</span>', 'htmlNote', '')->merge_cells = 2;

        $fld = $frm->addTextBox('<label>' . Utilities::getLabel('L_Company') . '</label>', 'user_company')->merge_cells = 2;

        $fld = $frm->addTextArea('<label>' . Utilities::getLabel('L_Brief_Profile') . '</label>', 'user_profile');

        $fld->html_after_field = '<small>' . Utilities::getLabel('L_Please_tell_us_something_about_yourself') . '</small>';

        $frm->addTextArea('<label>' . Utilities::getLabel('L_What_kind_products_services_advertise') . '</label>', 'user_products_services');

        $frm->addHtml('<span class="panelTitleHeading">' . Utilities::getLabel('L_Your_Password') . '</span>', 'htmlNote', '')->merge_cells = 2;

        $fld_password = $frm->addPasswordField('<label>' . Utilities::getLabel('M_Password') . '</label>', 'user_password', '', 'user_password', '');

        $fld_password->requirements()->setRequired(true);

        $fld_password->requirements()->setLength(4, 20);

        $fld = $frm->addPasswordField('<label>' . Utilities::getLabel('M_Confirm_new_password') . '</label>', 'confirm_pwd', '', 'confirm_pwd');

        $fld->requirements()->setRequired(true);

        $fld->requirements()->setCompareWith('user_password', 'eq');

        $fld = $frm->addHtml('&nbsp;', '', sprintf(Utilities::getLabel('L_By_using_agree_terms_conditions'), '<a target="_blank" href="' . Utilities::generateUrl('cms', 'view', array(Settings::getSetting("CONF_ACCOUNT_TERMS"))) . '">' . Utilities::getLabel('L_Terms_Conditions') . '</a>'))->merge_cells = 2;

        $fld = $frm->addSubmitButton('', 'btn_signup', Utilities::getLabel('BTN_REGISTER'));

        $frm->setJsErrorDisplay('afterfield');

        $frm->setLeftColumnProperties('width="25%"');

        $frm->setTableProperties('width="100%" border="0" class="tbl-twocell" cellpadding="0" cellspacing="0"');

        return $frm;

    }



    private function getQuickLoginForm() {

        $frm = new Form('frmLogin');

        $frm->setFieldsPerRow(3);

        $frm->setRequiredStarPosition('N');

        $frm->setAction(Utilities::generateUrl('user', 'advertise'));

        $frm->setExtra('class="siteForm seller-login form-double-cell"');

        $frm->captionInSameCell(false);

        $redirect_url = Utilities::getSessionRedirectUrl();

        Utilities::unsetSessionRedirectUrl();

        $frm->addHiddenField('', 'redirect_url', $redirect_url);

        $fld = $frm->addRequiredField('', 'username', '', 'username', 'title="' . Utilities::getLabel('L_Username_or_Email') . '" placeholder="' . Utilities::getLabel('L_Username_or_Email') . '"');

        $fld = $frm->addPasswordField('', 'password', '', 'password', 'title="' . Utilities::getLabel('L_Password') . '" placeholder="' . Utilities::getLabel('L_Password') . '"');

        $fld->requirements()->setRequired(true);

        $fld = $frm->addSubmitButton('', 'btn_login', Utilities::getLabel('L_LOGIN_NOW'));

        $frm->addHtml('&nbsp;', 'forgot', '<a href="' . Utilities::generateUrl('user', 'forgot_password') . '" class="forgot fl">' . Utilities::getLabel('L_FORGOT_PASSWORD') . '</a>');

        $frm->setValidatorJsObjectName('frm_validator');

        $frm->setJsErrorDisplay('afterfield');

        return $frm;

    }



    function advertiser_registration() {

        Utilities::checkIsAlreadyLoggedIn();

        $quickLoginFrm = $this->getQuickLoginForm();

        $registrationFrm = $this->getRegistrationForm();

        $post = Syspage::getPostedVar();

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_signup'])) {

            if (!$registrationFrm->validate($post)) {

                Message::addErrorMessage($registrationFrm->getValidationErrors());

            } else {

                if (!$registrationFrm->validate($post)) {

                    Message::addErrorMessage($registrationFrm->getValidationErrors());

                } else {

                    $arr = array_merge($post, array("user_email_verified" => 0, "user_type" => CONF_ADVERTISER_USER_TYPE));

                    if ($this->User->addUser($arr)) {

                        if (Settings::getSetting("CONF_AUTO_LOGIN_REGISTRATION") && ($p != "api")) {

                            $pwd = Utilities::encryptPassword($post['user_password']);

                            if ($this->User->login($post['user_username'], $pwd, true) === true) {

                                Utilities::redirectUser(Utilities::generateUrl('account'));

                            }

                        }

                        $user_verified = $this->User->getAttribute('user_email_verified');

                        if ($user_verified == 1) {

                            Message::addMessage(Utilities::getLabel('M_SUCCESS_USER_SIGNUP_VERIFIED'));

                        } else {

                            Message::addMessage(Utilities::getLabel('M_SUCCESS_USER_SIGNUP'));

                        }

                    } else {

                        $registrationFrm->fill($post);

                        Message::addErrorMessage($this->User->getError());

                    }

                }

            }

        }

        $this->set('quickLoginFrm', $quickLoginFrm);

        $this->set('RegistrationFrm', $registrationFrm);

        $this->_template->render(false, false, '', false, true, false);

    }



    function fees() {



        $data = array();

        $mydb = Syspage::getdb();

        $fees_query = "select * from tbl_extra_pages where epage_identifier='FEES_CONTENT_BLOCK'";

        $fees_obj = $mydb->query($fees_query);

        if ($fees_obj->num_rows > 0) {

            $data = $mydb->fetch_all($fees_obj);

        }



        $this->set('data', $data);

        $this->_template->render();

    }



    function about_us() {

        $data = array();

        $mydb = Syspage::getdb();

        $fees_query = "select * from tbl_extra_pages where epage_identifier='ABOUT_US_CONTENT_BLOCK'";

        $fees_obj = $mydb->query($fees_query);

        if ($fees_obj->num_rows > 0) {

            $data = $mydb->fetch_all($fees_obj);

        }



        $this->set('data', $data);

        $this->_template->render();

    }


    function iscron_reset(){
        $this->db = Syspage::getdb(); 
        $update_query = "UPDATE  tbl_url_cron SET iscronRun = '0' where status='1'";
        $ordred_products = $this->db->query($update_query);

    }




    function product_cron(){

        $this->db = Syspage::getdb();

        set_time_limit(0);

       // $fees_query = "SELECT * FROM `tbl_url_cron` a INNER JOIN `tbl_url_column_setting` b ON a.id=b.cron_id WHERE a.status = '1'";
         $fees_query = "SELECT * FROM `tbl_url_cron` a INNER JOIN `tbl_url_column_setting` b ON a.id=b.cron_id WHERE a.status = '1'  AND a.isCronRun='0' LIMIT 0,3";


        $fees_obj = $this->db->query($fees_query);

       /* echo "<pre>";
        print_r($fees_obj);*/
       /* die;*/
        if ($fees_obj->num_rows > 0) {

            $data = $this->db->fetch_all($fees_obj);

            foreach ($data as $key => $value) {


                $update_iscron_reset_query = "UPDATE  tbl_url_cron SET iscronRun = '1' where user_id='".$value['user_id']."' AND shop_id='".$value['shop_id']."'";
                $this->db->query($update_iscron_reset_query);
                //echo "<br>";


            	/*echo "<pre>===";

            	print_r($value);

            	echo "</pre>";

            	die;*/

                $user_id = $value['user_id'];

                $shop_id = $value['shop_id'];

                

                $get_colm = "SELECT * FROM `tbl_url_column_setting` a WHERE user_id = '$user_id' AND shop_id = '$shop_id' LIMIT 1";



                $get_colm_result = $this->db->query($get_colm);



                $get_colm_result_data = $this->db->fetch_all($get_colm_result);

          

                $colm_structure = array(

                      'prod_name' => $get_colm_result_data[0]['prod_name'],                  

                      'prod_sku'  => $get_colm_result_data[0]['prod_sku'],                  

                      'prod_slug' => $get_colm_result_data[0]['prod_slug'],                  

                      'prod_retail_price' => $get_colm_result_data[0]['prod_retail_price'],                  

                      'prod_sale_price' => $get_colm_result_data[0]['prod_sale_price'],                  

                      'prod_stock' => $get_colm_result_data[0]['prod_stock'],                  

                      'prod_long_desc' => $get_colm_result_data[0]['prod_long_desc'],                  

                      'prod_image' => $get_colm_result_data[0]['prod_image'],                  

                );

                

               /* echo "<pre>";

                print_r($colm_structure);

                echo "</pre>";     

                echo "=========";   

                 die;   */

                $user_nodes = array();

                $rows = $this->xml_parser($value['url'],'rows',$colm_structure);

                $xml_node_count = $this->xml_node_count($value['url'],'rows',$colm_structure);

               



               $column = $this->xml_parser($value['url'],'column',array());

               $_SESSION['avail_column'] = array_unique($column);



                /*echo "<pre> first==";

                print_r($rows);

                echo "</pre><br>";

                die;*/



                if($xml_node_count){

                    $count_elemenet =  $xml_node_count;

                }else{

                    $count_elemenet = count($rows[$data['prod_name']]);

                }

                

              /*  echo "count:-";

                 echo $count_elemenet;

                 echo "<br>";*/



                $category_id = $value['category_id'];

                $shipping_id = $value['shipping_id'];



               // $count_elemenet = count($rows[$value['prod_name']]);

                $array = array();



                for ($i=0; $i < $count_elemenet; $i++) { 

                    $p_name = str_replace("'", "",$rows[$value['prod_name']][$i]);

                    $p_name = str_replace('"', '',$p_name);

                    $p_name = str_replace(',', '',$p_name);

                    $p_name = str_replace('/', '-', $p_name);

                    $p_name = str_replace('&', '-', $p_name);

                    $slug   = str_replace("'", "",$rows[$value['prod_slug']][$i]);

                    $slug   = str_replace('"', '',$slug);

                    $slug   = str_replace(',', '',$slug);

                    $slug   = str_replace('&', '',$slug);
                    $slug = str_replace('/', '-', $slug);


                   

                    $desc   = str_replace("'", "",$rows[$value['prod_long_desc']][$i]);

                    $desc   = str_replace('"', '',$desc);

                    $desc   = str_replace(',', '',$desc);

                    $desc   = str_replace('&', '',$desc);
                    $desc = str_replace('/', '-', $desc);
                   

                    $sku    = str_replace("'", "",$rows[$value['prod_sku']][$i]);

                    $sku    = str_replace('"', '',$sku);

                    $sku    = str_replace(',', '',$sku);
                    
                    $sku    = str_replace('&', '',$sku);
                    $sku = str_replace('/', '-', $sku);
                    //echo $rows[$value['prod_name']][$i]."<br> ";

                    $rows[$value['prod_stock']][$i];

                    

                    $product_stock = 0;           

                    switch (trim($rows[$value['prod_stock']][$i])) {

                        case 'in stock':

                         //   echo "In stock<br>";

                             $product_stock = 4;

                            break;

                         case 'out of stock': 

                            // "out of stock<br>";

                             $product_stock = 0;

                            break;

                        default:

                        	//echo "default<br>";

                             $product_stock = $rows[$value['prod_stock']][$i];

                            break;

                    }

 						//echo "<br>";

                       $array[] = array(

                            'prod_name'         =>trim($p_name),

                            'prod_sku'          =>$sku,

                            'prod_slug'         =>$slug,

                            'prod_retail_price' =>(float)$rows[$value['prod_retail_price']][$i],

                            'prod_sale_price'   =>(float)$rows[$value['prod_sale_price']][$i],

                            'prod_stock'        =>$product_stock,

                            'prod_long_desc'    =>$desc,

                            'prod_image'        =>$rows[$value['prod_image']][$i],

                        );

                }

           /* echo "<br><pre>EXACT";

            print_r($array);

            echo "</pre>";

           die(); */  
            //echo "<br>";
         $delete_query="UPDATE  tbl_products SET prod_status = '0' where is_imported = '1' AND 

                            prod_added_by = '".$user_id."' AND prod_shop='".$shop_id."'";

          // echo "<br>";

            $ordred_products=$this->db->query($delete_query);

           

            foreach ($array as $ke => $val) {

                   //  if user select the  Delete all old data before Import

                   // echo "<br> select";        

                    $select_query="select * from tbl_products where

                        prod_added_by = '".$user_id."' AND  prod_name = '".trim($val['prod_name'])."' AND prod_shop='".$shop_id."'";

                    //    echo "<br>";

                         

                   

                    $ordred_products=$this->db->query($select_query);

                    $ordred_product=$this->db->fetch_all($ordred_products);

                    $product_id = $ordred_product['0']['prod_id'];



                    if($product_id){
                      //  echo "update:->".$product_id.'<br>';
                        $prod_retail_price = $val['prod_retail_price']?$val['prod_retail_price']:0;

                        

                        $prod_stock = $val['prod_stock']?$val['prod_stock']:0;

                            //echo "update<br>";



                             $query1 = "UPDATE `tbl_products` SET

                            `prod_name`='".trim($val['prod_name'])."',

                            `prod_status` = '1',

                            `prod_sku`   = '".$val['prod_sku']."',

                            `prod_slug`='".$val['prod_slug']."',

                            `prod_image`='".$val['prod_image']."',

                            `prod_retail_price`='".$val['prod_retail_price']."',

                            `prod_sale_price`='".$val['prod_sale_price']."',

                            `prod_stock`='".$prod_stock."',

                            `shipping_class_id` = '".$shipping_id."',

                            `is_imported` = '1'

                             WHERE prod_id='".$product_id."'";

                           //  echo "<br>";



                            if($this->db->query($query1)){                        

                           

                           $query2 = "UPDATE `tbl_prod_details` SET 

                                prod_long_desc = '".$val['prod_long_desc']."',

                                prod_meta_title='".$val['prod_name']."'

                                WHERE prod_id ='".$product_id."'";

        

                            $this->db->query($query2); 

                            $where_alias = "products_id=$product_id";

                            $query3 = "UPDATE `tbl_url_alias` SET url_alias_keyword ='".$val['prod_name']."' WHERE url_alias_query = '".$where_alias."'";

                            

                            $query4 = "UPDATE `tbl_product_images` SET image_file = '".$val['prod_image']."' WHERE image_prod_id='".$product_id."' ";

                                $this->db->query($query4);

                            }

                    

                        }else {
                            echo "Add:->".$product_id.'<br>';
                            $final_product_collection = array(

                                'prod_added_by'=> $user_id,

                                'prod_category'=>$category_id,

                                'prod_sku'=>trim($val['prod_sku']),

                                'prod_type' =>'1',

                                'prod_name'=>trim($val['prod_name']),

                                'shipping_class_id'=>$shipping_id,

                                'prod_slug'=>$val['prod_slug'],

                                'prod_image'=>$val['prod_image'],

                                'prod_brand'=>0,

                                'prod_model'=>'',

                                'prod_shop'=>$shop_id,

                                'prod_retail_price'=>$val['prod_retail_price']?$val['prod_retail_price']:0,

                                'prod_sale_price'=>$val['prod_sale_price']?$val['prod_sale_price']:0,

                                'prod_shipping'=>0,

                                'prod_stock'=>$val['prod_stock']?$val['prod_stock']:0,

                                'prod_shipping_country'=>0,

                                'prod_min_order_qty'=>1,

                                'prod_subtract_stock'=>1,

                                'prod_requires_shipping'=>1,

                                'prod_track_inventory'=>0,

                                'prod_threshold_stock_level'=>0,

                                'prod_group'=>0,

                                'prod_markup'=>0,

                                'prod_markup_type'=>'',

                                'prod_view_count'=>0,

                                'prod_sold_count'=>0,    

                                'prod_condition'=>'N',

                                'prod_condition_level'=>0,

                                'prod_added_on'=>date('Y-m-d h:i:s'),

                                'prod_published_on'=>date('Y-m-d h:i:s'),

                                'prod_status'=>'1',

                                'prod_is_expired'=>0,

                                'prod_is_deleted'=>0,

                                'prod_display_order'=>1,

                                'prod_enable_cod_orders'=>0,

                                'is_imported' => '1',

                            );

                            

                            // echo "<pre>Insert<br>";

                            // print_r($final_product_collection);

                            // echo "</pre><br>";

                                            

                            if ($this->db->insert_from_array('tbl_products', 

                             $final_product_collection)){

                                $inserted_item_id = $this->db->insert_id();

                                $product_details = array(

                                    'prod_id'=>$inserted_item_id,

                                    'prod_length'=>'',

                                    'prod_width' =>'',

                                    'prod_height'=>'',

                                    'prod_weight'=>'',

                                    'prod_length_class'=>'CM',

                                    'prod_weight_class'=>'KG',

                                    'prod_tags'=>$val['tag'],

                                    'prod_youtube_video'=>'',

                                    'prod_short_desc'=>$val['prod_long_desc'],

                                    'prod_long_desc'=>$val['prod_long_desc'],

                                    'prod_meta_title'=>$val['prod_name'],

                                    'prod_meta_title'=>'',

                                    'prod_meta_keywords'=>'',

                                    'prod_meta_description'=>'',

                                    'prod_featuered'=>'',

                                    'prod_ship_free'=>'',

                                    'prod_tax_free'=>'',

                                    'prod_available_date'=>date('Y-m-d'),

                                );

                                $this->db->insert_from_array('tbl_prod_details',$product_details);

                            }

                            $url_a = "products_id=".$inserted_item_id;

                            $url_alias = array(

                                            'url_alias_query'=>$url_a,

                                            'url_alias_keyword'=>$val['prod_name'],

                                    );



                            $this->db->insert_from_array('tbl_url_alias', $url_alias);

                            $image_info = array(

                                            'image_prod_id'=>$inserted_item_id,

                                            'image_session'=>'',

                                            'image_file'=>$val['prod_image'],

                                            'image_default'=>'',

                                            'image_temp'=>'',

                                            'image_ordering'=>'',

                                        );

                            $this->db->insert_from_array('tbl_product_images', $image_info);

                        }

                }

            }

        }

    

    }

        function xml_parser($url,$type,$user_nodes=array()){
       // echo $url."<br>";
        set_time_limit(0);
        $xml = file_get_contents($url);
        $data = simplexml_load_file($url);
        $column = array();

        if($data->channel)
        {
            $object= new DOMDocument();
            $object->loadXML($xml);
            $result=array();
            $get_all_node[] = array();
            $k = 0;
            foreach($object->getElementsByTagName("item") as $item){ 
                foreach($item->childNodes as $node){ 
                   if($node instanceof DOMElement)        
                    {    
                        $get_all_node[$k][] = $node->tagName;
                    }  
                }
            $k++;
            }
              
            static $m = 0;
             $arr_push = array();
                 foreach($object->getElementsByTagName("item") as $item){ 
                    $length = $item->childNodes->length;
                  // echo "vishnu";
                    /*for the dandashop count is 13 and for the other one is 6*/

                    if (strpos($url, 'dandashop') !== false) {
                        
                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'xtremexccessories') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'mcastore.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'shop-in-a-bundle.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, '4akid1.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'digitalstarco.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'perfect-deals1.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else{
                        if($length!=6){
                            continue;
                        }
                    } 
                    $total_avail_column = $_SESSION['avail_column'];
                    $total_avail_column_1 = $_SESSION['avail_column'];
                    $i = 0;
                    foreach($item->childNodes as $node){ 
                       if($node instanceof DOMElement)        
                        {  
                         if(!in_array($m,$arr_push)){
                            $b =  array_diff($user_nodes, $get_all_node[$m]);
                            if($b){
                                foreach ($b as $y => $e) {
                                }
                            }
                        }
                        if (($key = array_search($node->tagName, $total_avail_column)) !== false) {
                            unset($total_avail_column[$key]);
                        }
                        $column[] = $node->tagName;
                        $row[$node->tagName][]=$node->textContent;
                    
                        if(count($total_avail_column)=='1'){
                            $keys = array_keys($total_avail_column);
                        }
                        array_push($arr_push,$m);
                        } 
                   $i++;
                    }
                $m++;
                
                if(count($total_avail_column)){
                    foreach ($total_avail_column as $key => $value) {
                        if (($key = array_search($value, $total_avail_column_1)) !== false) {
                            unset($total_avail_column_1[$key]);
                        }
                        $end_array = end($total_avail_column_1);
                        $end_game = $row[$end_array];
                        foreach ($end_game as $key_2 => $value_2) {
                            $last_key = $key_2;
                        }
                        $row[$value][$last_key] = '';   
                    }
                }
            }
        }
       /*7*/
        if($type=='column'){
            return $column;
        }else if($type=='rows'){
            return $row;
        }else{
            die('Xml not valid for parsing.');
        }
    }

    function xml_node_count($url,$type,$user_nodes=array()){
        set_time_limit(0);
        $xml = file_get_contents($url);
        $data = simplexml_load_file($url);
        $column = array();
        if($data->channel) 
        {
            $object= new DOMDocument();
            $object->loadXML($xml);
            $result=array();
            $get_all_node[] = array();
            $k = 0;
            foreach($object->getElementsByTagName("item") as $item){ 
                 $length = $item->childNodes->length;
                    
                    if (strpos($url, 'dandashop') !== false) {
                        
                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'xtremexccessories') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'mcastore.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'shop-in-a-bundle.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, '4akid1.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'digitalstarco.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else if(strpos($url, 'perfect-deals1.myshopify.com') !== false){

                        if($length!=13){
                            continue;
                        }
                    }else{
                        if($length!=6){
                            continue;
                        }
                    } 

                foreach($item->childNodes as $node){ 
                   if($node instanceof DOMElement)        
                    {    
                        $get_all_node[$k][] = $node->tagName;
                    }  
                }
            $k++;
            }
            return  count($get_all_node);
        }
    }

  /*  function xml_parser($url,$type,$user_nodes=array()){

      

        set_time_limit(0);

        $xml = file_get_contents($url);

        $data = simplexml_load_file($url);

        $column = array();



        if($data->channel)

        {

            $object= new DOMDocument();

            $object->loadXML($xml);

            $result=array();

            $get_all_node[] = array();

            $k = 0;

            foreach($object->getElementsByTagName("item") as $item){ 

                foreach($item->childNodes as $node){ 

                   if($node instanceof DOMElement)        

                    {    

                        $get_all_node[$k][] = $node->tagName;

                    }  

                }

            $k++;

            }

              

            static $m = 0;

             $arr_push = array();

                 foreach($object->getElementsByTagName("item") as $item){ 

                    $length = $item->childNodes->length;

                  

                    /*for the dandashop count is 13 and for the other one is 6*/



            /*        if (strpos($url, 'dandashop') !== false) {

                        

                        if($length!=13){

                            continue;

                        }

                    }else if(strpos($url, 'xtremexccessories') !== false){



                        if($length!=13){

                            continue;

                        }

                    }else if(strpos($url, 'mcastore.myshopify.com') !== false){



                        if($length!=13){

                            continue;

                        }

                    }else{

                        if($length!=6){

                            continue;

                        }

                    } 

                    $total_avail_column = $_SESSION['avail_column'];

                    $total_avail_column_1 = $_SESSION['avail_column'];

                    $i = 0;

                    foreach($item->childNodes as $node){ 

                       if($node instanceof DOMElement)        

                        {  

                         if(!in_array($m,$arr_push)){

                            $b =  array_diff($user_nodes, $get_all_node[$m]);

                            if($b){

                                foreach ($b as $y => $e) {

                                }

                            }

                        }

                        if (($key = array_search($node->tagName, $total_avail_column)) !== false) {

                            unset($total_avail_column[$key]);

                        }

                        $column[] = $node->tagName;

                        $row[$node->tagName][]=$node->textContent;

                    

                        if(count($total_avail_column)=='1'){

                            $keys = array_keys($total_avail_column);

                        }

                        array_push($arr_push,$m);

                        } 

                   $i++;

                    }

                $m++;

                

                if(count($total_avail_column)){

                    foreach ($total_avail_column as $key => $value) {

                        if (($key = array_search($value, $total_avail_column_1)) !== false) {

                            unset($total_avail_column_1[$key]);

                        }

                        $end_array = end($total_avail_column_1);

                        $end_game = $row[$end_array];

                        foreach ($end_game as $key_2 => $value_2) {

                            $last_key = $key_2;

                        }

                        $row[$value][$last_key] = '';   

                    }

                }

            }

        }



        if($type=='column'){

            return $column;

        }else if($type=='rows'){

            return $row;

        }else{

            die('Xml not valid for parsing.');

        }

    }*/



   /* function xml_node_count($url,$type,$user_nodes=array()){

        set_time_limit(0);

        $xml = file_get_contents($url);

        $data = simplexml_load_file($url);

        $column = array();

        if($data->channel) 

        {

            $object= new DOMDocument();

            $object->loadXML($xml);

            $result=array();

            $get_all_node[] = array();

            $k = 0;

            foreach($object->getElementsByTagName("item") as $item){ 

                 $length = $item->childNodes->length;

                    

                      if (strpos($url, 'dandashop') !== false) {

                        

                        if($length!=13){

                            continue;

                        }

                    }else if(strpos($url, 'xtremexccessories') !== false){



                        if($length!=13){

                            continue;

                        }

                    }else if(strpos($url, 'mcastore.myshopify.com') !== false){



                        if($length!=13){

                            continue;

                        }

                    }else{

                        if($length!=6){

                            continue;

                        }

                    } 



                foreach($item->childNodes as $node){ 

                   if($node instanceof DOMElement)        

                    {    

                        $get_all_node[$k][] = $node->tagName;

                    }  

                }

            $k++;

            }

            return  count($get_all_node);

        }

    }*/

    function cronCart()
    {
        $mydb = Syspage::getdb();

        $cartUsers = $mydb->query("select * from `tbl_user_cart` where `cart_user_id` IN (SELECT `user_id` FROM `tbl_users`) AND `cart_details` NOT IN ('a:0:{}', '') AND `updated_at` < DATE_SUB(NOW(), INTERVAL 1 DAY) AND `updated_at` > DATE_SUB(NOW(), INTERVAL 2 DAY)");
//        $cartUsers = $mydb->query("select * from `tbl_user_cart` where `cart_user_id` IN (SELECT `user_id` FROM `tbl_users`) AND `cart_details` NOT IN ('a:0:{}', '') AND `updated_at` IS NOT NULL");

        if ($cartUsers->num_rows > 0) {

            $userCarts = $mydb->fetch_all($cartUsers);

            foreach ($userCarts as $userCart) {

                $cart_details = unserialize($userCart["cart_details"]);
                $userID = $userCart['cart_user_id'];

                $userDetail = $mydb->query("select * from `tbl_users` where `user_id` = '$userID' LIMIT 1");

                if ($userDetail->num_rows > 0) {

                    $user = $mydb->fetch_all($userDetail);

                    $userEmail = $user[0]['user_email'];

                    $products = [];
                    foreach ($cart_details as $key => $quantity) {
                        $product = unserialize(base64_decode($key));

                        $product_id = $product['product_id'];
                        $pObj = new Products();
                        $pObj->joinWithDetailTable();
                        $pObj->joinWithCategoryTable();
                        $pObj->joinWithBrandsTable();
                        $pObj->joinWithPromotionsTable();
                        $pObj->addSpecialPrice();
                        $pObj->selectFields(array('tp.*', 'tpd.*', 'ts.shop_id', 'ts.shop_user_id', 'ts.shop_name', 'ts.shop_title', 'ts.shop_enable_cod_orders', 'tu.user_id', 'tu.user_name', 'tu.user_username', 'tu.user_email', 'IF(prod_stock >0, "1", "0" ) as available', 'tpb.brand_name'));
                        $product_info = $pObj->getData($product_id, array("available_date" => 1));

                        $product_info['cart_quantity'] = $quantity;

                        if($product_info)
                            $products[] = $product_info;
                    }

                    $tableFormat = $this->_generateTableFormat($products);

                    if (Utilities::sendMailTpl($userEmail, 'abandoned_cart_email', array(
                        '{site_domain}' => CONF_SERVER_PATH,
                        '{website_name}' => Settings::getSetting("CONF_WEBSITE_NAME"),
                        '{user_full_name}' => htmlentities(trim($user[0]['user_name'])),
                        '{order_products_table_format}' => $tableFormat,
                    ))) {
                        echo 'CRON mail sent successfully';
                    } else {
                        echo 'There was an error while sending an CRON mail';
                    }
                } else {
                    echo "User not found";
                }
            }
        } else {
            echo "Cart Items not found";
        }
    }

    private function _generateTableFormat($products = [])
    {
        $str = '<table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;">
	<tr>
	<td width="50%" style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">' . Utilities::getLabel('L_Product') . '</td>
	<td width="10%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;">' . Utilities::getLabel('L_Qty') . '</td>
	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">' . Utilities::getLabel('L_Price') . '</td>
	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">' . Utilities::getLabel('L_Total') . '</td>
	</tr>';

        $i = 1;
        foreach ($products as $val) {
            if(isset($val['prod_id']) && $val["prod_name"] && $val["prod_sale_price"]) {
                $str .= '<tr>
				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">
    				<a href="' . Utilities::generateAbsoluteUrl('products', 'view', array($val["prod_id"]), "/") . '" style="font-size:13px; color:#333;">' . $val["prod_name"] . '
				</td>
			    <td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">' . $val['cart_quantity'] . '</td>
    			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">' . $val["prod_sale_price"] . '</td>
    			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">' . ($val['cart_quantity'] * ($val["prod_sale_price"])) . '</td>
			</tr>';
            }

            $i++;
        }


        return $str;
    }


}

