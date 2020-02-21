-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2017 at 11:25 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing_yokart_installer_v7.1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_image` varchar(255) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_full_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_is_super_admin` tinyint(1) NOT NULL,
  `admin_dashboard_layout` tinyint(4) NOT NULL,
  `admin_dashboard_color` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_image`, `admin_username`, `admin_password`, `admin_full_name`, `admin_email`, `admin_is_super_admin`, `admin_dashboard_layout`, `admin_dashboard_color`) VALUES
(1, '', 'welcome', '18751331f169b666b1c8f577879b720a', 'Ravi Bhalla', 'info@yo-kart.com', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_password_reset_requests`
--

CREATE TABLE `tbl_admin_password_reset_requests` (
  `apr_admin_id` int(11) NOT NULL,
  `apr_token` varchar(20) NOT NULL,
  `apr_expiry` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_permissions`
--

CREATE TABLE `tbl_admin_permissions` (
  `ap_admin_id` int(11) NOT NULL,
  `ap_module` int(11) NOT NULL,
  `ap_permission` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_permission_names`
--

CREATE TABLE `tbl_admin_permission_names` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(255) NOT NULL,
  `permission_controller` varchar(200) NOT NULL,
  `permission_action` varchar(200) NOT NULL,
  `permission_display_order` tinyint(4) NOT NULL,
  `permission_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin_permission_names`
--

INSERT INTO `tbl_admin_permission_names` (`permission_id`, `permission_name`, `permission_controller`, `permission_action`, `permission_display_order`, `permission_is_active`) VALUES
(1, 'Dashboard', 'admin', 'default_action', 1, 1),
(2, 'Manage Shops', 'shops', '', 2, 1),
(3, 'Product Brands', 'brands', '', 3, 1),
(4, 'Product Categories', 'categories', '', 4, 1),
(5, 'Manage Products', 'products', '', 5, 1),
(6, 'Product Options', 'options', '', 6, 1),
(7, 'Filter Groups', 'filtergroups', '', 7, 0),
(8, 'Customers/Users', 'users', '', 11, 1),
(9, 'Navigations', 'navigations', '', 13, 1),
(10, 'Content Pages', 'cms', '', 14, 1),
(11, 'Content Block', 'extrapage', '', 15, 1),
(12, 'Language Labels', 'labels', '', 16, 1),
(13, 'FAQ Categories', 'faqcategories', '', 19, 1),
(14, 'FAQ Management', 'faqs', '', 20, 1),
(15, 'Testimonials', 'testimonials', '', 21, 1),
(16, 'Report Reasons', 'reportreasons', '', 22, 1),
(17, 'Return Reasons', 'returnreasons', '', 23, 1),
(18, 'Order Statuses', 'orderstatus', '', 50, 0),
(19, 'Shipping Companies', 'shippingcompany', '', 24, 1),
(20, 'Shipping Durations', 'shippingduration', '', 25, 1),
(21, 'Zone Management', 'zones', '', 27, 1),
(22, 'Countries Management', 'countries', '', 28, 1),
(23, 'States Management', 'states', '', 29, 1),
(24, 'General Settings', 'configurations', '', 30, 1),
(25, 'View Server Info', 'configurations', 'view_server_info', 33, 1),
(26, 'Manage Email Templates', 'emailtemplates', '', 32, 1),
(27, 'Customer Order', 'orders', '', 34, 1),
(28, 'Vendor Orders', 'vendororders', '', 35, 1),
(29, 'Withdrawal Requests', 'custom', 'withdrawal_requests', 36, 1),
(30, 'Reports', 'reports', '', 38, 1),
(31, 'Messages', 'messages', '', 39, 1),
(32, 'Staff Members', 'users', 'staff', 40, 1),
(33, 'Return Requests', 'custom', 'return_requests', 37, 0),
(36, 'Filters', 'filtergroupoptions', '', 8, 1),
(37, 'Attribute Groups', 'attributegroups', '', 9, 0),
(38, 'Attributes/Specifications\r\n', 'attributes', '', 10, 1),
(39, 'Collections', 'collections', '', 12, 1),
(40, 'Slides Management', 'slides', '', 17, 1),
(41, 'Banner Management', 'banners', '', 18, 1),
(42, 'Discount Coupons', 'coupons', '', 26, 1),
(43, 'Payment Methods', 'paymentmethods', '', 31, 1),
(44, 'Cancel Reasons', 'cancelreasons', '', 22, 1),
(45, 'Order Cancellation Requests', 'custom', 'cancellation_requests', 36, 1),
(46, 'Database Backup & Restore', 'databasebackuprestore', '', 41, 1),
(47, 'Supplier Approval Form', 'users', 'supplier_form', 45, 1),
(48, 'Supplier Approval Requests', 'users', 'supplier_approval_requests', 46, 1),
(49, 'Empty Cart Items ', 'emptycartitems', '', 18, 1),
(50, 'Commission Settings', 'commissions', '', 31, 1),
(51, 'Affiliate Module', 'affiliates', '', 32, 1),
(52, 'Affiliate Commission Settings', 'affiliatecommissions', '', 52, 1),
(53, 'Theme Settings', 'themes', '', 53, 1),
(54, 'Bulk Import/Export', 'importexport', '', 54, 1),
(55, 'Currency Management', 'currency', '', 55, 1),
(56, 'PayPal Adaptive Payments', 'paypaladaptive', '', 56, 1),
(57, 'Product Tags', 'producttags', '', 57, 1),
(58, 'Supplier Requests', 'users', 'supplier_requests', 58, 1),
(59, 'Social Platforms Management', 'socialmedia', '', 59, 1),
(60, 'PPC Fees Settings', 'ppcfees', '', 60, 1),
(61, 'PPC Payment Methods', 'ppcpaymentmethods', '', 61, 1),
(62, 'Manage Advertisers', '', '', 62, 1),
(63, 'Blog Categories', '', '', 63, 1),
(64, 'Blog Posts', '', '', 64, 1),
(65, 'Blog Contributions', '', '', 65, 1),
(66, 'Blog Comments', '', '', 66, 1),
(67, 'Subscription Payment Methods', 'subscriptionpaymentmethods', '', 67, 1),
(68, 'Subscription Packages', 'subscriptionpackagescontroller', '', 68, 1),
(69, 'Subscription Discount Coupons', 'subscriptioncouponscontrollersubscriptionorders', '', 69, 1),
(70, 'Subscription Orders', 'subscriptionorders', '', 70, 1),
(71, 'Smart Recommendations - Weightages', 'smartrecommendations', 'weightages', 71, 1),
(72, 'Smart Recommendations - Products', 'smartrecommendations', '', 72, 1),
(73, 'PPC Promotions', 'ppc', '', 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_remember_me_tokens`
--

CREATE TABLE `tbl_admin_remember_me_tokens` (
  `art_admin_id` int(11) NOT NULL,
  `art_browser` text NOT NULL,
  `art_token` varchar(255) NOT NULL,
  `art_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliates`
--

CREATE TABLE `tbl_affiliates` (
  `affiliate_id` bigint(20) NOT NULL,
  `affiliate_name` varchar(255) NOT NULL,
  `affiliate_username` varchar(255) NOT NULL,
  `affiliate_email` varchar(255) NOT NULL,
  `affiliate_password` varchar(200) NOT NULL,
  `affiliate_phone` varchar(30) NOT NULL,
  `affiliate_company` varchar(255) NOT NULL,
  `affiliate_website` varchar(100) NOT NULL,
  `affiliate_address_1` varchar(255) NOT NULL,
  `affiliate_address_2` varchar(255) NOT NULL,
  `affiliate_city` varchar(100) NOT NULL,
  `affiliate_postcode` varchar(10) NOT NULL,
  `affiliate_country` int(11) NOT NULL,
  `affiliate_state` int(11) NOT NULL,
  `affiliate_profile_image` varchar(200) NOT NULL,
  `affiliate_commission` decimal(10,2) NOT NULL,
  `affiliate_code` varchar(50) NOT NULL,
  `affiliate_tax` varchar(100) NOT NULL,
  `affiliate_payment` varchar(100) NOT NULL,
  `affiliate_cheque` varchar(200) NOT NULL,
  `affiliate_paypal` varchar(200) NOT NULL,
  `affiliate_bank_name` varchar(100) NOT NULL,
  `affiliate_bank_branch_number` varchar(100) NOT NULL,
  `affiliate_bank_swift_code` varchar(100) NOT NULL,
  `affiliate_bank_account_name` varchar(100) NOT NULL,
  `affiliate_bank_account_number` varchar(100) NOT NULL,
  `affiliate_ip` varchar(40) NOT NULL,
  `affiliate_status` tinyint(1) NOT NULL,
  `affiliate_is_approved` tinyint(1) NOT NULL,
  `affiliate_added_on` datetime NOT NULL,
  `affiliate_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliates_remember_me_tokens`
--

CREATE TABLE `tbl_affiliates_remember_me_tokens` (
  `art_affiliate_id` int(11) NOT NULL,
  `art_browser` text NOT NULL,
  `art_token` varchar(255) NOT NULL,
  `art_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliate_commission_settings`
--

CREATE TABLE `tbl_affiliate_commission_settings` (
  `afcommsetting_id` int(11) NOT NULL,
  `afcommsetting_affiliate` bigint(20) NOT NULL,
  `afcommsetting_category` int(11) NOT NULL,
  `afcommsetting_fees` decimal(10,2) NOT NULL,
  `afcommsetting_is_mandatory` tinyint(1) NOT NULL,
  `afcommsetting_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_affiliate_commission_settings`
--

INSERT INTO `tbl_affiliate_commission_settings` (`afcommsetting_id`, `afcommsetting_affiliate`, `afcommsetting_category`, `afcommsetting_fees`, `afcommsetting_is_mandatory`, `afcommsetting_is_deleted`) VALUES
(1, 0, 0, '5.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliate_login`
--

CREATE TABLE `tbl_affiliate_login` (
  `alogin_id` bigint(20) NOT NULL,
  `alogin_username_email` varchar(255) NOT NULL,
  `alogin_ip` varchar(40) NOT NULL,
  `alogin_total` int(11) NOT NULL,
  `alogin_date_added` datetime NOT NULL,
  `alogin_date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliate_password_reset_requests`
--

CREATE TABLE `tbl_affiliate_password_reset_requests` (
  `aprr_affiliate_id` int(11) NOT NULL,
  `aprr_token` varchar(255) NOT NULL,
  `aprr_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliate_transactions`
--

CREATE TABLE `tbl_affiliate_transactions` (
  `atxn_id` bigint(20) NOT NULL,
  `atxn_withdrawal_id` int(11) NOT NULL,
  `atxn_affiliate_id` int(11) NOT NULL,
  `atxn_date` datetime NOT NULL,
  `atxn_credit` decimal(10,4) NOT NULL,
  `atxn_debit` decimal(10,4) NOT NULL,
  `atxn_description` text NOT NULL,
  `atxn_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_affiliate_withdrawal_requests`
--

CREATE TABLE `tbl_affiliate_withdrawal_requests` (
  `afwithdrawal_id` bigint(20) NOT NULL,
  `afwithdrawal_affiliate_id` int(11) NOT NULL,
  `afwithdrawal_amount` decimal(10,4) NOT NULL,
  `afwithdrawal_payment_mode` varchar(100) NOT NULL,
  `afwithdrawal_paypal` varchar(100) NOT NULL,
  `afwithdrawal_cheque` varchar(100) NOT NULL,
  `afwithdrawal_bank_name` varchar(100) NOT NULL,
  `afwithdrawal_bank_branch_number` varchar(100) NOT NULL,
  `afwithdrawal_bank_swift_code` varchar(100) NOT NULL,
  `afwithdrawal_bank_account_name` varchar(100) NOT NULL,
  `afwithdrawal_bank_account_number` varchar(100) NOT NULL,
  `afwithdrawal_comments` text NOT NULL,
  `afwithdrawal_request_date` datetime NOT NULL,
  `afwithdrawal_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attributes`
--

CREATE TABLE `tbl_attributes` (
  `attribute_id` bigint(20) NOT NULL,
  `attribute_group` int(11) NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_display_order` int(11) NOT NULL,
  `attribute_is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attribute_groups`
--

CREATE TABLE `tbl_attribute_groups` (
  `attribute_group_id` bigint(20) NOT NULL,
  `attribute_group_name` varchar(255) NOT NULL,
  `attribute_group_display_order` int(11) NOT NULL,
  `attribute_group_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banks`
--

CREATE TABLE `tbl_banks` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banners`
--

CREATE TABLE `tbl_banners` (
  `banner_id` int(11) NOT NULL,
  `banner_title` varchar(255) NOT NULL,
  `banner_position` int(11) NOT NULL,
  `banner_type` int(11) NOT NULL COMMENT '0=>Image, 1=>html',
  `banner_image_path` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `banner_html` text NOT NULL,
  `banner_status` tinyint(4) NOT NULL,
  `banner_start_date` date NOT NULL,
  `banner_end_date` date NOT NULL,
  `banner_link_newtab` tinyint(4) NOT NULL DEFAULT '1',
  `banner_priority` int(11) NOT NULL,
  `banner_is_deleted` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banners`
--

INSERT INTO `tbl_banners` (`banner_id`, `banner_title`, `banner_position`, `banner_type`, `banner_image_path`, `banner_url`, `banner_html`, `banner_status`, `banner_start_date`, `banner_end_date`, `banner_link_newtab`, `banner_priority`, `banner_is_deleted`) VALUES
(33, 'Banner - 1', 0, 0, 'banner-1.jpg', 'http://www.fatbit.com', '', 1, '0000-00-00', '0000-00-00', 1, 1, 0),
(34, 'Banner - 2', 0, 0, 'banner-2.jpg', '', '', 1, '0000-00-00', '0000-00-00', 1, 2, 0),
(35, 'Banner - 3', 0, 0, 'banner-3.jpg', '', '', 1, '0000-00-00', '0000-00-00', 1, 3, 0),
(36, 'Banner - 4', 0, 0, 'banner-4.jpg', '', '', 1, '0000-00-00', '0000-00-00', 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_attached_files`
--

CREATE TABLE `tbl_blog_attached_files` (
  `file_id` int(11) NOT NULL,
  `file_type` int(11) NOT NULL COMMENT '4=>user-image,5->''artist profile cover photo''6->post main Image,7=>post \r\n\r\nattach files',
  `file_record_id` int(11) NOT NULL,
  `file_record_subid` int(11) NOT NULL,
  `file_physical_path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'For display Only',
  `file_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_contributions`
--

CREATE TABLE `tbl_blog_contributions` (
  `contribution_id` int(11) NOT NULL,
  `contribution_author_first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contribution_author_last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contribution_author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contribution_author_phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `contribution_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contribution_file_display_name` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `contribution_status` tinyint(1) NOT NULL COMMENT '0->Pending, 1->Approved, 2->Posted, 3-\r\n\r\n>Rejected',
  `contribution_date_time` datetime NOT NULL,
  `contribution_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_blog_contributions`
--

INSERT INTO `tbl_blog_contributions` (`contribution_id`, `contribution_author_first_name`, `contribution_author_last_name`, `contribution_author_email`, `contribution_author_phone`, `contribution_file_name`, `contribution_file_display_name`, `contribution_status`, `contribution_date_time`, `contribution_user_id`) VALUES
(1, 'max', 'max', 'max@gmail.com', '8989888', 'AJHogezip', 'A_J_Hoge.zip', 0, '2016-07-02 14:53:25', 0),
(2, 'max', 'max', 'max@gmail.com', '8989888', 'AJHogezip_632206', 'A_J_Hoge.zip', 0, '2016-07-02 14:55:13', 0),
(3, 'shilpa', 'bansal', 'shilpa@dummyid.com', '123456789', 'fortesttxt', 'for test.txt', 1, '2016-07-02 17:20:17', 0),
(4, 'shilpa', 'bansal', 'shilpa@dummyid.com', '', '1pdf', '1.pdf', 0, '2016-07-02 17:45:23', 0),
(5, 'shilpa', 'bansal', 'shilpa1@dummyid.com', '', 'fortesttxt_494093', 'for test.txt', 0, '2016-07-02 17:46:50', 0),
(6, 'test <b>name</b>', 'test <b>name</b>', 'test@dummyid.com', '9999999999', 'license9txt', 'license (9).txt', 0, '2016-07-08 10:31:10', 0),
(7, '<script>alert("test")</script>', '<script>alert("test")</script>', 'shilpa@dummyid.com', '123456789', 'fortesttxt_765739', 'for test.txt', 1, '2016-07-08 11:37:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_meta_data`
--

CREATE TABLE `tbl_blog_meta_data` (
  `meta_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_others` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_record_id` int(11) NOT NULL,
  `meta_record_type` tinyint(4) NOT NULL COMMENT '0->Post, 1->Category'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_blog_meta_data`
--

INSERT INTO `tbl_blog_meta_data` (`meta_id`, `meta_title`, `meta_keywords`, `meta_description`, `meta_others`, `meta_record_id`, `meta_record_type`) VALUES
(1, '', '', '', '', 1, 1),
(2, '', '', '', '', 2, 1),
(3, '', '', '', '', 3, 1),
(4, '', '', '', '', 1, 0),
(5, '', '', '', '', 4, 1),
(6, '', '', '', '', 5, 1),
(7, '', '', '', '', 2, 0),
(8, '', '', '', '', 3, 0),
(9, '', '', '', '', 4, 0),
(10, '', '', '', '', 5, 0),
(11, '', '', '', '', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_post`
--

CREATE TABLE `tbl_blog_post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `post_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_seo_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name will be used in urls and must be seo \r\n\r\nfriendly',
  `post_status` tinyint(1) NOT NULL COMMENT '0->Draft, 1-Published',
  `post_comment_status` tinyint(1) NOT NULL COMMENT '0->Not Open, 1->Open',
  `post_date_time` datetime NOT NULL,
  `post_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_published` datetime NOT NULL,
  `post_contributor_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `post_view_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_blog_post`
--

INSERT INTO `tbl_blog_post` (`post_id`, `post_title`, `post_short_description`, `post_content`, `post_seo_name`, `post_status`, `post_comment_status`, `post_date_time`, `post_last_modified`, `post_published`, `post_contributor_name`, `post_view_count`) VALUES
(5, 'Lorem Ipsum is simply dummy text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<div>Lorem Ipsum is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry''s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum</div>\r\n<div>Lorem Ipsum is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry''s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum</div>\r\n<div>Lorem Ipsum is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry''s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum</div>', 'lorem-ipsum-is-simply-dummy-text', 1, 0, '2016-07-11 13:26:38', '2016-07-11 02:26:38', '2016-07-11 13:26:38', '', 0),
(6, 'Lorem Ipsum is simply dummy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', '<div>Lorem Ipsum is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry''s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum</div>\r\n<div>Lorem Ipsum is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry''s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum</div>\r\n<div>Lorem Ipsum is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry''s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum</div>', 'lorem-ipsum-is-simply-dummy', 1, 0, '2016-07-11 13:27:46', '2016-07-11 02:27:46', '2016-07-11 13:33:12', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_post_categories`
--

CREATE TABLE `tbl_blog_post_categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8_unicode_ci NOT NULL,
  `category_seo_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name will be used in urls and must be seo \r\n\r\nfriendly',
  `category_status` tinyint(4) NOT NULL COMMENT '0->Inactive, 1->Active',
  `category_date_time` datetime NOT NULL,
  `category_parent` int(11) NOT NULL,
  `category_display_order` int(11) NOT NULL,
  `category_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_blog_post_categories`
--

INSERT INTO `tbl_blog_post_categories` (`category_id`, `category_title`, `category_description`, `category_seo_name`, `category_status`, `category_date_time`, `category_parent`, `category_display_order`, `category_code`) VALUES
(1, 'Category1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis metus, feugiat et odio et, malesuada sollicitudin orci. Aenean mollis, nisi et suscipit ornare, ex tortor laoreet massa, at congue lectus elit eu massa. Quisque efficitur odio ipsum, ut convallis tortor scelerisque ut. Maecenas semper ornare massa efficitur condimentum. Nullam sed ex sapien. Vivamus vel arcu blandit, sollicitudin diam ut, congue velit. Mauris quis mauris felis. Suspendisse rutrum justo vestibulum lacinia tempus. Donec felis orci, commodo nec egestas sit amet, venenatis ut mi. Nullam eget accumsan leo, a laoreet sem.', 'category1', 1, '2016-06-29 14:45:10', 0, 0, '00001'),
(2, 'subcate 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis metus, feugiat et odio et, malesuada sollicitudin orci. Aenean mollis, nisi et suscipit ornare, ex tortor laoreet massa, at congue lectus elit eu massa. Quisque efficitur odio ipsum, ut convallis tortor scelerisque ut. Maecenas semper ornare massa efficitur condimentum. Nullam sed ex sapien. Vivamus vel arcu blandit, sollicitudin diam ut, congue velit. Mauris quis mauris felis. Suspendisse rutrum justo vestibulum lacinia tempus. Donec felis orci, commodo nec egestas sit amet, venenatis ut mi. Nullam eget accumsan leo, a laoreet sem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis metus, feugiat et odio et, malesuada sollicitudin orci. Aenean mollis, nisi et suscipit ornare, ex tortor laoreet massa, at congue lectus elit eu massa. Quisque efficitur odio ipsum, ut convallis tortor scelerisque ut. Maecenas semper ornare massa efficitur condimentum. Nullam sed ex sapien. Vivamus vel arcu blandit, sollicitudin diam ut, congue velit. Mauris quis mauris felis. Suspendisse rutrum justo vestibulum lacinia tempus. Donec felis orci, commodo nec egestas sit amet, venenatis ut mi. Nullam eget accumsan leo, a laoreet sem.', 'subcate-1', 1, '2016-06-29 14:45:28', 1, 2, '0000100002'),
(3, 'subcate 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis metus, feugiat et odio et, malesuada sollicitudin orci. Aenean mollis, nisi et suscipit ornare, ex tortor laoreet massa, at congue lectus elit eu massa. Quisque efficitur odio ipsum, ut convallis tortor scelerisque ut. Maecenas semper ornare massa efficitur condimentum. Nullam sed ex sapien. Vivamus vel arcu blandit, sollicitudin diam ut, congue velit. Mauris quis mauris felis. Suspendisse rutrum justo vestibulum lacinia tempus. Donec felis orci, commodo nec egestas sit amet, venenatis ut mi. Nullam eget accumsan leo, a laoreet sem.', 'subcate-2', 1, '2016-06-29 14:45:42', 1, 1, '0000100003'),
(4, 'Ecommerce site', '', 'ecommerce-site', 1, '2016-06-29 15:59:47', 0, 0, '00004'),
(5, 'Shop', '', 'shop', 1, '2016-06-29 16:00:14', 4, 0, '0000400005');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_post_category_relation`
--

CREATE TABLE `tbl_blog_post_category_relation` (
  `relation_post_id` int(11) NOT NULL,
  `relation_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_blog_post_category_relation`
--

INSERT INTO `tbl_blog_post_category_relation` (`relation_post_id`, `relation_category_id`) VALUES
(5, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_post_comments`
--

CREATE TABLE `tbl_blog_post_comments` (
  `comment_id` int(11) NOT NULL,
  `comment_post_id` int(11) NOT NULL,
  `comment_author_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `comment_author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment_content` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL COMMENT '0->Pending, 1->Approved, 2->Deleted',
  `comment_date_time` datetime NOT NULL,
  `comment_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `comment_user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_post_images`
--

CREATE TABLE `tbl_blog_post_images` (
  `post_image_id` int(11) NOT NULL,
  `post_image_post_id` int(11) NOT NULL,
  `post_image_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_image_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_blog_post_images`
--

INSERT INTO `tbl_blog_post_images` (`post_image_id`, `post_image_post_id`, `post_image_file_name`, `post_image_default`) VALUES
(8, 6, '109384_banner.jpg', 1),
(9, 6, '454320_1223.jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cancel_reasons`
--

CREATE TABLE `tbl_cancel_reasons` (
  `cancelreason_id` int(11) NOT NULL,
  `cancelreason_title` varchar(255) NOT NULL,
  `cancelreason_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cancel_reasons`
--

INSERT INTO `tbl_cancel_reasons` (`cancelreason_id`, `cancelreason_title`, `cancelreason_description`) VALUES
(1, 'I placed a duplicate order', 'I placed a duplicate order'),
(3, 'I ordered the wrong product(s)', 'I ordered the wrong product(s)'),
(4, 'The supplier did not ship the order on time as agreed', 'The supplier did not ship the order on time as agreed'),
(5, 'The supplier said the product(s) i want is out of stock', 'The supplier said the product(s) i want is out of stock'),
(6, 'The supplier refuses to ship the product(s)', 'The supplier refuses to ship the product(s)'),
(7, 'I am not able to contact the supplier', 'I am not able to contact the supplier'),
(8, 'Other reason(s) caused by the supplier', 'Other reason(s) caused by the supplier');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(11) NOT NULL,
  `category_type` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_slug` varchar(200) NOT NULL,
  `category_description` text NOT NULL,
  `category_parent` int(11) NOT NULL,
  `category_featured` tinyint(4) NOT NULL,
  `category_file` varchar(255) DEFAULT NULL,
  `category_meta_title` varchar(255) NOT NULL,
  `category_meta_keywords` text NOT NULL,
  `category_meta_description` text NOT NULL,
  `category_display_order` tinyint(4) NOT NULL,
  `category_status` tinyint(1) NOT NULL,
  `category_is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_type`, `category_name`, `category_slug`, `category_description`, `category_parent`, `category_featured`, `category_file`, `category_meta_title`, `category_meta_keywords`, `category_meta_description`, `category_display_order`, `category_status`, `category_is_deleted`) VALUES
(11, 2, 'Trending Questions', 'trending-questions', '<h4 style="box-sizing: border-box; font-family: ''Open Sans'', sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin: 0px; font-size: 18px; padding: 0px; background-color: rgb(255, 255, 255);"><br />\r\n	</h4>', 0, 0, '', 'Trending Questions', '', '', 1, 1, 0),
(12, 2, 'Report a Problem', 'report-a-problem', '', 0, 0, '', 'Report a Problem', '', '', 2, 1, 0),
(13, 2, 'Get Started', 'get-started', '', 0, 0, '', 'Get Started', '', '', 3, 1, 0),
(14, 2, 'Open a Shop', 'open-a-shop', '', 0, 0, '', 'Open a Shop', '', '', 4, 1, 0),
(15, 2, 'Create and Edit Listings', 'create-and-edit-listings', '', 0, 0, '', 'Create and Edit Listings', '', '', 5, 1, 0),
(16, 2, 'Collect Credit Card Payments', 'collect-credit-card-payments', '', 0, 0, '', 'Collect Credit Card Payments', '', '', 5, 1, 0),
(17, 2, 'Make a Purchase', 'make-a-purchase', '', 0, 0, '', 'Make a Purchase', '', '', 7, 1, 0),
(18, 2, 'Shopping Features', 'shopping-features', '', 0, 0, '', 'Shopping Features', '', '', 8, 1, 0),
(26, 1, 'Electronics', 'electronics', 'Electronics', 0, 0, '', 'Electronics', 'Electronics', 'Electronics', 1, 1, 0),
(37, 1, 'Entertainment', 'entertainment', 'Entertainment', 0, 0, '', 'Entertainment', 'Entertainment', 'Entertainment', 2, 1, 0),
(38, 1, 'Fashion', 'fashion', '', 0, 0, '', 'Fashion', '', '', 3, 1, 0),
(39, 1, 'Home', 'home', 'Home', 0, 0, '', 'Home', '', '', 4, 1, 0),
(40, 1, 'Sports', 'sports', '', 0, 0, '', 'Sports', '', '', 5, 1, 0),
(41, 1, 'Art & Collectables', 'art-collectables', 'Art & Collectables', 0, 0, '', 'Art & Collectables', '', '', 6, 1, 0),
(241, 1, 'Books & Media', 'books-media', 'Books & Media', 0, 1, NULL, 'Books & Media', 'Books & Media', 'Books & Media', 7, 1, 0),
(242, 1, 'Baby & Kids', 'baby-kids', 'Baby & Kids', 0, 1, NULL, 'Baby & Kids', 'Baby & Kids', 'Baby & Kids', 8, 1, 0),
(248, 2, 'test', '', 'test', 0, 0, NULL, '', '', '', 1, 1, 0),
(251, 1, 'Cars', 'cars', '', 0, 0, NULL, '', '', '', 1, 1, 0),
(252, 1, 'Test', 'test', '', 0, 0, NULL, '', '', '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_filter`
--

CREATE TABLE `tbl_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collections`
--

CREATE TABLE `tbl_collections` (
  `collection_id` int(11) NOT NULL,
  `collection_name` varchar(255) NOT NULL,
  `collection_display_title` varchar(255) NOT NULL,
  `collection_image` varchar(255) NOT NULL,
  `collection_status` tinyint(1) NOT NULL,
  `collection_display_order` int(11) NOT NULL,
  `collection_type` char(1) NOT NULL,
  `collection_criteria` tinyint(1) NOT NULL,
  `collection_primary_records` int(11) NOT NULL,
  `collection_child_records` int(11) NOT NULL,
  `collection_is_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collection_brands`
--

CREATE TABLE `tbl_collection_brands` (
  `dctc_collection_id` int(11) NOT NULL,
  `dctc_brand_id` int(11) NOT NULL,
  `dctc_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collection_categories`
--

CREATE TABLE `tbl_collection_categories` (
  `dctc_collection_id` int(11) NOT NULL,
  `dctc_category_id` int(11) NOT NULL,
  `dctc_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collection_products`
--

CREATE TABLE `tbl_collection_products` (
  `dctc_collection_id` int(11) NOT NULL,
  `dctc_product_id` int(11) NOT NULL,
  `dctc_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collection_shops`
--

CREATE TABLE `tbl_collection_shops` (
  `dctc_collection_id` int(11) NOT NULL,
  `dctc_shop_id` int(11) NOT NULL,
  `dctc_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commission_settings`
--

CREATE TABLE `tbl_commission_settings` (
  `commsetting_id` int(11) NOT NULL,
  `commsetting_product` bigint(20) NOT NULL,
  `commsetting_vendor` bigint(20) NOT NULL,
  `commsetting_category` int(11) NOT NULL,
  `commsetting_fees` decimal(10,2) NOT NULL,
  `commsetting_is_mandatory` tinyint(1) NOT NULL,
  `commsetting_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_commission_settings`
--

INSERT INTO `tbl_commission_settings` (`commsetting_id`, `commsetting_product`, `commsetting_vendor`, `commsetting_category`, `commsetting_fees`, `commsetting_is_mandatory`, `commsetting_is_deleted`) VALUES
(1, 0, 0, 0, '10.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_configurations`
--

CREATE TABLE `tbl_configurations` (
  `conf_var` varchar(255) NOT NULL,
  `conf_val` text NOT NULL,
  `conf_serialized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_configurations`
--

INSERT INTO `tbl_configurations` (`conf_var`, `conf_val`, `conf_serialized`) VALUES
('CONF_ACCOUNT_TERMS', '10', 0),
('CONF_ACTIVATE_SEPARATE_SIGNUP_FORM', '1', 0),
('CONF_ACTIVE_SUBSCRIPTION_STATUS', '2', 0),
('CONF_ADDITIONAL_ALERT_EMAILS', '', 0),
('CONF_ADDRESS', 'Your Online Store\r\n# 45/1-2 Annswamy Mudalian Road\r\nNear Post Office\r\nHudson Lane', 0),
('CONF_ADMIN_APPROVAL_REGISTRATION', '0', 0),
('CONF_ADMIN_APPROVAL_SUPPLIER_REGISTRATION', '1', 0),
('CONF_ADMIN_EMAIL', 'yokartv7.1@dummyid.com', 0),
('CONF_ADMIN_LOGO', '2015-12-03.png', 0),
('CONF_ADVERTISER_ALERT_EMAIL', '1', 0),
('CONF_ADVERTISER_REQUIRES_APPROVAL', '1', 0),
('CONF_ADVERTISER_TERMS', '10', 0),
('CONF_AFFILIATES_ALERT_EMAIL', '1', 0),
('CONF_AFFILIATES_AUTO_COMMISSION', '0', 0),
('CONF_AFFILIATES_COMMISSION', '5.00', 0),
('CONF_AFFILIATES_REQUIRES_APPROVAL', '1', 0),
('CONF_AFFILIATES_TERMS', '10', 0),
('CONF_AFFILIATE_SIGNUP_COMMISSION', '10', 0),
('CONF_ALLOW_CANCELLATION_ORDER_STATUS', 'a:1:{i:0;s:1:"2";}', 1),
('CONF_ALLOW_CHECKOUT', '0', 0),
('CONF_ALLOW_GUEST_REVIEWS', '1', 0),
('CONF_ALLOW_REVIEWS', '1', 0),
('CONF_ALLOW_USED_PRODUCTS_LISTING', '1', 0),
('CONF_ANALYTICS_ACCESS_TOKEN', '1/Rc6-USuBEstqWePSzCrvb9f1nDgkXwg2XYx8f3AV0nY', 0),
('CONF_ANALYTICS_CLIENT_ID', '', 0),
('CONF_ANALYTICS_ID', '', 0),
('CONF_ANALYTICS_SECRET_KEY', '', 0),
('CONF_APPLE_TOUCH_ICON', 'apple-touch-icon.png', 0),
('CONF_AUTO_APPROVE_PRODUCTS', '0', 0),
('CONF_AUTO_LOGIN_REGISTRATION', '1', 0),
('CONF_AUTO_LOGOUT_PASSWORD_CHANGE', '1', 0),
('CONF_AUTO_RESTORE_ON', '0', 0),
('CONF_AWEBER_SIGNUP_CODE', '', 0),
('CONF_BUYER_CAN_SEE_SELLER_TAB', '1', 0),
('CONF_BUYER_ORDER_STATUS', 'a:9:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:2:"13";i:3;s:1:"4";i:4;s:1:"5";i:5;s:1:"6";i:6;s:1:"8";i:7;s:1:"7";i:8;s:1:"9";}', 1),
('CONF_BUYER_SELLER_INDIVIDUAL_MODE', '1', 0),
('CONF_CANCELLED_SUBSCRIPTION_STATUS', '5', 0),
('CONF_CHECKOUT_TERMS', '9', 0),
('CONF_CHECK_STOCK', '1', 0),
('CONF_CLASSIFIED_LISTING_FEES', '129', 0),
('CONF_COD_MIN_WALLET_BALANCE', '1000', 0),
('CONF_COD_PAYMENT_METHOD', '18', 0),
('CONF_COMPLETED_ORDER_STATUS', 'a:2:{i:0;s:1:"7";i:1;s:1:"9";}', 1),
('CONF_CONEKTA_ENABLED', '1', 0),
('CONF_CONEKTA_PAYMENT_MODE', '0', 0),
('CONF_CONEKTA_PRIVATE_KEY', 'key_omVTb8Dr9SZKMY6AzoW4Qg', 0),
('CONF_CONEKTA_PUBLIC_KEY', 'key_OGGkrV6byYpyPQGP5x184tA', 0),
('CONF_CONTACT_EMAIL', 'info@dummyid.com', 0),
('CONF_COUNTRY', '240', 0),
('CONF_CPC_BANNER', '2.0', 0),
('CONF_CPC_PRODUCT', '0.50', 0),
('CONF_CPC_SHOP', '1.00', 0),
('CONF_CURRENCY', 'USD', 0),
('CONF_CURRENCY_SYMBOL', '$', 0),
('CONF_CURR_PROD_UPLOAD_DIR', '', 0),
('CONF_CUSTOMER_BOUGHT_ITEMS_CART_PAGE', '20', 0),
('CONF_CUSTOMER_BOUGHT_ITEMS_PRODUCT_PAGE', '20', 0),
('CONF_DATE_FORMAT_MYSQL', '%Y-%m-%d', 0),
('CONF_DATE_FORMAT_PHP', 'M d, Y', 0),
('CONF_DEFAULT_CANCEL_ORDER_STATUS', '8', 0),
('CONF_DEFAULT_COD_ORDER_STATUS', '14', 0),
('CONF_DEFAULT_ORDERS_STATUS', '1', 0),
('CONF_DEFAULT_ORDER_STATUS', '1', 0),
('CONF_DEFAULT_PAID_ORDERS_STATUS', '3', 0),
('CONF_DEFAULT_PAID_ORDER_STATUS', '2', 0),
('CONF_DEFAULT_REVIEW_STATUS', '0', 0),
('CONF_DEFAULT_SHIPPING_ORDER_STATUS', '5', 0),
('CONF_DEF_ITEMS_PER_PAGE_ADMIN', '15', 0),
('CONF_DEF_ITEMS_PER_PAGE_CATALOG', '30', 0),
('CONF_DEF_LIST_DESC_LIMIT', '100', 0),
('CONF_DIGITAL_DOWNLOAD_STATUS', 'a:3:{i:0;s:2:"13";i:1;s:1:"7";i:2;s:1:"9";}', 1),
('CONF_DIGITAL_FILE_EXT_ALLOWED', 'zip\r\nrar', 0),
('CONF_DIGITAL_MAX_FILE_SIZE', '1024000', 0),
('CONF_DISPLAY_CURRENCY_SYMBOL', 'R', 0),
('CONF_DISPLAY_PRICE_COMMISSION', '0', 0),
('CONF_DISP_INC_TAX', '1', 0),
('CONF_EMAIL_LOGO', '2015-12-05.png', 0),
('CONF_EMAIL_VERIFICATION_REGISTRATION', '0', 0),
('CONF_ENABLE_AUTO_SELLER_DASHBOARD', '1', 0),
('CONF_ENABLE_BUYING_OWN_PRODUCTS', '0', 0),
('CONF_ENABLE_COD_PAYMENTS', '0', 0),
('CONF_ENABLE_COD_SELLER_NOTIFICATION', '1', 0),
('CONF_ENABLE_DIGITAL_PRODUCTS', '0', 0),
('CONF_ENABLE_FACEBOOK_LOGIN', '0', 0),
('CONF_ENABLE_GOOGLEPLUS_LOGIN', '0', 0),
('CONF_ENABLE_LIVECHAT', '', 0),
('CONF_ENABLE_NEWSLETTER_SUBSCRIPTION', '1', 0),
('CONF_ENABLE_REFERRER_MODULE', '1', 0),
('CONF_ENABLE_SELLER_SUBSCRIPTION', '0', 0),
('CONF_FACEBOOK_APP_ID', '', 0),
('CONF_FACEBOOK_APP_SECRET', '', 0),
('CONF_FAVICON', 'favicon.ico', 0),
('CONF_FEATURED_ITEMS_HOME_PAGE', '8', 0),
('CONF_FILE_EXT_ALLOWED', 'zip\r\ntxt\r\npng\r\nJpeg\r\njpe\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\ndocx', 0),
('CONF_FILE_MIME_ALLOWED', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n"application/zip"\r\napplication/x-zip\r\n"application/x-zip"\r\napplication/x-zip-compressed\r\n"application/x-zip-compressed"\r\napplication/rar\r\n"application/rar"\r\napplication/x-rar\r\n"application/x-rar"\r\napplication/x-rar-compressed\r\n"application/x-rar-compressed"\r\napplication/octet-stream\r\n"application/octet-stream"\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\napplication/vnd.openxmlformats-officedocument.wordprocessingml.document\r\napplication/msword\r\ntext/plain\r\nimage/x-icon', 0),
('CONF_FOOTER_LOGO_GRAPHIC', 'f-logo.png', 0),
('CONF_FRIEND_URL_ENABLED', '1', 0),
('CONF_FROM_EMAIL', 'from-email@dummyid.com', 0),
('CONF_FROM_NAME', 'YoKart Online Store', 0),
('CONF_FRONT_LOGO', 'logo-resized.svg', 0),
('CONF_FRONT_MOBILE_LOGO_ICON', 'android-icon-72x72.png', 0),
('CONF_FRONT_THEME', 'theme-0', 0),
('CONF_GOOGLEPLUS_CLIENT_ID', '', 0),
('CONF_GOOGLEPLUS_CLIENT_SECRET', '', 0),
('CONF_GOOGLEPLUS_DEVELOPER_KEY', '', 0),
('CONF_IMAGE_MIME_ALLOWED', 'image/png\r\nimage/jpeg\r\nimage/gif\r\nimage/svg+xml\r\nimage/x-icon', 0),
('CONF_INVOICE_FORMAT', '0000702', 0),
('CONF_INVOICE_PREFIX', 'INV-2014-00', 0),
('CONF_LANGUAGE', 'en', 0),
('CONF_LENGTH_CLASS', 'MM', 0),
('CONF_LISTING_FEE', '2.00', 0),
('CONF_LISTING_FEE_ENABLED', '1', 0),
('CONF_LIVE_CHAT_CODE', '', 0),
('CONF_LOGIN_DISPLAY_PRICES', '1', 0),
('CONF_MAILCHIMP_KEY', '', 0),
('CONF_MAILCHIMP_LIST_ID', '', 0),
('CONF_MAINTENANCE', '0', 0),
('CONF_MAINTENANCE_TEXT', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur erat nec nibh accumsan interdum. Duis pharetra, orci a sodales commodo, nibh libero auctor felis, ut eleifend tortor ligula et urna. </div>\r\n<div>&nbsp;</div>\r\n<div>Aliquam ut lectus ac eros consectetur hendrerit sed non justo. Praesent pulvinar, dui ut aliquam iaculis, sapien ex ornare dui, nec finibus lorem ipsum eget dui. Integer sollicitudin congue mauris, id rutrum neque porttitor sed.&nbsp;</div>', 0),
('CONF_MAX_COD_ORDER_LIMIT', '10000', 0),
('CONF_MAX_COMMISSION', '5000', 0),
('CONF_MAX_FREE_PRODUCTS', '5', 0),
('CONF_MAX_LOGIN_ATTEMPTS', '5', 0),
('CONF_MAX_NUMBER_PRODUCT_ADDONS', '5', 0),
('CONF_MAX_WITHDRAW_LIMIT', '1000', 0),
('CONF_META_DESCRIPTION', 'My Meta description will go here', 0),
('CONF_META_KEYWORD', 'My Meta keywords will go here', 0),
('CONF_MIN_COD_ORDER_LIMIT', '50', 0),
('CONF_MIN_INTERVAL_WITHDRAW_REQUESTS', '7', 0),
('CONF_MIN_PRODUCT_PRICE', '10', 0),
('CONF_MIN_WALLET_BALANCE', '100', 0),
('CONF_MIN_WITHDRAW_LIMIT', '50', 0),
('CONF_NEWSLETTER_SYSTEM', 'Mailchimp', 0),
('CONF_NEW_ACCOUNT_EMAIL', '1', 0),
('CONF_NEW_ORDER_EMAIL', '1', 0),
('CONF_NEW_SUBSCRIPTION_EMAIL', '1', 0),
('CONF_NOTIFY_ADMIN_REGISTRATION', '1', 0),
('CONF_PAGE_TITLE', '++++ Welcome to Yokart Online Store  ++++', 0),
('CONF_PAYMENT_PRODUCT_DAYS', '10', 0),
('CONF_PENDING_SUBSCRIPTION_STATUS', '1', 0),
('CONF_PPC_PRODUCTS_HOME_PAGE', '4', 0),
('CONF_PPC_PRODUCTS_HOME_PAGE_CAPTION', 'Featured Products', 0),
('CONF_PPC_SHOPS_HOME_PAGE', '4', 0),
('CONF_PPC_SHOPS_HOME_PAGE_CAPTION', 'Featured Shops', 0),
('CONF_PROCESSING_ORDER_STATUS', 'a:4:{i:0;s:2:"13";i:1;s:1:"4";i:2;s:1:"5";i:3;s:1:"6";}', 1),
('CONF_PROCESS_ORDER_REFUND_CANCELLATION', 'R_P', 0),
('CONF_PRODUCT_META_TITLE_MANDATORY', '1', 0),
('CONF_PRODUCT_MODEL_MANDATORY', '1', 0),
('CONF_PRODUCT_SKU_MANDATORY', '1', 0),
('CONF_PURCHASE_ORDER_STATUS', 'a:6:{i:0;s:1:"2";i:1;s:1:"4";i:2;s:1:"5";i:3;s:1:"6";i:4;s:1:"7";i:5;s:1:"9";}', 1),
('CONF_RECAPTCHA_SECRET_KEY', '', 0),
('CONF_RECAPTCHA_SITE_KEY', '', 0),
('CONF_RECHARGE_INVOICE_FORMAT', '', 0),
('CONF_RECOMMENDED_ITEMS_HOME_PAGE', '20', 0),
('CONF_RECOMMENDED_ITEMS_PRODUCT_PAGE', '20', 0),
('CONF_REGISTRATION_REFEREE_REWARD_POINTS', '10', 0),
('CONF_REGISTRATION_REFEREE_REWARD_POINTS_VALIDITY', '90', 0),
('CONF_REGISTRATION_REFERRER_REWARD_POINTS', '10', 0),
('CONF_REGISTRATION_REFERRER_REWARD_POINTS_VALIDITY', '90', 0),
('CONF_REPLY_TO_EMAIL', 'reply-to@dummyid.com', 0),
('CONF_RETURN_EXCHANGE_READY_ORDER_STATUS', 'a:2:{i:0;s:1:"5";i:1;s:1:"6";}', 1),
('CONF_RETURN_REQUEST_APPROVED_ORDER_STATUS', '9', 0),
('CONF_RETURN_REQUEST_ORDER_STATUS', '13', 0),
('CONF_RETURN_REQUEST_WITHDRAWN_ORDER_STATUS', '7', 0),
('CONF_REVIEW_ALERT_EMAIL', '1', 0),
('CONF_REVIEW_READY_ORDER_STATUS', 'a:4:{i:0;s:1:"5";i:1;s:1:"6";i:2;s:1:"7";i:3;s:1:"9";}', 1),
('CONF_SALES_ORDER_STATUS', '0', 0),
('CONF_SALE_REFEREE_REWARD_POINTS', '10', 0),
('CONF_SALE_REFEREE_REWARD_POINTS_VALIDITY', '90', 0),
('CONF_SALE_REFERRER_REWARD_POINTS', '10', 0),
('CONF_SALE_REFERRER_REWARD_POINTS_VALIDITY', '90', 0),
('CONF_SELL_SITENAME_PAGE', '{SITEROOT}user/become_seller', 0),
('CONF_SEND_EMAIL', '1', 0),
('CONF_SEND_SMTP_EMAIL', '0', 0),
('CONF_SHIPSTATION_API_KEY', '', 0),
('CONF_SHIPSTATION_API_SECRET_KEY', '', 0),
('CONF_SHIPSTATION_API_STATUS', '0', 0),
('CONF_SITE_COMM_PRODUCT_SOLD', '8', 0),
('CONF_SITE_FAX', '333-222-111', 0),
('CONF_SITE_OWNER', 'Yokart', 0),
('CONF_SITE_PHONE', '1800-272-172', 0),
('CONF_SITE_TAX', '2', 0),
('CONF_SITE_TRACKER_CODE', '<site tracker code></site tracker code>', 0),
('CONF_SMTP_HOST', '', 0),
('CONF_SMTP_PASSWORD', '', 0),
('CONF_SMTP_PORT', '', 0),
('CONF_SMTP_SECURE', 'tls', 0),
('CONF_SMTP_USERNAME', '', 0),
('CONF_SOCIAL_FEED_FACEBOOK_POST_CAPTION', 'I am currently shopping at %s Online Store. Join me there and earn yourself discounts on your orders.', 0),
('CONF_SOCIAL_FEED_FACEBOOK_POST_DESCRIPTION', 'I am currently shopping at %s Online Store. Join me there and earn yourself discounts on your orders.', 0),
('CONF_SOCIAL_FEED_FACEBOOK_POST_TITLE', 'Click on this link to enjoy discounts on %s Online Store.', 0),
('CONF_SOCIAL_FEED_IMAGE', '2015-12-05.png', 0),
('CONF_SOCIAL_FEED_TWITTER_POST_TITLE', 'Click on this link to enjoy discounts on %s Online Store.', 0),
('CONF_SUBSCRIPTION_EXPIRY_EMAIL', '1', 0),
('CONF_SUBSCRIPTION_EXPIRY_EMAIL_DAYS', '3', 0),
('CONF_SUBSCRIPTION_INVOICE_FORMAT', '1', 0),
('CONF_SUBTRACT_STOCK', '1', 0),
('CONF_TIMEZONE', 'Asia/Kolkata', 0),
('CONF_TWITTER_API_KEY', '', 0),
('CONF_TWITTER_API_SECRET', '', 0),
('CONF_TWITTER_USERNAME', '', 0),
('CONF_USE_CUSTOMER_TAX_ADDRESS', 'B', 0),
('CONF_USE_SSL', '0', 0),
('CONF_VENDOR_ORDER_STATUS', 'a:8:{i:0;s:1:"2";i:1;s:2:"13";i:2;s:1:"4";i:3;s:1:"5";i:4;s:1:"6";i:5;s:1:"8";i:6;s:1:"7";i:7;s:1:"9";}', 1),
('CONF_WALLET_BALANCE_ALERT', '150', 0),
('CONF_WATERMARK_IMAGE', '', 0),
('CONF_WEBSITE_NAME', 'Yokart Installer 7.1', 0),
('CONF_WEIGHT_CLASS', 'GM', 0),
('CONF_WELCOME_EMAIL_REGISTRATION', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_pages`
--

CREATE TABLE `tbl_content_pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_excerpt` tinytext NOT NULL,
  `page_content` text NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `page_meta_title` varchar(255) NOT NULL,
  `page_meta_keywords` varchar(255) NOT NULL,
  `page_meta_desc` varchar(255) NOT NULL,
  `page_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_content_pages`
--

INSERT INTO `tbl_content_pages` (`page_id`, `page_title`, `page_excerpt`, `page_content`, `page_slug`, `page_meta_title`, `page_meta_keywords`, `page_meta_desc`, `page_added_on`) VALUES
(4, 'About Us', '', '<h4>Company Overview</h4>                    \r\n<p><strong>Founded in 2002 and At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</strong><br />\r\n	<br />\r\n	Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.</p>\r\n<h4>What We Do</h4>                \r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.<br />\r\n	<br />\r\n	Eenim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. </p>\r\n<h4>Who We Are</h4>                \r\n<p> Maecenas tempus neque pulvinar diam auctor faucibus. Vivamus in lacus eu elit hendrerit posuere. Maecenas sit amet urna <span id="caaa0a88-95c2-4d2f-bb84-bac39b68a293" ginger_software_uiphraseguid="59705ee2-e170-4908-9249-d37708948719" class="GINGER_SOFTWARE_mark">nibh</span>. In <span id="ac887192-dfd5-4176-a0e4-36a9298e9623" ginger_software_uiphraseguid="3ddd10ca-3445-4fae-aff6-546e2d3c06cf" class="GINGER_SOFTWARE_mark">molestie</span> <span id="70d88c27-d879-4a83-91a2-f03b5da401c6" ginger_software_uiphraseguid="3ddd10ca-3445-4fae-aff6-546e2d3c06cf" class="GINGER_SOFTWARE_mark">enim</span> <span id="a11a7ed5-382f-47a5-9110-b7e32f9718c4" ginger_software_uiphraseguid="3ddd10ca-3445-4fae-aff6-546e2d3c06cf" class="GINGER_SOFTWARE_mark">nec</span> ante <span id="f5c58570-bfb3-480d-b8bc-bae70fe81c3d" ginger_software_uiphraseguid="3ddd10ca-3445-4fae-aff6-546e2d3c06cf" class="GINGER_SOFTWARE_mark">rhoncus</span> vulputate. Phasellus vulputate nec turpis eu lacinia. Etiam mauris justo, pretium ut imperdiet ac, posuere eget felis. Praesent eu aliquam urna. <span id="04563297-7d81-45b7-87f3-940ce3fbaff0" ginger_software_uiphraseguid="79811c98-2b5c-405c-90e8-68b952278f41" class="GINGER_SOFTWARE_mark">Pellentesque</span> <span id="652b6522-1ec8-443c-bd15-ef38ce862590" ginger_software_uiphraseguid="79811c98-2b5c-405c-90e8-68b952278f41" class="GINGER_SOFTWARE_mark">nisi</span> dui, accumsan vel <span id="8f1a971d-bb95-48db-b14a-3f243ceb2ced" ginger_software_uiphraseguid="79811c98-2b5c-405c-90e8-68b952278f41" class="GINGER_SOFTWARE_mark">accumsan</span> a, <span id="4b257538-2b7e-4811-80c7-67bb173f77f8" ginger_software_uiphraseguid="79811c98-2b5c-405c-90e8-68b952278f41" class="GINGER_SOFTWARE_mark">tempor</span> in <span id="9132398f-6761-440a-a658-992b33da19c2" ginger_software_uiphraseguid="79811c98-2b5c-405c-90e8-68b952278f41" class="GINGER_SOFTWARE_mark">nunc</span>. <span id="c6af8070-e30e-42e4-a5ae-dc28efd8a911" ginger_software_uiphraseguid="cc07e70a-045e-400d-8ec4-7243b4532570" class="GINGER_SOFTWARE_mark">Mauris</span> a magna <span id="ee2134df-8718-40e9-9c17-ac426a6b9a76" ginger_software_uiphraseguid="cc07e70a-045e-400d-8ec4-7243b4532570" class="GINGER_SOFTWARE_mark">bibendum</span> <span id="7094496b-6ae6-45f2-9b74-ded98f1e8c8b" ginger_software_uiphraseguid="cc07e70a-045e-400d-8ec4-7243b4532570" class="GINGER_SOFTWARE_mark">libero</span> condimentum luctus.<br />\r\n	<br />\r\n	Aenean tempor risus vitae nisl bibendum varius. Aenean sodales lorem ultrices ligula vestibulum bibendum. Cras ut pretium justo. Nam a eros elementum, ultricies orci id, convallis purus. Duis <span id="937375e1-0a0b-4002-831c-0073c376fe2f" ginger_software_uiphraseguid="8c6dc573-96e0-4763-a6b3-a84da8e903e4" class="GINGER_SOFTWARE_mark">semper</span> <span id="c51c3c19-3a42-49a9-96a6-e81529acf367" ginger_software_uiphraseguid="8c6dc573-96e0-4763-a6b3-a84da8e903e4" class="GINGER_SOFTWARE_mark">ultricies</span> <span id="bc5bd304-ed95-47d7-9705-6a805a2cf218" ginger_software_uiphraseguid="8c6dc573-96e0-4763-a6b3-a84da8e903e4" class="GINGER_SOFTWARE_mark">elit</span> <span id="3dec63f1-aa92-4236-9967-39b4972fde58" ginger_software_uiphraseguid="8c6dc573-96e0-4763-a6b3-a84da8e903e4" class="GINGER_SOFTWARE_mark">nec</span> gravida. Pellentesque sit amet placerat mi, ac interdum orci. Mauris ullamcorper posuere mauris. </p>                    \r\n<ul>                    \r\n	<li>Duis <span id="463b4c1c-b418-4046-b7df-386584cd608b" ginger_software_uiphraseguid="cba6f1bf-41bf-41a8-806e-f1fa1137efe9" class="GINGER_SOFTWARE_mark">semper</span> <span id="59a83084-ff56-4b08-ae37-ff0090257d04" ginger_software_uiphraseguid="cba6f1bf-41bf-41a8-806e-f1fa1137efe9" class="GINGER_SOFTWARE_mark">ultricies</span> <span id="ac407a1f-7494-4648-b18b-0d7599ad2c8b" ginger_software_uiphraseguid="cba6f1bf-41bf-41a8-806e-f1fa1137efe9" class="GINGER_SOFTWARE_mark">elit</span> <span id="ea3e11ae-add4-4e3c-9709-45d9c94a2247" ginger_software_uiphraseguid="cba6f1bf-41bf-41a8-806e-f1fa1137efe9" class="GINGER_SOFTWARE_mark">nec</span> gravida</li>                        \r\n	<li>Maecenas tempus neque pulvinar diam auctor faucibus</li>                        \r\n	<li>Vivamus in lacus eu elit hendrerit posuere. Maecenas sit amet urna <span id="8b921684-986f-4b7d-b1ec-415efd147dba" ginger_software_uiphraseguid="9f079293-bb1c-4ceb-87a9-7014a64a411b" class="GINGER_SOFTWARE_mark">nibh</span></li>                        \r\n	<li>Phasellus vulputate nec turpis eu lacinia. <span id="c3ddc994-a239-4875-b003-57b7851a8245" ginger_software_uiphraseguid="c65a4b9c-84b4-4740-ae3b-27b77b4a06ad" class="GINGER_SOFTWARE_mark">Etiam</span> <span id="40c21590-9135-4d91-afb6-1a7a40c8d3e4" ginger_software_uiphraseguid="c65a4b9c-84b4-4740-ae3b-27b77b4a06ad" class="GINGER_SOFTWARE_mark">mauris</span> <span id="f7c68aaf-b78f-46d7-b608-7de99c59b5b6" ginger_software_uiphraseguid="c65a4b9c-84b4-4740-ae3b-27b77b4a06ad" class="GINGER_SOFTWARE_mark">justo</span></li>                        \r\n	<li>Praesent eu aliquam urna. <span id="431dbca7-af92-425b-87b1-ab3eb93a81c4" ginger_software_uiphraseguid="e3cd3c7c-9445-4879-b3dc-11f9e9589153" class="GINGER_SOFTWARE_mark">Pellentesque</span> <span id="95146ac2-4af2-4ae7-81c7-27411f1952f4" ginger_software_uiphraseguid="e3cd3c7c-9445-4879-b3dc-11f9e9589153" class="GINGER_SOFTWARE_mark">nisi</span> dui, accumsan vel <span id="c2542308-eb9a-4318-9655-364a8ca8bb5f" ginger_software_uiphraseguid="e3cd3c7c-9445-4879-b3dc-11f9e9589153" class="GINGER_SOFTWARE_mark">accumsan</span> a, <span id="898a3f7f-100e-422e-ba87-367b60955eb3" ginger_software_uiphraseguid="e3cd3c7c-9445-4879-b3dc-11f9e9589153" class="GINGER_SOFTWARE_mark">tempor</span> in <span id="797c8d98-70bf-4c71-aa31-bbd57349ecef" ginger_software_uiphraseguid="e3cd3c7c-9445-4879-b3dc-11f9e9589153" class="GINGER_SOFTWARE_mark">nunc</span></li>                        \r\n	<li>Aenean tempor risus vitae nisl bibendum varius</li>                        \r\n	<li>Aenean sodales lorem ultrices ligula vestibulum bibendum</li>                        \r\n	<li>Cras ut pretium justo. <span id="c1717d14-223e-4686-91c5-7d261b753ec3" ginger_software_uiphraseguid="29e68a64-8aba-4382-abec-1c3711deac85" class="GINGER_SOFTWARE_mark">Nam</span> a <span id="05016170-931f-45f7-9270-7d3408a0fa4f" ginger_software_uiphraseguid="29e68a64-8aba-4382-abec-1c3711deac85" class="GINGER_SOFTWARE_mark">eros</span> <span id="7994dbdf-ecb3-4735-88d3-562e9a85a284" ginger_software_uiphraseguid="29e68a64-8aba-4382-abec-1c3711deac85" class="GINGER_SOFTWARE_mark">elementum</span></li>                    \r\n</ul>', '', 'About Us', 'About Us - Meta Keywords', 'About Us - Meta Description', '0000-00-00 00:00:00'),
(7, 'How it works', '', '<h4>How It Works - Heading</h4>                    \r\n<p><strong>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</strong><br />\r\n	<br />\r\n	Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.</p>\r\n<h4>How it Works</h4>                \r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.<br />\r\n	<br />\r\n	Eenim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. </p>\r\n<h4>How it Works</h4>                \r\n<p> Maecenas tempus neque pulvinar diam auctor faucibus. Vivamus in lacus eu elit hendrerit posuere. Maecenas sit amet urna <span id="49fba3d2-e73c-454c-99c0-0d1ffd31cf7a" ginger_software_uiphraseguid="75ef834e-6d5e-4a3f-9e2d-5cb2f57acd17" class="GINGER_SOFTWARE_mark">nibh</span>. In <span id="f57fee95-9991-4a19-b848-75b54c13dea7" ginger_software_uiphraseguid="ae45c440-2eca-4ec3-88a7-4a3de8bdf3ec" class="GINGER_SOFTWARE_mark">molestie</span> <span id="7683767c-50ca-4bbd-b8ff-7c4d308f1144" ginger_software_uiphraseguid="ae45c440-2eca-4ec3-88a7-4a3de8bdf3ec" class="GINGER_SOFTWARE_mark">enim</span> <span id="2a957fdc-ad3b-4122-9c35-d7dc0809b8d8" ginger_software_uiphraseguid="ae45c440-2eca-4ec3-88a7-4a3de8bdf3ec" class="GINGER_SOFTWARE_mark">nec</span> ante <span id="b5d4a009-ebaa-499a-9985-66e40ea353b1" ginger_software_uiphraseguid="ae45c440-2eca-4ec3-88a7-4a3de8bdf3ec" class="GINGER_SOFTWARE_mark">rhoncus</span> vulputate. Phasellus vulputate nec turpis eu lacinia. Etiam mauris justo, pretium ut imperdiet ac, posuere eget felis. Praesent eu aliquam urna. <span id="0d6bf7c4-1927-45c0-b8c0-fc743cb26162" ginger_software_uiphraseguid="972298f5-9246-4fa3-b939-5d1c60e2add8" class="GINGER_SOFTWARE_mark">Pellentesque</span> <span id="c5e94706-3be0-416f-89f1-f7412ec2edcc" ginger_software_uiphraseguid="972298f5-9246-4fa3-b939-5d1c60e2add8" class="GINGER_SOFTWARE_mark">nisi</span> dui, accumsan vel <span id="7ab1f07f-0e6d-4d03-91d8-cbf5b95bcafb" ginger_software_uiphraseguid="972298f5-9246-4fa3-b939-5d1c60e2add8" class="GINGER_SOFTWARE_mark">accumsan</span> a, <span id="9eb355a5-9ee8-4b94-b275-f3c25e3f3a32" ginger_software_uiphraseguid="972298f5-9246-4fa3-b939-5d1c60e2add8" class="GINGER_SOFTWARE_mark">tempor</span> in <span id="130f6500-7ad6-4ea2-ae17-6dee9d91b2a1" ginger_software_uiphraseguid="972298f5-9246-4fa3-b939-5d1c60e2add8" class="GINGER_SOFTWARE_mark">nunc</span>. <span id="f28a3434-176b-4c67-a7e0-5d33bf3e88b4" ginger_software_uiphraseguid="8c124f76-86b5-46b7-bf0a-f19013f8457c" class="GINGER_SOFTWARE_mark">Mauris</span> a magna <span id="6ef729bb-89b9-4936-8b22-690a70280376" ginger_software_uiphraseguid="8c124f76-86b5-46b7-bf0a-f19013f8457c" class="GINGER_SOFTWARE_mark">bibendum</span> <span id="721ff908-c54f-4c1c-bc7b-54eab8cd9a22" ginger_software_uiphraseguid="8c124f76-86b5-46b7-bf0a-f19013f8457c" class="GINGER_SOFTWARE_mark">libero</span> condimentum luctus.<br />\r\n	<br />\r\n	Aenean tempor risus vitae nisl bibendum varius. Aenean sodales lorem ultrices ligula vestibulum bibendum. Cras ut pretium justo. Nam a eros elementum, ultricies orci id, convallis purus. Duis <span id="73a41d29-4ed0-4ae5-adcb-307c96c24d3a" ginger_software_uiphraseguid="c8751bc0-59fd-47d4-a257-c31ae23b54d6" class="GINGER_SOFTWARE_mark">semper</span> <span id="b717921f-f753-4e7d-8489-52786ac25e65" ginger_software_uiphraseguid="c8751bc0-59fd-47d4-a257-c31ae23b54d6" class="GINGER_SOFTWARE_mark">ultricies</span> <span id="adca0379-4077-497a-a161-074abb04356b" ginger_software_uiphraseguid="c8751bc0-59fd-47d4-a257-c31ae23b54d6" class="GINGER_SOFTWARE_mark">elit</span> <span id="a2b71d34-cb9b-4504-b8db-5a7931442d13" ginger_software_uiphraseguid="c8751bc0-59fd-47d4-a257-c31ae23b54d6" class="GINGER_SOFTWARE_mark">nec</span> gravida. Pellentesque sit amet placerat mi, ac interdum orci. Mauris ullamcorper posuere mauris. </p>                    \r\n<ul>                    \r\n	<li>Duis <span id="8372d7ad-f4dd-43f6-af72-b19fae756a9b" ginger_software_uiphraseguid="5d6af100-eb8d-46fe-a3d5-b542640ae93a" class="GINGER_SOFTWARE_mark">semper</span> <span id="a683f604-6c09-4a25-bafc-4dfebe55400f" ginger_software_uiphraseguid="5d6af100-eb8d-46fe-a3d5-b542640ae93a" class="GINGER_SOFTWARE_mark">ultricies</span> <span id="1130dfaf-768e-45d9-afe9-28adf07f9cc0" ginger_software_uiphraseguid="5d6af100-eb8d-46fe-a3d5-b542640ae93a" class="GINGER_SOFTWARE_mark">elit</span> <span id="26a9001e-35b9-4b2e-bd76-7065f3de73f5" ginger_software_uiphraseguid="5d6af100-eb8d-46fe-a3d5-b542640ae93a" class="GINGER_SOFTWARE_mark">nec</span> gravida</li>                        \r\n	<li>Maecenas tempus neque pulvinar diam auctor faucibus</li>                        \r\n	<li>Vivamus in lacus eu elit hendrerit posuere. Maecenas sit amet urna <span id="74c79bd9-7a11-4169-92b7-cbcbcf72f79e" ginger_software_uiphraseguid="01356aa6-bf1c-439c-80d3-0c170e82f4f1" class="GINGER_SOFTWARE_mark">nibh</span></li>                        \r\n	<li>Phasellus vulputate nec turpis eu lacinia. <span id="658974eb-1b54-4c18-9e42-bca20808a25d" ginger_software_uiphraseguid="0e09de1b-2cb5-4314-a1b8-60fbb5d81752" class="GINGER_SOFTWARE_mark">Etiam</span> <span id="dc15cfdd-2481-4dc2-8705-aaaf90c68527" ginger_software_uiphraseguid="0e09de1b-2cb5-4314-a1b8-60fbb5d81752" class="GINGER_SOFTWARE_mark">mauris</span> <span id="92012fd2-104f-4408-a0f3-f38a0942befd" ginger_software_uiphraseguid="0e09de1b-2cb5-4314-a1b8-60fbb5d81752" class="GINGER_SOFTWARE_mark">justo</span></li>                        \r\n	<li>Praesent eu aliquam urna. <span id="65e773bd-ad2a-4552-ad93-d67ee17a8e42" ginger_software_uiphraseguid="edbb2e47-6738-4e92-bf8b-592d82c3b417" class="GINGER_SOFTWARE_mark">Pellentesque</span> <span id="17450ee7-f916-47ec-83a7-dac8bc1da894" ginger_software_uiphraseguid="edbb2e47-6738-4e92-bf8b-592d82c3b417" class="GINGER_SOFTWARE_mark">nisi</span> dui, accumsan vel <span id="a834e7e5-feea-4ae4-803e-a257395486d6" ginger_software_uiphraseguid="edbb2e47-6738-4e92-bf8b-592d82c3b417" class="GINGER_SOFTWARE_mark">accumsan</span> a, <span id="b8f9da7e-2a15-4ef8-9e7a-db53569d58d8" ginger_software_uiphraseguid="edbb2e47-6738-4e92-bf8b-592d82c3b417" class="GINGER_SOFTWARE_mark">tempor</span> in <span id="0e2adc00-6b7f-4fdd-a66d-7018edd74634" ginger_software_uiphraseguid="edbb2e47-6738-4e92-bf8b-592d82c3b417" class="GINGER_SOFTWARE_mark">nunc</span></li>                        \r\n	<li>Aenean tempor risus vitae nisl bibendum varius</li>                        \r\n	<li>Aenean sodales lorem ultrices ligula vestibulum bibendum</li>                        \r\n	<li>Cras ut pretium justo. <span id="950e2972-6454-4781-98a5-a32ef3bc83de" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark">Nam</span> a <span id="34085792-cb08-433b-b96b-8640c3fd8217" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark">eros</span> <span id="68acce65-bcfe-42d8-aeff-52d80acbbe8e" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark">elementum</span></li>\r\n	<li><span id="68acce65-bcfe-42d8-aeff-52d80acbbe8e" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark"></span>Cras ut pretium justo.&nbsp;<span id="950e2972-6454-4781-98a5-a32ef3bc83de" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark">Nam</span>&nbsp;a&nbsp;<span id="34085792-cb08-433b-b96b-8640c3fd8217" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark">eros</span>&nbsp;<span id="68acce65-bcfe-42d8-aeff-52d80acbbe8e" ginger_software_uiphraseguid="4462d2c5-3888-4412-a738-02091e4aed3a" class="GINGER_SOFTWARE_mark">elementum</span></li>                    \r\n</ul>', '', 'How it works', 'How it works - Meta Keywords', 'How it works - Meta Description', '0000-00-00 00:00:00'),
(8, 'What is Yokart', '', 'What is Yokart - Page content will go here.', '', 'What is Yokart', 'What is Yokart - Meta Keywords', 'What is Yokart - Meta Description', '0000-00-00 00:00:00'),
(9, 'Privacy Policy', '', 'Privacy policy page content will go here', '', 'Privacy Policy', 'Privacy Policy - Meta Keywords', 'Privacy Policy - Meta Description', '0000-00-00 00:00:00'),
(10, 'Terms & Conditions', '', 'Terms &amp; Conditions - Page content will go here.', '', 'Terms & Conditions', 'Terms & Conditions - Meta Keywords', 'Terms & Conditions - Meta Description', '0000-00-00 00:00:00'),
(11, 'Policies & Regulations', '', 'Policies &amp; Regulations - Page content will go here', '', 'Policies & Regulations', 'Policies & Regulations - Meta Keywords', 'Policies & Regulations - Meta Description', '0000-00-00 00:00:00'),
(12, 'How to Buy?', '', 'How to Buy - Content Page will go here.', '', 'How to Buy - Page Title', 'How to Buy - Meta Keywords', 'How to Buy - Meta Description', '0000-00-00 00:00:00'),
(13, 'How to Sell?', '', 'How to Sell - Content Page will go here.', '', 'How to Sell - Page Title', 'How to Sell - Meta Keywords', 'How to Sell - Meta Description', '0000-00-00 00:00:00'),
(14, 'Private Operations', '', 'Private Operations - Page content will go here.', '', 'Private Operations - Page Title', 'Private Operations - Meta Keywords', 'Private Operations - Meta Description', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_countries`
--

CREATE TABLE `tbl_countries` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(25) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_delete` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_countries`
--

INSERT INTO `tbl_countries` (`country_id`, `country_code`, `country_name`, `country_delete`) VALUES
(1, 'AF', 'Afghanistan', 0),
(2, 'AL', 'Albania', 0),
(3, 'AL', 'Algeria', 0),
(4, 'AN', 'Andorra', 0),
(5, 'AM', 'American Samoa', 0),
(6, 'AN', 'Angola', 0),
(7, 'AN', 'Anguilla', 0),
(8, 'AN', 'Antartica', 0),
(9, 'AB', 'Antigua and Barbuda', 0),
(10, 'AR', 'Argentina', 0),
(11, 'AR', 'Armenia', 0),
(12, 'AR', 'Aruba', 0),
(13, 'AC', 'Ashmore and Cartier Island', 0),
(14, 'AU', 'Australia', 0),
(15, 'AU', 'Austria', 0),
(16, 'AZ', 'Azerbaijan', 0),
(17, 'BA', 'Bahamas', 0),
(18, 'BA', 'Bahrain', 0),
(19, 'BA', 'Bangladesh', 0),
(20, 'BA', 'Barbados', 0),
(21, 'BE', 'Belarus', 0),
(22, 'BE', 'Belgium', 0),
(23, 'BE', 'Belize', 0),
(24, 'BE', 'Benin', 0),
(25, 'BE', 'Bermuda', 0),
(26, 'BH', 'Bhutan', 0),
(27, 'BO', 'Bolivia', 0),
(28, 'BH', 'Bosnia and Herzegovina', 0),
(29, 'BO', 'Botswana', 0),
(30, 'BR', 'Brazil', 0),
(31, 'BVI', 'British Virgin Islands', 0),
(32, 'BR', 'Brunei', 0),
(33, 'BU', 'Bulgaria', 0),
(34, 'BU', 'Burkina Faso', 0),
(35, 'BU', 'Burma', 0),
(36, 'BU', 'Burundi', 0),
(37, 'CA', 'Cambodia', 0),
(38, 'CA', 'Cameroon', 0),
(39, 'CA', 'Canada', 0),
(40, 'CA', 'Cape Verde', 0),
(41, 'CA', 'Cayman Islands', 0),
(42, 'CE', 'Central African Republic', 0),
(43, 'CH', 'Chad', 0),
(44, 'CH', 'Chile', 0),
(45, 'CH', 'China', 0),
(46, 'CH', 'Christmas Island', 0),
(47, 'CL', 'Clipperton Island', 0),
(48, 'CO', 'Cocos (Keeling) Islands', 0),
(49, 'CO', 'Colombia', 0),
(50, 'CO', 'Comoros', 0),
(51, 'CO', 'Congo', 0),
(52, 'CO', 'Cook Islands', 0),
(53, 'CR', 'Costa Rica', 0),
(54, 'CO', 'Cote dIvoire', 0),
(55, 'CR', 'Croatia', 0),
(56, 'CU', 'Cuba', 0),
(57, 'CY', 'Cyprus', 0),
(58, 'CZ', 'Czeck Republic', 0),
(59, 'DE', 'Denmark', 0),
(60, 'DJ', 'Djibouti', 0),
(61, 'DO', 'Dominica', 0),
(62, 'DO', 'Dominican Republic', 0),
(63, 'EC', 'Ecuador', 0),
(64, 'EG', 'Egypt', 0),
(65, 'EL', 'El Salvador', 0),
(66, 'EQ', 'Equatorial Guinea', 0),
(67, 'ER', 'Eritrea', 0),
(68, 'ES', 'Estonia', 0),
(69, 'ET', 'Ethiopia', 0),
(70, 'EU', 'Europa Island', 0),
(71, 'FA', 'Falkland Islands (Islas Malvinas)', 0),
(72, 'FA', 'Faroe Islands', 0),
(73, 'FI', 'Fiji', 0),
(74, 'FI', 'Finland', 0),
(75, 'FR', 'France', 0),
(76, 'FR', 'French Guiana', 0),
(77, 'FR', 'French Polynesia', 0),
(78, 'FR', 'French Southern and Antarctic Lands', 0),
(79, 'GA', 'Gabon', 0),
(80, 'GA', 'Gambia', 0),
(81, 'GA', 'Gaza Strip', 0),
(82, 'GE', 'Georgia', 0),
(83, 'GE', 'Germany', 0),
(84, 'GH', 'Ghana', 0),
(85, 'GI', 'Gibraltar', 0),
(86, 'GL', 'Glorioso Islands', 0),
(87, 'GR', 'Greece', 0),
(88, 'GR', 'Greenland', 0),
(89, 'GR', 'Grenada', 0),
(90, 'GU', 'Guadeloupe', 0),
(91, 'GU', 'Guam', 0),
(92, 'GU', 'Guatemala', 0),
(93, 'GU', 'Guernsey', 0),
(94, 'GU', 'Guinea', 0),
(95, 'GU', 'Guinea-Bissau', 0),
(96, 'GU', 'Guyana', 0),
(97, 'HA', 'Haiti', 0),
(98, 'HE', 'Heard Island and McDonald Islands', 0),
(99, 'HO', 'Holy See (Vatican City)', 0),
(100, 'HO', 'Honduras', 0),
(101, 'HO', 'Hong Kong', 0),
(102, 'HO', 'Howland Island', 0),
(103, 'HU', 'Hungary', 0),
(104, 'IC', 'Iceland', 0),
(105, 'IN', 'India', 0),
(106, 'IN', 'Indonesia', 0),
(107, 'IR', 'Iran', 0),
(108, 'IR', 'Iraq', 0),
(109, 'IR', 'Ireland', 0),
(110, 'IS', 'Israel', 0),
(111, 'IT', 'Italy', 0),
(112, 'JA', 'Jamaica', 0),
(113, 'JA', 'Jan Mayen', 0),
(114, 'JA', 'Japan', 0),
(115, 'JA', 'Jarvis Island', 0),
(116, 'JE', 'Jersey', 0),
(117, 'JO', 'Johnston Atoll', 0),
(118, 'JO', 'Jordan', 0),
(119, 'JU', 'Juan de Nova Island', 0),
(120, 'KA', 'Kazakhstan', 0),
(121, 'KE', 'Kenya', 0),
(122, 'KI', 'Kiribati', 0),
(123, 'KO', 'Korea North', 0),
(124, 'KO', 'Korea South', 0),
(125, 'KU', 'Kuwait', 0),
(126, 'KY', 'Kyrgyzstan', 0),
(127, 'LA', 'Laos', 0),
(128, 'LA', 'Latvia', 0),
(129, 'LE', 'Lebanon', 0),
(130, 'LE', 'Lesotho', 0),
(131, 'LI', 'Liberia', 0),
(132, 'LI', 'Libya', 0),
(133, 'LI', 'Liechtenstein', 0),
(134, 'LI', 'Lithuania', 0),
(135, 'LU', 'Luxembourg', 0),
(136, 'MA', 'Macau', 0),
(137, 'MA', 'Macedonia', 0),
(138, 'MA', 'Madagascar', 0),
(139, 'MA', 'Malawi', 0),
(140, 'MA', 'Malaysia', 0),
(141, 'MA', 'Maldives', 0),
(142, 'MA', 'Mali', 0),
(143, 'MA', 'Malta', 0),
(144, 'MA', 'Man Isle of', 0),
(145, 'MA', 'Marshall Islands', 0),
(146, 'MA', 'Martinique', 0),
(147, 'MA', 'Mauritania', 0),
(148, 'MA', 'Mauritius', 0),
(149, 'MA', 'Mayotte', 0),
(150, 'ME', 'Mexico', 0),
(151, 'MI', 'Micronesia', 0),
(152, 'MI', 'Midway Islands', 0),
(153, 'MO', 'Moldova', 0),
(154, 'MO', 'Monaco', 0),
(155, 'MO', 'Mongolia', 0),
(156, 'MO', 'Montserrat', 0),
(157, 'MO', 'Morocco', 0),
(158, 'MO', 'Mozambique', 0),
(159, 'NA', 'Namibia', 0),
(160, 'NA', 'Nauru', 0),
(161, 'NE', 'Nepal', 0),
(162, 'NE', 'Netherlands', 0),
(163, 'NE', 'Netherlands Antilles', 0),
(164, 'NE', 'New Caledonia', 0),
(165, 'NE', 'New Zealand', 0),
(166, 'NI', 'Nicaragua', 0),
(167, 'NI', 'Niger', 0),
(168, 'NI', 'Nigeria', 0),
(169, 'NI', 'Niue', 0),
(170, 'NO', 'Norfolk Island', 0),
(171, 'NO', 'No Man`s Island', 0),
(172, 'NO', 'Northern Mariana Islands', 0),
(173, 'NO', 'Norway', 0),
(174, 'OM', 'Oman', 0),
(175, 'PA', 'Pakistan', 0),
(176, 'PA', 'Palau', 0),
(177, 'PA', 'Panama', 0),
(178, 'PA', 'Papua New Guinea', 0),
(179, 'PA', 'Paraguay', 0),
(180, 'PE', 'Peru', 0),
(181, 'PH', 'Philippines', 0),
(182, 'PI', 'Pitcaim Islands', 0),
(183, 'PO', 'Poland', 0),
(184, 'PO', 'Portugal', 0),
(185, 'PU', 'Puerto Rico', 0),
(186, 'QA', 'Qatar', 0),
(187, 'RE', 'Reunion', 0),
(188, 'RO', 'Romainia', 0),
(189, 'RU', 'Russia', 0),
(190, 'RW', 'Rwanda', 0),
(191, 'SA', 'Saint Helena', 0),
(192, 'SA', 'Saint Kitts and Nevis', 0),
(193, 'SA', 'Saint Lucia', 0),
(194, 'SA', 'Saint Pierre and Miquelon', 0),
(195, 'SA', 'Saint Vincent and the Grenadines', 0),
(196, 'SA', 'Samoa', 0),
(197, 'SA', 'San Marino', 0),
(198, 'SA', 'Sao Tome and Principe', 0),
(199, 'SA', 'Saudi Arabia', 0),
(200, 'SC', 'Scotland', 0),
(201, 'SE', 'Senegal', 0),
(202, 'SE', 'Serbia and Monterago', 0),
(203, 'SE', 'Seychelles', 0),
(204, 'SI', 'Sierra Leone', 0),
(205, 'SI', 'Singapore', 0),
(206, 'SL', 'Slovakia', 0),
(207, 'SL', 'Slovenia', 0),
(208, 'SO', 'Solomon Islands', 0),
(209, 'SO', 'Somalia', 0),
(210, 'SO', 'South Africa', 0),
(211, 'SO', 'South Georgia and the South Sandwich Islandss', 0),
(212, 'SP', 'Spain', 0),
(213, 'SP', 'Spratly Islands', 0),
(214, 'SR', 'SriLanka', 0),
(215, 'SU', 'Sudan', 0),
(216, 'SU', 'Suriname', 0),
(217, 'SV', 'Svalbard', 0),
(218, 'SW', 'Swaziland', 0),
(219, 'SW', 'Sweden', 0),
(220, 'SW', 'Switzerland', 0),
(221, 'SY', 'Syria', 0),
(222, 'TA', 'Taiwan', 0),
(223, 'TA', 'Tajikistan', 0),
(224, 'TA', 'Tanzania', 0),
(225, 'TH', 'Thailand', 0),
(226, 'TR', 'Trinidad and Tobago', 0),
(227, 'TO', 'Toga', 0),
(228, 'TO', 'Tokelau', 0),
(229, 'TO', 'Tonga', 0),
(230, 'TU', 'Tunisia', 0),
(231, 'TU', 'Turkey', 0),
(232, 'TU', 'Turkmenistan', 0),
(233, 'TU', 'Turks and Caicos Island', 0),
(234, 'TU', 'Tuvalu', 0),
(235, 'UG', 'Uganda', 0),
(236, 'UK', 'Ukraine', 0),
(237, 'UAE', 'United Arab Emirates', 0),
(238, 'UK', 'United Kingdom', 0),
(239, 'UR', 'Uruguay', 0),
(240, 'US', 'United States', 0),
(241, 'UZ', 'Uzbekistan', 0),
(242, 'VA', 'Vanuatu', 0),
(243, 'VE', 'Venezuela', 0),
(244, 'VI', 'Vietnam', 0),
(245, 'VI', 'Virgin Islands', 0),
(246, 'WA', 'Wales', 0),
(247, 'WA', 'Wallis and Futuna', 0),
(248, 'WE', 'West Bank', 0),
(249, 'WE', 'Western Sahara', 0),
(250, 'YE', 'Yemen', 0),
(251, 'YU', 'Yugoslavia', 0),
(252, 'ZA', 'Zambia', 0),
(253, 'ZI', 'Zimbabwe', 0),
(254, 'OT', 'Others', 0),
(255, 'DO', 'Doesnt Matter', 0),
(257, 'SE', 'Serbia', 0),
(274, 'EU', 'Europe', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupons`
--

CREATE TABLE `tbl_coupons` (
  `coupon_id` bigint(20) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_description` text NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_image` varchar(255) NOT NULL,
  `coupon_min_order_value` decimal(10,4) NOT NULL,
  `coupon_discount_type` char(1) NOT NULL,
  `coupon_discount_value` decimal(10,4) NOT NULL,
  `coupon_max_discount_value` decimal(10,4) NOT NULL,
  `coupon_start_date` date NOT NULL,
  `coupon_end_date` date NOT NULL,
  `coupon_uses` int(11) NOT NULL,
  `coupon_uses_customer` int(11) NOT NULL,
  `coupon_free_shipping` tinyint(1) NOT NULL,
  `coupon_status` tinyint(4) NOT NULL,
  `coupon_is_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupons_history`
--

CREATE TABLE `tbl_coupons_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_categories`
--

CREATE TABLE `tbl_coupon_categories` (
  `dctc_coupon_id` int(11) NOT NULL,
  `dctc_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_products`
--

CREATE TABLE `tbl_coupon_products` (
  `dctc_coupon_id` int(11) NOT NULL,
  `dctc_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cron_log`
--

CREATE TABLE `tbl_cron_log` (
  `cronlog_id` int(11) NOT NULL,
  `cronlog_cron_id` int(11) NOT NULL,
  `cronlog_started_at` datetime NOT NULL,
  `cronlog_ended_at` datetime NOT NULL,
  `cronlog_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cron_schedules`
--

CREATE TABLE `tbl_cron_schedules` (
  `cron_id` int(11) NOT NULL,
  `cron_name` varchar(255) NOT NULL,
  `cron_command` varchar(255) NOT NULL,
  `cron_interval` int(11) NOT NULL COMMENT 'Minutes',
  `cron_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cron_schedules`
--

INSERT INTO `tbl_cron_schedules` (`cron_id`, `cron_name`, `cron_command`, `cron_interval`, `cron_active`) VALUES
(1, 'PayPal Adaptive ', 'paypaladaptive_pay/cron', 60, 1),
(2, 'Charge Wallet for Promotions', 'cronjobs/cron_charge_wallet_promotions', 1440, 1),
(3, 'Subscription Status Change', 'cronjobs/cron_change_subscription_status', 60, 1),
(4, 'Subscription Expiry Alert', 'cronjobs/cron_send_subscription_expiry_email', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currencies`
--

CREATE TABLE `tbl_currencies` (
  `currency_id` int(11) NOT NULL,
  `currency_title` varchar(200) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `currency_decimal` int(1) NOT NULL DEFAULT '2',
  `currency_symbol_left` varchar(20) NOT NULL,
  `currency_symbol_right` varchar(20) NOT NULL,
  `currency_value` float(15,8) NOT NULL,
  `currency_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_currencies`
--

INSERT INTO `tbl_currencies` (`currency_id`, `currency_title`, `currency_code`, `currency_decimal`, `currency_symbol_left`, `currency_symbol_right`, `currency_value`, `currency_is_deleted`) VALUES
(1, 'United States Dollar', 'USD', 2, '$', '', 1.00000000, 0),
(2, 'Indian Rupee', 'INR', 2, 'â‚¹', '', 1.00000000, 0),
(3, 'Great Britain Pound', 'GBP', 2, 'Â£', '', 1.00000000, 0),
(4, 'Canadian Dollar', 'CAD', 2, '$', '', 1.00000000, 0),
(5, 'Mexican Dollar', 'MXN', 2, '$', '', 1.00000000, 0),
(6, 'Hong Kong Dollar', 'HKD', 2, '$', '', 1.00000000, 0),
(7, 'Dominican Pesos', 'DOP', 2, '$', '', 1.00000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_groups`
--

CREATE TABLE `tbl_customer_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `group_description` text COLLATE latin1_general_ci NOT NULL,
  `group_markup` decimal(10,2) NOT NULL,
  `group_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_archives`
--

CREATE TABLE `tbl_email_archives` (
  `mailarchive_id` int(11) NOT NULL,
  `mailarchive_from_email` varchar(255) NOT NULL,
  `mailarchive_to_email` varchar(255) NOT NULL,
  `mailarchive_tpl_name` varchar(255) NOT NULL,
  `mailarchive_subject` text NOT NULL,
  `mailarchive_message` text NOT NULL,
  `mailarchive_sent_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_email_archives`
--

INSERT INTO `tbl_email_archives` (`mailarchive_id`, `mailarchive_from_email`, `mailarchive_to_email`, `mailarchive_tpl_name`, `mailarchive_subject`, `mailarchive_message`, `mailarchive_sent_on`) VALUES
(1, '', 'info@yo-kart.com', 'admin_order_email', 'Order placed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">An order has been received on your site with Order Invoice Number <strong>160802-0000701</strong>.Please find the order information below.</span></p>                              \r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;"><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;">\r\n	<tr>\r\n	<td width="50%" style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n	<td width="10%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;">Qty</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Price</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Total</td>\r\n	</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/5" style="font-size:13px; color:#333;">Panasonic Corded Phone KX-TSC60SX Black Landline Caller ID Phone</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1,200.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1,200.00</td>\r\n			</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/9" style="font-size:13px; color:#333;">Dell Inspiron</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$550.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$550.00</td>\r\n			</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td>\r\n			</tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Cart Total</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1,830.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Shipping</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$73.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">VAT</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$36.60</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>Order Total</strong></td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>$1,939.60</strong></td></tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></span></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:19:37'),
(2, '', 'maxixx@dummyid.com', 'customer_order_email', 'Order Details from Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Maxixx</span>,\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">Thanks for placing an order. Your order has been received and will be processed once payment has been confirmed.</span></p>\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">Your order information is give below.</span></p>                              \r\n								<p><span style="font-size:13px; color:#666;"><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;">\r\n	<tr>\r\n	<td width="50%" style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n	<td width="10%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;">Qty</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Price</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Total</td>\r\n	</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/5" style="font-size:13px; color:#333;">Panasonic Corded Phone KX-TSC60SX Black Landline Caller ID Phone</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1,200.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1,200.00</td>\r\n			</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/9" style="font-size:13px; color:#333;">Dell Inspiron</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$550.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$550.00</td>\r\n			</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td>\r\n			</tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Cart Total</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1,830.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Shipping</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$73.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">VAT</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$36.60</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>Order Total</strong></td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>$1,939.60</strong></td></tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></span></p>                            \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:19:42'),
(3, '', 'info@yo-kart.com', 'primary_order_payment_status_change_admin', 'Payment Status Changed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p style="font-size:13px; color:#666;">Order payment status has been changed to <span style="font-weight: bold;">Paid</span> corresponding to Order Invoice Number -&nbsp;<span style="font-weight: bold;">160802-0000701</span>.</p>\r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:19:59'),
(4, '', 'maxixx@dummyid.com', 'primary_order_payment_status_change_buyer', 'Order Payment Status Changed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Maxixx</span>,\r\n								<p style="font-size:13px; color:#666;">Your order payment status has been changed to <span style="font-weight: bold;">Paid</span> corresponding to Order Invoice Number -&nbsp;<span style="font-weight: bold;">160802-0000701</span>.</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:20:00'),
(5, '', 'justin@dummyid.com', 'vendor_order_email', 'Order Received From Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Justin Lenger</span>,\r\n								<p><span style="font-size:16px; display:block;color:#333; font-weight:bold;padding:10px 0 10px 0;">An order has been placed for your product(s)<br />\r\n										</span></p>\r\n								<p style="font-size:14px; color:#666; padding:0 0 15px 0;">Order details &amp; Shipping information are given below:<br />\r\n									<br />\r\n									 \r\n									<table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="45%">Product</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="5%">Qty</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Price</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="30%">Shipping</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="10%">Tax</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Total</td></tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><a href="http://localhost/-/products/view/5" style="font-size:13px; color:#333;">Panasonic Corded Phone KX-TSC60SX Black Landline Caller ID Phone</a><br/>\r\n				</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$1,200.00</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">3 to 5 Business Days by <em>DHL</em><br/><strong>Shipping Charges</strong> (+$15.00)</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">$24.00</td>\r\n				\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$1,239.00</td>\r\n		  </tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:20:01'),
(6, '', 'maxixx@dummyid.com', 'vendor_order_email', 'Order Received From Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Maxixx</span>,\r\n								<p><span style="font-size:16px; display:block;color:#333; font-weight:bold;padding:10px 0 10px 0;">An order has been placed for your product(s)<br />\r\n										</span></p>\r\n								<p style="font-size:14px; color:#666; padding:0 0 15px 0;">Order details &amp; Shipping information are given below:<br />\r\n									<br />\r\n									 \r\n									<table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="45%">Product</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="5%">Qty</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Price</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="30%">Shipping</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="10%">Tax</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Total</td></tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><a href="http://localhost/-/products/view/9" style="font-size:13px; color:#333;">Dell Inspiron</a><br/>\r\n				</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$550.00</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">3 to 5 Business Days by <em>DHL</em><br/><strong>Shipping Charges</strong> (+$23.00)</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">$11.00</td>\r\n				\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$584.00</td>\r\n		  </tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:20:02'),
(7, '', 'justin@dummyid.com', 'vendor_order_email', 'Order Received From Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Justin Lenger</span>,\r\n								<p><span style="font-size:16px; display:block;color:#333; font-weight:bold;padding:10px 0 10px 0;">An order has been placed for your product(s)<br />\r\n										</span></p>\r\n								<p style="font-size:14px; color:#666; padding:0 0 15px 0;">Order details &amp; Shipping information are given below:<br />\r\n									<br />\r\n									 \r\n									<table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="45%">Product</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="5%">Qty</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Price</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="30%">Shipping</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="10%">Tax</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Total</td></tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$80.00</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1 to 3 Business Days by <em>DHL</em><br/><strong>Shipping Charges</strong> (+$35.00)</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">$1.60</td>\r\n				\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$116.60</td>\r\n		  </tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:20:02'),
(8, '', 'info@yo-kart.com', 'admin_order_email', 'Order placed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">An order has been received on your site with Order Invoice Number <strong>160802-0000702</strong>.Please find the order information below.</span></p>                              \r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;"><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;">\r\n	<tr>\r\n	<td width="50%" style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n	<td width="10%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;">Qty</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Price</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Total</td>\r\n	</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td>\r\n			</tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Cart Total</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Shipping</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$35.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">VAT</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1.60</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>Order Total</strong></td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>$116.60</strong></td></tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></span></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:25:54'),
(9, '', 'maxixx@dummyid.com', 'customer_order_email', 'Order Details from Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Maxixx</span>,\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">Thanks for placing an order. Your order has been received and will be processed once payment has been confirmed.</span></p>\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">Your order information is give below.</span></p>                              \r\n								<p><span style="font-size:13px; color:#666;"><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;">\r\n	<tr>\r\n	<td width="50%" style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n	<td width="10%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;">Qty</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Price</td>\r\n	<td width="20%" style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" align="right">Total</td>\r\n	</tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">\r\n				<a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td>\r\n			</tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Cart Total</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$80.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">Shipping</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$35.00</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">VAT</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right">$1.60</td></tr><tr><td colspan="3" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>Order Total</strong></td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" align="right"><strong>$116.60</strong></td></tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></span></p>                            \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:25:55'),
(10, '', 'info@yo-kart.com', 'primary_order_payment_status_change_admin', 'Payment Status Changed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p style="font-size:13px; color:#666;">Order payment status has been changed to <span style="font-weight: bold;">Paid</span> corresponding to Order Invoice Number -&nbsp;<span style="font-weight: bold;">160802-0000702</span>.</p>\r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:26:19'),
(11, '', 'maxixx@dummyid.com', 'primary_order_payment_status_change_buyer', 'Order Payment Status Changed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Maxixx</span>,\r\n								<p style="font-size:13px; color:#666;">Your order payment status has been changed to <span style="font-weight: bold;">Paid</span> corresponding to Order Invoice Number -&nbsp;<span style="font-weight: bold;">160802-0000702</span>.</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:26:20');
INSERT INTO `tbl_email_archives` (`mailarchive_id`, `mailarchive_from_email`, `mailarchive_to_email`, `mailarchive_tpl_name`, `mailarchive_subject`, `mailarchive_message`, `mailarchive_sent_on`) VALUES
(12, '', 'justin@dummyid.com', 'vendor_order_email', 'Order Received From Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Justin Lenger</span>,\r\n								<p><span style="font-size:16px; display:block;color:#333; font-weight:bold;padding:10px 0 10px 0;">An order has been placed for your product(s)<br />\r\n										</span></p>\r\n								<p style="font-size:14px; color:#666; padding:0 0 15px 0;">Order details &amp; Shipping information are given below:<br />\r\n									<br />\r\n									 \r\n									<table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="45%">Product</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="5%">Qty</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Price</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="30%">Shipping</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="10%">Tax</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Total</td></tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$80.00</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1 to 3 Business Days by <em>DHL</em><br/><strong>Shipping Charges</strong> (+$35.00)</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">$1.60</td>\r\n				\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$116.60</td>\r\n		  </tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:26:20'),
(13, '', 'maxixx@dummyid.com', 'child_order_status_change', 'Order Item Status Changed at Yokart Multi-Vendor System', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><img src=''http://localhost/yversionv5/image/site_email_logo/2015-12-05.png'' alt=''''  /></td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">Aug 02, 2016</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Maxixx</span>,\r\n								<p style="font-size:13px; color:#666;">Your order item status has been changed to <strong>Payment Confirmed</strong> corresponding to Order Invoice Number&nbsp;<strong>160802-0000702-S0001</strong>.<br/><br/></p>\r\n								<p style="font-size:13px; color:#666;">Your Item details is as below :-</p>\r\n								<p style="font-size:13px; color:#666;"><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="45%">Product</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="5%">Qty</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Price</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="30%">Shipping</td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" width="10%">Tax</td><td style="padding:10px;background:#eee;font-size:13px; border:1px solid #ddd;color:#333; font-weight:bold;" width="10%">Total</td></tr><tr>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><a href="http://localhost/-/products/view/8" style="font-size:13px; color:#333;">FOXY GIRL TICKET-2 FLIP FLOPS RED</a><br/>\r\n				</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$80.00</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">1 to 3 Business Days by <em>DHL</em><br/><strong>Shipping Charges</strong> (+$35.00)</td>\r\n				<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">$1.60</td>\r\n				\r\n			<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" nowrap="nowrap">$116.60</td>\r\n		  </tr></table><br/><br/><table cellspacing="0" cellpadding="0" border="0" width="100%" style="border:1px solid #ddd; border-collapse:collapse;"><tr><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;"  bgcolor="#f0f0f0"><strong>Order Billing Details</strong></td><td style="padding:10px;background:#eee;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;" bgcolor="#f0f0f0"><strong>Order Shipping Details</strong></td></tr><tr><td valign="top" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;" ><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td><td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;"><strong>A</strong><br /># address line 1<br/># address line 2<br/>my city, American Samoa - 567563<br />United States<br/><strong>T</strong>: 123-456-789</td></tr></table></p>\r\n								<p style="font-size:13px; color:#666;"></p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">Yokart Multi-Vendor System&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-08-02 17:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_templates`
--

CREATE TABLE `tbl_email_templates` (
  `tpl_id` int(11) NOT NULL,
  `tpl_code` varchar(50) NOT NULL,
  `tpl_name` varchar(100) NOT NULL,
  `tpl_subject` varchar(250) NOT NULL,
  `tpl_body` text NOT NULL,
  `tpl_replacements` text NOT NULL,
  `tpl_status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_email_templates`
--

INSERT INTO `tbl_email_templates` (`tpl_id`, `tpl_code`, `tpl_name`, `tpl_subject`, `tpl_body`, `tpl_replacements`, `tpl_status`) VALUES
(1, 'forgot_password', 'Forgot Password Email', 'Password reset instructions at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>                          \r\n							<td><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 20px; font-weight: bold;">Dear {user_full_name},</span><br />\r\n								<br />\r\n								\r\n								<table style="color:#666; font-size:13px; padding:0 0 10px 0;">                                    \r\n									<tbody>\r\n										<tr>\r\n											<td>It seems that you have used the forgot password option at <strong>{website_name}</strong> (<strong>{website_url}</strong>).</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td>Please visit the link below to reset your password. Please note that the link is valid for next 24 hours only.<br />\r\n												Password reset url: <a href="{reset_url}">{reset_url}</a><br />\r\n												<br />\r\n												<em>Please ignore this email if you did not use the forgot password option.</em></td>\r\n										</tr>                                  \r\n									</tbody>\r\n								</table>                                \r\n                              \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver<br>\r\n{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n{reset_url} URL to reset the password<br>', 1),
(2, 'contact_us', 'Contact-Us', 'Contact Us Form Submitted on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{name}</span> has submitted the contact us form on {website_name}.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Name</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{name}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Email Address</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{email_address}</td>\r\n														</tr>       \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Phone Number</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{phone_number}</td>\r\n														</tr>                                                        \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Message</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{message}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{name} Name of the person who has submitted the contact form<br />\r\n{email_address} Email Address of the sender<br />\r\n{phone_number} Phone Number of the sender<br />\r\n{message} Additional message sent by sender', 1),
(3, 'send_message', 'Send a Message', 'Message received on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{username}</span> has sent you a message.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="109" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Subject</td>\r\n															<td width="664" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{message_subject}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Message</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{message}</td>\r\n														</tr>    \r\n													</tbody>\r\n												</table>                                              <br />\r\n												\r\n												<div>Please {click_here} to reply to this message.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the person who is receiving this email<br />\r\n{username} Username of the sender<br />\r\n{message_subject} Subject of the message<br />\r\n{message} Additional message/text sent by sender', 1),
(4, 'email_verification', 'Email Verification', 'Email Verification at {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">It seems that you have used the change email address option at {website_name} ({website_url}).</span></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">You need to confirm your new email to get your account activated with this email address. To confirm your new email, please click the link below or copy-paste the URL below in your browserâ€™s address bar:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td><a href="{verification_url}" style="font-size:12px; color:#3687c0;">{verification_url}</a></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver.<br>\r\n{website_name} Name of our website<br>\r\n{website_url} URL/Link of our website<br>\r\n{verification_url} Url to verify email', 1),
(5, 'signup_verification', 'Email Confirmation on Registration', 'Email Verification at {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;"><span style="font-weight: bold;">Thank you for registering at {website_name}.</span></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">You need to confirm your email address to get your FREE account activated. To confirm and activate your account, please click the link below or copy-paste the URL below in your browser address bar:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td><a href="{verification_url}" style="font-size:12px; color:#3687c0;">{verification_url}</a></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver.<br>\r\n{website_name} Name of our website<br>\r\n{verification_url} Url to verify email', 1),
(6, 'primary_order_payment_status_change_buyer', 'Buyers - Primary Order Payment Status Change', 'Order Payment Status Changed at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p style="font-size:13px; color:#666;">Your order payment status has been changed to <span style="font-weight: bold;">{new_order_status}</span> corresponding to Order Invoice Number -&nbsp;<span style="font-weight: bold;">{invoice_number}</span>.</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} - Name of the email receiver.<br/>\r\n{website_name} Name of our website<br>\r\n{new_order_status} New Payment Status (Pending/Paid) <br>\r\n{invoice_number} Invoice Number of the order<br>', 1),
(7, 'primary_order_payment_status_change_admin', 'Admin - Primary Order Payment Status Change', 'Payment Status Changed at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p style="font-size:13px; color:#666;">Order payment status has been changed to <span style="font-weight: bold;">{new_order_status}</span> corresponding to Order Invoice Number -&nbsp;<span style="font-weight: bold;">{invoice_number}</span>.</p>\r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of our website<br>\r\n{invoice_number} Invoice Number of the Order<br>\r\n{new_order_status} New Order Status<br>', 1),
(8, 'report_shop', 'Report a shop', 'Report submitted on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{username}</span> has reported a shop on {website_name}.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="109" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Shop</td>\r\n															<td width="664" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{shop_name}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Reason</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{report_reason}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Message</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{report_message}</td>\r\n														</tr>    \r\n													</tbody>\r\n												</table>\r\n												<div><br />\r\n													</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{username} Username of the person who submitted the Report<br />\r\n{shop_name} Shop Name<br />\r\n{report_reason} Reason for reported<br />\r\n{report_message} Message submitted by the reporter', 1),
(9, 'admin_order_email', 'Admin Order Email', 'Order placed at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">An order has been received on your site with Order Invoice Number <strong>{order_invoice_number}</strong>. Please find the order information below.</span></p>                              \r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">{order_products_table_format}</span></p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} - Name of the email receiver.<br/>\r\n{order_invoice_number} - Invoice Number of the order.<br/>\r\n{order_date} - Date of the order.<br/>\r\n{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n{order_products_table_format} Order Products Summary in Tabular Format.<br>', 1),
(39, 'supplier_request_submitted', 'New Supplier Request Received - Admin', 'Request for new {request_type} submitted on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{username}</span> has submitted a request for new {request_type} - <span style="color: rgb(102, 102, 102); font-family: Arial; font-size: 12px; font-weight: bold;">{request_name}</span>.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{username} Username of the person who submitted the Request<br />\r\n{request_type} Request Type<br />\r\n', 1),
(40, 'supplier_request_status_change', 'Supplier Request Status Change Notification for Suppliers', 'Request {request_status} at {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your request for {request_type} addition - <span style="font-style: italic;"><span style="font-weight: bold;">{request_value} </span>has been <span style="font-weight: bold;">{request_status}</span></span>.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver.<br />\r\n{request_status} - Approved or Declined<br>', 1),
(10, 'customer_order_email', 'Customer Order Email - Notification', 'Order Details from {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">Thanks for placing an order. Your order has been received and will be processed once payment has been confirmed.</span></p>\r\n								<p><span style="font-size:13px; color:#666; padding:10px 0 10px 0;">Your order information is shown below.</span></p>                              \r\n								<p><span style="font-size:13px; color:#666;">{order_products_table_format}</span></p>                            \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} - Name of the email receiver.<br/>\r\n{order_invoice_number} - Invoice Number of the order.<br/>\r\n{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n{order_products_table_format} Order Products Summary in Tabular Format.<br>', 1),
(38, 'reward_points_credited_debited', 'Reward Points Received/Debited Email for Buyer/Supplier', 'Your account has been {type} reward points on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your account has been {type} reward points. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>  \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Points</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{reward_points}</td>\r\n														</tr>    \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comment</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver.<br />\r\n{type} - Credited or Debited<br>{reward_points} - Reward Points<br>{comments} - Comments<br>{website_name} - Name of the website.', 1),
(11, 'child_order_status_change', 'Child Order Status Change - Notification', 'Order Item Status Changed at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p style="font-size:13px; color:#666;">Your order item status has been changed to <strong>{new_order_status}</strong> corresponding to Order Invoice Number&nbsp;<strong>{invoice_number}</strong>.{shipment_information}</p>\r\n								<p style="font-size:13px; color:#666;">Your Item details is show below :-</p>\r\n								<p style="font-size:13px; color:#666;">{order_items_table_format}</p>\r\n								<p style="font-size:13px; color:#666;">{order_admin_comments}</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver<br/> \r\n{new_order_status} New/Current Order Status<br/>\r\n{invoice_number} - Child Order Invoice Number.<br/>\r\n{order_items_table_format} - Child Order Items in Tabular Format.<br/>\r\n{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n', 1),
(12, 'admin_order_notification', 'Admin Order For Customer - Notification', 'Order Notification at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p style="font-size:13px; color:#666;">Your order status has been changed to <strong>{new_order_status}</strong> corresponding to Order Invoice Number&nbsp;<strong>{invoice_number}</strong>.</p>    \r\n								<p style="font-size:13px; color:#666;">{order_admin_comments}</p>\r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n{reset_url} URL to reset the password<br>', 1),
(13, 'vendor_order_email', 'Vendor Order Email', 'Order Received From {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {vendor_name}</span>,\r\n								<p><span style="font-size:16px; display:block;color:#333; font-weight:bold;padding:10px 0 10px 0;">An order has been placed for the following product(s)<br />\r\n										</span></p>\r\n								<p style="font-size:14px; color:#666; padding:0 0 15px 0;">Order details &amp; Shipping information are shown below:<br />\r\n									<br />\r\n									 \r\n									{order_items_table_format}</p>    \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{vendor_name} Name of the vendor<br/>\r\n{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n{order_items_table_format} Order items in Tabular Format.<br>', 1);
INSERT INTO `tbl_email_templates` (`tpl_id`, `tpl_code`, `tpl_name`, `tpl_subject`, `tpl_body`, `tpl_replacements`, `tpl_status`) VALUES
(14, 'withdrawal_request_admin', 'Withdrawal Request - Admin', 'Withdrawal Request on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{username}</span> has submitted a withdrawal request on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Request ID</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_id}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Amount<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_amount}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Bank name</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_bank}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Beneficiary/Account Holder Name<br />\r\n																</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_account_holder}</td>\r\n														</tr> \r\n                                                             \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Bank Account Number<br />\r\n																</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_account_number}</td>\r\n														</tr>    \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">IFSC Code/Swift Code<br />\r\n																</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_ifsc_swift_number}</td>\r\n														</tr> \r\n                                                        \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Bank Address<br />\r\n																</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_bank_address}</td>\r\n														</tr>                                                      \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comments</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{username} Username of the person submitted the withdrawal request<br />\r\n{website_name} Name of the website<br />\r\n{request_id} Withdrawal Request ID<br />\r\n{request_amount} Withdrawal Request Amount<br />\r\n{request_bank} - Withdrawal Request Bank<br>\r\n{request_account_holder} - Account Holder Name<br>\r\n{request_account_number} - Account Number<br>\r\n{request_clabe_number} - Account Clabe Number<br>\r\n{request_rif_number} - Account RIF Number.<br/>\r\n{request_comments} - Additional Comments sent by the sender.', 1),
(15, 'product_review', 'Product Review Notification', 'Review Submitted on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{username}</span> has submitted a product review. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">                                              \r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="109" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n															<td width="664" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{prod_title}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Rating</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{review_rating}</td>\r\n														</tr>    \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Feedback</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{review_text}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{username} Username of the person submitted review.<br />\r\n{prod_title} Product title/name for which review is submitted.<br />\r\n{review_rating} Review Rating Submitted by the reviewer<br />\r\n{review_text} feedback by the reviewer<br />\r\n{website_name} Name of our website.', 1),
(16, 'product_return_buyer_notification', 'Product Return - Buyer Notification', 'Product return request submitted on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your product {return_request_type} request has been submitted to vendor. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_prod_title}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Qty</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_qty}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Request Type</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_request_type}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Reason</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_reason}</td>\r\n														</tr> \r\n                                                             \r\n														   \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comments</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{return_prod_title} Product name/title for which return request is placed.<br />\r\n{return_qty} Number of QTY(s) for which return request is placed.<br />\r\n{return_request_type} Refund or Exchange<br />\r\n{return_reason} Return reason selected by the user.<br/>\r\n{return_comments} Additional comments corresponding to the return request.', 1),
(17, 'product_return', 'Product Return - Vendor Notification', 'Product return request submitted on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{username}</span> has submitted a {return_request_type} request on a product. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Product</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_prod_title}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Qty</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_qty}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Request Type</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_request_type}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Reason</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_reason}</td>\r\n														</tr> \r\n                                                             \r\n														   \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comments</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{return_comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{username} Username of the person, who placed return request.<br/>\r\n{return_request_type} - Refund or Return. .<br/>\r\n{return_prod_title} - Product for which return request is placed.<br />\r\n{return_qty} Return request QTY.<br />\r\n{return_reason} Return Reason selected by buyer.<br />\r\n{return_comments} Comments submitted by the buyer<br />\r\n', 1),
(18, 'threshold_notification_vendor', 'Threshold Level Notification - Vendor', 'Product threshold level achieved on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">\r\n												<div>Your product <span style="font-weight: bold;">{prod_title}</span> has reached a low threshold level on {website_name}.</div>\r\n												<div>&nbsp;</div>\r\n												<div> Please {click_here} to restock or adjust product quantity.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{prod_title} Name of the product<br />\r\n{website_name} Name of the website<br />\r\n{click_here} Click here Link to update inventory.', 1),
(19, 'account_credited_debited', 'Credits Received/Debited Email for Vendor', 'Your account has been {txn_type} on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your account has been {txn_type}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="109" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">ID</td>\r\n															<td width="664" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{txn_id}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Amount</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{txn_amount}</td>\r\n														</tr>    \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comment</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{txn_comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver.<br />\r\n{txn_type} - Credited or Debited<br>{txn_id} - Transaction ID<br/>{txn_amount} - Transaction Amount<br>{txn_comments} - Transaction Comments<br>{website_name} - Name of the website.', 1),
(20, 'withdrawal_request_approved_declined', 'Withdrawal Request Approved/Declined Email for User', 'Fund Withdrawal Request {request_status} on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n                                          \r\n											<td style="font-size:12px; color:#666;">Your fund withdrawal request <span style="font-weight: bold;">{request_id} </span>of  <span style="font-weight: bold;">{request_amount}</span> has been <span style="font-weight: bold;">{request_status}</span> on {website_name}.{request_reason_cancellation}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{request_id} Withdrawal Request ID<br />\r\n{request_amount} Withdrawal Request Amount.<br />\r\n{request_status} New Withdrawal Request Status<br />\r\n{website_name} Name of the website', 1),
(21, 'return_request_message_user', 'Return request message notification - for Buyer/Vendor', 'New message received on return request at {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="color: rgb(102, 102, 102); font-family: Arial; font-size: 12px; font-weight: bold;">{username}</span><span style="color: rgb(102, 102, 102); font-family: Arial; font-size: 12px;">&nbsp;has posted a message on request number <span style="font-weight: bold;">{request_number}</span>.</span></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<div><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">{message}</span></div>\r\n												<div><br />\r\n													</div>\r\n												<div>Please {click_here} to reply to this message.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} - Name of the email receiver<br/>\r\n{username} username of the person posted a message.<br />\r\n{request_number} Request number on which message is posted.<br />\r\n{message} message body/comments sent by the sender<br />\r\n{click_here} Link to reply to the message <br />', 1),
(22, 'return_request_status_change_notification', 'Return request status change notification', 'Return request status changed on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">\r\n												<div><span style="color: rgb(102, 102, 102); font-family: Arial; font-size: 12px; font-weight: bold;">{username}</span><span style="color: rgb(102, 102, 102); font-family: Arial; font-size: 12px;">&nbsp;has <span style="font-weight: bold;">{new_status_name}</span>&nbsp;return request number <span style="font-weight: bold;">{request_number}</span> on {website_name}.</span><br />\r\n													</div>\r\n												<div><br />\r\n													</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver<br />\r\n{username} username of the person<br />\r\n{new_status_name} New Status of the Request<br />\r\n{request_number} Request number<br />\r\n{website_name} Name of the website.', 1),
(23, 'password_changed_successfully', 'Password Changed Successfully', 'Password Changed Successfully at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>                          \r\n							<td><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 20px; font-weight: bold;">Dear {full_name},</span><br />\r\n								<br />\r\n								\r\n								<table style="color:#666; font-size:13px; padding:0 0 10px 0;">                                    \r\n									<tbody>\r\n										<tr>\r\n											<td>You have successfully changed your password, now you can log in with your new password.</td>\r\n										</tr>                                  \r\n									</tbody>\r\n								</table>                                \r\n                              \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{full_name} Name of the email receiver.<br/>\r\n{website_name} Name of our website<br>', 1),
(24, 'new_registration_admin', 'New Registration - Admin', 'New Registration on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">We have received a new registration on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Username</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{username}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Email<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{email}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Name</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{name}</td>\r\n														</tr>                                                        \r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of the website<br />\r\n{username} Username of the person registered<br />\r\n{email} Email Address of the person registered<br />\r\n{name} Name of the person registered<br />\r\n', 1),
(25, 'welcome_registration', 'Welcome Mail on Registration', 'Welcome to {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;"><span style="font-weight: bold;">Thank you for signing up on {website_name}.</span><br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">\r\n												<div>We are thrilled to have you aboard! You have taken a great first step and we are so excited to connect directly with you.</div>\r\n												<div><br />\r\n													</div>\r\n												<div>If you require any assistance in using our site, or have any feedback or suggestions, you can email us at {contact_us_email}</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{name} Name of the signed up user.<br>\r\n{email} Email Address of the signed up user.<br>\r\n{username} Username of the signed up User <br/>\r\n{contact_us_email} - Contact Us Email Address<br/>\r\n{website_name} Name of our website<br>\r\n', 1),
(26, 'order_cancellation_notification', 'Order Cancellation Notification - Vendor & Admin', 'Order Cancellation Request Received on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">\r\n												<div>Buyer has submitted an Order Cancellation Request corresponding to Order Invoice Number <span style="font-weight: bold;">{invoice_number}</span>.<br />\r\n													</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{website_name} Name of the website<br />\r\n{click_here} Click here Link to update inventory.', 1),
(27, 'cancellation_request_approved_declined', 'Cancellation Request Approved/Declined Email for User', 'Order Cancellation Request {request_status} on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your order cancellation request on&nbsp;<span style="font-weight: bold;">{invoice_number}</span> has been <span style="font-weight: bold;">{request_status}</span> on {website_name}.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{invoice_number} Order Invoice Number<br />\r\n{request_status} New Withdrawal Request Status<br />\r\n{website_name} Name of the website', 1);
INSERT INTO `tbl_email_templates` (`tpl_id`, `tpl_code`, `tpl_name`, `tpl_subject`, `tpl_body`, `tpl_replacements`, `tpl_status`) VALUES
(28, 'new_supplier_approval_admin', 'New Supplier Approval Request - Admin', 'New Supplier Approval Request on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">We have received a new supplier approval request on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>                                                    \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Reference Number</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{reference_number}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Username</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{username}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Email<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{email}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Name</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{name}</td>\r\n														</tr>                                                                                                            \r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of the website<br />\r\n{username} \r\n\r\nUsername of the person registered<br />\r\n{email} Email Address of the person registered<br />\r\n{name} Name of the person sent request<br />\r\n{reference_number} \r\n\r\nReference Number of the request<br />\r\n', 1),
(29, 'supplier_request_status_change_buyer', 'Buyers - Supplier Request Status Change', 'Your Supplier Request {new_request_status} at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p style="font-size:13px; color:#666;">Your supplier approval request has been&nbsp;<span style="font-weight: bold;">{new_request_status}</span> corresponding to Reference Number -&nbsp;<span style="font-weight: bold;">{reference_number}</span>.{request_comments}</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} - Name of the email receiver.<br/>\r\n{website_name} Name of our website<br>\r\n\r\n\r\n{new_request_status} New Request Status (Approved/Declined) <br>\r\n{reference_number} Reference Number of the request<br>', 1),
(30, 'smtp_settings', 'Test settings - Admin', 'Test Email From {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">This is just a test email to test email settings on your hosting.<br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of the website<br />\r\n', 1),
(31, 'user_send_email', 'User & Affiliate Send Email', '{admin_subject}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">{admin_message}<br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver<br>\r\n{website_name} Name of the website<br />\r\n', 1),
(32, 'affiliate_account_activated', 'Affiliate Account activated', 'Your Affiliate Account has been activated on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;"><span style="font-weight: bold;">Thank you for signing up on {website_name}.</span><br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">Your account has now been created and you can log in by using your email address and password by visiting our website or at the following URL:<br />\r\n												{affiliate_page_url}<br />\r\n												<br />\r\n												    Upon logging in, you will be able to generate tracking codes, track commission payments and edit your account information.<br />\r\n												<br />\r\n												If you require any assistance in using our site, or have any feedback or suggestions, you can email us at {contact_us_email}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{name} Name of the signed up user.<br>\r\n{email} Email Address of the signed up user.<br>\r\n{username} Username of the signed up User <br/>\r\n{contact_us_email} - Contact Us Email Address<br/>\r\n{website_name} Name of our website<br>\r\n', 1),
(33, 'welcome_affiliate_registration', 'Affiliate - Registration Mail', '{website_name} - Affiliate Program', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;"><span style="font-weight: bold;">Thank you for joining the {website_name} Affiliate Program!</span><br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">\r\n												<div>{affiliate_account_login_approved_text}</div>\r\n												<div>{affiliate_page_url}</div>\r\n												<div>&nbsp;</div>\r\n												<div>Upon logging in, you will be able to generate tracking codes, track commission payments and edit your account information.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{name} Name of the signed up user.<br>\r\n{email} Email Address of the signed up user.<br>\r\n{username} Username of the signed up User <br/>\r\n{contact_us_email} - Contact Us Email Address<br/>\r\n{website_name} Name of our website<br>\r\n', 1),
(34, 'affiliate_registration_admin', 'New Affiliate Registration - Admin', 'New Affiliate Registration on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">We have received a new affiliate registration on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Username</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{username}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Email<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{email}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Name</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{name}</td>\r\n														</tr>                                                        \r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of the website<br />\r\n{username} Username of the person registered<br />\r\n{email} Email Address of the person registered<br />\r\n{name} Name of the person registered<br />\r\n', 1),
(35, 'affiliate_withdrawal_request_admin', 'Affiliate Withdrawal Request - Admin', 'Affiliate Withdrawal Request on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{affiliate_username}</span> has submitted a withdrawal request on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Request ID</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_id}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Amount<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_amount}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Payment Mode</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_payment_mode}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Payment Details</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_payment_details}</td>\r\n														</tr> \r\n                                                                                                       \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comments</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{affiliate_username} Username of the person submitted the withdrawal request<br />\r\n{website_name} Name of the website<br />\r\n{request_id} Withdrawal Request ID<br />\r\n{request_amount} Withdrawal Request Amount<br />\r\n{request_payment_mode} - Withdrawal Request Payment Mode<br>\r\n{request_payment_details} - Withdrawal Request Payment Details<br>\r\n{request_comments} - Additional Comments sent by the sender.', 1),
(36, 'affiliate_withdrawal_request_approved_declined', 'Affiliate Withdrawal Request Approved/Declined Email for Affiliate', 'Fund Withdrawal Request {request_status} on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {affiliate_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your fund withdrawal request <span style="font-weight: bold;">{request_id} </span>of  <span style="font-weight: bold;">{request_amount}</span> has been <span style="font-weight: bold;">{request_status}</span> on {website_name}.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{affiliate_name} Name of the email receiver<br />\r\n{request_id} Withdrawal Request ID<br />\r\n{request_amount} Withdrawal Request Amount.<br />\r\n{request_status} New Withdrawal Request Status<br />\r\n{website_name} Name of the website', 1),
(37, 'invitation_email', 'Invitation Email for Friends', '{website_name} - Your friend has invited you for Amazing Discounts.', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Friend,</td>\r\n										</tr>\r\n										<tr>\r\n											<td></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">\r\n												<div>\r\n													<div>This is an invitation from {Sender_Name} to join them on "{website_name}" and enjoy Amazing Discounts.</div>\r\n													<div><br />\r\n														</div>\r\n													<div>Click the link below to accept this invitation:</div>\r\n													<div>{Tracking_URL}</div>\r\n													<div>&nbsp;</div>\r\n													<div>{Invitation_Message}</div></div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{Sender_Name} Name of the sender.<br>\r\n{Website_Name}  Name of the website<br>\r\n{Tracking_URL} -  Tracking URL<br/>\r\n{Personal_Message} Personal Message by Sender <br>\r\n', 1),
(41, 'blog_comment_email', 'Blog Comment', 'Blog Comment Posted', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{user_full_name}</span> has submitted a blog comment.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Post Name</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{post_name}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comment</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{comment}</td>\r\n														</tr>    \r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{comment} Message \n{post_name} POST Name  \n{site_name} Site Name  \n{user_full_name} User Name\n{website_name} =>Website name \n{Company_Logo} =>Website Logo', 1),
(42, 'contribution_email_to_admin', 'Contribution Email To Admin', 'Blog Contribution Status', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{user_full_name}</span> has submitted a blog contribution.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Posted On</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{posted_on}</td>\r\n														</tr>    \r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Email</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{user_email}</td>\r\n														</tr> \r\n														<tr>\r\n															<td width="136" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Phone</td>\r\n															<td width="637" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{user_phone}</td>\r\n														</tr>    \r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_email} User Email\n{user_phone} User Phone\n{posted_on} Posted on date\n{site_name} Site Name  \n{user_full_name} User Name\n{website_name} =>Website name \n{Company_Logo} =>Website Logo', 1),
(43, 'welcome_advertiser_registration', 'Advertiser - Registration Mail', '{website_name} - Advertiser Program', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;"><span style="font-weight: bold;">Thank you for joining the {website_name} as an Advertiser!</span><br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">\r\n												<div>{advertise_account_login_approved_text}</div>\r\n												<div>{advertise_page_url}</div>\r\n												<div>&nbsp;</div>\r\n												<div>Upon logging in, you will be able to create your own advertisements and edit your account information.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{name} Name of the signed up user.<br>\r\n{email} Email Address of the signed up user.<br>\r\n{username} Username of the signed up User <br/>\r\n{contact_us_email} - Contact Us Email Address<br/>\r\n{website_name} Name of our website<br>\r\n', 1),
(44, 'advertiser_registration_admin', 'New Advertiser Registration - Admin', 'New Advertiser Registration on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">We have received a new advertiser registration on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Username</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{username}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Email<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{email}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Name</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{name}</td>\r\n														</tr>                                                        \r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of the website<br />\r\n{username} Username of the person registered<br />\r\n{email} Email Address of the person registered<br />\r\n{name} Name of the person registered<br />\r\n', 1),
(45, 'advertiser_account_activated', 'Advertiser Account activated', 'Your Advertiser Account has been activated on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;"><span style="font-weight: bold;">Thank you for signing up on {website_name}.</span><br />\r\n												</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#333333;">Your account has now been created and you can log in by using your email address and password by visiting our website or at the following URL:<br />\r\n												{advertiser_page_url}<br />\r\n												\r\n												<div>&nbsp;</div>\r\n												<div><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 12px;">Upon logging in, you will be able to create your own advertisements and edit your account information.</span><br />\r\n													</div><br />\r\n												If you require any assistance in using our site, or have any feedback or suggestions, you can email us at {contact_us_email}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name} Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{name} Name of the signed up user.<br>\r\n{email} Email Address of the signed up user.<br>\r\n{username} Username of the signed up User <br/>\r\n{contact_us_email} - Contact Us Email Address<br/>\r\n{website_name} Name of our website<br>\r\n', 1);
INSERT INTO `tbl_email_templates` (`tpl_id`, `tpl_code`, `tpl_name`, `tpl_subject`, `tpl_body`, `tpl_replacements`, `tpl_status`) VALUES
(46, 'advertiser_withdrawal_request_admin', 'Advertiser Withdrawal Request - Admin', 'Advertiser Withdrawal Request on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;"><span style="font-weight: bold;">{advertiser_username}</span> has submitted a withdrawal request on {website_name}. Please find the details below:</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:12px; color:#666;">\r\n												<table cellspacing="0" cellpadding="0" border="0" style="border:1px solid #ddd; border-collapse:collapse; width:775px;">\r\n													<tbody>\r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Request ID</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_id}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Amount<span class="Apple-tab-span" style="white-space:pre"></span></td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_amount}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Payment Mode</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_payment_mode}</td>\r\n														</tr>                                                        \r\n														<tr>\r\n															<td width="153" style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Payment Details</td>\r\n															<td width="620" style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_payment_details}</td>\r\n														</tr> \r\n                                                                                                       \r\n														<tr>    \r\n															<td style="padding:10px;font-size:13px;border:1px solid #ddd; color:#333; font-weight:bold;">Comments</td>\r\n															<td style="padding:10px;font-size:13px; color:#333;border:1px solid #ddd;">{request_comments}</td>\r\n														</tr>\r\n													</tbody>\r\n												</table></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{advertiser_username} Username of the person submitted the withdrawal request<br />\r\n{website_name} Name of the website<br />\r\n{request_id} Withdrawal Request ID<br />\r\n{request_amount} Withdrawal Request Amount<br />\r\n{request_payment_mode} - Withdrawal Request Payment Mode<br>\r\n{request_payment_details} - Withdrawal Request Payment Details<br>\r\n{request_comments} - Additional Comments sent by the sender.', 1),
(47, 'advertiser_withdrawal_request_approved_declined', 'Advertiser Withdrawal Request Approved/Declined Email for Advertiser', 'Fund Withdrawal Request {request_status} on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {advertiser_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">Your fund withdrawal request <span style="font-weight: bold;">{request_id} </span>of  <span style="font-weight: bold;">{request_amount}</span> has been <span style="font-weight: bold;">{request_status}</span> on {website_name}.</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{advertiser_name} Name of the email receiver<br />\r\n{request_id} Withdrawal Request ID<br />\r\n{request_amount} Withdrawal Request Amount.<br />\r\n{request_status} New Withdrawal Request Status<br />\r\n{website_name} Name of the website', 1),
(48, 'wallet_balance_notification_vendor', 'Low Wallet Balance Notification - Vendor', 'Low Wallet Balance on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">\r\n												<div>Your wallet balance&nbsp;has decreased to <span style="font-weight: bold;">{current_wallet_balance} </span>on {website_name}. </div>\r\n												<div>&nbsp;</div>\r\n												<div>If you are currently running any paid Promotions, please keep your wallet sufficiently funded as charges for promotion(s) will be deducted from your wallet.</div>\r\n												<div>&nbsp;</div>\r\n												<div> Please {click_here} to add funds to your wallet.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{website_name} Name of the website<br />\r\n{click_here} Click here to add funds to your wallet.', 1),
(49, 'unapproved_promotion_admin', 'Un-Approved Promotion - Admin', 'Un-Approved Promotion on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear Admin,</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">\r\n												<div>A promotion <strong style="color: rgb(102, 102, 102); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);">{promotion_number}&nbsp;</strong>was added/updated on {website_name} and is currently pending approval.&nbsp;</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of the website<br />\r\n{promotion_number} Number/Identifier of Promotion<br/>\r\n', 1),
(50, 'promotion_approved', 'Promotion Approved Notification for Promoter', 'Your Promotion has been approved on {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p style="font-size:13px; color:#666;">Your promotion&nbsp;<strong>{promotion_number} </strong>has been approved.</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the Promoter<br/>{promotion_number} Number/Identifier of Promotion<br/>\r\n{website_name} Name of our website<br>\r\n', 1),
(51, 'subscription_status_change', 'Subscription Status Change - Notification', 'Subscription Status Changed at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>,\r\n								<p style="font-size:13px; color:#666;">Your subscription status has been changed to <strong>{new_subscription_status}</strong> corresponding to Subscription Invoice Number&nbsp;<strong>{subscription_invoice_number}</strong>.</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} Name of the email receiver<br/> \r\n{new_subscription_status} New/Current Subscription Status<br/>\r\n{subscription_invoice_number} - Subscription  Invoice Number.<br/>\r\n{website_name} Name of our website<br>\r\n{website_url} URL of our website<br>\r\n', 1),
(52, 'subscription_details_buyer', 'Buyers - Subscription Details', 'Subscription Details from {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear {user_full_name}</span>, \r\n								<p style="font-family: arial; background-color: rgb(255, 255, 255); font-size: 13px; color: rgb(102, 102, 102);">You have successfully purchased a subscription on our site<span style="font-weight: bold;">.&nbsp;</span>Please find the subscription details below.</p>\r\n								<p style="font-family: arial; background-color: rgb(255, 255, 255); font-size: 13px; color: rgb(102, 102, 102);">{subscription_details}&nbsp;</p>   \r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_full_name} - Name of the email receiver.<br/>\r\n{website_name} Name of our website<br>\r\n{subscription_payment_status} New Payment Status (Pending/Paid) <br>\r\n{subscription_invoice_number} Invoice Number of the Subscription<br>\r\n{subscription_details} Subscription Details<br>', 1),
(53, 'subscription_details_admin', 'Admin - Subscription Details', 'Subscription Purchased at {website_name}', '<table cellspacing="0" cellpadding="0" border="0" align="center" style="font-family:arial; width:780px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>{Company_Logo}</td>\r\n							<td>\r\n								<table cellspacing="0" cellpadding="0" border="0" style="width:100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="text-align:right; padding:10px;color:#333; font-weight:bold;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table cellspacing="0" cellpadding="0" border="0" style="background:#fff;border:1px solid #dbdada; padding:10px 10px 0 10px; width:100%">\r\n					<tbody>\r\n						<tr>\r\n							<td><span style="color: rgb(13, 68, 107); font-size: 20px; font-weight: bold;">Dear Admin</span>,\r\n								<p style="font-size:13px; color:#666;">A Subscription has been purchased on your site<span style="font-weight: bold;">.&nbsp;</span>Please find the subscription details below.</p>\r\n								<p style="font-size:13px; color:#666;"><span style="color: rgb(102, 102, 102); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);">{subscription_details}</span></p>\r\n								<p><span style="color: rgb(13, 68, 107); font-size: 15px; font-weight: bold;">Thanks,<br />\r\n										</span><span style="color: rgb(13, 68, 107); font-family: Arial; font-size: 15px; font-weight: bold;">{website_name}&nbsp;Team</span><br />\r\n									</p></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{website_name} Name of our website<br>\r\n{subscription_invoice_number} Invoice Number of the Subscription <br>\r\n{subscription_payment_status} New Payment Status<br>{subscription_invoice_number} Invoice Number of the Subscription<br>\r\n{subscription_details} Subscription Details<br>', 1),
(54, 'subscription_expiry_alert', 'Subscription Expiry Notification - Vendor', 'Subscription About to Expire on {website_name}', '<table align="center" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial;" width="650">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td style="padding:10px 0 10px 0;"><span style="font-family: arial;">{Company_Logo}</span><br />\r\n								</td>\r\n							<td valign="top">\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right" style="font-size:14px; color:#666666; padding:15px 0 8px 0;">{current_date}</td>\r\n										</tr>\r\n										<tr>\r\n											<td align="right">&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #dbdada; padding:10px 10px 0 10px;" width="100%">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<table border="0" cellpadding="0" cellspacing="0" width="100%">\r\n									<tbody>\r\n										<tr>\r\n											<td style="font-size:20px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Dear {user_full_name},</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>                                          \r\n											<td style="font-size:12px; color:#666;">\r\n												<div>Your subscription on {website_name} is about to expire on <span style="font-weight: bold;">{subscription_end_date}</span>.</div>\r\n												<div>&nbsp;</div>\r\n												<div> Please {click_here} to view details of your subscription.</div></td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n										<tr>\r\n											<td style="font-size:15px; color:#0d446b; font-weight:bold; padding:5px 0 0 0;">Thanks,<br />\r\n												{website_name}&nbsp;Team</td>\r\n										</tr>\r\n										<tr>\r\n											<td>&nbsp;</td>\r\n										</tr>\r\n									</tbody>\r\n								</table></td>\r\n						</tr>\r\n					</tbody>\r\n				</table></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '{user_name} Name of the email receiver<br />\r\n{website_name} Name of the website<br />\r\n{subscription_end_date} Subscription End Date<br />\r\n{click_here} - Subscription URL\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_empty_cart_items`
--

CREATE TABLE `tbl_empty_cart_items` (
  `emptycartitem_id` int(11) NOT NULL,
  `emptycartitem_title` varchar(255) NOT NULL,
  `emptycartitem_url` varchar(255) NOT NULL,
  `emptycartitem_status` tinyint(4) NOT NULL,
  `emptycartitem_link_newtab` tinyint(4) NOT NULL DEFAULT '1',
  `emptycartitem_priority` int(11) NOT NULL,
  `emptycartitem_is_deleted` tinyint(1) NOT NULL,
  `emptycartitem_is_mandatory` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_empty_cart_items`
--

INSERT INTO `tbl_empty_cart_items` (`emptycartitem_id`, `emptycartitem_title`, `emptycartitem_url`, `emptycartitem_status`, `emptycartitem_link_newtab`, `emptycartitem_priority`, `emptycartitem_is_deleted`, `emptycartitem_is_mandatory`) VALUES
(1, 'Favorite Products', '{SITEROOT}account/favorites', 1, 0, 1, 0, 1),
(2, 'Favorite Stores', '{SITEROOT}account/favorite_shops', 1, 0, 2, 0, 1),
(3, 'Top 50 Products', '{SITEROOT}products/top_50', 1, 0, 3, 0, 1),
(4, 'Featured Products', '{SITEROOT}products/featured', 1, 0, 4, 0, 1),
(5, 'Featured Shops', '{SITEROOT}shops/featured', 1, 0, 5, 0, 1),
(6, 'New Stuff', '{SITEROOT}products/new_stuff', 1, 0, 6, 0, 1),
(7, 'Browse All Brands', '{SITEROOT}brands', 1, 0, 7, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_extra_pages`
--

CREATE TABLE `tbl_extra_pages` (
  `epage_id` int(11) NOT NULL,
  `epage_label` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `epage_content` text COLLATE latin1_general_ci NOT NULL,
  `epage_identifier` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbl_extra_pages`
--

INSERT INTO `tbl_extra_pages` (`epage_id`, `epage_label`, `epage_content`, `epage_identifier`) VALUES
(1, 'Contact Us', '<h3>Contact the Seller</h3>              \r\n<p><strong>YoKart</strong> is a venue made up of individual artists and crafters who maintain their own online shops. If you have a question about an item or an order you have placed, contact the seller directly.<br />\r\n	                <br />\r\n	                Learn more about contacting individual <strong>YoKart</strong> sellers <a href="javascript:void(0)">here</a>.</p>              \r\n<h3>Contact Support</h3>              \r\n<p>Have a question for <strong>YoKart</strong> Support? First, search our Help Page for <a href="javascript:void(0)">answers</a> ! <br />\r\n	                If you''re unable to find what you''re looking for, contact us <a href="javascript:void(0)">here</a>.</p>              \r\n<h3>Contact our Press Teams</h3>              \r\n<p>Contact YoKart''s press and media folks: press@ponwa.com</p>              \r\n<h3>Contact our Legal Department</h3>              \r\n<p>If you need to contact ponwa regarding an intellectual property matter, please refer to our <a href="javascript:void(0)">Copyright and Intellectual Property Policy</a>. This document outlines the information required for reporting infringement and the ways to submit it. </p>', 'CONTACT_US_CONTENT_BLOCK'),
(2, 'Footer Options', '<div class="contact-here">                \r\n	<div class="contact"> \r\n		<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="70px" height="70px" viewbox="-364 606 70 70" enable-background="new -364 606 70 70" xml:space="preserve">                  \r\n			<g>                    \r\n				<path fill="#999999" d="M-329,606c-19.4,0-35,15.6-35,35s15.6,35,35,35s35-15.6,35-35C-294.1,621.6-309.8,606-329,606L-329,606z M-329,673.3c-18,0-32.4-14.5-32.4-32.2c0-17.8,14.4-32.4,32.4-32.4c17.8,0,32.4,14.4,32.4,32.4 C-296.8,658.8-311.2,673.3-329,673.3L-329,673.3z"></path>                  </g>                  \r\n			<g>                    \r\n				<g>                      \r\n					<path fill="#999999" d="M-320.5,621.3h-17c-2,0-3.6,1.6-3.6,3.6v31.5c0,2,1.6,3.6,3.6,3.6h17c2,0,3.6-1.6,3.6-3.6V625 C-316.9,623-318.5,621.3-320.5,621.3L-320.5,621.3z M-333.8,623.1h9.7v1.2h-9.7V623.1z M-329,657.7c-1.3,0-2.4-1.1-2.4-2.4 s1.1-2.4,2.4-2.4s2.4,1.1,2.4,2.4S-327.7,657.7-329,657.7L-329,657.7z M-319.3,650.4h-19.4v-24.2h19.4 C-319.3,626.2-319.3,650.4-319.3,650.4z"></path>                    </g>                  </g>                  </svg>TRY OUR MOBILE APP <span class="under-txt"><a href="#">Download Now</a></span></div>                \r\n	<div class="contact"> \r\n		<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="70px" height="70px" viewbox="-364 606 70 70" enable-background="new -364 606 70 70" xml:space="preserve">                  \r\n			<g>                    \r\n				<path fill="#999999" d="M-329,606c-19.4,0-35,15.6-35,35s15.6,35,35,35s35-15.6,35-35C-294.1,621.6-309.8,606-329,606L-329,606z M-329,673.3c-18,0-32.4-14.5-32.4-32.2c0-17.8,14.4-32.4,32.4-32.4c17.8,0,32.4,14.4,32.4,32.4 C-296.8,658.8-311.2,673.3-329,673.3L-329,673.3z"></path>                  </g>                  \r\n			<path fill="#999999" d="M-333.4,633.3l-5.9-10.6c1.1-0.8,2.4-1.7,3.5-2.5c0.5-0.3,1.3-0.2,1.7,0.4l4.6,8.2c0.3,0.6,0.2,1.5-0.3,1.9 l-3,2.2C-333.1,633-333.3,633.2-333.4,633.3L-333.4,633.3z M-329.9,649c-1-1.5-1.9-3.1-2.9-4.8c-0.9-1.6-1.8-3.3-2.6-5 c-0.6-1.3-0.6-3.1,0.2-4.3l-6.1-10.9c-2.2,1.6-3,6.9-1.9,12c0.5,2.2,1.3,4.3,2,6.3c0.8,1.9,1.8,3.9,2.8,5.7c1,1.8,2.1,3.7,3.3,5.4 c1.3,1.7,2.6,3.3,4.1,4.8c3.6,3.4,8.2,4.8,10.4,3.2l-6.1-10.9C-327.6,650.8-329,650.2-329.9,649L-329.9,649z M-314.6,655.7l-4.6-8.2 c-0.3-0.6-1.1-0.8-1.7-0.4l-1.6,1.1l-1.5,1c-0.2,0.1-0.4,0.2-0.5,0.3l5.9,10.6c1.1-0.9,2.4-1.7,3.5-2.5 C-314.4,657.2-314.2,656.3-314.6,655.7L-314.6,655.7z"></path>                  </svg> Need ASSISTANCE? <span class="under-txt">Call Us: 0836-363-363</span></div>                \r\n	<div class="contact"> \r\n		<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="-270.3 362 70 70" style="enable-background:new -270.3 362 70 70;" xml:space="preserve"> \r\n			<style type="text/css"> \r\n.st0{fill:#999999;} </style> \r\n			<g> \r\n				<path class="st0" d="M-235.3,362c-19.4,0-35,15.6-35,35s15.6,35,35,35s35-15.6,35-35C-200.4,377.6-216.1,362-235.3,362L-235.3,362z M-235.3,429.3c-18,0-32.4-14.5-32.4-32.2c0-17.8,14.4-32.4,32.4-32.4c17.8,0,32.4,14.4,32.4,32.4 C-203.1,414.8-217.5,429.3-235.3,429.3L-235.3,429.3z"></path> </g> \r\n			<g> \r\n				<g id="Shape_17"> \r\n					<g> \r\n						<path class="st0" d="M-213.4,386c0-1-0.4-1.8-1-2.5c0,0,0,0,0,0c0,0,0,0,0,0c-0.7-0.7-1.7-1.2-2.7-1.2h-37.5 c-1.1,0-2.1,0.5-2.7,1.2c0,0,0,0,0,0c0,0,0,0,0,0c-0.6,0.7-1,1.5-1,2.5V408c0,1,0.4,1.9,1,2.5c0,0,0,0,0,0c0,0,0,0,0,0 c0.7,0.7,1.7,1.1,2.7,1.1h37.5c1.1,0,2-0.4,2.7-1.1c0,0,0,0,0,0c0,0,0,0,0,0c0.6-0.7,1-1.6,1-2.5L-213.4,386L-213.4,386z M-228.2,395.8l13-10.8c0.1,0.3,0.2,0.6,0.2,0.9V408c0,0.3-0.1,0.6-0.2,0.8L-228.2,395.8z M-217.2,383.8c0.3,0,0.6,0.1,0.9,0.2 l-19.7,16.3l-19.7-16.3c0.3-0.1,0.6-0.2,0.9-0.2H-217.2z M-256.8,408.9c-0.1-0.3-0.2-0.5-0.2-0.8V386c0-0.3,0.1-0.6,0.2-0.9 l13,10.8L-256.8,408.9z M-254.8,410.2c-0.4,0-0.7-0.1-1-0.2l13.2-13.2l6.1,5c0.1,0.1,0.3,0.2,0.5,0.2s0.4-0.1,0.5-0.2l6.1-5 l13.2,13.2c-0.3,0.2-0.6,0.2-1,0.2H-254.8L-254.8,410.2z"></path> </g> </g> </g> </svg>CONTACT US  <span class="under-txt">{SITE_EMAIL_ADDRESS}</span></div>              </div>', 'FOOTER_OPTION_CONTENT_BLOCK');
INSERT INTO `tbl_extra_pages` (`epage_id`, `epage_label`, `epage_content`, `epage_identifier`) VALUES
(3, 'Become Seller', '<!--\r\nBecome seller page\r\n-->\r\n      \r\n      \r\n<div class="seller-slide" style="background-image:url(images/seller-banner.jpg);">        \r\n	<div class="seller-txt">          \r\n		<div class="title">Lots of shoppers want  to see<br />\r\n			            what you have in store</div>          <a href="{SITEROOT}supplier" class="btn red large">Open Your Shop</a> </div>        \r\n	<div class="scroll-links">          \r\n		<ul>            \r\n			<li><a href="#fees">Fees</a></li>            \r\n			<li><a href="#tools">Tools</a></li>            \r\n			<li><a href="#support">Support</a></li>            \r\n			<li><a href="#faq">FAQ</a></li>          \r\n		</ul>        </div>      </div>      \r\n<div id="fees" class="section-fees bg-fees">        \r\n	<div class="fixed-container">          \r\n		<div class="headings">            \r\n			<h2>Join a creative marketplace where millions buyers\r\n              around the world shop for somthing unique</h2>          </div>          \r\n		<div class="three-box">            \r\n			<div class="box">              \r\n				<div class="icn"> <span class="svg-icn">                \r\n						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                  \r\n							<defs> </defs>                  \r\n							<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                </svg>                </span> </div>              \r\n				<h3>Dummy Text Lorem</h3>              \r\n				<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type... </p>            </div>            \r\n			<div class="box">              \r\n				<div class="icn"> <span class="svg-icn">                \r\n						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="116" height="103.097" viewbox="0 0 116 103.097">                  \r\n							<defs> </defs>                  \r\n							<path d="M116.000,90.530 L116.000,90.530 C116.000,97.476 110.356,103.104 103.391,103.104 L103.391,103.104 L12.609,103.104 L12.609,103.104 C5.644,103.104 -0.000,97.476 -0.000,90.530 L-0.000,17.605 C-0.000,12.050 4.516,7.546 10.087,7.546 L10.087,7.546 L60.953,7.546 L81.376,0.168 C82.670,-0.302 84.102,0.364 84.574,1.650 L86.725,7.546 L95.826,7.546 C101.397,7.546 105.913,12.050 105.913,17.605 L105.913,22.634 L105.913,22.634 C111.484,22.634 116.000,27.138 116.000,32.693 L116.000,90.530 ZM10.087,12.576 L10.087,12.576 C7.303,12.576 5.043,14.829 5.043,17.605 C5.043,20.381 7.303,22.634 10.087,22.634 L18.774,22.634 L18.774,22.634 L19.251,22.634 C19.284,22.622 19.304,22.594 19.337,22.582 L47.030,12.576 L10.087,12.576 ZM83.414,13.031 L80.736,5.678 L80.733,5.678 L80.733,5.678 L75.561,7.546 L75.569,7.546 L61.664,12.576 L61.639,12.576 L33.801,22.634 L86.914,22.634 L83.414,13.031 ZM100.870,17.605 C100.870,14.829 98.610,12.576 95.826,12.576 L88.556,12.576 L92.222,22.634 L100.870,22.634 L100.870,22.634 L100.870,17.605 ZM105.913,27.664 L10.087,27.664 L10.087,27.664 C8.241,27.664 6.531,27.133 5.043,26.268 L5.043,90.530 C5.043,94.697 8.433,98.074 12.609,98.074 L103.391,98.074 C107.570,98.074 110.956,94.697 110.956,90.530 L110.956,72.928 L100.870,72.928 C95.299,72.928 90.783,68.424 90.783,62.869 C90.783,57.314 95.299,52.811 100.870,52.811 L110.956,52.811 L110.956,32.693 C110.956,29.917 108.697,27.664 105.913,27.664 ZM110.956,67.898 L110.956,57.840 L100.870,57.840 C98.086,57.840 95.826,60.093 95.826,62.869 C95.826,65.645 98.086,67.898 100.870,67.898 L110.956,67.898 ZM100.870,60.355 L105.913,60.355 L105.913,65.384 L100.870,65.384 L100.870,60.355 Z" class="cls-1"></path>                </svg>                </span> </div>              \r\n				<h3>Dummy Text Lorem</h3>              \r\n				<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type... </p>            </div>            \r\n			<div class="box">              \r\n				<div class="icn"> <span class="svg-icn">                \r\n						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="116" height="95.816" viewbox="0 0 116 95.816">                  \r\n							<defs> </defs>                  \r\n							<path d="M105.913,95.818 L17.652,95.818 C12.082,95.818 7.565,91.302 7.565,85.732 L7.565,37.460 C3.220,36.336 -0.000,32.427 -0.000,27.732 L-0.000,20.235 C-0.000,20.230 -0.000,20.227 -0.000,20.222 L-0.000,20.166 C-0.000,19.770 0.108,19.410 0.270,19.075 C0.282,19.052 0.300,19.037 0.313,19.016 C0.479,18.696 0.714,18.431 0.996,18.209 L18.219,0.989 C18.678,0.399 19.367,-0.008 20.174,-0.008 L20.227,-0.008 C20.232,-0.008 20.237,-0.008 20.242,-0.008 L35.357,-0.008 C35.362,-0.008 35.367,-0.008 35.372,-0.008 L50.488,-0.008 C50.493,-0.008 50.498,-0.008 50.503,-0.008 L65.618,-0.008 C65.623,-0.008 65.628,-0.008 65.633,-0.008 L80.749,-0.008 C80.754,-0.008 80.759,-0.008 80.764,-0.008 L105.913,-0.008 C111.483,-0.008 116.000,4.509 116.000,10.079 L116.000,10.079 L116.000,85.732 C116.000,91.302 111.483,95.818 105.913,95.818 ZM35.304,90.775 L35.304,90.775 L35.304,68.079 L25.217,68.079 L25.217,90.775 L25.217,90.775 L35.304,90.775 ZM5.043,27.732 C5.043,30.515 7.303,32.775 10.087,32.775 C12.871,32.775 15.130,30.515 15.130,27.732 L15.130,22.688 L5.043,22.688 L5.043,27.732 ZM21.135,5.036 L8.526,17.645 L16.691,17.645 L29.300,5.036 L21.135,5.036 ZM20.174,27.732 C20.174,30.515 22.433,32.775 25.217,32.775 C28.001,32.775 30.261,30.515 30.261,27.732 L30.261,22.688 L20.174,22.688 L20.174,27.732 ZM36.265,5.036 L23.656,17.645 L31.822,17.645 L44.430,5.036 L36.265,5.036 ZM35.304,27.732 C35.304,30.515 37.564,32.775 40.348,32.775 C43.132,32.775 45.391,30.515 45.391,27.732 L45.391,22.688 L35.304,22.688 L35.304,27.732 ZM51.395,5.036 L38.787,17.645 L46.952,17.645 L59.561,5.036 L51.395,5.036 ZM50.435,27.732 C50.435,30.515 52.694,32.775 55.478,32.775 C58.262,32.775 60.522,30.515 60.522,27.732 L60.522,22.688 L50.435,22.688 L50.435,27.732 ZM66.526,5.036 L53.917,17.645 L62.083,17.645 L74.691,5.036 L66.526,5.036 ZM78.174,8.518 L65.565,21.127 L65.565,27.732 C65.565,33.302 61.049,37.818 55.478,37.818 C52.450,37.818 49.761,36.454 47.913,34.341 C46.065,36.454 43.376,37.818 40.348,37.818 C37.319,37.818 34.631,36.454 32.783,34.341 C30.934,36.454 28.246,37.818 25.217,37.818 C22.184,37.818 19.498,36.454 17.647,34.336 C16.333,35.826 14.598,36.946 12.609,37.460 L12.609,85.732 C12.609,88.516 14.868,90.775 17.652,90.775 L20.174,90.775 L20.174,90.775 L20.174,65.558 C20.174,64.163 21.301,63.036 22.696,63.036 L37.826,63.036 C39.221,63.036 40.348,64.163 40.348,65.558 L40.348,90.775 L40.348,90.775 L73.130,90.775 C75.914,90.775 78.174,88.516 78.174,85.732 L78.174,8.518 ZM110.956,10.079 C110.956,7.296 108.697,5.036 105.913,5.036 L83.217,5.036 L83.217,85.732 C83.217,87.577 82.685,89.287 81.818,90.775 L105.913,90.775 C108.697,90.775 110.956,88.516 110.956,85.732 L110.956,10.079 ZM68.087,68.079 L68.087,68.079 L47.913,68.079 L47.913,68.079 C46.518,68.079 45.391,66.952 45.391,65.558 L45.391,47.906 C45.391,46.511 46.518,45.384 47.913,45.384 L68.087,45.384 C69.481,45.384 70.609,46.511 70.609,47.906 L70.609,65.558 C70.609,66.952 69.481,68.079 68.087,68.079 ZM65.565,50.427 L50.435,50.427 L50.435,63.036 L65.565,63.036 L65.565,50.427 Z" class="cls-1"></path>                </svg>                </span> </div>              \r\n				<h3>Dummy Text Lorem</h3>              \r\n				<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type... </p>            </div>          </div>          \r\n		<div class="cta">            \r\n			<h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h4>            <a class="btn black medium" href="{SITEROOT}supplier">Start Selling Today</a> </div>        </div>      </div>      \r\n<div id="tools" class="section-tools">        \r\n	<div class="fixed-container">          \r\n		<div class="headings onwhite">            \r\n			<h2>Lorem, ipsum and dummy</h2>          </div>          \r\n		<div class="features">            \r\n			<ul>              \r\n				<li><span class="check"> <span class="svg-icn">                \r\n							<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="0 0 52 52" style="enable-background:new 0 0 52 52;" xml:space="preserve">                  \r\n								<g>                    \r\n									<path d="M26,0C11.664,0,0,11.663,0,26s11.664,26,26,26s26-11.663,26-26S40.336,0,26,0z M40.495,17.329l-16,18 C24.101,35.772,23.552,36,22.999,36c-0.439,0-0.88-0.144-1.249-0.438l-10-8c-0.862-0.689-1.002-1.948-0.312-2.811 c0.689-0.863,1.949-1.003,2.811-0.313l8.517,6.813l14.739-16.581c0.732-0.826,1.998-0.9,2.823-0.166 C41.154,15.239,41.229,16.503,40.495,17.329z"></path>                  </g>                </svg>                </span> </span>Dummy Text</li>              \r\n				<li><span class="check"> <span class="svg-icn">                \r\n							<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="0 0 52 52" style="enable-background:new 0 0 52 52;" xml:space="preserve">                  \r\n								<g>                    \r\n									<path d="M26,0C11.664,0,0,11.663,0,26s11.664,26,26,26s26-11.663,26-26S40.336,0,26,0z M40.495,17.329l-16,18 C24.101,35.772,23.552,36,22.999,36c-0.439,0-0.88-0.144-1.249-0.438l-10-8c-0.862-0.689-1.002-1.948-0.312-2.811 c0.689-0.863,1.949-1.003,2.811-0.313l8.517,6.813l14.739-16.581c0.732-0.826,1.998-0.9,2.823-0.166 C41.154,15.239,41.229,16.503,40.495,17.329z"></path>                  </g>                </svg>                </span></span>Lorem Ipsum</li>            \r\n			</ul>          </div>          \r\n		<div class="price">            \r\n			<p>Dummy text of the printing </p>            \r\n			<div class="main-price"> US$ 0.20 </div>            <small>Listing Fee</small>            \r\n			<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>            \r\n			<div class="percent"><img src="images/retina/percent.svg" alt="" /></div>            \r\n			<p>3.5 % Fee Ipsum has been the industry''s standard Paypal text ever since the 1500s</p>          </div>          \r\n		<div class="price-btm">            \r\n			<div class="keys">              \r\n				<div class="icn"><img src="images/retina/keys.svg" alt="" /></div>              \r\n				<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when  unknown printer took a galley of type and scrambled it to make a type.</p>            </div>            \r\n			<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>          </div>        </div>      </div>      \r\n<div id="support" class="section-industry" style="background-image:url(images/bg-source.jpg);">        \r\n	<div class="fixed-container">          \r\n		<div class="headings">            \r\n			<h2>Dummy text of the printing and typesetting industry</h2>          </div>          \r\n		<div class="indsutry-type">            \r\n			<div class="flag-type flag-side pull-left">              \r\n				<ul>                \r\n					<li><span class="icn"><span class="svg-icn">                  \r\n								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                    \r\n									<defs> </defs>                    \r\n									<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                  </svg>                  </span></span>                  \r\n						<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>                </li>                \r\n					<li><span class="icn"><span class="svg-icn">                  \r\n								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.094" height="48.59" viewbox="0 0 55.094 48.59">                    \r\n									<defs> </defs>                    \r\n									<path d="M55.094,42.659 L55.094,42.659 C55.094,45.931 52.413,48.582 49.105,48.582 L49.105,48.582 L5.983,48.582 L5.983,48.582 C2.675,48.582 -0.006,45.931 -0.006,42.659 L-0.006,8.309 C-0.006,5.692 2.139,3.571 4.785,3.571 L4.785,3.571 L28.947,3.571 L38.648,0.096 C39.262,-0.126 39.943,0.188 40.167,0.793 L41.188,3.571 L45.511,3.571 C48.157,3.571 50.303,5.692 50.303,8.309 L50.303,10.678 L50.303,10.678 C52.949,10.678 55.094,12.799 55.094,15.416 L55.094,42.659 ZM4.785,5.940 L4.785,5.940 C3.463,5.940 2.390,7.001 2.390,8.309 C2.390,9.616 3.463,10.678 4.785,10.678 L8.912,10.678 L8.912,10.678 L9.138,10.678 C9.154,10.672 9.163,10.659 9.179,10.653 L22.333,5.940 L4.785,5.940 ZM39.616,6.154 L38.344,2.691 L38.342,2.691 L38.342,2.691 L35.886,3.571 L35.889,3.571 L29.284,5.940 L29.272,5.940 L16.050,10.678 L41.278,10.678 L39.616,6.154 ZM47.907,8.309 C47.907,7.001 46.834,5.940 45.511,5.940 L42.058,5.940 L43.800,10.678 L47.907,10.678 L47.907,10.678 L47.907,8.309 ZM50.303,13.047 L4.785,13.047 L4.785,13.047 C3.908,13.047 3.096,12.797 2.390,12.389 L2.390,42.659 C2.390,44.622 3.999,46.213 5.983,46.213 L49.105,46.213 C51.090,46.213 52.698,44.622 52.698,42.659 L52.698,34.368 L47.907,34.368 C45.261,34.368 43.116,32.246 43.116,29.630 C43.116,27.013 45.261,24.891 47.907,24.891 L52.698,24.891 L52.698,15.416 C52.698,14.108 51.625,13.047 50.303,13.047 ZM52.698,31.998 L52.698,27.261 L47.907,27.261 C46.585,27.261 45.511,28.322 45.511,29.630 C45.511,30.937 46.585,31.998 47.907,31.998 L52.698,31.998 ZM47.907,28.445 L50.303,28.445 L50.303,30.814 L47.907,30.814 L47.907,28.445 Z" class="cls-1"></path>                  </svg>                  </span></span>                  \r\n						<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>                </li>                \r\n					<li><span class="icn"><span class="svg-icn">                  \r\n								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.094" height="45.12" viewbox="0 0 55.094 45.12">                    \r\n									<defs> </defs>                    \r\n									<path d="M50.309,45.123 L8.385,45.123 C5.739,45.123 3.593,42.995 3.593,40.372 L3.593,17.634 C1.530,17.104 -0.000,15.263 -0.000,13.051 L-0.000,9.520 C-0.000,9.517 -0.000,9.516 -0.000,9.514 L-0.000,9.488 C-0.000,9.301 0.051,9.131 0.128,8.973 C0.134,8.963 0.143,8.956 0.149,8.946 C0.228,8.795 0.339,8.670 0.473,8.566 L8.654,0.454 C8.872,0.176 9.199,-0.015 9.583,-0.015 L9.608,-0.015 C9.610,-0.015 9.612,-0.015 9.615,-0.015 L16.795,-0.015 C16.797,-0.015 16.799,-0.015 16.802,-0.015 L23.982,-0.015 C23.984,-0.015 23.986,-0.015 23.989,-0.015 L31.169,-0.015 C31.171,-0.015 31.173,-0.015 31.176,-0.015 L38.355,-0.015 C38.358,-0.015 38.360,-0.015 38.363,-0.015 L50.309,-0.015 C52.955,-0.015 55.100,2.112 55.100,4.736 L55.100,4.736 L55.100,40.372 C55.100,42.995 52.955,45.123 50.309,45.123 ZM16.769,42.747 L16.769,42.747 L16.769,32.056 L11.978,32.056 L11.978,42.747 L11.978,42.747 L16.769,42.747 ZM2.396,13.051 C2.396,14.363 3.469,15.427 4.791,15.427 C6.114,15.427 7.187,14.363 7.187,13.051 L7.187,10.675 L2.396,10.675 L2.396,13.051 ZM10.039,2.361 L4.050,8.300 L7.928,8.300 L13.918,2.361 L10.039,2.361 ZM9.583,13.051 C9.583,14.363 10.656,15.427 11.978,15.427 C13.301,15.427 14.374,14.363 14.374,13.051 L14.374,10.675 L9.583,10.675 L9.583,13.051 ZM17.226,2.361 L11.237,8.300 L15.115,8.300 L21.104,2.361 L17.226,2.361 ZM16.769,13.051 C16.769,14.363 17.843,15.427 19.165,15.427 C20.488,15.427 21.561,14.363 21.561,13.051 L21.561,10.675 L16.769,10.675 L16.769,13.051 ZM24.413,2.361 L18.424,8.300 L22.302,8.300 L28.291,2.361 L24.413,2.361 ZM23.956,13.051 C23.956,14.363 25.030,15.427 26.352,15.427 C27.675,15.427 28.748,14.363 28.748,13.051 L28.748,10.675 L23.956,10.675 L23.956,13.051 ZM31.600,2.361 L25.611,8.300 L29.489,8.300 L35.478,2.361 L31.600,2.361 ZM37.133,4.001 L31.143,9.940 L31.143,13.051 C31.143,15.675 28.998,17.803 26.352,17.803 C24.914,17.803 23.637,17.160 22.759,16.164 C21.881,17.160 20.604,17.803 19.165,17.803 C17.727,17.803 16.450,17.160 15.572,16.164 C14.694,17.160 13.417,17.803 11.978,17.803 C10.537,17.803 9.262,17.160 8.382,16.162 C7.758,16.864 6.934,17.391 5.989,17.634 L5.989,40.372 C5.989,41.683 7.062,42.747 8.385,42.747 L9.583,42.747 L9.583,42.747 L9.583,30.869 C9.583,30.212 10.118,29.681 10.780,29.681 L17.967,29.681 C18.630,29.681 19.165,30.212 19.165,30.869 L19.165,42.747 L19.165,42.747 L34.737,42.747 C36.059,42.747 37.133,41.683 37.133,40.372 L37.133,4.001 ZM52.704,4.736 C52.704,3.425 51.631,2.361 50.309,2.361 L39.528,2.361 L39.528,40.372 C39.528,41.241 39.275,42.046 38.863,42.747 L50.309,42.747 C51.631,42.747 52.704,41.683 52.704,40.372 L52.704,4.736 ZM32.341,32.056 L32.341,32.056 L22.759,32.056 L22.759,32.056 C22.096,32.056 21.561,31.526 21.561,30.869 L21.561,22.554 C21.561,21.897 22.096,21.366 22.759,21.366 L32.341,21.366 C33.004,21.366 33.539,21.897 33.539,22.554 L33.539,30.869 C33.539,31.526 33.004,32.056 32.341,32.056 ZM31.143,23.742 L23.956,23.742 L23.956,29.681 L31.143,29.681 L31.143,23.742 Z" class="cls-1"></path>                  </svg>                  </span></span>                  \r\n						<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>                </li>                \r\n					<li><span class="icn"><span class="svg-icn">                  \r\n								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                    \r\n									<defs> </defs>                    \r\n									<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                  </svg>                  </span></span>                  \r\n						<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>                </li>                \r\n					<li><span class="icn"><span class="svg-icn">                  \r\n								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.094" height="48.59" viewbox="0 0 55.094 48.59">                    \r\n									<defs> </defs>                    \r\n									<path d="M55.094,42.659 L55.094,42.659 C55.094,45.931 52.413,48.582 49.105,48.582 L49.105,48.582 L5.983,48.582 L5.983,48.582 C2.675,48.582 -0.006,45.931 -0.006,42.659 L-0.006,8.309 C-0.006,5.692 2.139,3.571 4.785,3.571 L4.785,3.571 L28.947,3.571 L38.648,0.096 C39.262,-0.126 39.943,0.188 40.167,0.793 L41.188,3.571 L45.511,3.571 C48.157,3.571 50.303,5.692 50.303,8.309 L50.303,10.678 L50.303,10.678 C52.949,10.678 55.094,12.799 55.094,15.416 L55.094,42.659 ZM4.785,5.940 L4.785,5.940 C3.463,5.940 2.390,7.001 2.390,8.309 C2.390,9.616 3.463,10.678 4.785,10.678 L8.912,10.678 L8.912,10.678 L9.138,10.678 C9.154,10.672 9.163,10.659 9.179,10.653 L22.333,5.940 L4.785,5.940 ZM39.616,6.154 L38.344,2.691 L38.342,2.691 L38.342,2.691 L35.886,3.571 L35.889,3.571 L29.284,5.940 L29.272,5.940 L16.050,10.678 L41.278,10.678 L39.616,6.154 ZM47.907,8.309 C47.907,7.001 46.834,5.940 45.511,5.940 L42.058,5.940 L43.800,10.678 L47.907,10.678 L47.907,10.678 L47.907,8.309 ZM50.303,13.047 L4.785,13.047 L4.785,13.047 C3.908,13.047 3.096,12.797 2.390,12.389 L2.390,42.659 C2.390,44.622 3.999,46.213 5.983,46.213 L49.105,46.213 C51.090,46.213 52.698,44.622 52.698,42.659 L52.698,34.368 L47.907,34.368 C45.261,34.368 43.116,32.246 43.116,29.630 C43.116,27.013 45.261,24.891 47.907,24.891 L52.698,24.891 L52.698,15.416 C52.698,14.108 51.625,13.047 50.303,13.047 ZM52.698,31.998 L52.698,27.261 L47.907,27.261 C46.585,27.261 45.511,28.322 45.511,29.630 C45.511,30.937 46.585,31.998 47.907,31.998 L52.698,31.998 ZM47.907,28.445 L50.303,28.445 L50.303,30.814 L47.907,30.814 L47.907,28.445 Z" class="cls-1"></path>                  </svg>                  </span></span>                  \r\n						<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>                </li>                \r\n					<li><span class="icn"><span class="svg-icn">                  \r\n								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.094" height="45.12" viewbox="0 0 55.094 45.12">                    \r\n									<defs> </defs>                    \r\n									<path d="M50.309,45.123 L8.385,45.123 C5.739,45.123 3.593,42.995 3.593,40.372 L3.593,17.634 C1.530,17.104 -0.000,15.263 -0.000,13.051 L-0.000,9.520 C-0.000,9.517 -0.000,9.516 -0.000,9.514 L-0.000,9.488 C-0.000,9.301 0.051,9.131 0.128,8.973 C0.134,8.963 0.143,8.956 0.149,8.946 C0.228,8.795 0.339,8.670 0.473,8.566 L8.654,0.454 C8.872,0.176 9.199,-0.015 9.583,-0.015 L9.608,-0.015 C9.610,-0.015 9.612,-0.015 9.615,-0.015 L16.795,-0.015 C16.797,-0.015 16.799,-0.015 16.802,-0.015 L23.982,-0.015 C23.984,-0.015 23.986,-0.015 23.989,-0.015 L31.169,-0.015 C31.171,-0.015 31.173,-0.015 31.176,-0.015 L38.355,-0.015 C38.358,-0.015 38.360,-0.015 38.363,-0.015 L50.309,-0.015 C52.955,-0.015 55.100,2.112 55.100,4.736 L55.100,4.736 L55.100,40.372 C55.100,42.995 52.955,45.123 50.309,45.123 ZM16.769,42.747 L16.769,42.747 L16.769,32.056 L11.978,32.056 L11.978,42.747 L11.978,42.747 L16.769,42.747 ZM2.396,13.051 C2.396,14.363 3.469,15.427 4.791,15.427 C6.114,15.427 7.187,14.363 7.187,13.051 L7.187,10.675 L2.396,10.675 L2.396,13.051 ZM10.039,2.361 L4.050,8.300 L7.928,8.300 L13.918,2.361 L10.039,2.361 ZM9.583,13.051 C9.583,14.363 10.656,15.427 11.978,15.427 C13.301,15.427 14.374,14.363 14.374,13.051 L14.374,10.675 L9.583,10.675 L9.583,13.051 ZM17.226,2.361 L11.237,8.300 L15.115,8.300 L21.104,2.361 L17.226,2.361 ZM16.769,13.051 C16.769,14.363 17.843,15.427 19.165,15.427 C20.488,15.427 21.561,14.363 21.561,13.051 L21.561,10.675 L16.769,10.675 L16.769,13.051 ZM24.413,2.361 L18.424,8.300 L22.302,8.300 L28.291,2.361 L24.413,2.361 ZM23.956,13.051 C23.956,14.363 25.030,15.427 26.352,15.427 C27.675,15.427 28.748,14.363 28.748,13.051 L28.748,10.675 L23.956,10.675 L23.956,13.051 ZM31.600,2.361 L25.611,8.300 L29.489,8.300 L35.478,2.361 L31.600,2.361 ZM37.133,4.001 L31.143,9.940 L31.143,13.051 C31.143,15.675 28.998,17.803 26.352,17.803 C24.914,17.803 23.637,17.160 22.759,16.164 C21.881,17.160 20.604,17.803 19.165,17.803 C17.727,17.803 16.450,17.160 15.572,16.164 C14.694,17.160 13.417,17.803 11.978,17.803 C10.537,17.803 9.262,17.160 8.382,16.162 C7.758,16.864 6.934,17.391 5.989,17.634 L5.989,40.372 C5.989,41.683 7.062,42.747 8.385,42.747 L9.583,42.747 L9.583,42.747 L9.583,30.869 C9.583,30.212 10.118,29.681 10.780,29.681 L17.967,29.681 C18.630,29.681 19.165,30.212 19.165,30.869 L19.165,42.747 L19.165,42.747 L34.737,42.747 C36.059,42.747 37.133,41.683 37.133,40.372 L37.133,4.001 ZM52.704,4.736 C52.704,3.425 51.631,2.361 50.309,2.361 L39.528,2.361 L39.528,40.372 C39.528,41.241 39.275,42.046 38.863,42.747 L50.309,42.747 C51.631,42.747 52.704,41.683 52.704,40.372 L52.704,4.736 ZM32.341,32.056 L32.341,32.056 L22.759,32.056 L22.759,32.056 C22.096,32.056 21.561,31.526 21.561,30.869 L21.561,22.554 C21.561,21.897 22.096,21.366 22.759,21.366 L32.341,21.366 C33.004,21.366 33.539,21.897 33.539,22.554 L33.539,30.869 C33.539,31.526 33.004,32.056 32.341,32.056 ZM31.143,23.742 L23.956,23.742 L23.956,29.681 L31.143,29.681 L31.143,23.742 Z" class="cls-1"></path>                  </svg>                  </span></span>                  \r\n						<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>                </li>              \r\n				</ul>            </div>            \r\n			<div class="yk-ipad pull-right img-responsive"><img src="images/yk-ipad.png" width="571" height="649" alt="" /></div>          </div>        </div>      </div>      \r\n<div class="section-help">        \r\n	<div class="fixed-container">          \r\n		<div class="headings onwhite">            \r\n			<h2>Printing and typesetting industry</h2>            \r\n			<p>Lorem Ipsum has been the industry''s standard dummy text ever since <br />\r\n				              the 1500s, when an unknown printer took a make a type.</p>          </div>          \r\n		<div class="flag-type double">            \r\n			<ul>              \r\n				<li><span class="icn"><span class="svg-icn">                \r\n							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                  \r\n								<defs> </defs>                  \r\n								<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                </svg>                </span></span>                \r\n					<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>              </li>              \r\n				<li><span class="icn"><span class="svg-icn">                \r\n							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                  \r\n								<defs> </defs>                  \r\n								<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                </svg>                </span></span>                \r\n					<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>              </li>              \r\n				<li><span class="icn"><span class="svg-icn">                \r\n							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                  \r\n								<defs> </defs>                  \r\n								<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                </svg>                </span></span>                \r\n					<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>              </li>              \r\n				<li><span class="icn"><span class="svg-icn">                \r\n							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveaspectratio="xMidYMid" width="55.093" height="54.63" viewbox="0 0 55.093 54.63">                  \r\n								<defs> </defs>                  \r\n								<path d="M55.087,28.482 L55.087,28.507 C55.087,28.887 54.895,29.211 54.614,29.428 L31.929,51.923 C31.473,52.376 30.734,52.376 30.275,51.923 C29.819,51.470 29.819,50.735 30.275,50.283 L52.691,28.054 L52.691,20.192 C52.691,19.537 53.229,19.004 53.889,19.004 C54.552,19.004 55.087,19.537 55.087,20.192 L55.087,28.474 C55.087,28.477 55.087,28.478 55.087,28.482 ZM22.520,54.128 C22.481,54.185 22.456,54.249 22.406,54.299 C22.170,54.531 21.858,54.640 21.549,54.633 C21.240,54.640 20.929,54.531 20.693,54.299 C20.643,54.249 20.619,54.185 20.579,54.128 L0.503,34.218 C0.446,34.181 0.382,34.156 0.331,34.106 C0.095,33.872 -0.012,33.564 -0.006,33.258 C-0.013,32.951 0.095,32.642 0.331,32.408 C0.382,32.358 0.446,32.335 0.503,32.296 L27.808,5.219 C28.027,4.942 28.353,4.751 28.736,4.751 L28.761,4.751 C28.763,4.751 28.766,4.751 28.768,4.751 L33.594,4.751 C33.753,2.966 34.488,1.401 35.594,0.376 L35.614,0.397 C35.847,0.151 36.168,-0.001 36.521,-0.001 C37.231,-0.001 37.805,0.607 37.805,1.357 C37.805,1.802 37.590,2.178 37.277,2.425 C36.704,2.950 36.295,3.778 36.159,4.751 L41.878,4.751 C41.880,4.751 41.883,4.751 41.888,4.751 L41.911,4.751 C42.295,4.751 42.623,4.940 42.840,5.219 L49.823,12.144 C50.103,12.362 50.296,12.686 50.296,13.066 L50.296,13.091 C50.296,13.093 50.296,13.095 50.296,13.098 L50.296,26.098 C50.296,26.100 50.296,26.103 50.296,26.106 L50.296,26.131 C50.296,26.511 50.104,26.836 49.823,27.052 L22.520,54.128 ZM47.900,13.518 L41.455,7.127 L36.409,7.127 C36.620,7.654 36.917,8.103 37.277,8.433 L37.277,8.433 C37.326,8.473 37.387,8.497 37.429,8.543 L37.451,8.521 C38.698,9.677 39.517,11.500 39.517,13.574 C39.517,13.624 39.505,13.668 39.503,13.717 C40.936,14.537 41.913,16.057 41.913,17.817 C41.913,20.441 39.767,22.568 37.122,22.568 C34.476,22.568 32.330,20.441 32.330,17.817 C32.330,15.267 34.361,13.202 36.906,13.087 C36.798,12.033 36.378,11.130 35.769,10.572 C35.720,10.533 35.659,10.509 35.615,10.462 L35.596,10.484 C34.705,9.658 34.047,8.482 33.735,7.127 L29.192,7.127 L2.841,33.258 L21.549,51.809 L47.900,25.679 L47.900,13.518 ZM35.768,16.578 C36.065,16.306 36.308,15.940 36.507,15.529 C35.483,15.800 34.725,16.717 34.725,17.816 C34.725,19.127 35.798,20.191 37.120,20.191 C38.444,20.191 39.516,19.127 39.516,17.816 C39.516,17.254 39.312,16.745 38.983,16.338 C38.246,18.173 37.429,18.605 37.429,18.605 C37.198,18.851 36.877,19.002 36.521,19.002 C35.812,19.002 35.240,18.394 35.240,17.645 C35.240,17.202 35.454,16.826 35.768,16.578 ZM13.507,31.221 C13.965,30.768 14.705,30.768 15.162,31.221 L23.605,39.593 C24.061,40.046 24.061,40.780 23.605,41.234 C23.148,41.686 22.407,41.686 21.951,41.234 L13.507,32.861 C13.051,32.408 13.051,31.675 13.507,31.221 ZM18.298,26.470 C18.756,26.017 19.496,26.017 19.953,26.470 L28.396,34.842 C28.851,35.295 28.851,36.029 28.396,36.483 C27.939,36.935 27.198,36.935 26.742,36.483 L18.298,28.110 C17.842,27.657 17.842,26.924 18.298,26.470 Z" class="cls-1"></path>                </svg>                </span></span>                \r\n					<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>              </li>            \r\n			</ul>          </div>        </div>      </div>      \r\n<div id="faq" class="section-faqs">        \r\n	<div class="fixed-container">          \r\n		<div class=" headings">            \r\n			<h2>Frequently Asked Questions</h2>            \r\n			<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type.</p>          </div>          \r\n		<div class="faq-box">            \r\n			<div class="box pull-left">              \r\n				<h4>What do I need to do to create a shop?</h4>              \r\n				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>              \r\n				<h4>Dummy Text Lorem</h4>              \r\n				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown pr inter took a galley of type and scrambled it to make a type specimen book. It has rvived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five nturies, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>              \r\n				<h4>What do I need to do to create a shop?</h4>              \r\n				<p>Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>            </div>            \r\n			<div class="box pull-right">              \r\n				<h4>What do I need to do to create a shop?</h4>              \r\n				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>              \r\n				<h4>What do I need to do to create a shop?</h4>              \r\n				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown pr inter took a galley of type and scrambled it to make a type specimen book. It has rvived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five nturies, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>              \r\n				<h4>What do I need to do to create a shop?</h4>              \r\n				<p>Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>            </div>          </div>        </div>      </div>      \r\n<div class="section-white">        \r\n	<div class="fixed-container">          \r\n		<div class="cta onwhite">            \r\n			<h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h4>            \r\n			<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown<br />\r\n				              printer took a galley of type and scrambled it to make a type.</p>            <a class="btn black medium" href="{SITEROOT}custom/contact_us">Contact Us</a> </div>        </div>      </div>      \r\n<div class="section-ready" style="background-image:url(images/bg-ready.jpg);">        \r\n	<div class="fixed-container">          \r\n		<div class="cta">            \r\n			<h2>So, are you ready?</h2>            \r\n			<p>Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when<br />\r\n				              an unknown printer took a galley of type and scrambled it to make a type.</p>            <a class="btn red medium" href="{SITEROOT}supplier">Open Your Shop</a> </div>        </div>      </div>', 'BECOME_SELLER_CONTENT_BLOCK');
INSERT INTO `tbl_extra_pages` (`epage_id`, `epage_label`, `epage_content`, `epage_identifier`) VALUES
(4, 'Product Setup Info', '<p><strong>Product Setup:</strong><br />\r\n	  Details matters!<br />\r\n	  Appropriate Details regarding the product helps the customer  to have detailed information regarding the products so that they can visualize  and be clear with the specifications, discounts, models, color and other  variants before making a purchase.<br />\r\n	  It also adds an edge to the sellers in maintaining  transparency with the customers.<br />\r\n	  Fill in the below tabs while adding a product so that it  helps the interested buyers in making an informed decision: <br />\r\n	  <strong>General:</strong> This tab  allows the Seller to enter the product details such as model, SKU, product  condition, add tags and quote the price.<br />\r\n	  Sellers can choose the brand and category which the product is  attached to.<br />\r\n	  Shipping details: such as selecting the countries/locations  where the shipping is available, whether the shipping can be free or paid.<br />\r\n	  <strong>Data:</strong> Here,  Sellers can opt to track the stock subtraction statuses, track inventory,  shipping required/not and whether to keep the product under featured  categories. They can enter the details regarding the dimensions, length/weight  and YouTube video.<br />\r\n	  <strong>Links:</strong> This tab  allows Seller to map the product to the filters so that it can be searched  easily by the end-users. Related products option here, allows the Seller to  associate other similar products that will appear to the end-users on the  product detail page as reference.<br />\r\n	  <strong>SEO:</strong> This tab is  for SEO purpose. Sellers can add page title that should appear on clicking the  product, description and keywords that can be used for optimization and  ranking.<br />\r\n	  <strong>Attribute:</strong> This  tab allows the Seller to define the specifications for his product. Attributes  names are selected and the values are mentioned. The results are shown under  the "Specifications" tab on the Product detail page.<br />\r\n	  <strong>Options:</strong> This tab  allows user to manage various variants for a product. Sellers can select the  options, mark whether the underlying option will be mandatory for selection or  not and then enter the values for the same. Sellers need to select the option  value, enter quantity, price and weight values. <br />\r\n	  <strong>Discount:</strong> Here,  Sellers can configure multiple discounts for a product. You can configure: quantity,  discounted price of the product, priority, discount validity/duration to which  the discounts will be applied.<br />\r\n	  <strong>Special:</strong> Here,  Sellers can configure special price for a product. Details such as special  price of the product, priority, validity/duration to which the special price  will be applicable should be entered.</p>', 'PRODUCT_SETUP_CONTENT_BLOCK');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faqs`
--

CREATE TABLE `tbl_faqs` (
  `faq_id` int(11) NOT NULL,
  `faq_slug` varchar(255) NOT NULL,
  `faq_category_id` int(11) NOT NULL,
  `faq_question_title` varchar(255) NOT NULL,
  `faq_answer_brief` text NOT NULL,
  `faq_answer_detailed` text NOT NULL,
  `faq_meta_title` varchar(255) NOT NULL,
  `faq_meta_keywords` text NOT NULL,
  `faq_meta_description` text NOT NULL,
  `faq_status` tinyint(4) NOT NULL,
  `faq_is_deleted` tinyint(4) NOT NULL,
  `faq_display_order` bigint(20) NOT NULL DEFAULT '0',
  `faq_updated_editor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_filters`
--

CREATE TABLE `tbl_filters` (
  `filter_id` int(11) NOT NULL,
  `filter_group` int(11) NOT NULL,
  `filter_name` varchar(255) NOT NULL,
  `filter_display_order` int(11) NOT NULL,
  `filter_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_filter_groups`
--

CREATE TABLE `tbl_filter_groups` (
  `filter_group_id` int(11) NOT NULL,
  `filter_group_name` varchar(255) NOT NULL,
  `filter_group_display_order` int(11) NOT NULL,
  `filter_group_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_export_settings`
--

CREATE TABLE `tbl_import_export_settings` (
  `setting_id` int(11) NOT NULL,
  `setting_shop_id` int(11) NOT NULL,
  `setting_code` varchar(32) CHARACTER SET utf8 NOT NULL,
  `setting_key` varchar(64) CHARACTER SET utf8 NOT NULL,
  `setting_value` text CHARACTER SET utf8 NOT NULL,
  `setting_serialized` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_import_export_settings`
--

INSERT INTO `tbl_import_export_settings` (`setting_id`, `setting_shop_id`, `setting_code`, `setting_key`, `setting_value`, `setting_serialized`) VALUES
(1, 0, 'export_import', 'export_import_settings_use_export_cache', '1', 0),
(2, 0, 'export_import', 'export_import_settings_use_import_cache', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language_labels`
--

CREATE TABLE `tbl_language_labels` (
  `label_id` int(11) NOT NULL,
  `label_key` varchar(255) NOT NULL,
  `label_caption_en` text NOT NULL,
  `label_caption_es` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_language_labels`
--

INSERT INTO `tbl_language_labels` (`label_id`, `label_key`, `label_caption_en`, `label_caption_es`) VALUES
(1, 'L_BUY_OVER_PHONE', 'Buy Over Phone', 'Buy Over Phone'),
(3, 'L_HELP', 'Help', 'Help'),
(4, 'L_CONTACT_US', 'Contact Us', 'Contact Us'),
(5, 'L_LOGIN', 'Login', 'Login'),
(6, 'L_SHOPPING_CART', 'Shopping Cart', 'Shopping Cart'),
(7, 'L_VIEW_ALL_CATEGORIES', 'View all categories', 'View all categories'),
(8, 'L_WE_ACCEPT_HAPPILY', 'We Accept Happily', 'We Accept Happily'),
(9, 'L_ALL_RIGHTS_RESERVED', 'All rights reserved', 'All rights reserved'),
(10, 'F_WHAT_ARE_YOU_LOOKING_FOR', 'What are you looking for... ?', 'What are you looking for... ?'),
(11, 'BTN_SEARCH', 'Search', 'Search'),
(13, 'L_REVIEWS', 'Reviews', 'Reviews'),
(15, 'L_EXPLORE_MORE', 'Explore More', 'Explore More'),
(16, 'L_HOW_IT_WORKS', 'How it Works', 'How it Works'),
(17, 'L_DETAILED_FEATURES', 'Detailed Features', 'Detailed Features'),
(18, 'L_BUY', 'Buy', 'Buy'),
(19, 'L_SELL', 'Sell', 'Sell'),
(20, 'L_PRIVATE_OPERATIONS', 'Private Operations', 'Private Operations'),
(21, 'L_MORE_SUCCESS_STORIES', 'More Success Stories', 'More Success Stories'),
(22, 'L_SUBSCRIBE_TO_NEWSLETTER', 'Subscribe to Newsletter', 'Subscribe to Newsletter'),
(23, 'L_TYPE_YOUR_EMAIL', 'Type Your Email', 'Type Your Email'),
(24, 'M_EMAIL_ADDRESS', 'Email Address', 'Email Address'),
(25, 'M_PASSWORD', 'Password', 'Password'),
(26, 'M_LOGIN', 'Login', 'Login'),
(27, 'M_FORGOT_PASSWORD', 'Forgotten Password', 'Forgotten Password'),
(28, 'M_RELOAD', 'Reload', 'Reload'),
(29, 'F_YOUR_NAME', 'Your Name', 'Your Name'),
(30, 'F_YOUR_EMAIL', 'Your Email', 'Your Email'),
(31, 'F_YOUR_PHONE', 'Your Phone', 'Your Phone'),
(32, 'F_YOUR_MESSAGE', 'Your Message', 'Your Message'),
(33, 'F_SECURITY_CODE', 'Security Code (as shown in image)', 'Security Code (as shown in image)'),
(34, 'F_SUBMIT', 'Submit', 'Submit'),
(35, 'M_ERROR_INVALID_SECURITY_CODE', 'Please enter a valid security code.', 'Please enter a valid security code.'),
(36, 'M_YOUR_MESSAGE_SENT_SUCCESSFULLY', 'Your message has been sent successfully.', 'Your message has been sent successfully.'),
(37, 'M_email_not_sent_server_issue', 'Email not sent due to server problem. Please try again after some time.', 'Email not sent due to server problem. Please try again after some time.'),
(38, 'M_please_enter_valid_email_address', 'Please enter a valid email address.', 'Please enter a valid email address.'),
(39, 'M_subscription_email_sent', 'Subscription email sent.', 'Subscription email sent.'),
(40, 'M_subscribed_successfully', 'Subscribed Successfully.', 'Subscribed Successfully.'),
(41, 'M_invalid_verification_code', 'Invalid Verification Code.', 'Invalid Verification Code.'),
(42, 'L_FREQUENTLY_ASKED_QUESTIONS', 'Frequently Asked Questions', 'Frequently Asked Questions'),
(43, 'L_FAQ_CATEGORIES', 'FAQ Categories', 'FAQ Categories'),
(44, 'L_BROWSE_BY_TOPIC', 'Browse by Topic', 'Browse by Topic'),
(45, 'L_QUESTIONS', 'Questions', 'Questions'),
(46, 'L_VIEW_ALL', 'View All', 'View All'),
(47, 'F_NAME', 'Name', 'Name'),
(48, 'F_EMAIL', 'Email', 'Email'),
(49, 'M_CONFIRM_PASSWORD', 'Confirm Password', 'Confirm Password'),
(50, 'M_CLICK_HERE', 'Click Here', 'Click Here'),
(51, 'M_EMAIL_ID', 'Email Address', 'Email Address'),
(52, 'M_SUBMIT', 'Submit', 'Submit'),
(53, 'M_VERIFICATION_EMAIL_SEND_SUCCESSFULLY', 'Verification email sent successfully.', 'Verification email sent successfully.'),
(54, 'M_SUCCESS_USER_ACCOUNT_VERIFIED', 'Your account has been successfully verified.', 'Your account has been successfully verified.'),
(55, 'M_ERROR_INVALID_ACCESS', 'You do not have permission to access this area.', 'You do not have permission to access this area.'),
(56, 'M_SUCCESS_FORGOT_PASSWORD_REQUEST', 'Your password reset instructions have been sent to your email. Please check your spam folder if you do not find it in your inbox. Please note that this request is valid only for next 24 hours.', 'Your password reset instructions have been sent to your email. Please check your spam folder if you do not find it in your inbox. Please note that this request is valid only for next 24 hours.'),
(57, 'M_WARNING_FORGOT_PASSWORD_DUPLICATE_REQUEST', 'Your request to reset password has already been placed within last 24 hours. Please check your emails or retry after 24 hours of your previous request.', 'Your request to reset password has already been placed within last 24 hours. Please check your emails or retry after 24 hours of your previous request.'),
(58, 'M_ERROR_INVALID_EMAIL', 'Email address entered is not registered with us.', 'Email address entered is not registered with us.'),
(59, 'L_USERNAME', 'Username', 'Username'),
(60, 'L_PASSWORD', 'Password', 'Password'),
(61, 'L_REMEMBER_ME', 'Remember Me', 'Remember Me'),
(62, 'L_FORGOT_PASSWORD', 'Forgot Password?', 'Forgot Password?'),
(63, 'BTN_LOGIN', 'Login', 'Login'),
(64, 'BTN_REGISTER', 'Register', 'Register'),
(65, 'L_LOGIN_WITH_YOUR_ACCOUNT', 'Login with your account', 'Login with your account'),
(66, 'L_CREATE_AN_ACCOUNT', 'Create an account', 'Create an account'),
(67, 'L_RESEND_VERIFICATION_CODE', 'Resend Verification Code', 'Resend Verification Code'),
(68, 'M_ERROR_INVALID_EMAIL_OR_EMAIL_ALREADY_VERIFIED', 'Invalid email address or username entered or account already verified.', 'Invalid email address or username entered or account already verified.'),
(69, 'M_ERROR_INVALID_REQUEST', 'Invalid Request', 'Invalid Request'),
(70, 'M_ERROR_CANNOT_RESEND_VERIFICATION_EMAIL', 'You can not re-send verification email. The maximum limit is crossed for sending email. Please contact the administrator for the verification email.', 'You can not re-send verification email. The maximum limit is crossed for sending email. Please contact the administrator for the verification email.'),
(71, 'LBL_FORGOT_PASSWORD', 'Forgot your password?', 'Forgot your password?'),
(72, 'L_RESET_PASSWORD', 'Reset Password', 'Reset Password'),
(73, 'F_NEW_PASSWORD', 'New Password', 'New Password'),
(74, 'F_CONFIRM_NEW_PASSWORD', 'Confirm New Password', 'Confirm New Password'),
(75, 'BTN_SUBMIT', 'Submit', 'Submit'),
(76, 'M_ERROR_INVALID_TOCKEN', 'Invalid Token! You are using invalid link. <br>Please note that password reset requests are valid for 24 hours only.', 'Invalid Token! You are using invalid link. <br>Please note that password reset requests are valid for 24 hours only.'),
(77, 'M_Password_successfully_updated', 'Password successfully updated! Please login now with your new password.', 'Password successfully updated! Please login now with your new password.'),
(78, 'M_SUCCESS_USER_SIGNUP', 'You have been registered successfully. A verification link has been sent to your Email Address. Please verify your email and access my account area.', 'You have been registered successfully. A verification link has been sent to your Email Address. Please verify your email and access my account area.'),
(79, 'M_SUCCESS_USER_SIGNUP_VERIFIED', 'You have been registered successfully.', 'You have been registered successfully.'),
(80, 'M_ERROR_DUPLICATE_EMAIL', 'This email address already exists in our record. Kindly use forgot password to request a new password if this email address belongs to you.', 'This email address already exists in our record. Kindly use forgot password to request a new password if this email address belongs to you.'),
(81, 'F_CONTACT_US', 'Contact Us', 'Contact Us'),
(82, 'F_DROP_US_A_LINE', 'Drop us a Line', 'Drop us a Line'),
(83, 'LBL_ENTER_THE_EMAIL_ADDRESS_YOUR_ACCOUNT', 'Enter The E-mail Address Associated With Your Account. Click Submit To Have Password Reset Link E-mailed To You.', 'Enter The E-mail Address Associated With Your Account. Click Submit To Have Password Reset Link E-mailed To You.'),
(84, 'F_BACK_TO_LOGIN', 'Back to Login', 'Back to Login'),
(85, 'MSG_HOME_PAGE_BUY_TEXT', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, eiusmod tempor inunt labore et dolore magna.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, eiusmod tempor inunt labore et dolore magna.'),
(86, 'MSG_HOME_PAGE_SELL_TEXT', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, eiusmod tempor inunt labore et dolore magna.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, eiusmod tempor inunt labore et dolore magna.'),
(87, 'MSG_HOME_PAGE_PRIVATE_OPERATIONS_TEXT', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, eiusmod tempor inunt labore et dolore magna.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, eiusmod tempor inunt labore et dolore magna.'),
(88, 'M_ERROR_INVALID_EMAIL_PASSWORD', 'Invalid Email Address or Password.', 'Invalid Email Address or Password.'),
(89, 'M_ERROR_YOU_HAVE_NOT_VERIFIED_EMAIL', 'You have not verified your email, kindly click on the verification email sent to you or please %s to resend it.', 'You have not verified your email, kindly click on the verification email sent to you or please %s to resend it.'),
(90, 'M_ERROR_YOUR_ACCOUNT_NOT_ACTIVE', 'Your account is not active. Please contact administrator.', 'Your account is not active. Please contact administrator.'),
(91, 'M_ERROR_YOUR_ACCOUNT_DELETED', 'Your account is deleted. Please contact administrator.', 'Your account is deleted. Please contact administrator.'),
(92, 'M_ERROR_DUPLICATE_FACEBOOK_ID', 'This Facebook ID already exists in our records.', 'This Facebook ID already exists in our records.'),
(93, 'M_ERROR_DUPLICATE_LINKEDIN_ID', 'This LinkedIn ID already exists in our records.', 'This LinkedIn ID already exists in our records.'),
(94, 'M_ERROR_INVALID_CODE', 'Invalid URL or You have already performed this action.', 'Invalid URL or You have already performed this action.'),
(95, 'M_ERROR_INVALID_EMAIL', 'Invalid Email Address.', 'Invalid Email Address.'),
(96, 'M_ERROR_YOUR_EMAIL_ALREADY_VERIFIED', 'Your email ID has already been verified. Please login to your account or try Forgot Password in case you have forgotten your password.', 'Your email ID has already been verified. Please login to your account or try Forgot Password in case you have forgotten your password.'),
(97, 'M_Incorrect_current_password', 'Entered ''Current Password'' is wrong, please enter correct ''Current Password''.', 'Entered ''Current Password'' is wrong, please enter correct ''Current Password''.'),
(98, 'M_FIRST_NAME', 'First Name', 'First Name'),
(99, 'M_LAST_NAME', 'Last Name', 'Last Name'),
(100, 'M_NICKNAME', 'Nickname', 'Nickname'),
(101, 'M_DOB', 'DOB', 'DOB'),
(102, 'M_PHONE_NUMBER', 'Phone Number', 'Phone Number'),
(103, 'M_GENDER', 'Gender', 'Gender'),
(104, 'M_PROFILE_PICTURE', 'Profile Picture', 'Profile Picture'),
(105, 'M_CONSOLES_OWNED', 'Consoles Owned', 'Consoles Owned'),
(106, 'M_BIOGRAPHY', 'Biography', 'Biography'),
(107, 'M_SAVE_CHANGES', 'Save Changes', 'Save Changes'),
(108, 'M_NAME', 'Name', 'Name'),
(109, 'M_CITY_TOWN', 'City Town', 'City Town'),
(110, 'M_STATE_COUNTY_PROVINCE', 'State', 'State'),
(111, 'M_POSTCODE_ZIP', 'Postcode', 'Postcode'),
(112, 'M_MSG_YOUR_ACCOUNT_DETAILS_UPDATED', 'Your account details successfully updated.', 'Your account details successfully updated.'),
(113, 'M_OLD_PASSWORD', 'Old Password', 'Old Password'),
(114, 'M_ENTER_A_NEW_PASSWORD', 'Enter a new password', 'Enter a new password'),
(115, 'M_CONFIRM_NEW_PASSWORD', 'Confirm New Password', 'Confirm New Password'),
(117, 'M_YOUR_PASSWORD_HAS_BEEN_UPDATED', 'Your password has been updated.', 'Your password has been updated.'),
(118, 'M_CURRENT_PASSWORD', 'Current Password', 'Current Password'),
(119, 'M_NEW_PASSWORD', 'New Password', 'New Password'),
(120, 'M_ERROR_NOT_BUYER_TYPE', 'You are not registered as a customer.', 'You are not registered as a customer.'),
(121, 'M_SEARCH', 'Search', 'Search'),
(122, 'M_ERROR_INVALID_FBLOGIN', 'ERROR INVALID FBLOGIN', 'ERROR INVALID FBLOGIN'),
(123, 'M_ADDRESS_LINE_1', 'Address Line 1', 'Address Line 1'),
(124, 'M_ADDRESS_LINE_2', 'Address Line 2', 'Address Line 2'),
(125, 'M_COUNTRY', 'Country', 'Country'),
(126, 'M_DEFAULT_ADDRESS', 'Default Address', 'Default Address'),
(127, 'M_ADDRESS_TYPE', 'Address Type', 'Address Type'),
(129, 'M_FULL_NAME', 'Full Name', 'Full Name'),
(130, 'M_PROFILE_NAME', 'Profile Name', 'Profile Name'),
(131, 'L_DASHBOARD', 'Dashboard', 'Dashboard'),
(132, 'L_RECENT_ACTIVITY', 'Recent Activity', 'Recent Activity'),
(133, 'L_MESSAGES', 'Messages', 'Messages'),
(134, 'L_MY_ORDERS', 'My Orders', 'My Orders'),
(135, 'L_FAVORITES', 'Favorites', 'Favorites'),
(136, 'L_MY_ADDRESSES', 'My Addresses', 'My Addresses'),
(137, 'L_CHANGE_PASSWORD', 'Change Password', 'Change Password'),
(138, 'L_INVITE_A_FRIEND', 'Invite a Friend', 'Invite a Friend'),
(139, 'L_FAVORITE_ITEMS', 'Favorite Items', 'Favorite Items'),
(140, 'L_FAVORITE_SHOPS', 'Favorite Shops', 'Favorite Shops'),
(141, 'L_WELCOME', 'Welcome', 'Welcome'),
(142, 'L_THANK_YOU_FOR_VISITING', 'Thank you for visiting the <strong>%s</strong>', 'Thank you for visiting the <strong>%s</strong>'),
(143, 'L_BELOW_ARE_SOME_USEFUL_LINKS', 'Below are some useful links to help you manage your personal information and details of your orders.', 'Below are some useful links to help you manage your personal information and details of your orders.'),
(144, 'L_PERSONAL_INFORMATION', 'Personal Information', 'Personal Information'),
(145, 'L_EDIT', 'Edit', 'Edit'),
(146, 'L_NAME', 'Name', 'Name'),
(147, 'L_EMAIL', 'Email', 'Email'),
(148, 'L_LOCATION', 'Location', 'Location'),
(149, 'L_PHONE', 'Phone', 'Phone'),
(150, 'L_YOU_DO_NOT_HAVE_ANY_FAVOURITE_ITEM', 'You do not have any favorite item(s).', 'You do not have any favorite item(s).'),
(151, 'L_YOU_DO_NOT_HAVE_ANY_FAVOURITE_SHOPS', 'You do not have any favorite shop(s).', 'You do not have any favorite shop(s).'),
(152, 'L_LATEST_X_ORDERS', 'Latest %d Orders', 'Latest %d Orders'),
(153, 'L_DATE', 'Date', 'Date'),
(154, 'L_ORDER_ID', 'Order ID', 'Order ID'),
(155, 'L_SHIP_TO', 'Ship to', 'Ship to'),
(156, 'L_ORDER_TOTAL', 'Order Total', 'Order Total'),
(157, 'L_STATUS', 'Status', 'Status'),
(158, 'L_ACTION', 'Action', 'Action'),
(159, 'L_VIEW_ORDER', 'View Order', 'View Order'),
(160, 'L_YOU_HAVE_NOT_PLACED_ORDER', 'You have not placed order(s).', 'You have not placed order(s).'),
(161, 'L_YOU', 'You', 'You'),
(162, 'L_FAVORITED', 'favorited', 'favorited'),
(163, 'L_THIS', 'this', 'this'),
(164, 'L_ITEM', 'Item', 'Item'),
(165, 'L_SHOP', 'Shop', 'Shop'),
(166, 'L_ITEMS_X_TO_Y_OF_Z_TOTAL', 'Items %d to %d of %d total', 'Items %d to %d of %d total'),
(167, 'L_SHOPS', 'Shops', 'Shops'),
(168, 'L_ITEMS_I_LOVE', 'Items i Love', 'Items i Love'),
(169, 'L_SHOP_OWNER', 'Shop Owner', 'Shop Owner'),
(170, 'F_LIST_NAME', 'List Name', 'List Name'),
(171, 'F_CREATE', 'Create', 'Create'),
(172, 'F_CREATE_NEW_LIST', 'Create New List', 'Create New List'),
(173, 'L_LIST', 'List', 'List'),
(174, 'F_ADD', 'Add', 'Add'),
(175, 'M_ERROR_DUPLICATE_USERNAME', 'This username already exists in our record. Kindly use forgot password to request a new password if this username belongs to you.', 'This username already exists in our record. Kindly use forgot password to request a new password if this username belongs to you.'),
(176, 'L_USERNAME_OR_EMAIL', 'Username or Email', 'Username or Email'),
(177, 'M_EMAIL_OR_USERNAME', 'Email or Username', 'Email or Username'),
(178, 'F_EMAIL_OR_USERNAME', 'EMAIL OR USERNAME', 'EMAIL OR USERNAME'),
(179, 'L_CITY', 'City', 'City'),
(180, 'L_STATE', 'State', 'State'),
(181, 'L_MEMBER_SINCE', 'Member Since', 'Member Since'),
(182, 'L_CHANGE_EMAIL', 'Change Email Address', 'Change Email Address'),
(183, 'M_NEW_EMAIL', 'New Email', 'New Email'),
(184, 'M_CONFIRM_NEW_EMAIL', 'Confirm New Email', 'Confirm New Email'),
(187, 'M_CHANGE_EMAIL_REQUEST', 'Your request for change in email address received. A verification link has been sent to your new Email Address. Please verify your email to update your email address.', 'Your request for change in email address received. A verification link has been sent to your new Email Address. Please verify your email to update your email address.'),
(188, 'L_YOU_DO_NOT_HAVE_ANY_ITEM_IN_THIS_LIST.', 'You do not have any item in this list.', 'You do not have any item in this list.'),
(189, 'M_ERROR_NOT_SELLER_TYPE', 'You are registered as a Buyer, Please %s to login.', 'You are registered as a Buyer, Please %s to login.'),
(190, 'M_SUBJECT', 'Subject', 'Subject'),
(191, 'M_SEND', 'Send', 'Send'),
(192, 'F_ASK_A_QUESTION_SHOP_VENDOR', 'Ask A Question Shop Vendor', 'Ask A Question Shop Vendor'),
(193, 'F_MESSAGE', 'Message', 'Message'),
(194, 'F_INVITE_YOUR_FRIENDS', 'Invite your Friends', 'Invite your Friends'),
(195, 'M_INVITATION_EMAIL_SENT_SUCCESSFULLY', 'Invitation email sent successfully', 'Invitation email sent successfully'),
(196, 'F_YOUR_COMMENTS', 'Your Comments', 'Your Comments'),
(197, 'F_NOTIFY_ME', 'Notify Me', 'Notify Me'),
(198, 'M_MAKE_PAYMENT', 'Make Payment', 'Make Payment'),
(199, 'M_SUBMIT_REPORT', 'Submit Report', 'Submit Report'),
(200, 'M_NAME_ON_CARD', 'Name on card', 'Name on card'),
(201, 'M_CARD_NUMBER', 'Card Number', 'Card Number'),
(202, 'L_ORDER_INV_NUMBER', 'Order Inv Number', 'Order Inv Number'),
(203, 'M_BANK_NAME', 'Bank name', 'Bank name'),
(204, 'M_ACCOUNT_HOLDER_NAME', 'Beneficiary/Account Holder Name', 'Beneficiary/Account Holder Name'),
(205, 'M_ACCOUNT_NUMBER', 'Bank Account Number', 'Bank Account Number'),
(206, 'M_SOCIAL_SECURITY_NUMBER', 'Social Security Number', 'Social Security Number'),
(207, 'M_RIF_NUMBER', 'RIF Number', 'RIF Number'),
(208, 'L_MY_PRODUCTS', 'My Products', 'My Products'),
(209, 'L_YOUR_SHOP', 'Your Shop', 'Your Shop'),
(210, 'L_YOUR_PRODUCTS', 'Your Products', 'Your Products'),
(211, 'L_YOU_DO_NOT_HAVE_ANY_ITEM_IN_THIS_SECTION', 'You do not have any item in this section', 'You do not have any item in this section'),
(212, 'L_ESHOP', 'eShop', 'eShop'),
(213, 'L_MY_SALES', 'My Sales', 'My Sales'),
(214, 'L_NO_RECORD_FOUND', 'No Record Found', 'No Record Found'),
(215, 'L_LATEST_X_SALES', 'Latest %d Sales', 'Latest %d Sales'),
(216, 'L_YOU_HAVE_NOT_RECEIVED_ANY_SALES', 'You have not received any sale(s).', 'You have not received any sale(s).'),
(217, 'L_ORDERED_PRODUCTS', 'Ordered Products', 'Ordered Products'),
(218, 'L_AMOUNT_PAID', 'Amount Paid', 'Amount Paid'),
(219, 'L_INV_NUMBER', 'Inv Number', 'Inv Number'),
(220, 'YOUR FEEDBACK HAS ALREADY BEEN SUBMITTED.', 'Your feedback has already been submitted.', 'Your feedback has already been submitted.'),
(221, 'M_MSG_YOUR_BANK_DETAILS_UPDATED', 'Your bank details has been updated.', 'Your bank details has been updated.'),
(222, 'M_SUPPORT_NUMBER', 'Support Number', 'Support Number'),
(223, 'M_MSG_YOUR_REFUND_DETAILS_UPDATED', 'Your return/replace request has been updated.', 'Your return/replace request has been updated.'),
(224, 'M_REPLACE', 'Replace Item', 'Replace Item'),
(225, 'M_REFUND', 'Refund', 'Refund'),
(226, 'L_MY_RETURN_REQUESTS', 'My Return Requests', 'My Return Requests'),
(227, 'L_MY_CREDITS_INFO', 'My Credits Info', 'My Credits Info'),
(228, 'L_ID', 'ID', 'ID'),
(229, 'L_CREDIT', 'Credit', 'Credit'),
(230, 'L_DEBIT', 'Debit', 'Debit'),
(231, 'L_BALANCE', 'Balance', 'Balance'),
(232, 'L_DESCRIPTION', 'Description', 'Description'),
(233, 'F_COMMENTS', 'Comments', 'Comments'),
(234, 'M_SEND_REQUEST', 'Send Request', 'Send Request'),
(235, 'L_REQUEST_WITHDRAWAL', 'Request Withdrawal', 'Request Withdrawal'),
(236, 'L_MY_PUBLICATIONS', 'My Publications', 'My Publications'),
(237, 'F_ASK_A_QUESTION', 'Ask A Question', 'Ask A Question'),
(238, 'M_ERROR_YOUR_SESSION_EXPIRED', 'Either your login session has expired or you are not authorized to access this area. Please refresh this page to login again.', 'Either your login session has expired or you are not authorized to access this area. Please refresh this page to login again.'),
(239, 'L_VIEW_REQUEST', 'View Request', 'View Request'),
(240, 'L_BACK_TO_CREDIT_SUMMARY', 'Back to Credit Summary', 'Back to Credit Summary'),
(241, 'M_CLABE_NUMBER', 'Clabe Number', 'Clabe Number'),
(242, 'M_ERROR_NOT_AUTHORIZED', 'You are not authorized to access this page.', 'You are not authorized to access this page.'),
(244, 'L_PRODUCTS', 'Products', 'Products'),
(245, 'L_RETURN_QTY', 'Return Qty', 'Return Qty'),
(246, 'L_VIEW_RETURN_REQUEST', 'View Return Request', 'View Return Request'),
(247, 'L_BACK_TO_RETURN_REQUEST', 'Back to Return Request', 'Back to Return Request'),
(248, 'L_MY_CLASSIFIEDS', 'My Classifieds', 'My Classifieds'),
(249, 'L_CLASSIFIEDS', 'Classifieds', 'Classifieds'),
(250, 'L_CLSSIFIEDS_I_LOVE', 'Clssifieds i Love', 'Clssifieds i Love'),
(251, 'L_YOU_DO_NOT_HAVE_ANY_FAVOURITE_CLASSIFIED', 'You do not have any favorite classified.', 'You do not have any favorite classified.'),
(252, 'L_BANK_INFORMATION', 'Bank Information', 'Bank Information'),
(253, 'EDIT', '', ''),
(254, 'L_EDIT_RETURN_ADDRESS', 'Edit Return Address', 'Edit Return Address'),
(255, 'L_EDIT_PERSONAL_INFORMATION', 'Edit Personal Information', 'Edit Personal Information'),
(256, 'L_EDIT_BANK_INFORMATION', 'Edit Bank Information', 'Edit Bank Information'),
(257, 'L_PUBLISHED_ITEMS', 'Published Items', 'Published Items'),
(258, 'L_FROM', 'From', 'From'),
(259, 'L_IN', 'In', 'In'),
(260, 'L_INFORMATION', 'Information', 'Information'),
(261, 'L_UNABLE_TO_FIND_ANY_RECORD', 'We are unable to find any record corresponding to your selection.', 'We are unable to find any record corresponding to your selection.'),
(262, 'L_SORT_BY', 'Sort By', 'Sort By'),
(263, 'L_BROWSE_BY_CATEGORY', 'Browse By Category', 'Browse By Category'),
(264, 'L_ALL_CATEGORIES', 'All Categories', 'All Categories'),
(265, 'L_PRICE', 'Price', 'Price'),
(266, 'L_AND', 'and', 'and'),
(267, 'L_CLEAR_ALL', 'Clear All', 'Clear All'),
(268, 'L_FAVORITE', 'Favorite', 'Favorite'),
(269, 'L_ITEM_DETAILS', 'Item details', 'Item details'),
(270, 'L_YOUR_CART', 'Your Cart', 'Your Cart'),
(271, 'L_CONTINUE_SHOPPING', 'Continue Shopping', 'Continue Shopping'),
(272, 'L_YOUR_CART_IS_EMPTY', 'Your cart is empty', 'Your cart is empty'),
(273, 'L_BRAND', 'Brand', 'Brand'),
(274, 'L_SHOP_LOCATION', 'Shop Location', 'Shop Location'),
(275, 'L_CONDITION', 'Condition', 'Condition'),
(276, 'L_SHIPPING', 'Shipping', 'Shipping'),
(277, 'L_FREE_SHIPPING', 'Free Shipping', 'Free Shipping'),
(278, 'L_AVAILABILITY', 'Availability', 'Availability'),
(279, 'L_EXCLUDE_OUT_OF_STOCK', 'Exclude out of stock', 'Exclude out of stock'),
(280, 'L_IMAGE', 'Image', 'Image'),
(281, 'L_PRODUCT', 'Product', 'Product'),
(282, 'L_QTY', 'Qty', 'Qty'),
(283, 'L_UNIT_PRICE', 'Unit Price', 'Unit Price'),
(284, 'L_SUBTOTAL', 'Subtotal', 'Subtotal'),
(285, 'L_SELLER', 'Seller', 'Seller'),
(286, 'L_FAVORITE_PRODUCT', 'Favorite Product', 'Favorite Product'),
(287, 'L_CONTACT_TO_SHOP_OWNER', 'Contact to shop owner', 'Contact to shop owner'),
(288, 'L_POSITIVE_INTEGER_QTY', 'Positive Integer Qty', 'Positive Integer Qty'),
(289, 'L_SUB_TOTAL', 'Sub Total', 'Sub Total'),
(290, 'L_PLACE_ORDER', 'Place Order', 'Place Order'),
(291, 'L_MY_ACCOUNT', 'My Account', 'My Account'),
(292, 'L_LOGOUT', 'Logout', 'Logout'),
(293, 'L_TOTAL_AMOUNT', 'Total Amount', 'Total Amount'),
(294, 'L_GRAND_TOTAL', 'Grand Total', 'Grand Total'),
(295, 'L_PRODUCT_INFORMATION', 'Product Information', 'Product Information'),
(296, 'L_SELECT_SHIPPING', 'Select Shipping', 'Select Shipping'),
(297, 'L_ITEM_NOT_AVAILABLE_FOR_SHIPPING', 'Item not available for shipping in selected state.', 'Item not available for shipping in selected state.'),
(298, 'L_SURE_YOU_WANT_REMOVE_ITEM_CART', 'Sure you want to remove this item from your cart?', 'Sure you want to remove this item from your cart?'),
(299, 'L_UNABLE_TO_FIND_ANY_RECORD_HERE', 'We are unable to find any record here.', 'We are unable to find any record here.'),
(300, 'L_CONGRATULATIONS', 'Congratulations', 'Congratulations'),
(301, 'L_YOUR_ORDER_HAS_BEEN_PLACED', 'Your order %s has been successfully placed.', 'Your order %s has been successfully placed.'),
(302, 'L_YOU_WILL_RECEIVE_EMAIL', 'You will receive confirmation email shortly.', 'You will receive confirmation email shortly.'),
(303, 'L_BACK_TO_HOME', 'Back to home', 'Back to home'),
(304, 'L_SHIPPING_ADDRESS', 'Shipping Address', 'Shipping Address'),
(305, 'L_FULL_NAME', 'Full Name', 'Full Name'),
(306, 'L_PHONE_NUMBER', 'Phone Number', 'Phone Number'),
(307, 'L_ADDRESS_LINE_1', 'Address Line 1', 'Address Line 1'),
(308, 'L_ADDRESS_LINE_2', 'Address Line 2', 'Address Line 2'),
(309, 'L_COUNTRY', 'Country', 'Country'),
(310, 'L_POSTAL_CODE', 'Postal Code', 'Postal Code'),
(311, 'L_BILLING_ADDRESS', 'Billing Address', 'Billing Address'),
(312, 'L_YOUR_ORDER_PRODUCTS', 'Your order products', 'Your order products'),
(313, 'L_SELECT_SHIPPING_STATE', 'Select Shipping State', 'Select Shipping State'),
(314, 'L_CHOOSE_AN_ADDRESS', 'Choose an address', 'Choose an address'),
(315, 'L_MAKE_PAYMENT', 'Make Payment', 'Make Payment'),
(316, 'L_NAME_ON_CARD', 'Name on card', 'Name on card'),
(317, 'L_CREDIT_CARD_NUMBER', 'Credit card number', 'Credit card number'),
(318, 'L_EXP_MONTH', 'Exp Month', 'Exp Month'),
(319, 'L_EXP_YEAR', 'Exp Year', 'Exp Year'),
(320, 'L_CARD_CVV', 'Card CVV', 'Card CVV'),
(321, 'L_SAME_AS_SHIPPING_ADDRESS', 'Same as shipping address', 'Same as shipping address'),
(322, 'L_WHY_ARE_YOU_REPORTING', 'Why are you reporting this shop?', 'Why are you reporting this shop?'),
(323, 'L_SITEMAP', 'Sitemap', 'Sitemap'),
(324, 'L_SITE_PAGES', 'Site Pages', 'Site Pages'),
(325, 'L_HOME', 'Home', 'Home'),
(326, 'L_CATEGORIES', 'Categories', 'Categories'),
(327, 'L_BRANDS', 'Brands', 'Brands'),
(328, 'L_BROWSE_ALPHABETICALLY', 'Browse Alphabetically', 'Browse Alphabetically'),
(329, 'L_STORES', 'Stores', 'Stores'),
(330, 'L_HOW_CAN_HELP_YOU', 'How can we Help you?', 'How can we Help you?'),
(331, 'L_HAVE_QUESTION_ENTER', 'Have a Question?  Ask or enter a search term here.', 'Have a Question?  Ask or enter a search term here.'),
(332, 'L_SEARCH', 'Search', 'Search'),
(333, 'L_YOUR_RECENT_ACTIVITITIES', 'Your recent activities will live here.', 'Your recent activities will live here.'),
(334, 'L_ADDRESS_LIST', 'Address List', 'Address List'),
(335, 'L_ADD_ADDRESS', 'Add Address', 'Add Address'),
(336, 'L_LOAD_MORE', 'Load More', 'Load More'),
(337, 'L_ACCOUNT_INFORMATION', 'Account Information', 'Account Information'),
(338, 'M_CHANGE_PASSWORD', 'Change Password', 'Change Password'),
(339, 'M_CHANGE_EMAIL', 'Change Email', 'Change Email'),
(340, 'L_SHOP_SECTIONS', 'Shop Sections', 'Shop Sections'),
(341, 'L_SHOP_INFO', 'Shop Info', 'Shop Info'),
(342, 'L_OPENED_ON', 'Opened On', 'Opened On'),
(343, 'L_SEND_MESSAGE', 'Send Message', 'Send Message'),
(344, 'L_POLICIES', 'Policies', 'Policies'),
(345, 'L_OUT_OF', 'out of', 'out of'),
(346, 'L_ACTIONS', 'Actions', 'Actions'),
(347, 'L_SEE_WHO_FAVORITE_THIS', 'See who favorites this', 'See who favorites this'),
(348, 'L_REPORT_THIS_SHOP', 'Report this shop to Yokart', 'Report this shop to Yokart'),
(349, 'L_TOTAL_SALES', 'Total sales', 'Total sales'),
(350, 'L_QUICK_LINKS', 'Quick Links', 'Quick Links'),
(351, 'L_RETURN_REQUESTS', 'Return Requests', 'Return Requests'),
(352, 'L_WRITE_YOUR_ORDER_REVIEW', 'Write your order review', 'Write your order review'),
(353, 'L_FEEDBACK_DESCRIPTION', 'Please use the stars below to describe your overall satisfaction with the product. Write your experience with the product in the review box.', 'Please use the stars below to describe your overall satisfaction with the product. Write your experience with the product in the review box.'),
(354, 'L_FEEDBACK_DESCRIPTION_BOTTOM', 'Your review as a certified buyer will be posted on %s for our customers to read and make an informed buying decision. We appreciate you submitting your review.', 'Your review as a certified buyer will be posted on %s for our customers to read and make an informed buying decision. We appreciate you submitting your review.'),
(355, 'L_INVITE_FRIENDS', 'Invite Friends', 'Invite Friends'),
(356, 'L_FACEBOOK', 'Facebook', 'Facebook'),
(357, 'L_SEND_INVITATION_MESSAGE', 'Send Invitation message to your contacts', 'Send Invitation message to your contacts'),
(358, 'L_EDIT_INFORMATION', 'Edit Information', 'Edit Information'),
(359, 'L_CANNOT_BE_CHANGED', 'Cannot be changed', 'Cannot be changed'),
(360, 'L_VIEW', 'View', 'View'),
(361, 'L_MY_ADDRESS_BOOK', 'My Address Book', 'My Address Book'),
(362, 'L_DELETE', 'Delete', 'Delete'),
(363, 'L_SET_AS_DEFAULT', 'Set as default', 'Set as default'),
(364, 'L_WE_ARE_UNABLE_TO_FIND_RECORD', 'We are unable to find any record here, please %s to add new address.', 'We are unable to find any record here, please %s to add new address.'),
(365, 'L_CLICK_HERE', 'click here', 'click here'),
(366, 'L_YOUR_FAVORITE_SHOPS_LIVE_HERE', 'Your favorite shops will live here.', 'Your favorite shops will live here.'),
(367, 'L_VIEW_LIST', 'View List', 'View List'),
(368, 'L_DELETE_LIST', 'Delete List', 'Delete List'),
(369, 'L_CREATE_NEW_LIST', 'Create New List', 'Create New List'),
(370, 'L_INBOX', 'Inbox', 'Inbox'),
(371, 'L_SENT', 'Sent', 'Sent'),
(372, 'L_ALL', 'All', 'All'),
(373, 'L_YOU_NOT_HAVE_RECORD', 'You do not have any record in this section.', 'You do not have any record in this section.'),
(374, 'L_PART_COMBINED_ORDER', 'Part of combined order number', 'Part of combined order number'),
(375, 'L_REQUEST_REFUND_REPLACE', 'Request Refund/Replace', 'Request Refund/Replace'),
(376, 'L_SEND_A_MESSAGE', 'Send a message', 'Send a message'),
(377, 'L_FEEDBACK', 'Feedback', 'Feedback'),
(378, 'L_YOU_HAVE_NOT_PLACED_RETURN_REQUEST', 'You have not placed any return request.', 'You have not placed any return request.'),
(379, 'L_REQUEST_RETURN_REPLACE', 'Request Return or Replace', 'Request Return or Replace'),
(380, 'L_VIEW_MESSAGE', 'View Message', 'View Message'),
(381, 'L_BACK_TO_ALL_MESSAGES', 'Back to all messages', 'Back to all messages'),
(382, 'L_SUBJECT', 'Subject', 'Subject'),
(383, 'L_SAYS', 'says', 'says'),
(384, 'L_ORDER', 'Order', 'Order'),
(385, 'L_AMOUNT', 'Amount', 'Amount'),
(386, 'L_REQUEST_TYPE', 'Request Type', 'Request Type'),
(387, 'L_REASON', 'Reason', 'Reason'),
(388, 'L_SSAYS', 'ssays', 'ssays'),
(389, 'L_BACK_TO_MY_ORDERS', 'Back to my orders', 'Back to my orders'),
(390, 'L_ORDER_DATE', 'Order Date', 'Order Date'),
(391, 'L_PAYMENT_METHOD', 'Payment Method', 'Payment Method'),
(392, 'L_SHIPPING_ADDDRESS', 'Shipping Adddress', 'Shipping Adddress'),
(393, 'L_SHIPPING_METHOD', 'Shipping Method', 'Shipping Method'),
(394, 'L_CART_TOTAL', 'Cart Total', 'Cart Total'),
(395, 'L_SHIPPING_HANDLING', 'Shipping & Handling', 'Shipping & Handling'),
(396, 'L_VAT', 'VAT', 'VAT'),
(397, 'L_REFUND_AMOUNT_QTY', 'Refund Amount for Qty', 'Refund Amount for Qty'),
(398, 'L_TOP_50_BEST_SELLING', 'Top 50 Best Selling Products', 'Top 50 Best Selling Products'),
(399, 'L_OUT_OF_STOCK', 'Out of stock', 'Out of stock'),
(400, 'L_FAVORITE_SHOP', 'Favorite Shop', 'Favorite Shop'),
(401, 'L_READ_MORE', 'read more', 'read more'),
(403, 'L_REVIEWED_BY', 'Reviewed by', 'Reviewed by'),
(404, 'L_MONEY_BACK_GUARANTEE_MESSAGE', 'Get the item you ordered or get <strong>your money back</strong>. Covers your purchase price and original shipping.', 'Get the item you ordered or get <strong>your money back</strong>. Covers your purchase price and original shipping.'),
(405, 'L_MONEY_BACK_GUARANTEE', 'Yokart Money Back Guarantee', 'Yokart Money Back Guarantee'),
(406, 'L_USED', 'Used', 'Used'),
(407, 'L_RATING', 'Rating', 'Rating'),
(408, 'L_SHIPS_FROM', 'Ships from', 'Ships from'),
(409, 'L_ADDITIONAL_COST', 'Additional cost', 'Additional cost'),
(410, 'L_REMAINING_STOCK', 'Remaining Stock', 'Remaining Stock'),
(411, 'L_SHIPPING_POLICIES', 'Shipping & Policies', 'Shipping & Policies'),
(412, 'L_COST', 'Cost', 'Cost'),
(413, 'L_WITH_ANOTHER_ITEM', 'With another item', 'With another item'),
(414, 'L_BY', 'by', 'by'),
(415, 'L_EVERYWHERE_ELSE', '-- Everywhere Else --', '-- Everywhere Else --'),
(416, 'L_SHOP_POLICIES', '%s''s Shop Policies', '%s''s Shop Policies'),
(417, 'L_PAYMENT', 'Payment', 'Payment'),
(418, 'L_REFUND_EXCHANGES', 'Refund & Exchanges', 'Refund & Exchanges'),
(419, 'L_ADDITIONAL_POLICIES_FAQS', 'Additional Policies & FAQs', 'Additional Policies & FAQs'),
(420, 'L_SELLER_INFORMATION', 'Seller Information', 'Seller Information'),
(421, 'L_RELATED_PRODUCTS', 'Related Products', 'Related Products'),
(422, 'L_OTHER_ITEMS_SHOP', 'Other items from this shop.', 'Other items from this shop.'),
(423, 'L_SHIPPING_RATE_NOT_ENTERED', 'Shipping rates yet not entered for this product.', 'Shipping rates yet not entered for this product.'),
(424, 'L_NEW_PRODUCTS', 'New Products', 'New Products'),
(425, 'L_YOUR_LISTS', 'Your Lists', 'Your Lists'),
(426, 'L_SEARCH_RESULTS', 'Search Results', 'Search Results'),
(427, 'L_PRODUCT_CATEGORIES', 'Product Categories', 'Product Categories'),
(428, 'L_CLEAR_SELECTION', 'Clear Selection', 'Clear Selection'),
(429, 'L_CATEGORY', 'Category', 'Category'),
(430, 'L_MOST_RECENT', 'Most Recent', 'Most Recent'),
(431, 'L_FEATUERED', 'Featured', 'Featured'),
(432, 'L_BESTSELLING', 'Bestselling', 'Bestselling'),
(433, 'L_PRICE_LOW_HIGH', 'Price (Low to High)', 'Price (Low to High)'),
(434, 'L_PRICE_HIGH_LOW', 'Price (High to Low)', 'Price (High to Low)'),
(435, 'L_NAME_A_Z', 'Name (A to Z)', 'Name (A to Z)'),
(436, 'L_NAME_Z_A', 'Name (Z to A)', 'Name (Z to A)'),
(437, 'L_FEATURED', 'Featured', 'Featured'),
(438, 'L_SHIP_FREE', 'Ship Free', 'Ship Free'),
(439, 'L_NEW', 'New', 'New'),
(440, 'L_REFURBISHED', 'Refurbished', 'Refurbished'),
(441, 'L_NEW_PENDING', 'New Pending', 'New Pending'),
(442, 'L_APPROVED', 'Approved', 'Approved'),
(443, 'L_CANCELLED', 'Cancelled', 'Cancelled'),
(444, 'L_PENDING', 'Pending', 'Pending'),
(445, 'L_IN_PROCESS', 'In-Process', 'In-Process'),
(446, 'L_ESCALATED', 'Escalated', 'Escalated'),
(447, 'L_REFUNDED', 'Refunded', 'Refunded'),
(448, 'L_WITHDRAWN', 'Withdrawn', 'Withdrawn'),
(449, 'L_COMPLETED', 'Completed', 'Completed'),
(450, 'L_ADD_A_CLASSIFIED', 'Add a Classified', 'Add a Classified'),
(451, 'L_ACTIVE_ITEMS', 'Active Items', 'Active Items'),
(452, 'L_PAUSED_ITEMS', 'Paused Items', 'Paused Items'),
(453, 'L_FINALIZED_ITEMS', 'Finalized Items', 'Finalized Items'),
(454, 'L_EXPIRING_IN', 'Expiring in', 'Expiring in'),
(455, 'L_REMOVE', 'Remove', 'Remove'),
(456, 'L_PAUSE', 'Pause', 'Pause'),
(457, 'L_TITLE', 'Title', 'Title'),
(458, 'L_FINALIZED_ITEM', 'Finalized Item', 'Finalized Item'),
(459, 'L_ENABLE', 'Enable', 'Enable'),
(460, 'L_ADD_A_PRODUCT', 'Add a Product', 'Add a Product'),
(461, 'L_SOLD', 'Sold', 'Sold'),
(462, 'L_AVAILABLE', 'Available', 'Available'),
(463, 'L_ITEM_VARIANTS', 'Item Variants', 'Item Variants'),
(464, 'L_UPDATE_INVENTORY', 'Update Inventory', 'Update Inventory'),
(465, 'L_UPDATE_INVENTORY_MESSAGE', 'Please update the value in boxes provided below and click on "Update Inventory" Button.', 'Please update the value in boxes provided below and click on "Update Inventory" Button.'),
(466, 'L_CANCEL_ORDER', 'Cancel Order', 'Cancel Order'),
(467, 'L_THIS_ORDER_ALREADY', 'This order has already %s. You are not allowed to take any further action on this order.', 'This order has already %s. You are not allowed to take any further action on this order.'),
(468, 'L_INVOICE_ID', 'Invoice Id', 'Invoice Id'),
(469, 'L_TOTAL_PAID', 'Total Paid', 'Total Paid'),
(470, 'L_PRODUCT_NAME', 'Product Name', 'Product Name'),
(471, 'L_BUYING_PRICE', 'Buying Price', 'Buying Price'),
(472, 'L_CODE', 'Code', 'Code'),
(473, 'L_TOTAL', 'Total', 'Total'),
(474, 'L_DATE_ADDED', 'Date Added', 'Date Added'),
(475, 'L_CUSTOMER_NOTIFIED', 'Customer Notified', 'Customer Notified'),
(476, 'L_COMMENTS', 'Comments', 'Comments'),
(477, 'L_REASON_FOR_CANCELLATION', 'Reason for cancellation', 'Reason for cancellation'),
(478, 'L_SOLD_ITEMS', 'Sold Items', 'Sold Items'),
(479, 'L_CREDITS_SUMMARY', 'Credits Summary', 'Credits Summary'),
(480, 'L_CURRENT_BALANCE', 'Current Balance', 'Current Balance'),
(481, 'L_REPUBLISH', 'Republish', 'Republish'),
(482, 'L_PRODUCTS_SETUP', 'Products Setup', 'Products Setup'),
(483, 'L_ACTIVE_LISTINGS', 'Active Listings', 'Active Listings'),
(484, 'L_GENERAL', 'General', 'General'),
(485, 'L_VARIANTS', 'Variants', 'Variants'),
(486, 'L_PUBLISH', 'Publish', 'Publish'),
(487, 'L_MANAGE_YOUR_SHOP', 'Manage Your Shop', 'Manage Your Shop'),
(488, 'L_VISIT_SHOP', 'Visit Shop', 'Visit Shop'),
(489, 'L_INFO_APPEARANCE', 'Info & Appearance', 'Info & Appearance'),
(490, 'L_VIEW_SALE_ORDER', 'View Sale Order', 'View Sale Order'),
(491, 'L_DELIVERY', 'Delivery', 'Delivery'),
(492, 'L_REFUND_QTY', 'Refund Qty', 'Refund Qty'),
(493, 'L_REFUND_AMOUNT', 'Refund Amount', 'Refund Amount'),
(494, 'L_LISTED_PRICE', 'Listed Price', 'Listed Price'),
(495, 'L_BILLING_DETAILS', 'Billing Details', 'Billing Details'),
(496, 'L_SHIPPING_DETAILS', 'Shipping Details', 'Shipping Details'),
(497, 'L_ORDER_COMMENTS', 'Order Comments', 'Order Comments'),
(498, 'L_BANK_NAME', 'Bank name', 'Bank name'),
(499, 'L_ACCOUNT_NAME', 'Account Name', 'Account Name'),
(500, 'L_ACCOUNT_NUMBER', 'Bank Account Number', 'Bank Account Number'),
(501, 'L_CLABE_NUMBER', 'Clabe Number', 'Clabe Number'),
(502, 'L_RIF_NUMBER', 'RIF Number', 'RIF Number'),
(504, 'L_WITHDRAWAL_COMMENTS', 'Withdrawal Comments', 'Withdrawal Comments'),
(505, 'L_YET_NOT_REVIEWED', 'Yet not reviewed', 'Yet not reviewed'),
(506, 'L_ABOUT', 'About', 'About'),
(507, 'L_FEATURED_LISTINGS_FROM', 'Featured Listings From', 'Featured Listings From'),
(508, 'L_REFUNDS_EXCHANGES', 'Refunds Exchanges', 'Refunds Exchanges'),
(509, 'L_LAST_UPDATED', 'Last updated', 'Last updated'),
(510, 'L_BEST_SELLING', 'Best Selling - Stores', 'Best Selling - Stores'),
(511, 'F_WHO_FAVORITED_THIS', 'Who favorited this?', 'Who favorited this?'),
(512, 'F_PEOPLE_ADMIRE_THIS', 'people admire this shop', 'people admire this shop'),
(513, 'F_TESTIMONIALS_TOP_LINE', 'We have some great clients who love us', 'We have some great clients who love us'),
(514, 'F_TESTIMONIALS_WE_LOVE_CLIENT', 'We love our clients and they love us back', 'We love our clients and they love us back'),
(515, 'F_LOAD_MORE', 'Load More', 'Load More'),
(516, 'F_SELL_ON_SITE', 'Sell on Yokart', 'Sell on Yokart'),
(517, 'F_REGISTRATION_FORM', 'Registration Form', 'Registration Form'),
(518, 'L_ENTER_YOUR_QUERY', 'Enter your query', 'Enter your query'),
(519, 'L_QUERY_POSTED_FOR', 'Query posted for', 'Query posted for'),
(520, 'L_CLASSIFIED_MESSAGE_SENT', 'Your message has been sent, you will receive an email notification when vendor responds to your question(s).', 'Your message has been sent, you will receive an email notification when vendor responds to your question(s).'),
(521, 'L_YOU_HAVE_TO_BE_LOGGED_MESSAGE', 'You have to be a logged in member to add product to your favorite.\r\n\r\n\r\nIf you are already a member then please %s to login else %s to register.', 'You have to be a logged in member to add product to your favorite.\r\n\r\n\r\nIf you are already a member then please %s to login else %s to register.'),
(522, 'L_CLASSIFIEDS_SETUP', 'Classifieds Setup', 'Classifieds Setup'),
(523, 'L_ACTIVE_CLASSIFIEDS', 'Active Classifieds', 'Active Classifieds'),
(524, 'L_PLEASE_UPLOAD_VALID_IMAGE', 'Please upload valid image.', 'Please upload valid image.'),
(525, 'L_YOUR_IMAGE_UPLOADED_SUCCESSFULLY', 'Your image uploaded successfully.', 'Your image uploaded successfully.'),
(526, 'L_MAIN_PHOTO', 'Main Photo', 'Main Photo'),
(527, 'L_SHOWING_TOTAL', 'Showing Total', 'Showing Total'),
(528, 'L_PHOTOS', 'Photos', 'Photos'),
(529, 'F_TYPE_TWO_WORDS', 'Type the two words', 'Type the two words'),
(530, 'F_ENTER_SECURITY_CODE', 'Enter security code', 'Enter security code'),
(531, 'F_PLEASE_SELECT_YOUR_REASON', 'Please select your reason', 'Please select your reason'),
(532, 'F_PLEASE_EXPLAIN_SHOP_VIOLATES', 'Please explain why this shop violates site''s policies.', 'Please explain why this shop violates site''s policies.'),
(533, 'F_PLEASE_ENTER_MESSAGE', 'Please enter your message', 'Please enter your message'),
(534, 'F_YOUR_REPORT_SENT_REVIEW', 'Your report has been successfully sent for review.', 'Your report has been successfully sent for review.'),
(535, 'F_CART_UPDATED_SUCCESSFULLY', 'Your cart is updated successfully.', 'Your cart is updated successfully.'),
(536, 'L_PROFILE_DETAILS', 'Profile details', 'Profile details'),
(537, 'L_ERROR_FILE_VALID_IMAGE_EXTENSION', 'Please upload file with valid image extensions.', 'Please upload file with valid image extensions.'),
(538, 'M_ADDRESS_ADDED_UPDATED', 'Address added/updated successfully.', 'Address added/updated successfully.'),
(539, 'M_ADDRESS_DELETED_SUCCESSFULLY', 'Address deleted successfully.', 'Address deleted successfully.'),
(540, 'M_LIST_NAME', 'List Name', 'List Name'),
(541, 'M_NEW_LIST_ADDED', 'New list added successfully.', 'New list added successfully.'),
(542, 'M_LIST_DELETED', 'List deleted successfully.', 'List deleted successfully.'),
(543, 'M_YOUR_EMAIL_NOT_CHANGE', 'Your email address will not change until you confirm it via email.', 'Your email address will not change until you confirm it via email.'),
(544, 'L_PLEASE_ENTER_YOUR_MESSAGE', 'Please enter your message', 'Please enter your message'),
(545, 'L_NOT_SUPPORT_FILE_FORMAT_ATTACHMENT', 'We do not support this file format as attachment, please upload valid file.', 'We do not support this file format as attachment, please upload valid file.'),
(546, 'L_TO', 'To', 'To'),
(547, 'L_DATE_FROM', 'Date From', 'Date From'),
(548, 'L_DATE_TO', 'Date To', 'Date To'),
(549, 'L_CLEAR_SEARCH', 'Clear Search', 'Clear Search'),
(550, 'L_REASON_FOR_REQUEST', 'Reason for request', 'Reason for request'),
(551, 'L_SELECT_REASON', 'Select Reason', 'Select Reason'),
(552, 'L_PLEASE_SELECT_YOUR_REASON', 'Please select your reason', 'Please select your reason'),
(553, 'L_WANT_REFUND_REPLACE', 'Do you want a refund or replace:', 'Do you want a refund or replace:'),
(554, 'L_YOUR_REQUEST_SUBMITTED', 'Your request has been submitted successfully.', 'Your request has been submitted successfully.'),
(555, 'L_ALREADY_SUBMITTED_REQUEST_ORDER', 'You have already submitted request for this order.', 'You have already submitted request for this order.'),
(556, 'L_PRODUCT_RATING', 'Product Rating', 'Product Rating'),
(557, 'L_RATE', 'Rate', 'Rate'),
(558, 'L_TELL_EXPERIENCE_PRODUCT', 'Tell us your experience with this Product', 'Tell us your experience with this Product'),
(559, 'L_YOUR_REVIEW_SUBMITTED_SUCCESSFULLY', 'Your review has been submitted successfully.', 'Your review has been submitted successfully.'),
(560, 'M_YOU_HAVE_ALREADY_SUBMITTED_FEEDBACK', 'You have already submitted your feedback corresponding to this product.', 'You have already submitted your feedback corresponding to this product.'),
(561, 'L_ESCALATE_TO', 'Escalate to %s', 'Escalate to %s'),
(562, 'L_WITHDRAW_REQUEST', 'Withdraw Request', 'Withdraw Request'),
(563, 'L_RETURN_REQUEST_ESCALATED', 'This return request is escalated to %s.', 'This return request is escalated to %s.'),
(564, 'L_YOUR_REQUEST_SENT', 'Your request has been sent successfully.', 'Your request has been sent successfully.'),
(565, 'L_REQUEST_WITHDRAWN', 'Your request has been withdrawn.', 'Your request has been withdrawn.'),
(566, 'L_APPROVE_REFUND', 'Approve Refund', 'Approve Refund'),
(567, 'L_REQUEST_APPROVED_REFUND', 'Your request has been approved for refund.', 'Your request has been approved for refund.'),
(568, 'L_FINAL_PRICE', 'Final Price', 'Final Price'),
(569, 'L_IMAGE_SET_AS_DEFAULT', 'Image set as default.', 'Image set as default.'),
(570, 'L_YOUR_IMAGE_REMOVED_SUCCESSFULLY', 'Your image removed successfully.', 'Your image removed successfully.'),
(571, 'L_MINIMUM_SELLING_PRICE', 'Minimum Selling Price allowed for listing is %s.', 'Minimum Selling Price allowed for listing is %s.'),
(572, 'L_SELECT_VARIANTS_INCLUDE', 'Select those variants which You want to include for this product.', 'Select those variants which You want to include for this product.'),
(573, 'L_SUBMIT', 'Submit', 'Submit'),
(574, 'L_REMOVE_GROUP', 'Remove Group', 'Remove Group'),
(575, 'L_GROUP_REMOVED_PRODUCT', 'The Group has been removed from this product.', 'The Group has been removed from this product.'),
(576, 'L_GROUP_COULD_NOT_REMOVED_PRODUCT', 'The Group could not be removed.', 'The Group could not be removed.'),
(577, 'L_NOTHING_UPDATE_ADD', 'Nothing to update/add.', 'Nothing to update/add.'),
(578, 'L_SUM_VARIANTS_QTY', 'Please keep sum of all variants quantity equals to product stock quantity i.e [%s].', 'Please keep sum of all variants quantity equals to product stock quantity i.e [%s].'),
(579, 'L_PLEASE_ENTER_UNIUE_CODE', 'Please enter uniue code.', 'Please enter uniue code.'),
(580, 'L_PERFORM_VALID_PRODUCT', 'Please perform this action on valid product.', 'Please perform this action on valid product.'),
(581, 'L_ACTION_TRYING_PERFORM_NOT_VALID', 'Action you are trying to perform is not valid.', 'Action you are trying to perform is not valid.'),
(582, 'L_STATUS_MODIFIED_SUCCESSFULLY', 'Status has been modified successfully.', 'Status has been modified successfully.'),
(583, 'L_EMAIL_ADDRESS', 'Email Address', 'Email Address'),
(584, 'F_EMAIL_ADDRESS', 'Email Address', 'Email Address'),
(585, 'F_ADD_TO_CART', 'Add to cart', 'Add to cart'),
(586, 'M_SHOP_NAME', 'Shop Name', 'Shop Name'),
(587, 'M_SHOP_NAME_VALIDATION', 'You can only have letters and numbers in your shop name.', 'You can only have letters and numbers in your shop name.'),
(588, 'M_SHOP_SECTION_1', 'Section 1: Info & Appearance (Optional)', 'Section 1: Info & Appearance (Optional)'),
(589, 'M_SHOP_TITLE', 'Shop Title', 'Shop Title'),
(590, 'M_DESCRIPTION', 'Description', 'Description'),
(591, 'M_SELECT_STATE', 'SELECT STATE', 'SELECT STATE'),
(592, 'M_SHOP_CITY', 'Shop City', 'Shop City'),
(593, 'M_SHOP_LOGO', 'Shop Logo', 'Shop Logo'),
(594, 'M_SHOP_BANNER', 'Shop Banner', 'Shop Banner'),
(595, 'M_SHOP_BANNER_EXTENSIONS', 'Upload a .jpg, .gif or .png. This will be displayed in 1200 x 360 on your store.', 'Upload a .jpg, .gif or .png. This will be displayed in 1200 x 360 on your store.'),
(596, 'M_ANNOUNCEMENT', 'Announcement', 'Announcement'),
(597, 'M_MESSAGE_TO_BUYERS', 'Message to Buyers', 'Message to Buyers'),
(598, 'M_MESSAGE_TO_BUYERS_TEXT', 'We include this message on receipt pages and in the email buyers receive when they purchase from your shop.', 'We include this message on receipt pages and in the email buyers receive when they purchase from your shop.'),
(599, 'M_DISPLAY_STATUS', 'Display Status', 'Display Status'),
(600, 'M_DISPLAY_STATUS_TEXT', 'Keep it "Off" to hide your shop & products listing from display of the site.', 'Keep it "Off" to hide your shop & products listing from display of the site.'),
(601, 'M_SHOP_SECTION_2', 'Section 2: Shop Policies (Optional)', 'Section 2: Shop Policies (Optional)'),
(602, 'M_WELCOME_MESSAGE', 'Welcome Message', 'Welcome Message'),
(603, 'M_WELCOME_MESSAGE_TEXT', 'General information, philosophy, etc.', 'General information, philosophy, etc.'),
(604, 'M_DELIVERY_POLICY', 'Delivery Policy', 'Delivery Policy'),
(605, 'M_DELIVERY_POLICY_TEXT', 'Delivery methods, upgrades, deadlines, insurance, confirmation, international customs, etc.', 'Delivery methods, upgrades, deadlines, insurance, confirmation, international customs, etc.'),
(606, 'M_ADDITIONAL_INFORMATION', 'Additional Information', 'Additional Information'),
(607, 'M_ADDITIONAL_INFORMATION_TEXT', 'Additional policies, FAQs, custom orders, wholesale & consignment, guarantees, etc.', 'Additional policies, FAQs, custom orders, wholesale & consignment, guarantees, etc.'),
(608, 'M_SELLER_INFORMATION', 'SELLER INFORMATION', 'SELLER INFORMATION'),
(609, 'M_SELLER_INFORMATION_TEXT', 'Some countries require seller information such as your name, physical address, contact email address and, where applicable, tax identification number.', 'Some countries require seller information such as your name, physical address, contact email address and, where applicable, tax identification number.'),
(610, 'M_YOUR_ACTION_PERFORMED_SUCCESSFULLY', 'Your action performed successfully.', 'Your action performed successfully.'),
(611, 'M_PROD_SECTION_1', 'Section 1: Basic Information about Product.', 'Section 1: Basic Information about Product.'),
(612, 'M_PROD_SECTION_2', 'Section 2: Shipping Information about Product.', 'Section 2: Shipping Information about Product.'),
(613, 'M_PROD_SECTION_3', 'Section 3: Variant Information about Product.', 'Section 3: Variant Information about Product.'),
(614, 'M_PROD_SECTION_4', 'Section 4: Confirm and Publish Product.', 'Section 4: Confirm and Publish Product.'),
(615, 'M_PUBLISH', 'Publish', 'Publish'),
(616, 'M_SKIP', 'Skip', 'Skip'),
(617, 'M_PRODUCT_SHOP', 'Product Shop', 'Product Shop'),
(618, 'M_PRODUCT_TITLE', 'Product Title', 'Product Title'),
(619, 'M_SMALL_DESCRIPTION', 'Small Description', 'Small Description'),
(620, 'M_TAGS_COMMA_SEPARATED', 'Tags (Comma separated)', 'Tags (Comma separated)'),
(621, 'M_PRODUCT_CONDITION', 'Product Condition', 'Product Condition'),
(622, 'M_CONDITION_LEVEL', 'Condition Level', 'Condition Level'),
(623, 'M_SELLING_PRICE', 'Selling Price', 'Selling Price'),
(624, 'M_PRODUCT_CATEGORY', 'Product Category', 'Product Category'),
(625, 'M_PRODUCT_BRAND_MANUFACTURER', 'Product Brand/Manufacturer', 'Product Brand/Manufacturer'),
(626, 'M_BRAND_MANUFACTURER', 'Brand/Manufacturer', 'Brand/Manufacturer'),
(627, 'M_QUANTITY', 'Quantity', 'Quantity'),
(628, 'M_PHOTOS', 'Photo(s)', 'Photo(s)'),
(629, 'MAX_5_IMAGES', 'Max 5 Images can be uploaded.', 'Max 5 Images can be uploaded.'),
(632, 'M_INVENTORY', 'Inventory', 'Inventory'),
(633, 'M_THRESHOLD_LEVEL', 'Threshold Level', 'Threshold Level'),
(634, 'M_THRESHOLD_LEVEL_MESSAGE', 'Note: You will receive email notification when product stock qty is below or equal to threshold level and Inventory tracking is enabled.', 'Note: You will receive email notification when product stock qty is below or equal to threshold level and Inventory tracking is enabled.'),
(635, 'M_FEATURED_PRODUCT', 'Featured Product', 'Featured Product'),
(636, 'M_FEATURED_PRODUCT_MESSAGE', 'Featured Products will get priority.', 'Featured Products will get priority.'),
(637, 'M_YOUTUBE_VIDEO', 'Youtube Video', 'Youtube Video'),
(638, 'M_YOUTUBE_VIDEO_MESSAGE', 'Please enter the youtube video URL here.', 'Please enter the youtube video URL here.'),
(639, 'M_SHIP_FREE', 'Ship Free', 'Ship Free'),
(640, 'M_SHIP_FREE_MESSAGE', 'Shipping Prices will not considered for any location for ship free products.', 'Shipping Prices will not considered for any location for ship free products.'),
(641, 'M_SHIPS_FROM', 'Ships From', 'Ships From'),
(642, 'M_SELECT_PROPERTY', 'Select Property', 'Select Property'),
(643, 'M_NEXT', 'Next', 'Next'),
(644, 'M_UNABLE_ADD_PRODUCT', 'Unable to add product, please try after some time.', 'Unable to add product, please try after some time.'),
(660, 'L_PROCESSING_TIME', 'Processing Time', 'Processing Time'),
(661, 'L_SELECT', 'Select', 'Select'),
(662, 'L_SHIPPING_COST', 'Shipping Cost', 'Shipping Cost');
INSERT INTO `tbl_language_labels` (`label_id`, `label_key`, `label_caption_en`, `label_caption_es`) VALUES
(663, 'L_ADDITIONAL_SHIPPING_COST', 'Additional Shipping Cost', 'Additional Shipping Cost'),
(664, 'L_PROVIDER', 'Provider', 'Provider'),
(665, 'L_EVERYWHERE_SHIPPING_COST', 'Everywhere Shipping Cost', 'Everywhere Shipping Cost'),
(666, 'L_EVERYWHERE_ADDITIONAL_SHIPPING_COST', 'Everywhere Additional Shipping Cost', 'Everywhere Additional Shipping Cost'),
(667, 'L_SHIPS_TO', 'Ships To', 'Ships To'),
(668, 'L_SHIPPING_COMPANY', 'Shipping Company', 'Shipping Company'),
(669, 'L_EACH_ADDITIONAL_ITEM', 'Each Additional Item', 'Each Additional Item'),
(670, 'L_ADD_LOCATION', 'Add Location', 'Add Location'),
(671, 'M_FROM', 'From', 'From'),
(672, 'M_TO', 'To', 'To'),
(673, 'M_DATE_FROM', 'Date From', 'Date From'),
(674, 'M_DATE_TO', 'Date To', 'Date To'),
(675, 'M_CLEAR_SEARCH', 'Clear Search', 'Clear Search'),
(676, 'L_AMOUNT_TO_BE_WITHDRAWN', 'Amount to be Withdrawn', 'Amount to be Withdrawn'),
(677, 'L_WITHDRAWAL_REQUEST_GREATER', 'Your withdrawal request amount is greater than current withdrawable balance.', 'Your withdrawal request amount is greater than current withdrawable balance.'),
(678, 'L_WITHDRAWAL_REQUEST_LESS', 'Your withdrawal request amount is less than minimum allowed %s.', 'Your withdrawal request amount is less than minimum allowed %s.'),
(679, 'L_FUNDS_WITHDRAWN', 'Funds Withdrawn', 'Funds Withdrawn'),
(680, 'L_REQUEST_ID', 'Request ID', 'Request ID'),
(681, 'L_WITHDRAWAL_REQUEST_SUCCESSFULLY', 'Your withdrawal request has been successfully placed and sent for approval.', 'Your withdrawal request has been successfully placed and sent for approval.'),
(682, 'L_REPUBLISHED_SUCCESSFULLY', 'Re-Published Successfully', 'Re-Published Successfully'),
(683, 'L_FINALIZED_SUCCESSFULLY', 'Finalized Successfully', 'Finalized Successfully'),
(684, 'L_REASON_CANCELLATION', 'Please enter reason for cancellation', 'Please enter reason for cancellation'),
(685, 'L_COMBINATION_SELECTED', 'Combination Selected', 'Combination Selected'),
(686, 'L_ORDER_NUMBER_COMMENTS', 'Order Number %s  Cancelled. Amount Refunded.', 'Order Number %s  Cancelled. Amount Refunded.'),
(687, 'L_COMMENTS_FOR_ORDER', 'Comments for your order are', 'Comments for your order are'),
(688, 'L_ORDER_CANCELLED', 'Order has been cancelled successfully.', 'Order has been cancelled successfully.'),
(689, 'M_UNABLE_ADD_CLASSIFIED', 'Unable to add classified, please try after some time.', 'Unable to add classified, please try after some time.'),
(690, 'L_ERROR', 'Error', 'Error'),
(691, 'L_CLASSIFIED_TITLE', 'Classified Title', 'Classified Title'),
(692, 'L_SMALL_DESCRIPTION', 'Small Description', 'Small Description'),
(693, 'L_MAX_9_IMAGES', 'Max 9 Images can be uploaded.', 'Max 9 Images can be uploaded.'),
(695, 'M_LONG_DESCRIPTION', 'Long Description', 'Long Description'),
(696, 'M_NAME_CARD', 'Name on card', 'Name on card'),
(697, 'M_CREDIT_CARD_NUMBER', 'Credit Card Number', 'Credit Card Number'),
(698, 'M_EXP_DATE', 'Exp Date', 'Exp Date'),
(699, 'M_CARD_CVV', 'Card CVV', 'Card CVV'),
(700, 'M_LISTING_FEES', 'Listing Fees', 'Listing Fees'),
(701, 'M_PAYMENT_INFORMATION', 'Payment Information', 'Payment Information'),
(702, 'L_ERROR_CLASSIFIED_FEES', 'Error: Classified listing fees is not defined.', 'Error: Classified listing fees is not defined.'),
(703, 'M_YOUR_MESSAGE_SENT_EMAIL_NOTIFICATION', 'Your message has been sent, you will receive an email notification when vendor responds to your question(s).', 'Your message has been sent, you will receive an email notification when vendor responds to your question(s).'),
(704, 'M_CONTACT_INFO_NOT_SHARED', 'Your contact information will not be shared with the merchant.', 'Your contact information will not be shared with the merchant.'),
(705, 'M_YOUR_MESSAGE', 'Your Message', 'Your Message'),
(706, 'M_ABOUT_PRODUCT', 'About Product', 'About Product'),
(707, 'M_ABOUT_ORDER', 'About Order', 'About Order'),
(708, 'F_USERNAME_AVAILABLE', '''%s''  is available', '''%s''  is available'),
(709, 'F_USERNAME_NOT_AVAILABLE', 'Sorry, ''%s''  is not-available', 'Sorry, ''%s''  is not-available'),
(710, 'L_SOME_ERROR_AFTER_SOME', 'There is some error, please try after some time.', 'There is some error, please try after some time.'),
(711, 'M_BANK_ACCOUNT_DETAILS', 'Bank account details', 'Bank account details'),
(712, 'L_PRODUCT_REMOVED', 'This product is removed from the system, so not available for purchase.', 'This product is removed from the system, so not available for purchase.'),
(713, 'L_PRODUCT_NOT_BUYING', 'This product is not available for buying currently, please try after few days.', 'This product is not available for buying currently, please try after few days.'),
(714, 'M_PRODUCT_CONTAINS_OPTIONS', 'This Product contains options, please select product options as well.', 'This Product contains options, please select product options as well.'),
(715, 'M_ITEM_UPDATED_CART', 'Item updated to cart successfully. Please %s to view cart.', 'Item updated to cart successfully. Please %s to view cart.'),
(716, 'M_ITEM_ADDED_CART', 'Item added to cart successfully. Please %s to view cart.', 'Item added to cart successfully. Please %s to view cart.'),
(717, 'M_INVENTORY_NOT_ENOUGH', 'The number of products in the inventory is not enough for your order. The quantity of the product  (%s) has been changed in your cart.', 'The number of products in the inventory is not enough for your order. The quantity of the product  (%s) has been changed in your cart.'),
(718, 'M_YOUR_CART_EMPTY', 'It seems your cart is empty, please refresh this page to continue shopping.', 'It seems your cart is empty, please refresh this page to continue shopping.'),
(719, 'M_SELECT_SHIPPING_PRODUCT', 'Please select shipping corresponding to product (%s). If this item is not available in selected state than please remove this item from your cart and proceed.', 'Please select shipping corresponding to product (%s). If this item is not available in selected state than please remove this item from your cart and proceed.'),
(720, 'M_CART_STOCK_CHANGED', 'It seems cart stock qty has been changed, please refresh and place order with updated Qty.', 'It seems cart stock qty has been changed, please refresh and place order with updated Qty.'),
(721, 'M_HOME_DELIVERY', 'Home Delivery', 'Home Delivery'),
(722, 'L_ORDER_BILLING_DETAILS', 'Order Billing Details', 'Order Billing Details'),
(723, 'L_ORDER_SHIPPING_DETAILS', 'Order Shipping Details', 'Order Shipping Details'),
(724, 'L_CREDITED', 'credited', 'credited'),
(725, 'L_DEBITED', 'debited', 'debited'),
(726, 'L_BROWSE_BY_CATEGORIES', 'Browse by categories', 'Browse by categories'),
(727, 'M_ADDED', 'Added', 'Added'),
(728, 'L_ERROR_HEADING', 'The following errors occurred:', 'The following errors occurred:'),
(729, 'F_REALLY_WANT_GROUP', 'Do you really want to delete this Group?', 'Do you really want to delete this Group?'),
(730, 'F_REMOVING_GROUP', 'Removing this group and resetting stock...', 'Removing this group and resetting stock...'),
(731, 'F_PLEASE_SELECT_ATLEAST', 'Please select at least one variant. You can use Remove Group if you do not want to use any variant.', 'Please select at least one variant. You can use Remove Group if you do not want to use any variant.'),
(732, 'F_SELECT_OPTION_GROUP', 'Select Option Group', 'Select Option Group'),
(733, 'M_GROUP', 'Group', 'Group'),
(734, 'L_IN_STOCK', 'In Stock', 'In Stock'),
(735, 'L_NOT_IN_STOCK', 'Not In Stock', 'Not In Stock'),
(736, 'L_INVENTORY_UPDATED', 'Inventory Updated', 'Inventory Updated'),
(737, 'L_CHOOSE_COMBINATION', 'Choose Combination from above options!', 'Choose Combination from above options!'),
(738, 'L_SELECT_VARIANT', 'Please select your variant(s) from above!', 'Please select your variant(s) from above!'),
(739, 'L_MY_CREDITS', 'My Credits', 'My Credits'),
(740, 'M_YOUR_COMMENTS', 'Your Comments', 'Your Comments'),
(741, 'M_STATUS', 'Status', 'Status'),
(742, 'M_TRACKING_NUMBER', 'Tracking Number', 'Tracking Number'),
(743, 'M_NOTIFY_CUSTOMER', 'Notify Customer', 'Notify Customer'),
(744, 'M_APPEND_COMMENTS', 'Append Comments', 'Append Comments'),
(745, 'M_UPDATE', 'Update', 'Update'),
(746, 'M_PRODUCT', 'Product', 'Product'),
(747, 'F_SELECT_STATE', 'Select State', 'Select State'),
(748, 'F_SELECT_COUNTRY', 'Select Country', 'Select Country'),
(749, 'F_CVV', 'CVV', 'CVV'),
(750, 'F_MONTH', 'Month', 'Month'),
(751, 'F_YEAR', 'Year', 'Year'),
(752, 'F_BILLING_SHIPPING_SAME', 'Billing Shipping Same', 'Billing Shipping Same'),
(753, 'M_SHIPMENT_INFORMATION', 'Shipment Information', 'Shipment Information'),
(754, 'M_COMMENTS_FOR_YOUR_ORDER', 'Comments for your order', 'Comments for your order'),
(755, 'L_SELECT_COUNTRY', 'Select Country', 'Select Country'),
(756, 'L_MODEL', 'Model', 'Model'),
(757, 'L_ALL_PRODUCTS', 'All Products', 'All Products'),
(758, 'L_AVERAGE_ITEM_REVIEW', 'Average Item Review', 'Average Item Review'),
(759, 'L_OR', 'or', 'or'),
(760, 'L_REGISTER', 'Register', 'Register'),
(761, 'M_REMOVED', 'Removed', 'Removed'),
(762, 'M_RECORD_DELETED', 'Record deleted', 'Record deleted'),
(763, 'L_ARE_YOU_SURE_DELETE', 'Are you sure you want to delete this record?', 'Are you sure you want to delete this record?'),
(764, 'L_ARE_YOU_SURE_FINALIZE', 'Are you sure you want to finalize this record?', 'Are you sure you want to finalize this record?'),
(765, 'L_RETURN_ADDRESS', 'Return Address', 'Return Address'),
(766, 'L_VENDOR_RETURN_ADDRESS', 'Vendor Return Address', 'Vendor Return Address'),
(767, 'L_RETURN_INFORMATION', 'Return Information', 'Return Information'),
(768, 'L_AVAILABLE_CREDITS', 'Available Credits', 'Available Credits'),
(769, 'L_ORDER_PLACED_NUMBER', 'Order Placed %s', 'Order Placed %s'),
(770, 'M_DISCOUNT_COUPON', 'Discount Coupon', 'Discount Coupon'),
(771, 'M_APPLY_COUPON', 'Apply Coupon', 'Apply Coupon'),
(772, 'L_DISCOUNT', 'Qty Discount', 'Qty Discount'),
(773, 'L_COUPON', 'Coupon', 'Coupon'),
(774, 'M_SHIPMENT_INFORMATION', 'Shipment Information', 'Shipment Information'),
(775, 'M_COMMENTS_FOR_YOUR_ORDER', 'Comments for your order', 'Comments for your order'),
(776, 'L_LOGIN_NOW', 'LOGIN NOW', 'LOGIN NOW'),
(777, 'L_ORDER_PARTICULARS', 'Order Particulars', 'Order Particulars'),
(778, 'M_RETURN_EXCHANGE_DETAILS', 'Return/Exchange Details', 'Return/Exchange Details'),
(779, 'M_ERROR_DETAILS_NOT_SAVED', 'Details not saved, please try again.', 'Details not saved, please try again.'),
(780, 'L_SUPPLIER', 'Supplier', 'Supplier'),
(781, 'L_BUYER', 'Buyer', 'Buyer'),
(782, 'L_SHOP_INFORMATION', 'Shop Information', 'Shop Information'),
(783, 'M_SEARCH_HERE', 'Search Here', 'Search Here'),
(784, 'M_WITHDRAWAL_ACCOUNT_DETAILS', 'Withdrawal account details', 'Withdrawal account details'),
(785, 'L_INV_NUMBER_DATE', 'Inv Number & Date', 'Inv Number & Date'),
(786, 'M_CLEAR', 'Clear', 'Clear'),
(787, 'L_RETURN_REQUEST', 'Return Request', 'Return Request'),
(789, 'L_RETURN_REFUND_CANNOT_PLACED', 'This order is not yet available for refund. Usually refund is allowed only on "Shipped" and "Delivered" orders only.', 'This order is not yet available for refund. Usually refund is allowed only on "Shipped" and "Delivered" orders only.'),
(790, 'F_SEND_A_MESSAGE', 'Send a message', 'Send a message'),
(791, 'L_FEEDBACK_CAN_BE_PLACED_COMPLETED', 'Feedback can be placed on <i>"delivered"</i> and <i>"completed"</i> orders only.', 'Feedback can be placed on <i>"delivered"</i> and <i>"completed"</i> orders only.'),
(792, 'L_BACK_TO_MY_PRODUCTS', 'Back to my products', 'Back to my products'),
(793, 'M_ERROR_INVALID_EMAIL_USERNAME', 'Email address or username entered is not registered with us.', 'Email address or username entered is not registered with us.'),
(794, 'M_MODEL', 'Model', 'Model'),
(795, 'M_SKU', 'SKU', 'SKU'),
(796, 'M_PRODUCT_DESCRIPTION', 'Product Description', 'Product Description'),
(797, 'M_META_TAG_TITLE', 'Meta Tag Title', 'Meta Tag Title'),
(798, 'M_META_TAG_DESCRIPTION', 'Meta Tag Description', 'Meta Tag Description'),
(799, 'M_META_TAG_KEYWORDS', 'Meta Tag Keywords', 'Meta Tag Keywords'),
(800, 'M_TAGS', 'Tags', 'Tags'),
(801, 'M_SUBTRACT_STOCK', 'Subtract Stock', 'Subtract Stock'),
(802, 'M_REQUIRES_SHIPPING', 'Requires Shipping', 'Requires Shipping'),
(803, 'M_SEO_KEYWORDS', 'SEO Keywords', 'SEO Keywords'),
(804, 'M_TRACK_INVENTORY', 'Track Inventory', 'Track Inventory'),
(805, 'M_ALERT_STOCK_LEVEL', 'Alert Stock Level', 'Alert Stock Level'),
(806, 'M_DATE_AVAILABLE', 'Date Available', 'Date Available'),
(807, 'M_DIMENSIONS_LWH', 'Dimensions (L x W x H)', 'Dimensions (L x W x H)'),
(808, 'M_LENGTH_CLASS', 'Length Class', 'Length Class'),
(809, 'M_WEIGHT', 'Weight', 'Weight'),
(810, 'M_WEIGHT_CLASS', 'Weight Class', 'Weight Class'),
(811, 'M_SORT_ORDER', 'Sort Order', 'Sort Order'),
(812, 'M_PRODUCT_FILTERS', 'Product Filters', 'Product Filters'),
(813, 'M_ATTRIBUTE', 'Attribute', 'Attribute'),
(814, 'M_TEXT', 'Text', 'Text'),
(815, 'M_ADD_ATTRIBUTE', 'Add Attribute', 'Add Attribute'),
(816, 'M_OPTION', 'Option', 'Option'),
(817, 'M_SHIPPING_COUNTRY', 'Shipping Country', 'Shipping Country'),
(818, 'M_FREE_SHIPPING', 'Free Shipping', 'Free Shipping'),
(819, 'M_DEFAULT_SHIPPING_CHARGES', 'Default Shipping Charges', 'Default Shipping Charges'),
(820, 'M_SHIPS_TO', 'Ships To', 'Ships To'),
(821, 'M_SHIPPING_COMPANY', 'Shipping Company', 'Shipping Company'),
(822, 'M_PROCESSING_TIME', 'Processing Time', 'Processing Time'),
(823, 'M_COST', 'Cost', 'Cost'),
(824, 'M_EACH_ADDITIONAL_ITEM', 'Each Additional Item', 'Each Additional Item'),
(825, 'M_SHIPPING', 'Shipping', 'Shipping'),
(826, 'M_PRIORITY', 'Priority', 'Priority'),
(827, 'M_PRICE', 'Price', 'Price'),
(828, 'M_DATE_START', 'Date Start', 'Date Start'),
(829, 'M_DATE_END', 'Date End', 'Date End'),
(830, 'M_ADD_DISCOUNT', 'Add Discount', 'Add Discount'),
(831, 'M_ADD_SPECIAL', 'Add Special', 'Add Special'),
(832, 'M_REMOVE', 'Remove', 'Remove'),
(833, 'M_COMPANY', 'Company', 'Company'),
(834, 'M_DISCOUNTED_PRICE', 'Discounted Price', 'Discounted Price'),
(835, 'M_SPECIAL_PRICE', 'Price', 'Price'),
(836, 'M_YES', 'Yes', 'Yes'),
(837, 'M_NO', 'No', 'No'),
(838, 'M_OPTION_VALUE', 'Option Value', 'Option Value'),
(839, 'M_SUBTRACT', 'Subtract', 'Subtract'),
(840, 'L_SEND_MESSAGE_SHOP_OWNER', 'Send message to shop owner', 'Send message to shop owner'),
(841, 'L_BROWSE_BY_BRANDS', 'Browse by Brands', 'Browse by Brands'),
(842, 'L_BACK_TO_PRODUCT_PAGE', 'Back to product page', 'Back to product page'),
(843, 'L_SHOWING', 'SHOWING', 'SHOWING'),
(844, 'F_SEARCH_FOR_ITEM', 'Search for item', 'Search for item'),
(845, 'L_MARK_FAVORITE', 'Mark Favorite', 'Mark Favorite'),
(846, 'L_SHOP_FEATURED_STORES', 'Shop Featured Stores', 'Shop Featured Stores'),
(847, 'M_REQUIRED', 'Required', 'Required'),
(848, 'M_ADD', 'Add', 'Add'),
(849, 'M_ADD_TO_CART', 'Add to Cart', 'Add to Cart'),
(850, 'M_LABEL_REQUIRED', '%s Required', '%s Required'),
(851, 'M_PLEASE_SELECT', '-- Please Select --', '-- Please Select --'),
(852, 'M_ERROR_FILETYPE', 'Invalid file type!', 'Invalid file type!'),
(854, 'M_TEXT_UPLOAD', 'Your file was successfully uploaded!', 'Your file was successfully uploaded!'),
(855, 'M_Error_Filename', 'Filename must be between 3 and 64 characters!', 'Filename must be between 3 and 64 characters!'),
(856, 'M_Error_Upload_1', 'Warning: The uploaded file exceeds the upload_max_filesize directive in php.ini!', 'Warning: The uploaded file exceeds the upload_max_filesize directive in php.ini!'),
(857, 'M_Error_Upload_2', 'Warning: The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form!', 'Warning: The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form!'),
(858, 'M_Error_Upload_3', 'Warning: The uploaded file was only partially uploaded!', 'Warning: The uploaded file was only partially uploaded!'),
(859, 'M_Error_Upload_4', 'Warning: No file was uploaded!', 'Warning: No file was uploaded!'),
(860, 'M_Error_Upload_6', 'Warning: Missing a temporary folder!', 'Warning: Missing a temporary folder!'),
(861, 'M_Error_Upload_7', 'Warning: Failed to write file to disk!', 'Warning: Failed to write file to disk!'),
(862, 'M_Error_Upload_8', 'Warning: File upload stopped by extension!', 'Warning: File upload stopped by extension!'),
(863, 'M_Error_Upload_999', 'Warning: No error code available!', 'Warning: No error code available!'),
(864, 'M_UPLOAD_FILE', 'Upload file', 'Upload file'),
(865, 'M_ERROR_UPLOAD', 'Error: Required file upload or may be you are trying with large file in size, please try with smaller file in size.', 'Error: Required file upload or may be you are trying with large file in size, please try with smaller file in size.'),
(866, 'M_SUCCESS_CART_ADD', 'Success: You have added <a href="%s">%s</a> to your <a href="%s">shopping cart</a>!', 'Success: You have added <a href="%s">%s</a> to your <a href="%s">shopping cart</a>!'),
(868, 'M_CART_ITEM_REMOVED', 'cart item removed', 'cart item removed'),
(869, 'M_ERROR_STOCK', 'Products marked with *** are not available in the desired quantity or not in stock!', 'Products marked with *** are not available in the desired quantity or not in stock!'),
(871, 'M_CART_MODIFIED', 'Success: You have modified your shopping cart!', 'Success: You have modified your shopping cart!'),
(872, 'M_CART_SHIPPING_ADDRESS_MODIFIED', 'Success: You have modified your cart shipping address !', 'Success: You have modified your cart shipping address !'),
(873, 'M_SHIPPING_INFO_REQUIRED', 'Shipping info required for - <b>%s</b> !', 'Shipping info required for - <b>%s</b> !'),
(874, 'M_PROUCT_SHIPPING_INFO_CART_UPDATED', 'Success: You have modified shipping option(s) corresponding to product(s) in your shopping cart !', 'Success: You have modified shipping option(s) corresponding to product(s) in your shopping cart !'),
(877, 'M_ERROR_SHIPPING_OPTION', 'Shipping option is not yet selected corresponding to some of the product in your cart!', 'Shipping option is not yet selected corresponding to some of the product in your cart!'),
(878, 'M_PLEASE_SELECT_DELIVERY_ADDRESS', '<b>Delivery Address:</b> Please add or select a delivery address from below.', '<b>Delivery Address:</b> Please add or select a delivery address from below.'),
(879, 'M_PLEASE_ADD_DELIVERY_ADDRESS', '<b>Delivery Address:</b> Please add a  new address.', '<b>Delivery Address:</b> Please add a  new address.'),
(880, 'M_ERROR_SHIPPING_ADDRESS', 'Please select a delivery address from below.', 'Please select a delivery address from below.'),
(881, 'M_PLEASE_SELECT_BILLING_ADDRESS', '<b>Billing Address:</b> Please add or select a billing address from below.', '<b>Billing Address:</b> Please add or select a billing address from below.'),
(882, 'M_PLEASE_ADD_BILLING_ADDRESS', '<b>Billing Address:</b> Please add a  new address.', '<b>Billing Address:</b> Please add a  new address.'),
(883, 'M_CART_BILLING_ADDRESS_MODIFIED', 'Success: You have modified your cart billing address !', 'Success: You have modified your cart billing address !'),
(884, 'M_ERROR_BILLING_ADDRESS', 'Please select a billing address from below.', 'Please select a billing address from below.'),
(885, 'M_CART_DISCOUNT_COUPON_APPLIED', 'Success: Discount has been applied!', 'Success: Discount has been applied!'),
(886, 'M_CUSTOMER_SUCCESS_ORDER', '<p>Your order has been successfully processed!</p><p>You can view your order history by going to the <a href="%s">my account</a> page and by clicking on <a href="%s">history</a>.</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p><p>Thanks for shopping with us online!', '<p>Your order has been successfully processed!</p><p>You can view your order history by going to the <a href="%s">my account</a> page and by clicking on <a href="%s">history</a>.</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p><p>Thanks for shopping with us online!'),
(887, 'M_CUSTOMER_FAILURE_ORDER', '<p>There was a problem processing your payment and the order did not complete.</p>\r\n<p>Possible reasons are: </p>\r\n<ul>\r\n  <li>Insufficient funds</li>\r\n  <li>Verification failed</li>\r\n</ul>\r\n<p>Please try to order again using a different payment method.</p>\r\n<p>If the problem persists please <a href="%s">contact us</a> with the details of the order you are trying to place.</p>', '<p>There was a problem processing your payment and the order did not complete.</p>\r\n<p>Possible reasons are: </p>\r\n<ul>\r\n  <li>Insufficient funds</li>\r\n  <li>Verification failed</li>\r\n</ul>\r\n<p>Please try to order again using a different payment method.</p>\r\n<p>If the problem persists please <a href="%s">contact us</a> with the details of the order you are trying to place.</p>'),
(892, 'M_PAYMENT_INSTRUCTIONS', '<b>Payment Instructions</b>:', '<b>Payment Instructions</b>:'),
(893, 'M_PAYMENT_NOTE', 'Your order will not ship until we receive payment.', 'Your order will not ship until we receive payment.'),
(894, 'L_CREDITS_USED', 'Credits Used', 'Credits Used'),
(895, 'L_PAID_AMOUNT', 'Paid Amount', 'Paid Amount'),
(896, 'L_PAID', 'Paid', 'Paid'),
(898, 'F_YOUR_E-MAIL_ADDRESS', 'Your e-mail address', 'Your e-mail address'),
(899, 'M_NEWSLETTER_SUBSCRIPTION_VALID_EMAIL', 'Newsletter subscription valid email', 'Newsletter subscription valid email'),
(900, 'M_PLEASE_SELECT_SHIPPING_ADDRESS', '<b>Shipping Address:</b> Please add or select a shipping address from below.', '<b>Shipping Address:</b> Please add or select a shipping address from below.'),
(901, 'M_PLEASE_ADD_SHIPPING_ADDRESS', '<b>Shipping Address:</b> Please add a new address.', '<b>Shipping Address:</b> Please add a new address.'),
(902, 'CONF_MIN_WITHDRAW_LIMIT', 'MIN WITHDRAW LIMIT', 'MIN WITHDRAW LIMIT'),
(903, 'L_WITHDRAWAL_REQUEST_MINIMUM_BALANCE_LESS', 'Your account balance has to be greater than %s to place a withdrawal request.', 'Your account balance has to be greater than %s to place a withdrawal request.'),
(907, 'L_DEFAULT_ADDRESS', 'Default Address', 'Default Address'),
(908, 'L_PURCHASED', 'Purchased', 'Purchased'),
(909, 'M_YOUR_PASSWORD_CHANGED_LOGIN', 'Your password has been successfully changed. Please login with your new password.', 'Your password has been successfully changed. Please login with your new password.'),
(910, 'M_INVALID_ORDER_PAID_CANCELLED', 'Warning: This is an invalid order.', 'Warning: This is an invalid order.'),
(911, 'F_FREE_SHIPPING_RETURN_ALL_ORDERS', 'FREE SHIPPING & RETURNS ON ALL ORDERS', 'FREE SHIPPING & RETURNS ON ALL ORDERS'),
(912, 'M_SHIPPING_CART', 'Shopping Cart', 'Shopping Cart'),
(913, 'M_CHECKOUT', 'Checkout', 'Checkout'),
(914, 'M_OR', 'or', 'or'),
(915, 'M_SIGN_UP', 'SIGN UP', 'SIGN UP'),
(916, 'M_CART', 'Cart', 'Cart'),
(917, 'M_MORE', 'more', 'more'),
(918, 'M_VIEW_ALL_CATEGORIES', 'View All Categories', 'View All Categories'),
(919, 'M_DASHBOARD', 'DASHBOARD', 'DASHBOARD'),
(921, 'M_VIEW_YOUR_SHOP', 'View Your Shop', 'View Your Shop'),
(922, 'M_LIST_YOUR_PRODUCT', 'List Your Product', 'List Your Product'),
(923, 'M_LOG_OUT', 'LOG OUT', 'LOG OUT'),
(924, 'M_NEED_HELP', 'Need Help', 'Need Help'),
(925, 'M_CONTACT_US', 'Contact Us', 'Contact Us'),
(926, 'M_CALL_US', 'Call us', 'Call us'),
(927, 'M_TRY_OUR', 'Try Our', 'Try Our'),
(928, 'M_MOBILE_APP', 'Mobile App', 'Mobile App'),
(929, 'M_DOWNLOAD_NOW', 'Download Now', 'Download Now'),
(930, 'M_KEEP_IN_TOUCH', 'Keep in Touch', 'Keep in Touch'),
(931, 'M_COPYRIGHT_TEXT', 'Copyright Â© %s %s All Rights Reserved.', 'Copyright Â© %s %s All Rights Reserved.'),
(932, 'M_SUBSCRIBE_TO_NEWSLETTER', 'Subscribe to newsletter', 'Subscribe to newsletter'),
(933, 'M_SUBSCRIBE_NEWSLETTER_TEXT', 'Sign up & get shopping vouchers & stay updated about <strong>latest styles</strong> and <strong>exclusive promotions</strong>', 'Sign up & get shopping vouchers & stay updated about <strong>latest styles</strong> and <strong>exclusive promotions</strong>'),
(934, 'M_NEED', 'Need', 'Need'),
(935, 'M_ASSISTANCE', 'ASSISTANCE', 'ASSISTANCE'),
(936, 'M_CONTACT', 'Contact', 'Contact'),
(937, 'M_US', 'us', 'us'),
(938, 'M_TOP_BRANDS', 'Top Brands', 'Top Brands'),
(939, 'M_VIEW_ALL', 'View all', 'View all'),
(940, 'M_RECENT_ACTIVITY', 'Recent Activity', 'Recent Activity'),
(941, 'M_SALES', 'Sales', 'Sales'),
(942, 'M_MESSAGES', 'Messages', 'Messages'),
(943, 'M_MY_CREDITS', 'My Credits', 'My Credits'),
(944, 'M_MY_ORDERS', 'My Orders', 'My Orders'),
(945, 'M_MY_PUBLICATIONS', 'My Publications', 'My Publications'),
(946, 'M_SHOP', 'Shop', 'Shop'),
(947, 'M_FAVORITES', 'Favorites', 'Favorites'),
(948, 'M_ADDRESSES', 'Addresses', 'Addresses'),
(949, 'M_PUBLISHED_ITEMS', 'Published Items', 'Published Items'),
(950, 'M_FAVORITE_ITEMS', 'Favorite Items', 'Favorite Items'),
(951, 'M_SHOP_SECTIONS', 'Shop Sections', 'Shop Sections'),
(952, 'M_SHOP_INFO', 'Shop Info', 'Shop Info'),
(953, 'M_OPENED_ON', 'Opened on', 'Opened on'),
(954, 'M_POLICIES', 'Policies', 'Policies'),
(955, 'M_REVIEWS', 'Review(s)', 'Review(s)'),
(956, 'M_OUT_OF', 'out of', 'out of'),
(957, 'M_PAY_USING_CREDIT_CARD', 'Pay using credit card', 'Pay using credit card'),
(958, 'M_PAY_USING_PAYPAL_STANDARD', 'Pay using PayPal Standard', 'Pay using PayPal Standard'),
(959, 'M_PAY_USING_TRASFER_BANK', 'Pay using Trasfer to Bank', 'Pay using Trasfer to Bank'),
(960, 'M_SORT', 'sort', 'sort'),
(961, 'M_YOUR_CART_IS_EMPTY', 'Your shopping cart is empty!', 'Your shopping cart is empty!'),
(962, 'M_CART_TOTAL', 'Cart Total', 'Cart Total'),
(963, 'M_TAX', 'Tax', 'Tax'),
(964, 'M_TOTAL', 'Total', 'Total'),
(965, 'M_VIEW_CART', 'View Cart', 'View Cart'),
(966, 'M_BILLING_ADDRESS', 'Billing Address', 'Billing Address'),
(967, 'M_SHIPPING_ADDRESS', 'Shipping Address', 'Shipping Address'),
(968, 'M_SUMMARY', 'Summary', 'Summary'),
(969, 'M_PAYMENT', 'Payment', 'Payment'),
(970, 'M_BILLING_HERE', 'Billing Here', 'Billing Here'),
(971, 'M_ADD_NEW_ADDRESS', 'Add New Address', 'Add New Address'),
(972, 'M_DELIVER_HERE', 'Deliver Here', 'Deliver Here'),
(973, 'M_DELIVERY_ADDRESS', 'Delivery Address', 'Delivery Address'),
(974, 'M_PRODUCT_INFORMATION', 'Product Information', 'Product Information'),
(975, 'M_SUBTOTAL', 'SubTotal', 'SubTotal'),
(976, 'M_CONTINUE', 'Continue', 'Continue'),
(977, 'M_IMAGE', 'Image', 'Image'),
(978, 'M_PRODUCT_NAME', 'Product Name', 'Product Name'),
(979, 'M_QTY', 'QTY', 'QTY'),
(980, 'M_DELIVERY_DETAILS', 'Delivery Details', 'Delivery Details'),
(981, 'M_DELIVERED_IN', 'Delivered In', 'Delivered In'),
(982, 'M_BY', 'by', 'by'),
(983, 'M_SHIPPING_COST', 'Shipping Cost', 'Shipping Cost'),
(984, 'M_WITH_ANOTHER_ITEM', 'With another item', 'With another item'),
(985, 'M_APPLY_VOUCHER', 'Apply Voucher', 'Apply Voucher'),
(986, 'M_APPLY', 'Apply', 'Apply'),
(987, 'M_MESSAGE_PRODUCT_NOT_AVAILABLE_SHIPPING', 'Message: This product is not available for shipping at your selected delivery address, please select some other delivery address if possible or else remove this product from your cart to continue.', 'Message: This product is not available for shipping at your selected delivery address, please select some other delivery address if possible or else remove this product from your cart to continue.'),
(988, 'M_TOTAL_PAYMENT_MADE', 'Total Payment to be made to %s', 'Total Payment to be made to %s'),
(989, 'M_USE_MY_WALLET_CREDITS', 'Use My Wallet Credits', 'Use My Wallet Credits'),
(990, 'M_YOUR_CURENT_BALANCE', 'Your current balance is %s', 'Your current balance is %s'),
(991, 'M_SELECT_PAYMENT_METHOD', 'Select Your Preferred Payment Option', 'Select Your Preferred Payment Option'),
(992, 'M_LOADING_PLEASE_WAIT', 'Loading, Please wait....', 'Loading, Please wait....'),
(993, 'M_AMOUNT_PAYABLE', 'Amount Payable', 'Amount Payable'),
(994, 'M_WALLET', 'Wallet', 'Wallet'),
(995, 'M_NET_PAYABLE', 'Net Payable', 'Net Payable'),
(997, 'M_PAY_USING_PAYU_INDIA', 'Pay using PayU India', 'Pay using PayU India'),
(999, 'M_ITEMS', 'item(s)', 'item(s)'),
(1000, 'L_PAYMENT_FAILED', 'Payment Failed', 'Payment Failed'),
(1001, 'L_MAINTENANCE_MODE', 'Maintenance Mode', 'Maintenance Mode'),
(1002, 'L_ENABLED', 'Enabled', 'Enabled'),
(1003, 'L_SORT', 'Sort', 'Sort'),
(1004, 'L_TOP_50_BEST_SELLING_PRODUCTS', 'Top 50 Best Selling Products', 'Top 50 Best Selling Products'),
(1005, 'L_PRODUCT_DETAILS', 'Product Details', 'Product Details'),
(1006, 'L_ORIGINAL_PRICE', 'Original Price', 'Original Price'),
(1007, 'L_ASK_A_QUESTION', 'Ask a Question', 'Ask a Question'),
(1008, 'L_PRODUCT_CODE', 'Product Code', 'Product Code'),
(1009, 'L_AVAILABLE_DATE', 'Available Date', 'Available Date'),
(1010, 'L_SOLD_BY', 'Sold By', 'Sold By'),
(1011, 'L_RATINGS', 'Ratings', 'Ratings'),
(1012, 'L_AVAILABLE_OPTIONS', 'Available options', 'Available options'),
(1013, 'L_SPECIFICATIONS', 'Specifications', 'Specifications'),
(1014, 'L_SHIPPING_FREE', 'Shipping Free', 'Shipping Free'),
(1015, 'L_OR_MORE', 'or more', 'or more'),
(1016, 'M_TOTAL_ITEMS', 'Total Items', 'Total Items'),
(1017, 'M_TOTAL_REVIEWS', 'Total Reviews', 'Total Reviews'),
(1018, 'M_FAVORITE_SHOP', 'Favorite Shop', 'Favorite Shop'),
(1019, 'M_SEND_MESSAGE', 'Send Message', 'Send Message'),
(1020, 'M_LOGIN_EXISTING_USER', 'Existing User? Login Here', 'Existing User? Login Here'),
(1021, 'M_OR_LOGIN_WITH', 'Or Login With', 'Or Login With'),
(1022, 'M_FACEBOOK', 'Facebook', 'Facebook'),
(1023, 'M_GOOGLE', 'Google', 'Google'),
(1024, 'M_NEW_USER_SIGN_UP_HERE', 'New User? Sign up Here', 'New User? Sign up Here'),
(1027, 'M_YOUR_PRODUCT_SALES', 'Your Product sales', 'Your Product sales'),
(1028, 'M_TOTAL_PURCHASES', 'Total Purchases', 'Total Purchases'),
(1029, 'M_MY_TOTAL_CREDITS', 'My Total Credits', 'My Total Credits'),
(1030, 'M_TOTAL_ORDERS', 'Total Orders', 'Total Orders'),
(1031, 'M_UNREAD_MESSAGES', 'Unread Messages', 'Unread Messages'),
(1032, 'M_CONTACT_NUMBER', 'Contact Number', 'Contact Number'),
(1033, 'M_VIEW_ALL_ADDRESSES', 'View All Addresses', 'View All Addresses'),
(1034, 'M_LATEST_MESSAGES', 'Latest Messages', 'Latest Messages'),
(1035, 'M_YOU_DO_NOT_HAVE_MESSAGES', 'You do not have any messages.', 'You do not have any messages.'),
(1036, 'M_YOU_DO_NOT_DEFAULT_ADDRESS', 'You do not have any default address currently.', 'You do not have any default address currently.'),
(1037, 'M_TOTAL_SALES', 'Total Sales', 'Total Sales'),
(1038, 'M_ACCOUNT_BALANCE', 'Account Balance', 'Account Balance'),
(1039, 'M_TOTAL_SOLD_QTY', 'Total Sold Qty', 'Total Sold Qty'),
(1040, 'M_MANAGE_ORDERS', 'Manage Orders', 'Manage Orders'),
(1041, 'M_TOTAL_PRODUCTS', 'Total Products', 'Total Products'),
(1042, 'M_SOLD', 'Sold', 'Sold'),
(1043, 'M_WITHDRAW_MONEY', 'Withdraw Money', 'Withdraw Money'),
(1044, 'M_ADD_PRODUCT_SHOP', 'Add Product in Shop', 'Add Product in Shop'),
(1045, 'M_YOUR_PRODUCT_PURCHASES', 'Your Product Purchases', 'Your Product Purchases'),
(1046, 'L_DATA', 'Data', 'Data'),
(1047, 'L_LINKS', 'Links', 'Links'),
(1048, 'L_ATTRIBUTE', 'Attribute', 'Attribute'),
(1049, 'L_OPTION', 'Options', 'Options'),
(1050, 'L_SPECIAL', 'Special Discount', 'Special Discount'),
(1051, 'M_ENTER_CREDIT_CARD_NUMBER', 'ENTER CREDIT CARD NUMBER', 'ENTER CREDIT CARD NUMBER'),
(1052, 'M_CARD_HOLDER_NAME', 'CARD HOLDER NAME', 'CARD HOLDER NAME'),
(1053, 'M_EXPIRY_DATE', 'EXPIRY DATE', 'EXPIRY DATE'),
(1054, 'M_CVV_SECURITY_CODE', 'CVV SECURITY CODE', 'CVV SECURITY CODE'),
(1055, 'M_CONFIRM_PAYMENT', 'CONFIRM PAYMENT', 'CONFIRM PAYMENT'),
(1056, 'M_EMPTY_GATEWAY_RESPONSE', 'EMPTY GATEWAY RESPONSE', 'EMPTY GATEWAY RESPONSE'),
(1057, 'M_INVALID_ACTION', 'Invalid Action', 'Invalid Action'),
(1058, 'M_PAYMENT_AMOUNT', 'Payment Amount', 'Payment Amount'),
(1059, 'M_INVALID_REQUEST', 'Error: Invalid Request !!', 'Error: Invalid Request !!'),
(1060, 'L_WARNING_PRODUCT_AVAILABLE_DATE', 'Warning: %s Product is available for buying from %s', 'Warning: %s Product is available for buying from %s'),
(1061, 'L_WARNING_COUPON_INVALID', 'Warning: Coupon is either invalid, expired or reached its usage limit!', 'Warning: Coupon is either invalid, expired or reached its usage limit!'),
(1062, 'L_WARNING_ENTER_COUPON', 'Warning: Please enter coupon code', 'Warning: Please enter coupon code'),
(1063, 'L_PLEASE_LOGIN_CONTINUE', 'Please login to continue.', 'Please login to continue.'),
(1064, 'M_SHOPPING_CART', 'SHOPPING CART', 'SHOPPING CART'),
(1065, 'M_MINIMUM_SELLING_PRICE', 'Minimum Selling Price allowed for listing is %s', 'Minimum Selling Price allowed for listing is %s'),
(1066, 'M_CONTINUE_SHOPPING', 'Continue Shopping', 'Continue Shopping'),
(1067, 'M_ORDER_PAYMENT_GATEWAY_DESCRIPTION', 'Order on %s, Invoice Number %s', 'Order on %s, Invoice Number %s'),
(1068, 'M_TEST_MODE_ENABLED', 'Test mode is enabled', 'Test mode is enabled'),
(1069, 'M_ORDER_CUSTOM_NOTE', 'We are not handling currency conversion here, you will be charged in Payment Gateway Supported Currency.', 'We are not handling currency conversion here, you will be charged in Payment Gateway Supported Currency.'),
(1071, 'M_PLEASE_ENTER_POSITIVE_INTEGER', 'Please enter positive integer qty.', 'Please enter positive integer qty.'),
(1072, 'L_SET_MAIN_IMAGE', 'Set Main Image', 'Set Main Image'),
(1073, 'L_IMAGE_SET_DEFAULT', 'Selected image is set main image successfully.', 'Selected image is set main image successfully.'),
(1074, 'M_BANK_TRANSFER_NOTE', 'Please transfer the Net Payable amount to the bank details mentioned below :', 'Please transfer the Net Payable amount to the bank details mentioned below :'),
(1075, 'M_STOCK_KEEPING_UNIT', 'Stock Keeping Unit', 'Stock Keeping Unit'),
(1076, 'M_YOU_CAN_UPLOAD_MULTIPLE_PHOTOS', 'You can upload multiple photos from here.', 'You can upload multiple photos from here.'),
(1077, 'M_SEO_KEYWORDS_TEXT', 'URL Keywords entered above becomes part of the URL, Do not use spaces, instead replace spaces with hyphen (-).', 'URL Keywords entered above becomes part of the URL, Do not use spaces, instead replace spaces with hyphen (-).'),
(1078, 'M_ALERT_STOCK_LEVEL_TEXT', 'Note: You will receive email notification when product stock qty is below or equal to threshold level and Inventory tracking is enabled.', 'Note: You will receive email notification when product stock qty is below or equal to threshold level and Inventory tracking is enabled.'),
(1079, 'M_YOUTUBE_VIDEO_TEXT', 'Please enter the youtube video URL here.', 'Please enter the youtube video URL here.'),
(1080, 'M_FREE_SHIPPING_TEXT', 'Shipping Prices will not be considered for any location for ship free products.', 'Shipping Prices will not be considered for any location for ship free products.'),
(1081, 'M_PLEASE_CREATE_SHOP', 'Please create your shop first, before listing your product(s) with us.', 'Please create your shop first, before listing your product(s) with us.'),
(1082, 'M_PLEASE_ENTER_RETURN_ADDRESS', 'Please enter return/exchange address first, before listing your product(s) with us.', 'Please enter return/exchange address first, before listing your product(s) with us.'),
(1083, 'M_SEO_KEYWORDS_IN_USE', 'SEO keyword(s) entered by you is/are already in use.', 'SEO keyword(s) entered by you is/are already in use.'),
(1084, 'M_SECTION_SHOP_SEO_INFORMATION', 'Section 3: Shop SEO Information (Optional)', 'Section 3: Shop SEO Information (Optional)'),
(1086, 'M_PASSWORD_NOT_SAVED', 'Error: Password not saved, may be you are using same password as of your old, please try with a different one!!', 'Error: Password not saved, may be you are using same password as of your old, please try with a different one!!'),
(1088, 'L_COUNT_ITEMS', '%s item(s)', '%s item(s)'),
(1089, 'L_PAYMENT_POLICY', 'Payment Policy', 'Payment Policy'),
(1090, 'L_PAYMENT_POLICY_TEXT', 'Payment methods, terms, deadlines, taxes, cancellation policy, etc.', 'Payment methods, terms, deadlines, taxes, cancellation policy, etc.'),
(1091, 'L_REFUND_POLICY', 'Refund Policy', 'Refund Policy'),
(1092, 'L_REFUND_POLICY_TEXT', 'Terms, eligible items, damages, losses, etc.', 'Terms, eligible items, damages, losses, etc.'),
(1093, 'F_USERNAME', 'Username', 'Username'),
(1094, 'M_PERSONAL_INFORMATION', 'Personal Information', 'Personal Information'),
(1095, 'M_BANK_INFORMATION', 'Bank Information', 'Bank Information'),
(1096, 'M_RETURN_ADDRESS_INFO', 'Return Address Info', 'Return Address Info'),
(1097, 'L_BANK_ACCOUNT_INFORMATION', 'Bank Account Information', 'Bank Account Information'),
(1098, 'L_BANK_ACCOUNT_INFO', 'Bank Account Info', 'Bank Account Info'),
(1099, 'M_KEYWORD', 'Keyword', 'Keyword'),
(1100, 'L_REVIEWS_OF', 'Reviews of', 'Reviews of'),
(1101, 'M_ACCOUNT_INFORMATION', 'Account Information', 'Account Information'),
(1102, 'M_OUT_OF_STOCK', 'Out of Stock', 'Out of Stock'),
(1103, 'M_PLEASE_KEEP_IMAGE_DIMENSIONS', 'Please keep image dimensions greater than 500 x 500.', 'Please keep image dimensions greater than 500 x 500.'),
(1104, 'M_READ_MORE', 'Read More', 'Read More'),
(1105, 'M_READ_LESS', 'Read Less', 'Read Less'),
(1106, 'M_SHOW_MORE', 'Show more', 'Show more'),
(1107, 'M_SHOW_LESS', 'Show less', 'Show less'),
(1108, 'M_COUPON_CODES', 'Coupon Codes', 'Coupon Codes'),
(1109, 'M_FIND_ALL_DISCOUNT_CODES', 'Find all discount codes for great savings at one place.', 'Find all discount codes for great savings at one place.'),
(1110, 'M_EXPIRES', 'Expires', 'Expires'),
(1111, 'M_MIN_ORDER_VALUE', 'Min. Order Value', 'Min. Order Value'),
(1112, 'L_WE_DO_NOT_HAVE_ANY_OFFER', 'Sorry, we do not have any offer currently. Please keep checking this space for new offers.', 'Sorry, we do not have any offer currently. Please keep checking this space for new offers.'),
(1113, 'M_MY_RETURN_REQUESTS', 'My Return Requests', 'My Return Requests'),
(1114, 'M_RETURN_REQUESTS', 'Return Requests', 'Return Requests'),
(1115, 'L_RECEIVED', 'Received', 'Received'),
(1116, 'M_FREE', 'Free', 'Free'),
(1117, 'M_IFSC_SWIFT_CODE', 'IFSC Code/Swift Code', 'IFSC Code/Swift Code'),
(1118, 'M_BANK_ADDRESS', 'Bank Address', 'Bank Address'),
(1119, 'M_OTHER_INFO_INSTRUCTIONS', 'Other Info/Instructions', 'Other Info/Instructions'),
(1120, 'M_WITHDRAWAL_REQUEST_DECLINED_AMOUNT_REFUNDED', 'Withdrawal Request Declined %s. Amount Refunded.', 'Withdrawal Request Declined %s. Amount Refunded.'),
(1121, 'M_SHIPPING_CHARGES', 'Shipping Charges', 'Shipping Charges'),
(1122, 'M_CREATE_YOUR_SHOP', 'Create Your Shop', 'Create Your Shop'),
(1123, 'M_RECEIVED_CREDITS_FOR_ORDER', 'Received credits for order %s.', 'Received credits for order %s.'),
(1124, 'M_CHARGED_COMMISSION_FOR_ORDER', 'Charged commission for order %s.', 'Charged commission for order %s.'),
(1125, 'L_DIMENSIONS', 'Dimensions', 'Dimensions'),
(1126, 'L_WEIGHT', 'Weight', 'Weight'),
(1127, 'M_ERROR_YOUR_ACCOUNT_IS_DELETED', 'Your account is not in our database.', 'Your account is not in our database.'),
(1128, 'M_COUPON', 'Coupon', 'Coupon'),
(1129, 'L_WITHDRAWAL_REQUEST_DATE', 'You sent last withdrawal request on <b>%s</b>. You are allowed for next withdrawal only after <b>%s</b> (%d days).', 'You sent last withdrawal request on <b>%s</b>. You are allowed for next withdrawal only after <b>%s</b> (%d days).'),
(1131, 'M_EDIT', 'EDIT', 'EDIT'),
(1132, 'M_LIVE_CHAT_STRING', 'This will be powered by 3rd party Live Chat service/widget of your choice.', 'This will be powered by 3rd party Live Chat service/widget of your choice.'),
(1133, 'M_LIVE_CHAT', 'LIVE CHAT', 'LIVE CHAT'),
(1134, 'L_STATUS_HISTORY', 'Status History', 'Status History'),
(1135, 'L_PAYMENT_HISTORY', 'Payment History', 'Payment History'),
(1136, 'TXN_ID', 'ID', 'ID'),
(1137, 'M_TXN_ID', 'Txn ID', 'Txn ID'),
(1138, 'L_REFUND', 'Request Refund', 'Request Refund'),
(1139, 'L_CANCEL', 'Cancel', 'Cancel'),
(1140, 'L_ORDER_CANCELLATION_CANNOT_PLACED', 'This order is not eligible for cancellation.', 'This order is not eligible for cancellation.'),
(1141, 'L_PLACE_CANCELLATION_REQUEST', 'Place Cancellation Request', 'Place Cancellation Request'),
(1142, 'L_YOUR_CANCELLATION_REQUEST_SUBMITTED', 'Your cancellation request has been submitted successfully.', 'Your cancellation request has been submitted successfully.'),
(1143, 'L_ALREADY_SUBMITTED_CANCEL_REQUEST_ORDER', 'You have already submitted the cancellation request for this order.', 'You have already submitted the cancellation request for this order.'),
(1144, 'M_YOUR_CANCELLATION_REQUEST_APPROVED', 'Your request for order cancellation has been approved.', 'Your request for order cancellation has been approved.'),
(1145, 'M_CANCELLATION_REQUESTS', 'Cancellation Requests', 'Cancellation Requests'),
(1146, 'L_MY_CANCELLATION_REQUESTS', 'My Cancellation Requests', 'My Cancellation Requests'),
(1147, 'L_REQUEST_DETAILS', 'Request Details', 'Request Details'),
(1148, 'M_VIEW_RETURN_REQUESTS', 'View Return Requests', 'View Return Requests'),
(1149, 'M_VIEW_RETURN_REQUEST', 'View Return Request', 'View Return Request'),
(1150, 'L_RETURN_REQUEST_WITHDRAWN', 'This return request is withdrawn.', 'This return request is withdrawn.'),
(1153, 'M_BUYER_RAISED_RETURN_REQUEST', 'Buyer raised return request.', 'Buyer raised return request.'),
(1156, 'M_BUYER_WITHDRAWN_RETURN_REQUEST', 'Buyer withdrawn return request.', 'Buyer withdrawn return request.'),
(1157, 'L_RETURN_REQUEST_APPROVED_BY', 'Return request approved by %s', 'Return request approved by %s'),
(1158, 'M_SUPPLIER_APPROVED_RETURN_REQUEST', '<i>%s</i> approved return request.', '<i>%s</i> approved return request.'),
(1159, 'L_RETURN_REQUEST_APPROVED', 'Return request approved for %s. Amount Refunded.', 'Return request approved for %s. Amount Refunded.'),
(1160, 'L_YES', 'Yes', 'Yes'),
(1161, 'L_REFUNDED_TAX', 'Refunded Tax', 'Refunded Tax'),
(1162, 'L_TAX', 'Tax', 'Tax'),
(1163, 'M_PAY_NOW', 'Pay Now', 'Pay Now'),
(1165, 'M_GUEST_SUCCESS_ORDER', '<p>Your order has been successfully processed!</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p><p>\r\nThanks for shopping with us online!</p>', '<p>Your order has been successfully processed!</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p><p>\r\nThanks for shopping with us online!</p>'),
(1166, 'Tr', 'TR', 'TR'),
(1167, 'L_ADD_TO_CART', 'Add to cart', 'Add to cart'),
(1168, 'L_PRODUCT_VIEW', 'Product View', 'Product View'),
(1169, 'L_BACK_TO_RETURN_REQUESTS', 'Back to Return Requests', 'Back to Return Requests'),
(1172, 'L_BY_USING_AGREE_TERMS_CONDITIONS', 'By using this website you agree to the %s.', 'By using this website you agree to the %s.'),
(1173, 'L_TERMS_CONDITIONS', 'Terms & Conditions', 'Terms & Conditions'),
(1174, 'L_RECEIVED_PAYMENT', 'Received Payment', 'Received Payment'),
(1175, 'L_BACK_TO_ORDERS', 'Back to orders', 'Back to orders'),
(1176, 'L_PRINT_ORDER', 'Print Order', 'Print Order'),
(1177, 'L_LIVE_CHAT', 'Ñ‡Ð°Ñ‚Ð»Ð°Ñ…', 'Ñ‡Ð°Ñ‚Ð»Ð°Ñ…'),
(1178, 'M_DISPLAY_ORDER', 'Display Order', 'Display Order'),
(1179, 'M_SUCCESSFULLY_SUBSCRIBED', 'Successfully subscribed', 'Successfully subscribed'),
(1182, 'L_FEEDBACK_CAN_BE_PLACED_DELIVERED_COMPLETED', 'This order is not yet available for feedback, please wait for this order to be ready for feedback. Usually feedback is allowed on delivered and completed orders only.', 'This order is not yet available for feedback, please wait for this order to be ready for feedback. Usually feedback is allowed on delivered and completed orders only.'),
(1185, 'L_BACK_TO_LOGIN', 'Back to login', 'Back to login'),
(1186, 'L_SALES_GRAPH', 'Sales Graph - Last 12 Months', 'Sales Graph - Last 12 Months'),
(1188, 'L_SUPPLIER_APPROVAL_INFORMATION', 'Supplier Approval Information', 'Supplier Approval Information'),
(1189, 'M_YOUR_SUPPLIER_APPROVAL_FORM_REQUEST_SENT', 'Your request for supplier has been sent for approval, we will send you a notification on status update.', 'Your request for supplier has been sent for approval, we will send you a notification on status update.'),
(1190, 'L_VALIDATION_MANDATORY', '%s is mandatory.', '%s is mandatory.'),
(1191, 'L_VALIDATION_CHARACTER_ONLY', 'Only characters are supported for %s.', 'Only characters are supported for %s.'),
(1192, 'L_VALIDATION_INTEGER_ONLY', 'Please enter integer value for %s.', 'Please enter integer value for %s.'),
(1193, 'L_VALIDATION_NUMERIC_ONLY', 'Please enter numeric value for %s.', 'Please enter numeric value for %s.'),
(1194, 'L_VALIDATION_LENGTH_RANGE_ERROR', 'Length of %s must be between %s and %s.', 'Length of %s must be between %s and %s.'),
(1195, 'L_VALIDATION_VALUE_RANGE_ERROR', 'Value of %s must be between %s and %s', 'Value of %s must be between %s and %s'),
(1196, 'L_VALIDATION_USERNAME', '%s must start with a letter and can contain only alphanumeric characters (letters, _, ., digits). Length must be between 4 to 20 characters.', '%s must start with a letter and can contain only alphanumeric characters (letters, _, ., digits). Length must be between 4 to 20 characters.'),
(1197, 'L_VALIDATION_PASSWORD', '%s should not contain whitespace characters.', '%s should not contain whitespace characters.'),
(1198, 'L_VALIDATION_COMPARE_LT', '%s must be less than %s', '%s must be less than %s'),
(1199, 'L_VALIDATION_COMPARE_LE', '%s must be less than or equal to %s', '%s must be less than or equal to %s'),
(1200, 'L_VALIDATION_COMPARE_GT', '%s must be greater than %s', '%s must be greater than %s'),
(1201, 'L_VALIDATION_COMPARE_GE', '%s must be greater than or equal to %s', '%s must be greater than or equal to %s'),
(1202, 'L_VALIDATION_COMPARE_EQ', '%s must be same as %s', '%s must be same as %s'),
(1203, 'L_VALIDATION_COMPARE_NE', '%s should not be same as %s', '%s should not be same as %s'),
(1204, 'L_VALIDATION_EMAIL', 'Please enter valid email ID for %s.', 'Please enter valid email ID for %s.'),
(1205, 'L_VALIDATION_INVALID', 'Invalid value for %s', 'Invalid value for %s'),
(1206, 'L_VALIDATION_COMPARE_WITH', '%s could not be matched.', '%s could not be matched.'),
(1207, 'L_YOUR_APPLICATION_PENDING', 'Your application is pending approval.', 'Your application is pending approval.'),
(1208, 'L_PLEASE_PATIENT_REVIEW_APPLICATION', 'Please be patient while we review your information.', 'Please be patient while we review your information.'),
(1209, 'L_APPLICATION_REFERENCE', 'Application Reference', 'Application Reference'),
(1210, 'L_BACK_TO_DASHBOARD', 'Back to dashboard', 'Back to dashboard'),
(1211, 'L_DECLINED', 'Declined', 'Declined'),
(1212, 'L_YOUR_APPLICATION_DECLINED', 'Sorry, your application has been declined.', 'Sorry, your application has been declined.'),
(1213, 'L_THINK_ERROR_PLEASE_CONTACT_US', 'if you think there was an error, please feel free to submit revised request by clicking on the link below.', 'if you think there was an error, please feel free to submit revised request by clicking on the link below.'),
(1214, 'L_YOUR_APPLICATION_APPROVED', 'Your Application Is Approved.', 'Your Application Is Approved.'),
(1215, 'L_START_USING_SUPPLIER_PLEASE_CONTACT_US', 'You can start using Supplier Area, feel free to contact us for any query.', 'You can start using Supplier Area, feel free to contact us for any query.'),
(1216, 'M_TYPE', 'Type', 'Type'),
(1217, 'M_CAPTION', 'Caption', 'Caption'),
(1218, 'M_EXTRA_COMMENTS', 'Extra Comments', 'Extra Comments'),
(1219, 'L_ADMIN_COMMENTS', 'Admin Comments', 'Admin Comments'),
(1220, 'M_PAY_USING_PAYMENT_METHOD', 'Pay using %s', 'Pay using %s'),
(1221, 'L_SELLER_PROFILE_ACTIVATION', 'Seller Profile Activation', 'Seller Profile Activation'),
(1222, 'L_DECLINED_CANCELLED', 'Declined/Cancelled', 'Declined/Cancelled'),
(1223, 'L_PLEASE_ADD_MIMIMUM_CART_QTY', 'Please add minimum %s items to add %s into your cart.', 'Please add minimum %s items to add %s into your cart.'),
(1225, 'L_PLEASE_SUBMIT_YOUR_BUSINESS_INFO', 'Please submit your business info, our team will review it soonest possible.', 'Please submit your business info, our team will review it soonest possible.'),
(1226, 'M_PRODUCT_ADDED_CART', 'Success: You have added %s to your shopping cart!', 'Success: You have added %s to your shopping cart!'),
(1227, 'L_PLEASE_LOGIN_OR_LOGIN_AGAIN', 'Please login or you need to login again.', 'Please login or you need to login again.'),
(1228, 'L_INVALID_CODE', 'Invalid Code', 'Invalid Code'),
(1229, 'L_OK', 'OK', 'OK'),
(1230, 'M_ERROR_INVALID_TEMP_TOCKEN', 'Invalid Token! Your token is valid for 2 minutes only.', 'Invalid Token! Your token is valid for 2 minutes only.'),
(1231, 'L_SHOP_NAME_ALREADY_EXISTS', 'Shop name already exists', 'Shop name already exists'),
(1232, 'L_FEATURED_PRODUCTS', 'Featured Products', 'Featured Products'),
(1233, 'L_FEATURED_SHOPS', 'Featured Shops', 'Featured Shops'),
(1236, 'M_ERROR_INVALID_USERNAME', 'ERROR INVALID USERNAME', 'ERROR INVALID USERNAME'),
(1238, 'M_SELECT_SHIPPING', 'Select Shipping', 'Select Shipping'),
(1239, 'F_ALL', 'All', 'All'),
(1240, 'M_URL_KEYWORDS', 'URL Keywords', 'URL Keywords'),
(1241, 'F_EMAIL_NOT_AVAILABLE', 'Sorry, ''%s'' is not-available', 'Sorry, ''%s'' is not-available'),
(1242, 'F_EMAIL_AVAILABLE', '''%s'' is available', '''%s'' is available'),
(1243, 'M_SELECT_REASON', 'Select Reason', 'Select Reason'),
(1244, 'L_SHOP_REVIEWS', '%s''s Shop Reviews', '%s''s Shop Reviews'),
(1245, 'M_UPDATE_PROFILE_PICTURE', 'Update Profile Picture', 'Update Profile Picture'),
(1246, 'M_CHANGE_PHOTO', 'Change Photo', 'Change Photo'),
(1247, 'L_ORDER_FROM', 'Order From', 'Order From'),
(1248, 'L_ORDER_TO', 'Order To', 'Order To'),
(1249, 'L_HOW_COMMISSION_WORKS', 'Here you can setup portal commission at Site/Category/Vendor/Product Level. As you can see there are 4 levels of commission settings, the lower level setting over-rides the upper level setting. For example: Product Level Commission over-rides the Vendor/Category/Site level setting (if setup into the system), similarly Vendor Level setting over-rides the Category/Site Level setting (if setup into the system), Category level setting over-rides the Site level setting. This can be seen as Pyramid, lower level setting is stronger than the upper level.', 'Here you can setup portal commission at Site/Category/Vendor/Product Level. As you can see there are 4 levels of commission settings, the lower level setting over-rides the upper level setting. For example: Product Level Commission over-rides the Vendor/Category/Site level setting (if setup into the system), similarly Vendor Level setting over-rides the Category/Site Level setting (if setup into the system), Category level setting over-rides the Site level setting. This can be seen as Pyramid, lower level setting is stronger than the upper level.'),
(1250, 'L_WARNING_MAX_LOGIN_ATTEMPTS', 'Warning: Your account has exceeded allowed number of login attempts. Please try again in 1 hour.', 'Warning: Your account has exceeded allowed number of login attempts. Please try again in 1 hour.'),
(1251, 'F_PHONE', 'Phone', 'Phone'),
(1252, 'L_COMPANY', 'Company', 'Company'),
(1253, 'L_WEBSITE', 'Website', 'Website'),
(1254, 'L_TAX_ID', 'Tax ID', 'Tax ID'),
(1255, 'L_CHEQUE_PAYEE_NAME', 'Cheque Payee Name', 'Cheque Payee Name');
INSERT INTO `tbl_language_labels` (`label_id`, `label_key`, `label_caption_en`, `label_caption_es`) VALUES
(1256, 'L_PAYPAL_EMAIL_ACCOUNT', 'PayPal Email Account', 'PayPal Email Account'),
(1257, 'L_ABA/BSB_NUMBER_BRANCH_NUMBER', 'ABA/BSB number Branch Number', 'ABA/BSB number Branch Number'),
(1258, 'L_SWIFT_CODE', 'SWIFT Code', 'SWIFT Code'),
(1259, 'L_AFFILIATE_PROGRAM', 'Affiliate Program', 'Affiliate Program'),
(1260, 'L_AFFILIATE_PROGRAM_DESCRIPTION', 'Our affiliate program is easy & free to join! It enables you to earn revenue by referring potential customers to our website. Whether you are a large content network, social media butterfly or a seasoned blogger, you can earn our standard %s%% commission on referred purchases. For more information, please visit our FAQ page and donâ€™t forget to read our Terms & Conditions.', 'Our affiliate program is easy & free to join! It enables you to earn revenue by referring potential customers to our website. Whether you are a large content network, social media butterfly or a seasoned blogger, you can earn our standard %s%% commission on referred purchases. For more information, please visit our FAQ page and donâ€™t forget to read our Terms & Conditions.'),
(1261, 'L_AFFILIATE_PROGRAM_MORE_INFO', 'For more information, visit our FAQ page or see our Affiliate terms &amp; conditions.', 'For more information, visit our FAQ page or see our Affiliate terms &amp; conditions.'),
(1262, 'L_NEW_AFFILIATE', 'New Affiliate', 'New Affiliate'),
(1263, 'L_CURRENTLY_NOT_AFFILIATE', 'I am not currently an affiliate.', 'I am not currently an affiliate.'),
(1264, 'L_CLICK_BELOW_CREATE_AFFILIATE_ACCOUNT', 'Click Continue below to create a new affiliate account. Please note that this is not connected in any way to your customer account.', 'Click Continue below to create a new affiliate account. Please note that this is not connected in any way to your customer account.'),
(1265, 'L_CONTINUE', 'Continue', 'Continue'),
(1266, 'L_AFFILIATE_USERNAME_OR_EMAIL', 'Affiliate Username or Email', 'Affiliate Username or Email'),
(1267, 'L_AFFILIATE_PASSWORD', 'Affiliate Password', 'Affiliate Password'),
(1268, 'L_AFFILIATE_LOGIN', 'Affiliate Login', 'Affiliate Login'),
(1269, 'L_RETURNING_AFFILIATE', 'I am a returning affiliate.', 'I am a returning affiliate.'),
(1270, 'L_YOUR_PERSONAL_DETAILS', 'Your Personal Details', 'Your Personal Details'),
(1271, 'L_YOUR_ADDRESS_DETAILS', 'Your Address Details', 'Your Address Details'),
(1272, 'L_PAYMENT_INFORMATION', 'Payment Information', 'Payment Information'),
(1273, 'L_ALREADY_HAVE_AFFILIATE_ACCOUNT', 'If you already have an account with us, please login at the %s.', 'If you already have an account with us, please login at the %s.'),
(1274, 'L_LOGIN_PAGE', 'login page', 'login page'),
(1275, 'L_TO_CREATE_AN_AFFILIATE_ACCOUNT', 'To create an affiliate account, fill in the form below ensuring you complete all the required fields:', 'To create an affiliate account, fill in the form below ensuring you complete all the required fields:'),
(1276, 'L_YOUR_PASSWORD', 'Your Password', 'Your Password'),
(1278, 'L_AFFILIATE_ACCOUNT_MUST_APPROVED', 'Your account must be approved before you can login. Once approved you can log in by using your e-mail address and password by visiting our website or at the following URL:', 'Your account must be approved before you can login. Once approved you can log in by using your e-mail address and password by visiting our website or at the following URL:'),
(1279, 'L_AFFILIATE_ACCOUNT_REGISTRATION_SUCCESS_MESSAGE', 'Congratulations! Your new account has been successfully created!</p> <p>You are now a member of %s affiliates.</p> <p>If you have ANY questions about the operation of this affiliate system, please e-mail the store owner.</p> <p>A confirmation has been sent to the provided e-mail address. If you have not received it within the hour, please <a href="%s">contact us</a>.', 'Congratulations! Your new account has been successfully created!</p> <p>You are now a member of %s affiliates.</p> <p>If you have ANY questions about the operation of this affiliate system, please e-mail the store owner.</p> <p>A confirmation has been sent to the provided e-mail address. If you have not received it within the hour, please <a href="%s">contact us</a>.'),
(1280, 'L_AFFILIATE_ACCOUNT_REGISTRATION_APPROVAL_MESSAGE', 'Thank you for registering for an affiliate account with %s!\n\nYou will be notified by e-mail once your account has been activated by the admin.\n\nIf you have ANY questions about the operation of this affiliate system, please <a href="%s">contact the admin</a>.', 'Thank you for registering for an affiliate account with %s!\n\nYou will be notified by e-mail once your account has been activated by the admin.\n\nIf you have ANY questions about the operation of this affiliate system, please &lt;a href="%s"&gt;contact the admin&lt;/a&gt;.'),
(1281, 'L_AFFILIATE_ACCOUNT_CREATED_TEXT', 'Your account has now been created and you can log in by using your e-mail address and password by visiting our website or at the following URL:', 'Your account has now been created and you can log in by using your e-mail address and password by visiting our website or at the following URL:'),
(1282, 'L_AFFILIATE_ACCOUNT_CREATED', 'Your affiliate account has been created!', 'Your affiliate account has been created!'),
(1283, 'F_BACK_TO_AFFILIATE_LOGIN', 'Back to Affiliate Login', 'Back to Affiliate Login'),
(1284, 'L_ADDRESS_INFORMATION', 'Address Information', 'Address Information'),
(1285, 'PAYMENT_OPTIONS', 'Options', 'Options'),
(1287, 'L_CHEQUE', 'Cheque', 'Cheque'),
(1288, 'L_BANK', 'Bank', 'Bank'),
(1289, 'L_PAYPAL', 'PayPal', 'PayPal'),
(1290, 'M_YOUR_PAYMENT_DETAILS_UPDATED', 'Your payment details updated successfully.', 'Your payment details updated successfully.'),
(1291, 'M_AFFILIATE_TRACKING', 'Affiliate Tracking', 'Affiliate Tracking'),
(1292, 'L_TRACKING_INFORMATION', 'Tracking Information', 'Tracking Information'),
(1293, 'M_YOUR_TRACKING_CODE', 'Your Tracking Code', 'Your Tracking Code'),
(1294, 'M_TRACKING_LINK', 'Tracking Link', 'Tracking Link'),
(1295, 'L_TRACKING_LINK_GENERATOR', 'Tracking Link Generator', 'Tracking Link Generator'),
(1296, 'M_YOUR_DASHBOARD', 'Your Dashboard', 'Your Dashboard'),
(1297, 'L_AFFILIATE_COMMISSION_RECEIVED', 'Commission Received. Invoice Number %s.', 'Commission Received. Invoice Number %s.'),
(1298, 'L_INVOICE_NUMBER', 'Invoice Number', 'Invoice Number'),
(1299, 'L_ORDER_AMOUNT', 'Order Amount', 'Order Amount'),
(1300, 'L_COMMISSION', 'Commission', 'Commission'),
(1301, 'M_MY_TOTAL_BALANCE', 'My Total Balance', 'My Total Balance'),
(1302, 'M_BALANCE', 'Balance', 'Balance'),
(1303, 'M_MY_ACCOUNT_BALANCE', 'My Account Balance', 'My Account Balance'),
(1304, 'M_MY_PENDING_CREDITS', 'My Pending Credits', 'My Pending Credits'),
(1305, 'L_ALL_ORDERS', 'All Orders', 'All Orders'),
(1306, 'M_CURRENT_ACCOUNT_BALANCE', 'Current Account Balance', 'Current Account Balance'),
(1307, 'M_TOTAL_REVENUE', 'Total Revenue', 'Total Revenue'),
(1308, 'M_PENDING_PAYMENT', 'Pending Payment', 'Pending Payment'),
(1309, 'M_RECEIVED_PAYMENTS', 'Received Payments', 'Received Payments'),
(1310, 'M_PENDING_PAYMENTS', 'Pending Payments', 'Pending Payments'),
(1311, 'M_MY_TRANSACTIONS', 'My Transactions', 'My Transactions'),
(1312, 'L_AFWITHDRAWAL_COMMENTS', 'Withdrawal Comments', 'Withdrawal Comments'),
(1313, 'L_VIEW_WITHDRAWAL_REQUEST', 'View Withdrawal Request', 'View Withdrawal Request'),
(1314, 'M_PAYMENT_DETAILS', 'Payment Details', 'Payment Details'),
(1315, 'M_SHARING', 'Sharing', 'Sharing'),
(1316, 'L_SHARING_INFORMATION', 'Sharing Information', 'Sharing Information'),
(1317, 'L_FILTER', 'Filter', 'Filter'),
(1318, 'L_FILTERS', 'Filters', 'Filters'),
(1319, 'L_AFFILIATE_TELL_YOUR_FRIENDS', 'TELL YOUR FRIENDS ABOUT YOURSELF', 'TELL YOUR FRIENDS ABOUT YOURSELF'),
(1320, 'L_AFFILIATE_SHARING_MESSAGE', 'Share your unique URL on Facebook, Twitter, LinkedIn, Blog, Email and ask friends to sign up & shop. You may get some commission whenever any new user signup and make purchase with us.', 'Share your unique URL on Facebook, Twitter, LinkedIn, Blog, Email and ask friends to sign up & shop. You may get some commission whenever any new user signup and make purchase with us.'),
(1321, 'L_SHARE_ON', 'Share on', 'Share on'),
(1322, 'L_POST_YOUR_WALL_FACEBOOK', 'Post to your wall on %s telling them about yourself.', 'Post to your wall on %s telling them about yourself.'),
(1323, 'L_SHARE', 'Share', 'Share'),
(1324, 'L_TWITTER', 'Twitter', 'Twitter'),
(1325, 'L_SEND_A_TWEET_FOLLOWERS', 'Send a %s to your followers telling them about yourself.', 'Send a %s to your followers telling them about yourself.'),
(1326, 'L_TWEET', 'Tweet', 'Tweet'),
(1327, 'L_YOUR_FRIEND_TELL_THEM_ABOUT_YOURSELF', 'your friends to tell them about yourself.', 'your friends to tell them about yourself.'),
(1328, 'L_INVITE_FRIENDS_THROUGH_EMAIL', 'Invite friends through email', 'Invite friends through email'),
(1329, 'L_THANKS_FOR_SHARING', 'Thanks for sharing', 'Thanks for sharing'),
(1330, 'L_COMMENTS_FROM_SENDER', 'Comments from sender', 'Comments from sender'),
(1331, 'L_PAGE_NOT_FOUND', 'Page not found', 'Page not found'),
(1332, 'L_WE_ARE_SORRY', 'We''re sorry,', 'We''re sorry,'),
(1333, 'L_PAGE_LOOKING_DOES_NOT_EXIST', 'but the page you are looking for doesn''t exist.', 'but the page you are looking for doesn''t exist.'),
(1334, 'L_IT_MAY_OCCURED_DUE', 'It may have occurred due to:', 'It may have occurred due to:'),
(1335, 'L_INVALID_REQUEST_PAGE_URL', 'Invalid request or incorrect page url.', 'Invalid request or incorrect page url.'),
(1336, 'L_YOU_HAVE_TYPO_MISSING_FILE_NAME', 'You have a typo or missing file somewhere.', 'You have a typo or missing file somewhere.'),
(1337, 'L_PAGE_FILE_TIMED_OUT', 'Page or file link is timed out at this moment.', 'Page or file link is timed out at this moment.'),
(1338, 'L_LINKEDIN', 'Linkedin', 'Linkedin'),
(1339, 'L_GOOGLE_PLUS', 'Google Plus', 'Google Plus'),
(1340, 'L_PAYMENT_CARDS', 'Payment cards', 'Payment cards'),
(1341, 'L_SECURE_PAYMENTS', 'Secure Payments', 'Secure Payments'),
(1342, 'L_AFFILIATE_REGISTERED_SUCCESSFULLY', 'Affiliate Registered Successfully', 'Affiliate Registered Successfully'),
(1343, 'L_EXCLUDING_SHIPPING_CHARGES', 'Excluding of shipping charges', 'Excluding of shipping charges'),
(1344, 'M_ERROR_YOUR_ACCOUNT_APPROVAL_PENDING', 'Warning: Your account requires approval before you can login.', 'Warning: Your account requires approval before you can login.'),
(1345, 'L_PAYMENT_SUCCESS', 'Payment Success', 'Payment Success'),
(1346, 'L_AFFILIATE_SIGNUP_COMMISSION_RECEIVED', 'Signup Commission Received. %s Registered.', 'Signup Commission Received. %s Registered.'),
(1347, 'M_PENDING_ORDER_COMMISSION', 'Pending Order Commission', 'Pending Order Commission'),
(1348, 'M_RECEIVED_ORDER_COMMISSION', 'Received Order Commission', 'Received Order Commission'),
(1349, 'L_OFF', 'OFF', 'OFF'),
(1350, 'L_ON', 'ON', 'ON'),
(1351, 'M_LENGTH', 'Length', 'Length'),
(1352, 'M_WIDTH', 'Width', 'Width'),
(1353, 'M_HEIGHT', 'Height', 'Height'),
(1354, 'M_DIMENSIONS_TEXT', 'Dimensions', 'Dimensions'),
(1355, 'M_CENTIMETER', 'Centimeter', 'Centimeter'),
(1356, 'M_MILLIMETERS', 'Millimeters', 'Millimeters'),
(1357, 'M_INCH', 'Inch', 'Inch'),
(1358, 'M_KILOGRAM', 'Kilogram', 'Kilogram'),
(1359, 'M_GRAMS', 'Grams', 'Grams'),
(1360, 'M_POUNDS', 'Pounds', 'Pounds'),
(1361, 'M_OUNCE', 'Ounce', 'Ounce'),
(1362, 'M_LITRES', 'Litres', 'Litres'),
(1363, 'M_MILI_LITRES', 'Mili Litres', 'Mili Litres'),
(1364, 'M_REWARD_POINTS', 'Reward Points', 'Reward Points'),
(1365, 'L_REWARD_POINTS', 'Reward Points', 'Reward Points'),
(1366, 'L_POINTS', 'Points', 'Points'),
(1367, 'L_ADDED_DATE', 'Added Date', 'Added Date'),
(1368, 'L_EXPIRY_DATE', 'Expiry Date', 'Expiry Date'),
(1369, 'M_SHARE_AND_EARN', 'Share and Earn', 'Share and Earn'),
(1371, 'L_FRIENDS_EMAIL', 'Friend''s Email', 'Friend''s Email'),
(1372, 'L_USE_COMMAS_SEPARATE_EMAILS', 'Use commas to separate emails, Max 100 Emails', 'Use commas to separate emails, Max 100 Emails'),
(1373, 'L_FRIENDS_EMAIL_MANDATORY', 'Friend''s email is mandatory', 'Friend''s email is mandatory'),
(1374, 'L_PERSONAL_MESSAGE', 'Personal Message', 'Personal Message'),
(1375, 'L_INVITE_YOUR_FRIENDS', 'Invite Your Friends', 'Invite Your Friends'),
(1376, 'L_SHARE_AND_EARN_TEXT_MESSAGE', 'Share your unique URL on Facebook, Twitter, LinkedIn, Blog, Email and ask friends to sign up & shop. You and your friends may get reward benefits, which can be used against future purchases.', 'Share your unique URL on Facebook, Twitter, LinkedIn, Blog, Email and ask friends to sign up & shop. You and your friends may get reward benefits, which can be used against future purchases.'),
(1378, 'L_SHARE_AND_EARN', 'Share and Earn', 'Share and Earn'),
(1379, 'L_YOU_MAY_COPY_INVITATION_LINK_BELOW', 'You may copy the invitation link below & share with your friends on social networks like Facebook, Twitter, LinkedIn, Blog, Email etcâ€¦', 'You may copy the invitation link below & share with your friends on social networks like Facebook, Twitter, LinkedIn, Blog, Email etcâ€¦'),
(1380, 'L_PERSONAL_MESSAGE_FROM_SENDER', 'Personal Message From Sender', 'Personal Message From Sender'),
(1381, 'L_WE_SENT_INVITATION_EMAILS', 'We have sent an invitation email to your friend(s).', 'We have sent an invitation email to your friend(s).'),
(1383, 'L_REFEREE_SIGNUP_REWARD_POINTS_RECEIVED', 'Signup Reward Points. Your referral %s registered.', 'Signup Reward Points. Your referral %s registered.'),
(1385, 'L_REFERRAL_SIGNUP_REWARD_POINTS_RECEIVED', 'Signup Reward Points. Registered through referral link of your friend %s.', 'Signup Reward Points. Registered through referral link of your friend %s.'),
(1386, 'L_REFEREE_SALE_REWARD_POINTS_RECEIVED', 'Purchase reward points. Your referral %s placed first order.', 'Purchase reward points. Your referral %s placed first order.'),
(1387, 'L_REFERRAL_SALE_REWARD_POINTS_RECEIVED', 'Purchase reward points [1st purchase]. You are referral of %s.', 'Purchase reward points [1st purchase]. You are referral of %s.'),
(1388, 'L_ENTER_YOUR_COUPON_HERE', 'Enter your coupon here', 'Enter your coupon here'),
(1389, 'L_USE_COUPON_CODE', 'Use Coupon Code', 'Use Coupon Code'),
(1390, 'L_USE_REWARD_POINTS', 'Use Reward Points', 'Use Reward Points'),
(1391, 'L_POINTS_TO_USE', 'Points to use', 'Points to use'),
(1392, 'L_MAX', 'Max', 'Max'),
(1393, 'M_APPLY_POINTS', 'Apply Points', 'Apply Points'),
(1394, 'L_WARNING_YOU_DONT_HAVE_REWARD_POINTS', 'Warning: You don''t have %s reward points!', 'Warning: You don''t have %s reward points!'),
(1395, 'L_SUCCESS_REWARD_POINTS_APPLIED', 'Success: Your reward points discount has been applied!', 'Success: Your reward points discount has been applied!'),
(1396, 'L_WARNING_MAXIMUM_REWARDS_CAN_BE_APPLIED', 'Warning: The maximum number of points that can be applied is %s!', 'Warning: The maximum number of points that can be applied is %s!'),
(1397, 'L_WARNING_ENTER_REWARD_POINTS_TO_USE', 'Warning: Please enter the amount of reward points to use!', 'Warning: Please enter the amount of reward points to use!'),
(1398, 'L_USED_REWARD_POINTS_ORDER_INVOICE_NUMBER', 'Used Reward Points. Order Invoice Number %s.', 'Used Reward Points. Order Invoice Number %s.'),
(1399, 'L_SEE_MORE_AT', 'See more at', 'See more at'),
(1400, 'L_YOUTUBE', 'Youtube', 'Youtube'),
(1401, 'L_PINTEREST', 'Pinterest', 'Pinterest'),
(1402, 'L_LOADING', 'Loading', 'Loading'),
(1403, 'M_APPROVED_RETURN_REQUEST', '<i>%s</i> approved return request.', '<i>%s</i> approved return request.'),
(1404, 'F_WELCOME', 'Welcome', 'Welcome'),
(1405, 'L_WHAT_WOULD_YOU_LIKE_TO_DO_NEXT', 'What would you like to do next?', 'What would you like to do next?'),
(1406, 'L_CHOOSE_IF_HAVE_DISCOUNT_CODE_REWARD_POINTS', 'Choose if you have a discount code or reward points you want to use.', 'Choose if you have a discount code or reward points you want to use.'),
(1407, 'L_RECENTLY_VIEWED_PRODUCTS', 'Recently Viewed Products', 'Recently Viewed Products'),
(1408, 'L_ORDER_CANCELLED_REWARDS_POINTS_ADDED', 'Order Number %s Cancelled. Reward Points Added.', 'Order Number %s Cancelled. Reward Points Added.'),
(1409, 'L_RETURN_REQUEST_APPROVED_REWARDS_POINTS_ADDED', 'Return request approved for %s. Reward Points Added.', 'Return request approved for %s. Reward Points Added.'),
(1410, 'M_SELL_WITH_SITENAME', 'Sell with %s', 'Sell with %s'),
(1412, 'L_DAYS_MONEY_BACK_GUARANTEE', '30 Days Money Back Guarantee!', '30 Days Money Back Guarantee!'),
(1413, 'L_SAME_AS_BILLING_ADDRESS', 'Same as Billing Address', 'Same as Billing Address'),
(1414, 'L_ORDER_CANCELLED_REWARDS_POINTS_REVERSED', 'Order Number %s Cancelled. Reward Points Reversed.', 'Order Number %s Cancelled. Reward Points Reversed.'),
(1415, 'L_ORDER_CANCELLED_REWARDS_POINTS_REVERSED', 'Order Number %s Cancelled. Reward Points Reversed.', 'Order Number %s Cancelled. Reward Points Reversed.'),
(1416, 'M_MY_PRODUCTS', 'My Products', 'My Products'),
(1417, 'M_PURCHASED_ITEMS', 'Purchased Items', 'Purchased Items'),
(1418, 'L_CUSTOMERS_WHO_BOUGHT_THIS_ALSO_BOUGHT', 'Customers who bought this also bought', 'Customers who bought this also bought'),
(1419, 'M_ROTATE_LEFT', 'Rotate Left', 'Rotate Left'),
(1420, 'M_ROTATE_RIGHT', 'Rotate Right', 'Rotate Right'),
(1421, 'M_ERROR_FILE_SIZE', 'Error: Please select maximum 1MB  Image in size.', 'Error: Please select maximum 1MB  Image in size.'),
(1422, 'M_YOUR_SHOP_REMOVED_CONTACT_ADMIN', 'Your shop has been removed from the system.', 'Your shop has been removed from the system.'),
(1423, 'L_SHIP_FREE_PRODUCT', 'This product is available for Free Shipping.', 'This product is available for Free Shipping.'),
(1424, 'M_ERROR_PLEASE_VERIFY_YOURSELF', 'Please verify yourself through captcha.', 'Please verify yourself through captcha.'),
(1425, 'L_ENTER_YOUR_ADDRESS_DETAILS', 'Enter your address details', 'Enter your address details'),
(1426, 'L_EDIT_YOUR_ADDRESS_DETAILS', 'Edit your address details', 'Edit your address details'),
(1427, 'F_BRAND_NAME', 'Brand Name', 'Brand Name'),
(1428, 'L_PLACE_YOUR_REQUEST', 'Place Your Request', 'Place Your Request'),
(1429, 'L_NA', 'NA', 'NA'),
(1430, 'M_OPTIONS_VARIANTS', 'Options/Variants', 'Options/Variants'),
(1431, 'L_TYPE', 'Type', 'Type'),
(1432, 'M_OPTIONS_LIST', 'Options List', 'Options List'),
(1433, 'L_ADD_OPTION', 'Add Option', 'Add Option'),
(1434, 'F_TYPE', 'Type', 'Type'),
(1435, 'F_PLEASE_CHOOSE', 'Please Choose', 'Please Choose'),
(1436, 'F_DISPLAY_ORDER', 'Display Order', 'Display Order'),
(1437, 'F_OPTION_VALUE_NAME', 'Option Value Name', 'Option Value Name'),
(1438, 'F_SAVE_CHANGES', 'Save Changes', 'Save Changes'),
(1439, 'M_ADD_OPTION_VALUE', 'Add Option Value', 'Add Option Value'),
(1440, 'M_SUCCESS_OPTION_DETAILS_UPDATED_SUCCESSFULLY', 'Success: Option details added/updated successfully.', 'Success: Option details added/updated successfully.'),
(1441, 'M_REQUEST_FOR_NEW_BRAND', 'Request for new brand', 'Request for new brand'),
(1443, 'M_CREATE_NEW_OPTION_VARIANT', 'Create new option/variant', 'Create new option/variant'),
(1444, 'M_MINIMUM_QUANTITY', 'Minimum Quantity', 'Minimum Quantity'),
(1445, 'M_FORCE_MINIMUM_QUANTITY', 'Force a minimum ordered quantity.', 'Force a minimum ordered quantity.'),
(1446, 'L_SECURE', 'Secure', 'Secure'),
(1447, 'L_PAYMENTS', 'Payments', 'Payments'),
(1448, 'L_AUTHENTIC', 'Authentic', 'Authentic'),
(1449, 'L_24X7_CUSTOMER', '24X7 Customer', '24X7 Customer'),
(1450, 'L_SUPPORT', 'Support', 'Support'),
(1451, 'L_FAST', 'Fast', 'Fast'),
(1452, 'L_CHECKOUT_PRODUCTS', 'Products', 'Products'),
(1453, 'L_CHECKOUT_DELIVERY', 'Delivery', 'Delivery'),
(1454, 'L_ITEMS', 'items', 'items'),
(1455, 'M_CHECKOUT_SECURELY', 'Checkout Securely', 'Checkout Securely'),
(1456, 'M_BILLING ADDRESS', 'Billing Address', 'Billing Address'),
(1457, 'M_SHIPPING ADDRESS', 'Shipping Address', 'Shipping Address'),
(1458, 'M_CHANGE_ADDRESS', 'Change Address', 'Change Address'),
(1459, 'M_SHIPPING_SUMMARY', 'Shipping Summary', 'Shipping Summary'),
(1460, 'M_CART_SUMMARY', 'Cart Summary', 'Cart Summary'),
(1461, 'M_CHANGE_SHIPPING', 'Change Shipping', 'Change Shipping'),
(1462, 'M_VIEW_CART_SUMMARY', 'View Cart Summary', 'View Cart Summary'),
(1463, 'M_PAYMENT_SUMMARY', 'Payment Summary', 'Payment Summary'),
(1464, 'L_ERROR_MISSING_CATEGORY_ID', 'Export/Import: Missing category_ids in worksheet %1', 'Export/Import: Missing category_ids in worksheet %1'),
(1465, 'L_ERROR_INVALID_CATEGORY_ID', 'Export/Import: Invalid category_id %2 used in worksheet %1', 'Export/Import: Invalid category_id %2 used in worksheet %1'),
(1466, 'L_ERROR_DUPLICATE_CATEGORY_ID', 'Export/Import: Duplicate category_id %2 used in worksheet %1', 'Export/Import: Duplicate category_id %2 used in worksheet %1'),
(1467, 'L_ERROR_MISSING_PRODUCT_ID', 'Export/Import: Missing product_ids in worksheet %1', 'Export/Import: Missing product_ids in worksheet %1'),
(1468, 'L_ERROR_INVALID_PRODUCT_ID', 'Export/Import: Invalid product_id %2 used in worksheet %1', 'Export/Import: Invalid product_id %2 used in worksheet %1'),
(1469, 'L_ERROR_DUPLICATE_PRODUCT_ID', 'Export/Import: Duplicate product_id %2 used in worksheet %1', 'Export/Import: Duplicate product_id %2 used in worksheet %1'),
(1470, 'L_ERROR_UNLISTED_PRODUCT_ID', 'Export/Import: Unlisted product_id %2 used in worksheet %1', 'Export/Import: Unlisted product_id %2 used in worksheet %1'),
(1471, 'L_INVALID_HEADERS_IN_WORKSHEET', 'Export/Import: Invalid headers in worksheet %1', 'Export/Import: Invalid headers in worksheet %1'),
(1472, 'L_MISSING_WORKSHEET_OR_NOT_LISTED_BEFORE', 'Export/Import: Missing %2 Worksheet, or %2 worksheet not listed before %1', 'Export/Import: Missing %2 Worksheet, or %2 worksheet not listed before %1'),
(1473, 'L_ERROR_UNLISTED_PRODUCT_ID', 'Export/Import: Unlisted Product_id %2 in Worksheet %1', 'Export/Import: Unlisted Product_id %2 in Worksheet %1'),
(1474, 'L_ERROR_MISSING_OPTION_ID', 'Export/Import: Missing option_id in Worksheet %1', 'Export/Import: Missing option_id in Worksheet %1'),
(1475, 'L_ERROR_INVALID_OPTION_ID', 'Export/Import: Invalid option_id %2 in Worksheet %1', 'Export/Import: Invalid option_id %2 in Worksheet %1'),
(1476, 'L_ERROR_MISSING_OPTION_NAME', 'Export/Import: Missing option_name in Worksheet %1', 'Export/Import: Missing option_name in Worksheet %1'),
(1477, 'L_ERROR_INVALID_OPTION_NAME', 'Export/Import: Invalid option_name %2 in Worksheet %1', 'Export/Import: Invalid option_name %2 in Worksheet %1'),
(1478, 'L_ERROR_INVALID_PRODUCT_ID_OPTION_ID', 'Export/Import: Option_id %3 not specified for product_id %2 in worksheet %4, but it is used in worksheet %1', 'Export/Import: Option_id %3 not specified for product_id %2 in worksheet %4, but it is used in worksheet %1'),
(1479, 'L_ERROR_MISSING_OPTION_VALUE_ID', 'Export/Import: Missing option_value_ids in worksheet %1', 'Export/Import: Missing option_value_ids in worksheet %1'),
(1480, 'L_ERROR_INVALID_OPTION_ID_OPTION_VALUE_ID', 'Undefined option_value_id %3 for option_id %2 used in worksheet %1', 'Undefined option_value_id %3 for option_id %2 used in worksheet %1'),
(1481, 'L_ERROR_MISSING_OPTION_VALUE_NAME', 'Export/Import: Missing option_value_names in worksheet %1', 'Export/Import: Missing option_value_names in worksheet %1'),
(1482, 'L_ERROR_INVALID_OPTION_ID_OPTION_VALUE_NAME', 'Export/Import: Undefined option_value_name %3 for optiion_id %2 used in worksheet %1', 'Export/Import: Undefined option_value_name %3 for optiion_id %2 used in worksheet %1'),
(1483, 'L_ERROR_INVALID_PRODUCT_ID_OPTION_NAME', 'Export/Import: Option_name %3 not specified for product_id %2 in worksheet %4, but it is used in worksheet %1', 'Export/Import: Option_name %3 not specified for product_id %2 in worksheet %4, but it is used in worksheet %1'),
(1484, 'L_ERROR_INVALID_OPTION_NAME_OPTION_VALUE_ID', 'Export/Import: Undefined option_value_id %3 for option_name %2 used in worksheet %1', 'Export/Import: Undefined option_value_id %3 for option_name %2 used in worksheet %1'),
(1485, 'L_ERROR_INVALID_OPTION_NAME_OPTION_VALUE_NAME', 'Export/Import: Undefined option_value_name %3 for option_name %2 used in worksheet %1', 'Export/Import: Undefined option_value_name %3 for option_name %2 used in worksheet %1'),
(1486, 'L_ERROR_MISSING_ATTRIBUTE_GROUP_ID', 'Export/Import: Missing attribute_group_ids in worksheet %1', 'Export/Import: Missing attribute_group_ids in worksheet %1'),
(1487, 'L_ERROR_INVALID_ATTRIBUTE_GROUP_ID', 'Export/Import: Undefined attribute_group_id %2 used in worksheet %1', 'Export/Import: Undefined attribute_group_id %2 used in worksheet %1'),
(1488, 'L_ERROR_MISSING_ATTRIBUTE_ID', 'Export/Import: Missing attribute_ids in worksheet %1', 'Export/Import: Missing attribute_ids in worksheet %1'),
(1489, 'L_ERROR_INVALID_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID', 'Export/Import: Undefined attribute_id %3 for attribute_group_id %2 used in worksheet %1', 'Export/Import: Undefined attribute_id %3 for attribute_group_id %2 used in worksheet %1'),
(1490, 'L_ERROR_MISSING_ATTRIBUTE_NAME', 'Export/Import:Missing attribute name in worksheet %1', 'Export/Import:Missing attribute name in worksheet %1'),
(1491, 'L_ERROR_INVALID_ATTRIBUTE_GROUP_ID_ATTRIBUTE_NAME', 'Export/Import: Undefined attribute_name %3 for optiion_id %2 used in worksheet %1', 'Export/Import: Undefined attribute_name %3 for optiion_id %2 used in worksheet %1'),
(1492, 'L_ERROR_MISSING_ATTRIBUTE_GROUP_NAME', 'Export/Import: Missing attribute_group_names in worksheet %1', 'Export/Import: Missing attribute_group_names in worksheet %1'),
(1493, 'L_ERROR_INVALID_ATTRIBUTE_GROUP_NAME', 'Export/Import: Undefined attribute_group_name %2 used in worksheet %1', 'Export/Import: Undefined attribute_group_name %2 used in worksheet %1'),
(1494, 'L_ERROR_INVALID_ATTRIBUTE_GROUP_NAME_ATTRIBUTE_ID', 'Export/Import: Undefined attribute_id 3 for attribute_group_name %2 used in worksheet %1', 'Export/Import: Undefined attribute_id 3 for attribute_group_name %2 used in worksheet %1'),
(1495, 'L_ERROR_INVALID_ATTRIBUTE_GROUP_NAME_ATTRIBUTE_NAME', 'Export/Import: Undefined attribute_name %3 for attribute_group_name %2 used in worksheet %1', 'Export/Import: Undefined attribute_name %3 for attribute_group_name %2 used in worksheet %1'),
(1496, 'L_ERROR_MISSING_FILTER_GROUP_ID', 'Export/Import: Missing filter_group_ids in worksheet %1', 'Export/Import: Missing filter_group_ids in worksheet %1'),
(1497, 'L_ERROR_INVALID_FILTER_GROUP_ID', 'Export/Import: Undefined filter_group_id %2 used in worksheet %1', 'Export/Import: Undefined filter_group_id %2 used in worksheet %1'),
(1498, 'L_ERROR_MISSING_FILTER_ID', 'Export/Import: Missing filter_ids in worksheet %1', 'Export/Import: Missing filter_ids in worksheet %1'),
(1499, 'L_ERROR_INVALID_FILTER_GROUP_ID_FILTER_ID', 'Export/Import: Undefined filter_id %3 for filter_group_id %2 used in worksheet %1', 'Export/Import: Undefined filter_id %3 for filter_group_id %2 used in worksheet %1'),
(1500, 'L_ERROR_MISSING_FILTER_NAME', 'Export/Import: Missing filter_names in worksheet %1', 'Export/Import: Missing filter_names in worksheet %1'),
(1501, 'L_ERROR_INVALID_FILTER_GROUP_ID_FILTER_NAME', 'Export/Import: Undefined filter_name %3 for optiion_id %2 used in worksheet %1', 'Export/Import: Undefined filter_name %3 for optiion_id %2 used in worksheet %1'),
(1502, 'L_ERROR_MISSING_FILTER_GROUP_NAME', 'Export/Import: Missing filter_group_names in worksheet %1', 'Export/Import: Missing filter_group_names in worksheet %1'),
(1503, 'L_ERROR_INVALID_FILTER_GROUP_NAME', 'Export/Import: Undefined filter_group_name %2 used in worksheet %1', 'Export/Import: Undefined filter_group_name %2 used in worksheet %1'),
(1504, 'L_ERROR_INVALID_FILTER_GROUP_NAME_FILTER_ID', 'Export/Import: Undefined filter_id %3 for filter_group_name %2 used in worksheet %1', 'Export/Import: Undefined filter_id %3 for filter_group_name %2 used in worksheet %1'),
(1505, 'L_ERROR_INVALID_FILTER_GROUP_NAME_FILTER_ID', 'Export/Import: Undefined filter_id %3 for filter_group_name %2 used in worksheet %1', 'Export/Import: Undefined filter_id %3 for filter_group_name %2 used in worksheet %1'),
(1506, 'L_ERROR_INVALID_FILTER_GROUP_NAME_FILTER_NAME', 'Export/Import: Undefined filter_name %3 for filter_group_name %2 used in worksheet %1', 'Export/Import: Undefined filter_name %3 for filter_group_name %2 used in worksheet %1'),
(1507, 'L_ERROR_DUPLICATE_OPTION_ID', 'Export/Import: Duplicate option_id %2 used in worksheet %1', 'Export/Import: Duplicate option_id %2 used in worksheet %1'),
(1508, 'L_ERROR_DUPLICATE_OPTION_VALUE_ID', 'Export/Import: Duplicate option_value_id %2 used in worksheet %1', 'Export/Import: Duplicate option_value_id %2 used in worksheet %1'),
(1509, 'L_ERROR_DUPLICATE_ATTRIBUTE_GROUP_ID', 'Export/Import: Duplicate attribute_group_id %2 used in worksheet %1', 'Export/Import: Duplicate attribute_group_id %2 used in worksheet %1'),
(1510, 'L_ERROR_INVALID_ATTRIBUTE_ID', 'Export/Import: Undefined attribute_id %2 used in worksheet %1', 'Export/Import: Undefined attribute_id %2 used in worksheet %1'),
(1511, 'L_ERROR_DUPLICATE_ATTRIBUTE_ID', 'Export/Import: Duplicate attribute_id %2 used in worksheet %1', 'Export/Import: Duplicate attribute_id %2 used in worksheet %1'),
(1512, 'L_ERROR_DUPLICATE_FILTER_GROUP_ID', 'Export/Import: Duplicate filter_group_id %2 used in worksheet %1', 'Export/Import: Duplicate filter_group_id %2 used in worksheet %1'),
(1513, 'L_ERROR_INVALID_FILTER_ID', 'Export/Import: Undefined filter_id %2 used in worksheet %1', 'Export/Import: Undefined filter_id %2 used in worksheet %1'),
(1514, 'L_ERROR_DUPLICATE_FILTER_ID', 'Export/Import: Duplicate filter_id %2 used in worksheet %1', 'Export/Import: Duplicate filter_id %2 used in worksheet %1'),
(1515, 'L_ERROR_MISSING_DURATION_ID', 'Export/Import: Missing duration_id in worksheet %1', 'Export/Import: Missing duration_id in worksheet %1'),
(1516, 'L_ERROR_INVALID_DURATION_ID', 'Export/Import: Invalid duration_id %2 used in worksheet %1', 'Export/Import: Invalid duration_id %2 used in worksheet %1'),
(1517, 'L_ERROR_DUPLICATE_DURATION_ID', 'Export/Import: Duplicate duration_id %2 used in worksheet %1', 'Export/Import: Duplicate duration_id %2 used in worksheet %1'),
(1518, 'L_ERROR_MISSING_COMPANY_ID', 'Export/Import: Missing company_id in worksheet %1', 'Export/Import: Missing company_id in worksheet %1'),
(1519, 'L_ERROR_INVALID_COMPANY_ID', 'Export/Import: Invalid company_id %2 used in worksheet %1', 'Export/Import: Invalid company_id %2 used in worksheet %1'),
(1520, 'L_ERROR_DUPLICATE_COMPANY_ID', 'Export/Import: Duplicate company_id %2 used in worksheet %1', 'Export/Import: Duplicate company_id %2 used in worksheet %1'),
(1521, 'M_MY_PRODUCTS', 'My Products', 'My Products'),
(1522, 'M_OPTIONS_VARIANTS', 'Options Variants', 'Options Variants'),
(1523, 'M_BULK_IMPORT/EXPORT', 'Bulk Export/Import', 'Bulk Import/Export'),
(1524, 'L_EXPORT_DATA_XLSX_SPREADSHEET_FILE.', 'Export requested data to a XLSX spreadsheet file.', 'Export requested data to a XLSX spreadsheet file.'),
(1525, 'L_SELECT_WHAT_YOU_WANT_EXPORT', 'Select what data you want to export:', 'Select what data you want to export:'),
(1526, 'L_INCLUDING_CATEGORY_DATA_FILTER', 'Including Category Data Filter', 'Including Category Data Filter'),
(1527, 'M_INCLUDING_PRODUCT_OPTIONS_SPECIALS_DISCOUNTS_ATTRIBUTES_FILTERS_SHIPPING', 'Including Product Options Specials Discounts Attributes Filters Shipping', 'Including Product Options Specials Discounts Attributes Filters Shipping'),
(1528, 'L_OPTION_DEFINITIONS', 'Option Definitions', 'Option Definitions'),
(1529, 'L_ATTRIBUTE_DEFINITIONS', 'Attribute Definitions', 'Attribute Definitions'),
(1530, 'L_FILTER_DEFINITIONS', 'Filter Definitions', 'Filter Definitions'),
(1531, 'L_SHIPPING_DURATIONS', 'Shipping Durations', 'Shipping Durations'),
(1532, 'L_SHIPPING_COMPANIES', 'Shipping Companies', 'Shipping Companies'),
(1533, 'L_COUNTRIES', 'Countries', 'Countries'),
(1534, 'L_PRODUCTS_STOCK_AND_SKU', 'Products Stock And SKU', 'Products Stock And SKU'),
(1535, 'M_SELECT_DATA_RANGE', 'Please select the data range you want to export:', 'Please select the data range you want to export:'),
(1536, 'L_OPTIONAL_LEAVE_EMPTY', 'Optional, leave empty if not needed', 'Optional, leave empty if not needed'),
(1537, 'L_BY_ID_RANGE', 'By Id Range', 'By Id Range'),
(1538, 'L_BY_BATCHES', 'By Batches', 'By Batches'),
(1539, 'L_START_ID', 'Start Id', 'Start Id'),
(1540, 'L_END_ID', 'End ID', 'End ID'),
(1541, 'L_EXPORT', 'export', 'export'),
(1542, 'L_IMPORT', 'Import', 'Import'),
(1543, 'L_SETTINGS', 'Settings', 'Settings'),
(1544, 'L_IMPORT_XLS_XLSX_OR_ODS_FILE', 'Import from a XLS, XLSX or ODS spreadsheet file', 'Import from a XLS, XLSX or ODS spreadsheet file'),
(1545, 'L_SPREADSHEET_CAN_HAVE_ONLY_PRODUCTS', 'Spreadsheet can have products only.', 'Spreadsheet can have products only.'),
(1546, 'L_DO_EXPORT_FIRST_FOR_FORMAT', 'Do an Export first to see the exact format of the worksheets!', 'Do an Export first to see the exact format of the worksheets!'),
(1547, 'L_UPDATE_AND_OR_ADD_DATA', 'Update and/or add data', 'Update and/or add data'),
(1548, 'L_NO', 'No', 'No'),
(1549, 'L_DELETE_ALL_OLD_DATA', 'Delete all old data before Import', 'Delete all old data before Import'),
(1550, 'L_FILE_TO_BE_UPLOADED', 'File to be uploaded', 'File to be uploaded'),
(1551, 'L_UPDATE', 'Update', 'Update'),
(1552, 'L_BULK_IMPORT_EXPORT_SETTINGS', 'Bulk Import Export Settings', 'Bulk Import Export Settings'),
(1553, 'M_BULK_IMPORT_EXPORT', 'Bulk Export/Import', 'Bulk Export Import'),
(1554, 'L_INVALID_COLOUMS_IN_UPLOADED_FILE', 'Invalid Coloums In Uploaded File', 'Invalid Coloums In Uploaded File'),
(1555, 'L_IMPORT_SUCCESSFULLY', 'Import Successfully', 'Import Successfully'),
(1556, 'L_YOUR_CHANGES_RELATED_PRODUCT_IMAGES', 'Note: Your changes related to product images will be saved instantly, no need to click on "Save Changes" button at the bottom.', 'Note: Your changes related to product images will be saved instantly, no need to click on "Save Changes" button at the bottom.'),
(1557, 'M_DELIVERY', 'Delivery', 'Delivery'),
(1558, 'M_PLACE_ORDER', 'Place Order', 'Place Order'),
(1559, 'M_SOMETHING_WRONG_WITH_ORDER', 'Something wrong with the order details, please refresh the page and check.', 'Something wrong with the order details, please refresh the page and check.'),
(1560, 'L_WARNING_ORDER_INVALID', 'Warning: Some changes occurred corresponding to your cart, please reload the  page and proceed with the payments.', 'Warning: Some changes occurred corresponding to your cart, please reload the  page and proceed with the payments.'),
(1561, 'M_PREFERRED_DASHBOARD', 'Preferred Dashboard', 'Preferred Dashboard'),
(1562, 'M_BUYER', 'Buyer', 'Buyer'),
(1563, 'M_SUPPLIER', 'Supplier', 'Supplier'),
(1564, 'M_REMOVE_PHOTO', 'Remove Photo', 'Remove Photo'),
(1565, 'M_SHOP_LOGO_EXTENSIONS', 'Upload a .jpg, .gif or .png. This will be displayed in 165 x 165 on your store.', 'Upload a .jpg, .gif or .png. This will be displayed in 165 x 165 on your store.'),
(1566, 'M_ERROR_INVALID_FILETYPE', 'File has an invalid extension, it should one of png, gif, jpg, jpeg.', 'File has an invalid extension, it should one of png, gif, jpg, jpeg.'),
(1567, 'L_ADD_TO_LIST', 'Add to List', 'Add to List'),
(1568, 'M_CANCEL', 'Cancel', 'Cancel'),
(1569, 'M_SHOP_BASIC_INFORMATION', 'Basic Information', 'Basic Information'),
(1570, 'M_SHOP_ADDRESS', 'Shop Address', 'Shop Address'),
(1571, 'L_SHOP_ADDRESS_TEXT', 'Please provide address and contact person information of your shop.', 'Please provide address and contact person information of your shop.'),
(1572, 'F_CONTACT_PERSON_NAME', 'Contact Person Name', 'Contact Person Name'),
(1573, 'M_SHOP_POLICIES', 'Shop Policies [Optional]', 'Shop Policies [Optional]'),
(1574, 'M_SHOP_SEO_INFORMATION', 'Shop SEO Information [Optional]', 'Shop SEO Information [Optional]'),
(1577, 'L_PICKUP_DISPATCH_ADDRESS_1', 'Address Line 1', 'Address Line 1'),
(1578, 'L_PICKUP_DISPATCH_ADDRESS_2', 'Address Line 2', 'Address Line 2'),
(1579, 'M_PHONE', 'Phone', 'Phone'),
(1580, 'M_SEARCH_OPTION', 'Search Option', 'Search Option'),
(1581, 'M_IS_REQUIRED', 'Is Required', 'Is Required'),
(1582, 'M_IS_REQUIRED_INFO', 'Please keep it Yes - if you want buyers to select at least one of the options or enter some value in this option group.', 'Please keep it Yes - if you want buyers to select at least one of the options or enter some value in this option group.'),
(1583, 'M_PRODUCT_SETUP_INFO', 'Product Setup Info', 'Product Setup Info'),
(1584, 'L_STEP_1', 'Step 1', 'Step 1'),
(1585, 'M_SEARCH_OPTION_GROUPS', 'Search Option Groups', 'Search Option Groups'),
(1586, 'L_STEP_2', 'Step 2', 'Step 2'),
(1587, 'L_SELECT_OPTIONS', 'Select options from below', 'Select options from below'),
(1588, 'M_CLICK_PLUS_TO_ADD_MORE_OPTIONS', 'Click + to add more options', 'Click + to add more options'),
(1589, 'L_OPTIONS', 'Options', 'Options'),
(1590, 'L_SEO', 'SEO', 'SEO'),
(1591, 'M_YOKART_PAYMENT', 'YoKart Payment', 'YoKart Payment'),
(1593, 'M_SHIPPING_INFO_CHARGES', 'Shipping Info/Charges', 'Shipping Info/Charges'),
(1594, 'L_FREE_SHIPPING_RETURNS_ALL_ORDERS', 'FREE SHIPPING & RETURNS ON ALL ORDERS', 'FREE SHIPPING & RETURNS ON ALL ORDERS'),
(1595, 'L_CONFIRM_PAYMENT', 'Confirm Payment', 'Confirm Payment'),
(1596, 'STRIPE_TEST_MODE_ON', 'TEST MODE ON', 'TEST MODE ON'),
(1597, 'AMAZON_INVALID_PAYMENT_GATEWAY_SETUP_ERROR', 'INVALID PAYMENT GATEWAY SETUP ERROR', 'INVALID PAYMENT GATEWAY SETUP ERROR'),
(1598, 'M_ADD_YOUR_OWN_TAG', 'Add Your Own Tag', 'Add Your Own Tag'),
(1599, 'F_TAG_NAME', 'Tag Name', 'Tag Name'),
(1600, 'L_CREATE_YOUR_OWN_PRODUCT_TAG', 'Create Your Own Product Tag', 'Create Your Own Product Tag'),
(1601, 'L_PRODUCT_TAG_ADDED_SUCCESSFULLY', '%s added to the system.', '%s added to the system.'),
(1602, 'L_ERROR_PRODUCT_TAG_ALREADY_EXISTS', 'Error: Product tag already exists.', 'Error: Product tag already exists.'),
(1603, 'L_RECOMMENDED_PRODUCTS', 'Recommended Products', 'Recommended Products'),
(1604, 'L_RECOMMENDED_PRODUCTS_FOR_YOU', 'Recommended Products For You', 'Recommended Products For You'),
(1605, 'L_SIGNUP_DETAILS', 'Signup Details', 'Signup Details'),
(1606, 'L_CONFIRMATION', 'Confirmation', 'Confirmation'),
(1607, 'L_THANKYOU', 'Thank You!', 'Thank You!'),
(1608, 'L_YOU_HAVE_REGISTERED_SUCCESSFULLY', 'You have been successfully registered to the %s.', 'You have been successfully registered to the %s.'),
(1609, 'L_PLEASE_CHECK_YOUR_EMAIL', 'Please check your mail to activate your profile.', 'Please check your mail to activate your profile.'),
(1610, 'M_DO_NOT_REGISTER_AS_SUPPLIER', 'I do not want to register as SELLER', 'I do not want to register as SELLER'),
(1611, 'M_SIGNUP_AS_BUYER', 'Sign me up as BUYER only', 'Sign me up as BUYER only'),
(1612, 'M_DELETE_MY_ACCOUNT', 'Delete my account', 'Delete my account'),
(1613, 'L_ARE_YOU_SURE_DELETE_ACCOUNT', 'Are you sure to delete your account?', 'Are you sure to delete your account?'),
(1614, 'M_YOUR_ACCOUNT_SUCCESSFULLY_DELETED', 'Your account has been successfully deleted. Looking forward to see you again.', 'Your account has been successfully deleted. Looking forward to see you again.'),
(1615, 'M_ERROR_COMPLETE_REGISTRATION', 'Error: Your registration has not completed yet , please %s to complete your registration or view your application status.', 'Error: Your registration has not completed yet , please %s to complete your registration or view your application status.'),
(1616, 'M_YOUR_ACCOUNT_SUCCESSFULLY_REGISTERED_AS_BUYER', 'Your account successfully registered as buyer', 'Your account successfully registered as buyer'),
(1617, 'L_BACK_TO_HOME_PAGE', 'Back to home page', 'Back to home page'),
(1618, 'L_SUBMIT_REVISED_REQUEST', 'Submit Revised Request', 'Submit Revised Request'),
(1619, 'M_YOU_HAVE_ALREADY_CONSUMED_MAX_ATTEMPTS', 'You have already consumed the maximum number of attempts to submit revised requests.', 'You have already consumed the maximum number of attempts to submit revised requests.'),
(1620, 'M_PLEASE_LOGIN_WITH_BUYER_ACCOUNT', 'You are not logged in with buyer account currently, please login/signup as a buyer to checkout.', 'You are not logged in with buyer account currently, please login/signup as a buyer to checkout.'),
(1621, 'M_SELLER', 'Seller', 'Seller'),
(1622, 'M_YOUR_SUPPLIER_ACCOUNT_APPROVED', 'Your request for supplier has been received and approved, please feel free to login in to the system with your account details and start selling.', 'Your request for supplier has been received and approved, please feel free to login in to the system with your account details and start selling.'),
(1623, 'L_DURATION', 'Duration', 'Duration'),
(1624, 'L_EARNINGS', 'Earnings', 'Earnings'),
(1625, 'L_SALES_EARNINGS_LAST_12_MONTHS', 'Sales Earnings Last 12 Months', 'Sales Earnings Last 12 Months'),
(1626, 'L_SALES_EARNINGS', 'Sales Earnings', 'Sales Earnings'),
(1627, 'L_SELLER_REGISTRATION', 'Seller Registration', 'Seller Registration'),
(1631, 'L_GET_YOUR_BUSINESS_ONLINE', 'Get Your Business Online in 5 Minutes', 'Get Your Business Online'),
(1633, 'L_REGISTER_YOUR_ACCOUNT_NOW', 'REGISTER YOUR ACCOUNT NOW', 'REGISTER YOUR ACCOUNT NOW'),
(1634, 'L_OPEN_YOUR_SHOP', 'OPEN YOUR SHOP', 'OPEN YOUR SHOP'),
(1635, 'L_START_SELLING_GROW_YOUR_BUSINESS', 'START SELLING. GROW YOUR SALES.', 'START SELLING. GROW YOUR SALES.'),
(1636, 'M_PAYMENT_INFORMATION_TEXT', 'Payment Information', 'Payment Information'),
(1637, 'M_PAYPAL_ACCOUNT_DETAILS', 'Paypal account email', 'Paypal account email'),
(1638, 'M_PAYPAL_ACCOUNT_TEXT', 'Please enter your paypal account address where you wish to receive payments.', 'Please enter your paypal account address where you wish to receive payments.'),
(1639, 'L_Amount_Paid_Through_PayPal_Adaptive', 'Amount corresponding to invoice number %s is transferred to your Paypal account. Paypal transaction ID: %s', 'Amount corresponding to invoice number %s is transferred to your Paypal account. Paypal transaction ID: %s'),
(1640, 'M_PROMOTE', 'Promote', 'Promote'),
(1641, 'L_MY_PROMOTIONS', 'My Promotions', 'My Promotions'),
(1642, 'L_PROMOTE_PRODUCT', 'Promote Product', 'Promote Product'),
(1643, 'L_PROMOTE_SHOP', 'Promote Shop', 'Promote Shop'),
(1644, 'L_PROMOTE_BANNER', 'Promote Banner', 'Promote Banner'),
(1645, 'M_BUDGET', 'Budget', 'Budget'),
(1646, 'M_START_DATE', 'Start Date', 'Start Date'),
(1647, 'M_END_DATE', 'End Date', 'End Date'),
(1648, 'L_DAILY', 'Daily', 'Daily'),
(1649, 'L_WEEKLY', 'Weekly', 'Weekly'),
(1650, 'L_MONTHLY', 'Monthly', 'Monthly'),
(1651, 'M_DURATION', 'Duration', 'Duration'),
(1652, 'M_PREFERRED_START_TIME', 'Preferred Start Time', 'Preferred Start Time'),
(1653, 'M_PREFERRED_END_TIME', 'Preferred End Time', 'Preferred End Time'),
(1654, 'M_PROMOTION_ADDED_UPDATED', 'Promotion added/updated successfully.', 'Promotion added/updated successfully.'),
(1655, 'M_PLEASE_SELECT_VALID_PRODUCT_PROMOTION', 'Please select valid product for promotion.', 'Please select valid product for promotion.'),
(1656, 'M_BANNER_FILE', 'Banner File', 'Banner File'),
(1657, 'M_BANNER_URL', 'Banner URL', 'Banner URL'),
(1658, 'M_BANNER_TARGET', 'Banner Target', 'Banner Target'),
(1659, 'M_SELF', 'Self', 'Self'),
(1660, 'M_BLANK', 'Blank', 'Blank'),
(1661, 'L_BACK_TO_PROMOTIONS', 'Back to Promotions', 'Back to Promotions'),
(1662, 'L_CPC', 'CPC', 'CPC'),
(1663, 'L_BUDGET', 'Budget', 'Budget'),
(1664, 'L_CLICKS', 'Clicks', 'Clicks'),
(1665, 'L_ORDERS', 'Orders', 'Orders'),
(1666, 'L_PERIOD', 'Period', 'Period'),
(1667, 'M_PROMOTION_UPDATED_SUCCESSFULLY', 'Promotion Updated Successfully.', 'Promotion Updated Successfully.'),
(1668, 'M_PRODUCT_ADDONS', 'Product Addons', 'Product Addons'),
(1669, 'M_MAX_PRODUCT_ADDONS_SELECTED', 'Maximum %d add-ons can be selected for a particular product.', 'Maximum %d add-ons can be selected for a particular product.'),
(1670, 'M_Please_select_valid_shop_promotion', 'Please select valid shop for promotion.', 'Please select valid shop for promotion.'),
(1671, 'M_NEW_LIST', 'New List', 'New List'),
(1672, 'L_SEARCH_TEXT', 'Search Text', 'Search Text'),
(1673, 'L_CONTRIBUTE', 'Contribute', 'Contribute'),
(1674, 'L_NO_BLOG_POST_FOUND_WITH_SEARCH_CRITERIA!!', 'No Blog Post Found With Search Criteria!!', 'No Blog Post Found With Search Criteria!!'),
(1675, 'L_TRY_TO_SEARCH_WITH_DIFFERENT_KEYWORD', 'Try To Search With Different Keyword', 'Try To Search With Different Keyword'),
(1676, 'L_BACK_TO_BLOG', 'Back To Blog', 'Back To Blog'),
(1677, 'L_ARCHIVES', 'Archives', 'Archives'),
(1678, 'L_RECENT_POSTS', 'Recent Posts', 'Recent Posts'),
(1679, 'L_TOTAL_VIEWS', 'Total Views', 'Total Views'),
(1680, 'L_CLICK_TO_CONTINUE..', 'Click to Continue..', 'Click to Continue..'),
(1681, 'L_NAME*', 'Name*', 'Name*'),
(1682, 'L_EMAIL*', 'Email*', 'Email*'),
(1683, 'L_SECURITY_CODE', 'Security Code', 'Security Code'),
(1684, 'L_SECURITY_CODE*', 'Security Code*', 'Security Code*'),
(1685, 'L_COMMENT', 'Comment', 'Comment'),
(1686, 'L_COMMENT*', 'Comment*', 'Comment*'),
(1687, 'L_VIEWS', 'Views', 'Views'),
(1688, 'L_PRODUCT_CONTAINS_ADDONS', '%s contains some add-ons, please add this product through detail page by clicking here.', '%s contains some add-ons, please add this product through detail page by clicking here.'),
(1689, 'L_PRODUCT_CONTAINS_REQUIRED_COMBINATIONS', '%s contains some required combinations, please add this product through detail page by <a href="%s">clicking here</a>.', '%s contains some required combinations, please add this product through detail page by <a href="%s">clicking here</a>.'),
(1690, 'L_PLEASE_CLICK_HERE_TO_SIGNUP_SELLER', 'Please %s to register as a seller.', 'Please %s to register as a seller.'),
(1691, 'L_PAYPAL_ACCOUNT_ALREADY_EXISTS', 'Paypal account already exists in our records.', 'Paypal account already exists in our records.'),
(1692, 'L_PAYPAL_ACCOUNT_NOT_VERIFIED', 'Your account is not verified on PayPal. Please enter PayPal verified account address.', 'Your account is not verified on PayPal. Please enter PayPal verified account address.'),
(1693, 'M_FILE_UPLOADED_SUCCESSFULLY', '''%s'' file uploaded successfully.', '''%s'' file uploaded successfully.'),
(1694, 'M_REQUEST_ALREADY_EXISTS', 'This request already exists in our system with status <i>%s</i>', 'This request already exists in our system with status <i>%s</i>'),
(1695, 'M_ERROR_PAYPAL_ACCOUNT_VERIFIED', 'Error: Please enter verified paypal account corresponding to your shop.', 'Error: Please enter verified paypal account corresponding to your shop.'),
(1696, 'L_AUTHOR', 'Author', 'Author'),
(1697, 'L_ADD_YOUR_COMMENT', 'Add Your Comment', 'Add Your Comment'),
(1698, 'L_COMMENTS:', 'Comments:', 'Comments:'),
(1699, 'L_FIRST_NAME', 'First Name', 'First Name'),
(1700, 'L_FIRST_NAME*', 'First Name*', 'First Name*'),
(1701, 'L_LAST_NAME', 'Last Name', 'Last Name'),
(1702, 'L_LAST_NAME*', 'Last Name*', 'Last Name*'),
(1703, 'L_EMAIL_ADDRESS*', 'Email Address*', 'Email Address*'),
(1704, 'L_PHONE_NO', 'Phone No', 'Phone No'),
(1705, 'L_PHONE_NO.', 'Phone No.', 'Phone No.'),
(1706, 'L_UPLOAD_FILE', 'Upload File', 'Upload File'),
(1707, 'L_CONTRIBUTION_FORM', 'Contribution Form', 'Contribution Form'),
(1708, 'M_DELIVERY_CHARGES', 'Delivery Charges', 'Delivery Charges'),
(1709, 'M_ERROR_VALID_FILES_FOR_BLOG_CONTRIBUTION', 'Please provide valid file for contribution', 'Please provide valid file for contribution. and file size must not exceed 2 MB.'),
(1710, 'M_SUCCESS_DETAILS_SAVED', 'SUCCESS DETAILS SAVED', 'SUCCESS DETAILS SAVED'),
(1711, 'M_SUCCESS_COMMENT_SAVED', 'SUCCESS COMMENT SAVED', 'SUCCESS COMMENT SAVED'),
(1712, 'M_ERROR_BLOG_POST_FILE_SIZE', 'ERROR BLOG POST FILE SIZE', 'ERROR BLOG POST FILE SIZE'),
(1713, 'L_SKU', 'SKU', 'SKU'),
(1714, 'M_ERROR_BLOG_POST_FILE_EXTENSION', 'ERROR BLOG POST FILE EXTENSION', 'ERROR BLOG POST FILE EXTENSION'),
(1715, 'L_ENTER_AMOUNT_TO_BE_ADDED', 'Enter Amount to be Added', 'Enter Amount to be Added'),
(1716, 'L_INVALID_AMOUNT', 'Invalid Amount', 'Invalid Amount'),
(1717, 'L_ADD_MONEY_TO_WALLET', 'Add Money to Wallet', 'Add Money to Wallet'),
(1718, 'L_PAYABLE_AMOUNT', 'Payable Amount', 'Payable Amount'),
(1719, 'L_TXN_INVOICE', 'Txn Invoice', 'Txn Invoice'),
(1720, 'M_CUSTOMER_FAILURE_WALLET_RECHARGE', '<p>There was a problem processing your payment and the transaction did not complete.</p>\n<p>Please try to add funds again, If the problem persists please <a href="%s">contact us</a> with the details of the transaction you are trying to place.</p>', '<p>There was a problem processing your payment and the transaction did not complete.</p>\n<p>Please try to add funds again, If the problem persists please <a href="%s">contact us</a> with the details of the transaction you are trying to place.</p>'),
(1721, 'M_CUSTOMER_SUCCESS_WALLET_RECHARGE', '<p>Your request to add funds has been successfully processed! You can view your credits history by clicking on <a href="%s">credits</a>.</p>', '<p>Your request to add funds has been successfully processed! You can view your credits history by clicking on <a href="%s">credits</a>.</p>'),
(1722, 'L_RECHARGE_TXN_PLACED_NUMBER', 'Add funds request, Invoice Number %s', 'Add funds request, Invoice Number %s'),
(1723, 'L_RETURN_BACK_TO_MY_ACCOUNT', 'Return Back to My Account', 'Return Back to My Account'),
(1724, 'L_TXN_INVOICE_NUMBER', 'Txn Invoice Number', 'Txn Invoice Number'),
(1725, 'M_TRANSFER_FUND_BANK', 'Please transfer the funds to our bank and we will add funds to your wallet.', 'Please transfer the funds to our bank and we will add funds to your wallet.'),
(1726, 'M_INVALID_WALLET_REQUEST_PAID_CANCELLED', 'Warning: This is an invalid add funds request.', 'Warning: This is an invalid add funds request.'),
(1727, 'M_WALLET_RECHARGE_PAYMENT_GATEWAY_DESCRIPTION', 'Add Funds Request on %s, Invoice Number %s', 'Add Funds Request on %s, Invoice Number %s'),
(1728, 'L_ADVERTISE_WITH_US', 'Advertise With Us', 'Advertise With Us'),
(1729, 'L_ADVERTISE_WITH_US_PAGE_DESCRIPTION', '%s advertising offers a great value to brands with the ability to target their commertial messaging using different categories and search keywords.\n\nOur Advertising Platform provides an in-depth knowledge of e-commerce audience. This will help you to connect with our exclusive user base through various Advertising models like Standard Banners.', '%s advertising offers a great value to brands with the ability to target their commertial messaging using different categories and search keywords.\n\nOur Advertising Platform provides an in-depth knowledge of e-commerce audience. This will help you to connect with our exclusive user base through various Advertising models like Standard Banners.');
INSERT INTO `tbl_language_labels` (`label_id`, `label_key`, `label_caption_en`, `label_caption_es`) VALUES
(1730, 'L_NEW_ADVERTISER', 'New Advertiser', 'New Advertiser'),
(1731, 'L_CURRENTLY_NOT_ADVERTISER', 'I am not currently an advertiser.', 'I am not currently an advertiser.'),
(1732, 'L_CLICK_BELOW_CREATE_ADVERTISER_ACCOUNT', 'Click "Continue" button below to create a new advertiser account. Please note that this is not connected in any way to your customer account.', 'Click "Continue" button below to create a new advertiser account. Please note that this is not connected in any way to your customer account.'),
(1733, 'L_ADVERTISER_LOGIN', 'Advertiser Login', 'Advertiser Login'),
(1734, 'L_RETURNING_ADVERTISER', 'I am a returning advertiser.', 'I am a returning advertiser.'),
(1735, 'L_BRIEF_PROFILE', 'Brief Profile', 'Brief Profile'),
(1736, 'L_WHAT_KIND_PRODUCTS_SERVICES_ADVERTISE', 'What kind of products/services you wish to advertise?', 'What kind of products/services you wish to advertise?'),
(1737, 'L_PLEASE_TELL_US_SOMETHING_ABOUT_YOURSELF', 'Please tell us something about yourself', 'Please tell us something about yourself'),
(1738, 'L_ALREADY_HAVE_ADVERTISER_ACCOUNT', 'If you already have an account with us, please login at the %s.', 'If you already have an account with us, please login at the %s.'),
(1739, 'L_TO_CREATE_AN_ADVERTISER_ACCOUNT', 'To create an advertiser account, fill in the form below ensuring you complete all the required fields:', 'To create an advertiser account, fill in the form below ensuring you complete all the required fields:'),
(1740, 'L_ADVERTISER_ACCOUNT_MUST_APPROVED', 'ADVERTISER ACCOUNT MUST APPROVED', 'ADVERTISER ACCOUNT MUST APPROVED'),
(1741, 'L_ADVERTISER_REGISTERED_SUCCESSFULLY', 'Advertiser Registered Successfully', 'Advertiser Registered Successfully'),
(1742, 'L_ADVERTISER_ACCOUNT_REGISTRATION_SUCCESS_MESSAGE', 'Congratulations! Your new account has been successfully created!\n\nYou are now a member of %s advertisers.\n\nIf you have ANY questions about the operation of this advertise with us system, please e-mail the store owner.\n\nA confirmation has been sent to the provided e-mail address. If you have not received it within the hour, please contact us.', 'Congratulations! Your new account has been successfully created!\n\nYou are now a member of %s advertisers.\n\nIf you have ANY questions about the operation of this advertise with us system, please e-mail the store owner.\n\nA confirmation has been sent to the provided e-mail address. If you have not received it within the hour, please contact us.'),
(1743, 'L_ADVERTISER_ACCOUNT_CREATED', 'YOUR ADVERTISER ACCOUNT HAS BEEN CREATED', 'YOUR ADVERTISER ACCOUNT HAS BEEN CREATED'),
(1744, 'L_ADVERTISER_ACCOUNT_REGISTRATION_APPROVAL_MESSAGE', 'Thank you for registering for an advertiser account with %s!\n\nYou will be notified by e-mail once your account has been activated by the admin.\n\nIf you have ANY questions about the operation of this advertise with us system, please <a href="%s">contact the admin</a>.', 'Thank you for registering for an advertiser account with %s!\n\nYou will be notified by e-mail once your account has been activated by the admin.\n\nIf you have ANY questions about the operation of this advertise with us system, please <a href="%s">contact the admin</a>.'),
(1745, 'L_ADVERTISER_USERNAME_OR_EMAIL', 'Advertiser Username or Email', 'Advertiser Username or Email'),
(1746, 'L_ADVERTISER_PASSWORD', 'Advertiser Password', 'Advertiser Password'),
(1747, 'F_BACK_TO_ADVERTISER_LOGIN', 'Back to Advertiser Login', 'Back to Advertiser Login'),
(1748, 'L_DISABLE', 'Disable', 'Disable'),
(1749, 'L_PROMOTE_REQUEST_MINIMUM_BALANCE_LESS', 'Your account balance has to be greater than %s to start a promotion.', 'Your account balance has to be greater than %s to start a promotion.'),
(1750, 'M_COST_PER_CLICK', 'Cost Per Click', 'Cost Per Click'),
(1751, 'L_ANALYTICS', 'Analytics', 'Analytics'),
(1752, 'L_IMPRESSIONS', 'Impressions', 'Impressions'),
(1753, 'L_PROMOTION_ANALYTICS', 'Promotion Analytics', 'Promotion Analytics'),
(1754, 'M_CHARGES_FROM_PROMOTION_WALLET', 'Note: Charges for promotions will be settled from your wallet, so please keep it sufficiently funded.', 'Note: Charges for promotions will be settled from your wallet, so please keep it sufficiently funded.'),
(1755, 'M_MY_WALLET', 'My Wallet', 'My Wallet'),
(1756, 'L_MY_WALLET', 'My Wallet', 'My Wallet'),
(1757, 'M_PROMOTION_ALREADY_EXISTS', 'Promotion already exists in selected date range.', 'Promotion already exists in selected date range.'),
(1758, 'M_BANNER_POSITION', 'Banner Position', 'Banner Position'),
(1759, 'M_TOP_BANNER', 'Top Banner', 'Top Banner'),
(1760, 'M_BOTTOM_LEFT', 'Bottom Left', 'Bottom Left'),
(1761, 'M_BOTTOM_RIGHT_UPPER', 'Bottom Right Upper', 'Bottom Right Upper'),
(1762, 'M_BOTTOM_RIGHT_LOWER', 'Bottom Right Lower', 'Bottom Right Lower'),
(1763, 'M_PLEASE_ENTER_URL', 'Please enter website URL here. Example -', 'Please enter website URL here. Example -'),
(1764, 'M_SELECT', 'Select', 'Select'),
(1765, 'M_BOTTOM_LEFT_UPPER', 'Bottom Left Upper', 'Bottom Left Upper'),
(1766, 'M_BOTTOM_LOWER', 'Bottom Lower', 'Bottom Lower'),
(1767, 'L_PROMOTION_MINIMUM_BALANCE_LESS', '*** Your wallet balance balance has to be greater than %s to keep this promotion active.', '*** Your wallet balance balance has to be greater than %s to keep this promotion active.'),
(1768, 'M_CHARGES_FOR_PROMOTION_FROM_DURATION', 'Charges for Promotion ID %s from %s to %s for <b>%d</b> click(s).', 'Charges for Promotion ID %s from %s to %s for <b>%d</b> click(s).'),
(1769, 'M_PROMOTIONS', 'Promotions', 'Promotions'),
(1770, 'L_IP_ADDRESS', 'IP Address', 'IP Address'),
(1771, 'L_SN', 'SN', 'SN'),
(1772, 'M_TOP', 'Top', 'Top'),
(1773, 'M_BOTTOM', 'Bottom', 'Bottom'),
(1774, 'L_PROMOTIONS_LIST', 'Promotions List', 'Promotions List'),
(1775, 'L_ADD_PROMOTION', 'Add Promotion', 'Add Promotion'),
(1776, 'L_LATEST_X_PROMOTIONS', 'Latest %d Promotions', 'Latest %d Promotions'),
(1777, 'M_YOUR_ACCOUNT_SUMMARY', 'Your Account Summary', 'Your Account Summary'),
(1778, 'L_WITHDRAWABLE_BALANCE', 'Withdrawable Balance', 'Withdrawable Balance'),
(1779, 'L_WITHDRAWABLE_BALANCE_DESC', '<b>Withdrawable Balance</b>: Your current balance reduced by unsettled PPC charges.', '<b>Withdrawable Balance</b>: Your current balance reduced by unsettled PPC charges.'),
(1780, 'L_RELEVANCE', 'Relevance', 'Relevance'),
(1781, 'M_BANNER_NAME', 'Banner Name', 'Banner Name'),
(1782, 'L_CLEAR', 'Clear', 'Clear'),
(1783, 'M_ERROR_BLOG_POST_FILE_SIZE', 'Image size must be less than 2 MB and greater than 5 KB.', 'Image size must be less than 2 MB and greater than 5 KB.'),
(1784, 'M_ERROR_BLOG_POST_FILE_EXTENSION', 'Image format not recognized. Please try with jpg, jpeg, gif or png file.', 'Image format not recognized. Please try with jpg, jpeg, gif or png file.'),
(1785, 'L_Contribute', 'Contribute', 'Contribute'),
(1786, 'L_Categories', 'Categories', 'Categories'),
(1787, 'L_Archives', 'Archives', 'Archives'),
(1788, 'L_Recent_Posts', 'Recent Posts', 'Recent Posts'),
(1789, 'L_Comments', 'Comments', 'Comments'),
(1790, 'L_Comments:', 'Comments:', 'Comments:'),
(1791, 'L_Contribution_Form', 'Contribution Form', 'Contribution Form'),
(1792, 'L_Views', 'Views', 'Views'),
(1793, 'L_Total_Views', 'Total Views', 'Total Views'),
(1794, 'L_Author', 'Author', 'Author'),
(1795, 'L_Add_Your_Comment', 'Add Your Comment', 'Add Your Comment'),
(1796, 'L_No_Blog_Post_Found_With_Search_Criteria!!', 'No Blog Post Found With Search Criteria!!', 'No Blog Post Found With Search Criteria!!'),
(1797, 'L_Try_To_Search_With_Different_Keyword', 'Try To Search With Different Keyword', 'Try To Search With Different Keyword'),
(1798, 'L_Back_To_Blog', 'Back To Blog', 'Back To Blog'),
(1799, 'L_Click_to_Continue..', 'Click to Continue..', 'Click to Continue..'),
(1800, 'M_INVALID_REQUEST', 'Error: Invalid Request !!', 'Error: Invalid Request !!'),
(1801, 'L_Search_Text', 'Search Text', 'Search Text'),
(1802, 'L_Search', 'Search', 'Search'),
(1803, 'M_ERROR_INVALID_REQUEST', 'Invalid Request', 'Invalid Request'),
(1804, 'M_ERROR_PLEASE_VERIFY_YOURSELF', 'Please verify yourself through captcha.', 'Please verify yourself through captcha.'),
(1805, 'M_ERROR_FILE_SIZE_SHOULD_NOT_EXCEED_{VAR}_MB', 'File size must not exceed {VAR} MB.', 'File size must not exceed {VAR} MB.'),
(1806, 'M_SUCCESS_DETAILS_SAVED', 'Success: Details Saved Successfully.', 'Success: Details Saved Successfully.'),
(1807, 'M_ERROR_DETAILS_NOT_SAVED', 'Details not saved, please try again.', 'Details not saved, please try again.'),
(1808, 'M_ERROR_VALID_FILES_FOR_BLOG_CONTRIBUTION', 'Please provide valid file for contribution.', 'Please provide valid file for contribution.'),
(1809, 'M_ERROR_COULD_NOT_SAVE_FILE', 'Error: Could not save file!', 'Error: Could not save file!'),
(1810, 'L_First_Name', 'First Name', 'First Name'),
(1811, 'L_Last_Name', 'Last Name', 'Last Name'),
(1812, 'L_Email_Address', 'Email Address', 'Email Address'),
(1813, 'L_Phone_No', 'Phone No', 'Phone No'),
(1814, 'L_Upload_File', 'Upload File', 'Upload File'),
(1815, 'L_Submit', 'Submit', 'Submit'),
(1816, 'L_Name', 'Name', 'Name'),
(1817, 'L_Email', 'Email', 'Email'),
(1818, 'L_Comment', 'Comment', 'Comment'),
(1819, 'M_SUCCESS_COMMENT_SAVED', 'Success: Comment saved successfully!', 'Success: Comment saved successfully!'),
(1820, 'M_ERROR_COMMENT_NOT_SAVED', 'Error: Comment not saved!', 'Error: Comment not saved!'),
(1821, 'L_VIEW_TAG_PRODUCTS', 'View Tag Products', 'View Tag Products'),
(1822, 'M_PREMIUM', 'Premium', 'Premium'),
(1823, 'M_OPTION_QUANTITY_ERROR', 'Error: Please keep sum of product''s qty in a set of options combination equal to or less than total available product''s qty.', 'Error: Please keep sum of product''s qty in a set of options combination equal to or less than total available product''s qty.'),
(1824, 'M_ERROR_OWN_STORE', 'Products marked with &#9940; are from your own store. Buying products from your own store is not allowed.', 'Products marked with â›” are from your own store. Buying products from your own store is not allowed.'),
(1825, 'M_SPECIFICATION', 'Specification', 'Specification'),
(1826, 'L_BANNER', 'Banner', 'Banner'),
(1827, 'L_MY_PROMOTION_CLICKS', 'My Promotion clicks', 'My Promotion clicks'),
(1828, 'M_PLEASE_SELECT_VALID_BANNER_FILE_FOR_PROMOTION', 'Please select valid banner file for promotion', 'Please select valid banner file for promotion'),
(1829, 'L_TIME_SLOT', 'Time Slot', 'Time Slot'),
(1830, 'L_TIME', 'Time', 'Time'),
(1831, 'M_DAYS', 'Days', 'Days'),
(1832, 'M_PACKAGES', 'Packages', 'Packages'),
(1833, 'M_STARTING_AT_ONLY', 'Starting At Only', 'Starting At Only'),
(1834, 'M_ACTIVE_PRODUCTS', 'Active Products', 'Active Products'),
(1835, 'M_IMAGES_PER_PRODUCT', 'Images Per Product', 'Images Per Product'),
(1836, 'M_FREE_TRIAL', 'Free Trial', 'Free Trial'),
(1837, 'M_SELECT_YOUR_PACKAGE', 'Select your package', 'Select your package'),
(1838, 'M_CHANGE_PLAN', 'Change Plan', 'Change Plan'),
(1839, 'L_INVALID_REQUEST!', 'Invalid Request!', 'Invalid Request!'),
(1840, 'M_SUBSCRIPTION_CHECKOUT', 'Subscription Checkout', 'Subscription Checkout'),
(1841, 'M_SUBSCRIPTION_NAME', 'Subscription Name', 'Subscription Name'),
(1842, 'M_CREDITS_CHARGED', 'Credits charged', 'Credits charged'),
(1843, 'F_SELECT_SUBPACKAGE', 'SELECT SUBPACKAGE', 'SELECT SUBPACKAGE'),
(1844, 'L_MY_SUBSCRIPTIONS', 'My Subscriptions', 'My Subscriptions'),
(1845, 'L_DE-ACTIVATE_AUTO-RENEWAL', 'De-Activate Auto-Renewal', 'De-Activate Auto-Renewal'),
(1846, 'L_DEACTIVATE_SUBSCRIPTION', 'Deactivate Subscription', 'Deactivate Subscription'),
(1847, 'L_REFUND_SUBSCRIPTION', 'Refund Subscription', 'Refund Subscription'),
(1848, 'L_CHANGE_PLAN', 'Change Plan', 'Change Plan'),
(1849, 'L_BACK_TO_SUBSCRIPTIONS', 'Back to Subscriptions', 'Back to Subscriptions'),
(1850, 'L_SUBSCRIPTION_ID', 'Subscription ID', 'Subscription ID'),
(1851, 'L_SUBSCRIPTION_NAME', 'Subscription Name', 'Subscription Name'),
(1852, 'L_ADDED_ON', 'Added on', 'Added on'),
(1853, 'L_SUBSCRIPTION_PERIOD', 'Subscription Period', 'Subscription Period'),
(1854, 'L_SUBSCRIPTION_AMOUNT', 'Subscription Amount', 'Subscription Amount'),
(1855, 'L_SUBSCRIPTION_STATUS', 'Subscription Status', 'Subscription Status'),
(1856, 'L_PROFILE_REFERENCE', 'Profile Reference', 'Profile Reference'),
(1857, 'L_PRODUCTS_UPLOAD_LIMIT', 'Products upload Limit', 'Products upload Limit'),
(1858, 'L_TRANSACTIONS', 'Transactions', 'Transactions'),
(1859, 'L_TXN._ID', 'Txn. ID', 'Txn. ID'),
(1860, 'L_PAYMENT_GATEWAY_TXN._ID', 'Payment Gateway Txn. ID', 'Payment Gateway Txn. ID'),
(1861, 'L_RECURRING_TYPE', 'Recurring Type', 'Recurring Type'),
(1862, 'M_ORDER_NOW', 'Order Now', 'Order Now'),
(1863, 'M_BACK_TO_PACKAGES', 'Back to packages', 'Back to packages'),
(1865, 'M_SELLER_PACKAGE_SUCCESS_ORDER', '<p>Your subscription order has been successfully processed!</p><p>You can view your subscription history by going to the <a href="%s">my account</a> page and by clicking on <a href="%s">My Subscriptions</a>.</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p>', '<p>Your subscription order has been successfully processed!</p><p>You can view your subscription history by going to the <a href="%s">my account</a> page and by clicking on <a href="%s">My Subscriptions</a>.</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p>'),
(1866, 'L_USED_REWARD_POINTS_SUBSCRIPTION_REFERENCE_NUMBER', 'Used Reward Points. Subscription Invoice Number %s.', 'Used Reward Points. Subscription Invoice Number %s.'),
(1867, 'L_MPORDER_PLACED_NUMBER', 'Subscription Order Placed. Invoice Number %s', 'Subscription Order Placed. Invoice Number %s'),
(1868, 'L_CUSTOMER_NAME', 'Customer Name', 'Customer Name'),
(1869, 'L_CUSTOMER_EMAIL', 'Customer Email', 'Customer Email'),
(1870, 'L_PAYMENT_STATUS', 'Payment Status', 'Payment Status'),
(1871, 'L_PACKAGE_NAME', 'Package Name', 'Package Name'),
(1872, 'L_PACKAGE_CHARGES', 'Package Charges', 'Package Charges'),
(1873, 'L_PACKAGE_DISCOUNT', 'Package Discount', 'Package Discount'),
(1874, 'L_BILLING_CYCLE', 'Billing Cycle', 'Billing Cycle'),
(1875, 'L_DAYS', 'Days', 'Days'),
(1876, 'L_RECURRING_CHARGES', 'Recurring Charges', 'Recurring Charges'),
(1877, 'L_NET_CHARGED', 'Net Charged', 'Net Charged'),
(1878, 'M_APP_SELLER_PACKAGE_SUCCESS_ORDER', '<p>Your subscription order has been successfully processed!</p>', 'Your subscription order has been successfully processed!'),
(1879, 'M_GUEST_PACKAGE_SUCCESS_ORDER', '<p>Your subscription order has been successfully processed!</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p>', '<p>Your subscription order has been successfully processed!</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p>'),
(1880, 'M_APP_GUEST_PACKAGE_SUCCESS_ORDER', '<p>Your subscription order has been successfully processed!</p>', '<p>Your subscription order has been successfully processed!</p>'),
(1881, 'M_SELLER_PACKAGE_FAILURE_ORDER', '<p>There was a problem processing your payment and the subscription order did not complete.</p>\n<p>Possible reasons are: </p>\n<ul>\n  <li>Insufficient funds</li>\n  <li>Verification failed</li>\n</ul>\n<p>Please try to buy subscription again using a different payment method.</p>\n<p>If the problem persists please <a href="%s">contact us</a> with the details of the subscription order details you are trying to place.</p>', '<p>There was a problem processing your payment and the subscription order did not complete.</p>\n<p>Possible reasons are: </p>\n<ul>\n  <li>Insufficient funds</li>\n  <li>Verification failed</li>\n</ul>\n<p>Please try to buy subscription again using a different payment method.</p>\n<p>If the problem persists please <a href="%s">contact us</a> with the details of the subscription order details you are trying to place.</p>'),
(1882, 'M_SUBSCRIPTION_RECORD_NOT_FOUND', 'Subscription record not found', 'Subscription record not found'),
(1883, 'M_SUBSCRIPTION_CANNOT_BE_CANCELLED', 'Subscription cannot be cancelled as it is not %s.', 'Subscription cannot be cancelled as it is not %s.'),
(1884, 'M_SUBSCRIPTION_CANCELLED_SUCCESSFULLY', 'Subscription cancelled successfully.', 'Subscription cancelled successfully.'),
(1885, 'M_SUBSCRIPTION_CANNOT_BE_REFUNDED', 'Subscription cannot be refunded as it is not %s.', 'Subscription cannot be refunded as it is not %s.'),
(1886, 'M_SUBSCRIPTION_CANNOT_BE_REFUNDED_MIN_DAYS', 'Subscription cannot be refunded as minimum days to avail refund on subscription has already passed.', 'Subscription cannot be refunded as minimum days to avail refund on subscription has already passed.'),
(1887, 'M_SUBSCRIPTION_CAN_NOT_AUTO_RENEWED', 'Subscription can not be Auto Renewed, Either Subscription Period expired or Subscription Status is not %s Or the Selected Package is not available now.', 'Subscription can not be Auto Renewed, Either Subscription Period expired or Subscription Status is not %s Or the Selected Package is not available now.'),
(1888, 'M_RECORD_NOT_FOUND_OR_SUBSCRIPTION_NOT', 'Record not found or the subscription is not %s.', 'Record not found or the subscription is not %s.'),
(1889, 'M_ERROR_UPDATING_RECORD', 'Error in updating the record. Please contact us through contact us page.', 'Error in updating the record. Please contact us through contact us page.'),
(1890, 'M_PLEASE_SELECT_PACKAGE', 'Please select package', 'Please select package'),
(1891, 'M_SELECTED_PACKAGE_NOT_FOUND', 'Selected package is not available now.', 'Selected package is not available now.'),
(1892, 'M_YOU_CANNOT_BUY_NEW_SUBSCRIPTION', 'You can not buy new package, as you already have one %s subscription with us.', 'You can not buy new package, as you already have one %s subscription with us.'),
(1893, 'M_FREE_TRIAL_PACKAGE_ONLY_ONE_TIME', 'Free Trial Package is only of one time purchase and can be availed at the start of your subscription.', 'Free Trial Package is only of one time purchase and can be availed at the start of your subscription.'),
(1894, 'L_PLEASE_SELECT_SUBSCRIPTION_PACKAGE_FROM_PREVIOUS_PAGE', 'Please select subscription package from previous page', 'Please select subscription package from previous page'),
(1895, 'M_SUBSCRIPTION_ORDER_ALREADY_PROCESSED_NOT_FOUND', 'Subscription order is already processed or not found.', 'Subscription order is already processed or not found.'),
(1896, 'M_PLEASE_CONTACT_TECHNICAL_TEAM_RECURRING_PAYMENT', 'Please contact Technical team, as selected Payment Gateway does not support Recurring Payments.', 'Please contact Technical team, as selected Payment Gateway does not support Recurring Payments.'),
(1897, 'M_YOUR_SESSION_SEEMS_EXPIRED', 'Your session seems to be expired, please try after reloading the page.', 'Your session seems to be expired, please try after reloading the page.'),
(1898, 'M_TRY_AFTER_SOME_TIME', 'There is some technical issue, please try after some time.', 'There is some technical issue, please try after some time.'),
(1899, 'M_ALL_STATUS', 'All Status', 'All Status'),
(1900, 'L_PAYMENT_MODE', 'Payment Mode', 'Payment Mode'),
(1901, 'M_SUBSCRIPTIONS', 'Subscriptions', 'Subscriptions'),
(1902, 'M_PLEASE_ENTER_YOUR_PAYPAL_ACCOUNT_FIRST_NAME', 'Please enter your paypal account first name.', 'Please enter your paypal account first name.'),
(1903, 'M_PLEASE_ENTER_YOUR_PAYPAL_ACCOUNT_LAST_NAME', 'Please enter your paypal account last name.', 'Please enter your paypal account last name.'),
(1904, 'L_WALLET', 'Wallet', 'Wallet'),
(1905, 'L_FREE_TRIAL', 'Free Trial', 'Free Trial'),
(1906, 'L_SUBSCRIPTION_PACKAGES', 'Subscription Packages', 'Subscription Packages'),
(1907, 'M_PLEASE_BUY_SUBSCRIPTION_PACKAGE', 'Please buy or renew your subscription package to continue.', 'Please buy or renew your subscription package to continue.'),
(1908, 'M_YOUR_SUBSCRIPTION_PACKAGE_PRODUCTS_LIMIT_EXCEEDED.', 'You can list maximum %s product(s) with your existing package. Please upgrade your package to list more products with us.', 'You can list maximum %s product(s) with your existing package. Please upgrade your package to list more products with us.'),
(1909, 'M_PRODUCT_IMAGES_LIMIT_EXPIRED', 'Your existing subscription package allows you to set maximum %s images corresponding to a product.', 'Your existing subscription package allows you to set maximum %s images corresponding to a product.'),
(1910, 'M_ERROR_YOU_DONOT_HAVE_ACTIVE_SUBSCRIPTION', 'You do not have active subscription package so your products will not be available for buying on our system. Please buy or renew subscription to continue selling products on our platform.', 'You do not have active subscription package so your products will not be available for buying on our system. Please buy or renew subscription to continue selling products on our platform.'),
(1911, 'M_SELECT_SHIPPING_METHOD', 'Select Shipping Method', 'Select Shipping Method'),
(1912, 'M_FLAT_SHIPPING_RATE', 'Flat Shipping Rate', 'Flat Shipping Rate'),
(1913, 'M_SELECT_SHIPPING_PROVIDER', 'Select Shipping Provider', 'Select Shipping Provider'),
(1914, 'M_SELECT_SHIPPING_CARRIER', 'Select Shipping Carrier', 'Select Shipping Carrier'),
(1915, 'M_CALCULATED_SHIPPING', 'Calculated Shipping', 'Calculated Shipping'),
(1916, 'M_SELECT_SERVICES', 'Select Services', 'Select Services'),
(1917, 'M_SELECT_CARRIER', 'Select Carrier', 'Select Carrier'),
(1918, 'M_SELECT_SERVICE', 'Select Service', 'Select Service'),
(1919, 'M_SELECT_PROVIDER', 'Select Provider', 'Select Provider'),
(1920, 'M_DELIVERED_BY', 'Delivered By', 'Delivered By'),
(1921, 'L_DISCOUNT_OFFERS', 'Discount Offers', 'Discount Offers'),
(1922, 'L_ARE_YOU_SURE_CANCEL_SUBSCRIPTION', 'Are you sure you want to cancel the subscription?', 'Are you sure you want to cancel the subscription?'),
(1924, 'L_IT_WILL_CANCEL_CURRENT_ACTIVE_SUBSCRIPTION', 'This action will cancel your current active subscription after successful creation of the new plan.', 'This action will cancel your current active subscription after successful creation of the new plan.'),
(1925, 'L_WE_ARE_REDIRECTING_PAYMENT_PAGE', 'We are redirecting to payment page, please wait for few seconds.....', 'We are redirecting to payment page, please wait for few seconds.....'),
(1926, 'L_ORDER_INVOICE', 'Order Invoice', 'Order Invoice'),
(1927, 'L_PRODUCT_ADD-ONS', 'Product Add-ons', 'Product Add-ons'),
(1928, 'M_ACTION', 'Action', 'Action'),
(1929, 'M_INC_TAX', 'Inc Tax', 'Inc Tax'),
(1930, 'M_INVALID_SHOP_BANNER_IMAGE', 'Invalid shop banner Image, your banner is not saved, please upload a valid image to save your banner.', 'Invalid shop banner Image, your banner is not saved, please upload a valid image to save your banner.'),
(1931, 'M_INVALID_SHOP_LOGO_IMAGE', 'Invalid shop logo Image, your logo is not saved, please upload a valid image to save your logo.', 'Invalid shop logo Image, your logo is not saved, please upload a valid image to save your logo.'),
(1932, 'L_VENDOR', 'Vendor', 'Vendor'),
(1933, 'L_INVALID_AMOUNT_ENTER_VALUE_BETWEEN_1_10000', 'Invalid Amount. Enter Value Between 1 & 10000.', 'Invalid Amount. Enter Value Between 1 & 10000.'),
(1934, 'M_SUBSCRIBE_NOW', 'Subscribe Now', 'Subscribe Now'),
(1935, 'L_YOUR_SUBSCRIPTION_CART', 'Your Subscription Cart', 'Your Subscription Cart'),
(1936, 'L_ENTER_POINTS_HERE', 'Enter points here', 'Enter points here'),
(1937, 'L_IN-ACTIVE', 'In-Active', 'In-Active'),
(1938, 'L_ACTIVE', 'Active', 'Active'),
(1939, 'L_SPACE_AVAILABLE_FOR_ADVERTISING', 'This Space is available for advertising', 'This Space is available for advertising'),
(1940, 'M_YOU_ARE_DOWNGRADING_YOUR_PACKAGE', 'You are downgrading plan. This new packages support maximum up to  <i>%d</i> products and you currently have <i>%d</i> products listed with us. Please reduce your listed products count to match with your new plan.', 'You are downgrading plan. This new packages support maximum up to  <i>%d</i> products and you currently have <i>%d</i> products listed with us. Please reduce your listed products count to match with your new plan.'),
(1941, 'M_THERE_WAS_PROBLEM_AUTHENTICATING_FACEBOOK_ACCOUNT', 'There was some problem in authenticating your account with Facebook, Please try with different login options.', 'There was some problem in authenticating your account with Facebook, Please try with different login options.'),
(1943, 'M_THERE_WAS_PROBLEM_AUTHENTICATING_GOOGLEPLUS_ACCOUNT', 'There was some problem in authenticating your account with Google Plus, Please try with different login options.', 'There was some problem in authenticating your account with Google Plus, Please try with different login options.'),
(1944, 'L_MARKED_FAVORITE', 'Marked Favorite', 'Marked Favorite'),
(1945, 'L_REMOVED_FROM_FAVORITE', 'Removed from Favorite', 'Removed from Favorite'),
(1946, 'M_DELIVERY_DETAILS_NOT_REQUIRED', '-- Not Applicable --', '-- Not Applicable --'),
(1947, 'M_DELIVERY_DETAILS_NOT_APPLICABLE', '-- Not Applicable --', '-- Not Applicable --'),
(1948, 'L_DOWNLOADS', 'Downloads', 'Downloads'),
(1949, 'M_DOWNLOAD_NAME', 'Download Name', 'Download Name'),
(1950, 'M_FILENAME', 'Filename', 'Filename'),
(1951, 'M_MAX_DOWNLOAD_TIMES', 'Max Download Times', 'Max Download Times'),
(1952, 'M_ADD_DOWNLOAD', 'Add Download', 'Add Download'),
(1953, 'L_SURE_YOU_WANT_REMOVE_THIS_RECORD', 'Are you sure you want to remove this record?', 'Are you sure you want to remove this record?'),
(1954, 'L_RECORD_NOT_FOUND', 'Record not found', 'Record not found'),
(1955, 'L_YOUR_BROWSER_DOES_NOT_SUPPORT_FILE_API', 'Your browser does not support new File API! Please upgrade.', 'Your browser does not support new File API! Please upgrade.'),
(1956, 'L_UNSUPPORTED_FILE_TYPE', 'Selected file is unsupported file type! Please upload file with %s Extension(s).', 'Selected file is unsupported file type! Please upload file with %s Extension(s).'),
(1957, 'L_MAX_ALLOWED_FILE_SIZE', 'Max %s file is allowed.', 'Max %s file is allowed.'),
(1958, 'M_VALIDITY_DAYS', 'Validity days', 'Validity days'),
(1959, 'M_-1_FOR_UNLIMITED', '-1 for Unlimited', '-1 for Unlimited'),
(1960, 'M_DOWNLOAD', 'Download', 'Download'),
(1961, 'L_YOUR_FILE_REMOVED_SUCCESSFULLY', 'Your file removed successfully', 'Your file removed successfully'),
(1962, 'M_MY_DOWNLOADS', 'My Downloads', 'My Downloads'),
(1963, 'L_MY_DOWNLOADS', 'My Downloads', 'My Downloads'),
(1964, 'L_SIZE', 'Size', 'Size'),
(1965, 'L_VALID_TILL', 'Valid Till', 'Valid Till'),
(1966, 'L_UNLIMITED', 'Unlimited', 'Unlimited'),
(1967, 'L_DOWNLOADS_REMAINING', 'Downloads Remaining', 'Downloads Remaining'),
(1968, 'L_DOWNLOAD', 'Download', 'Download'),
(1969, 'L_PHYSICAL', 'Physical', 'Physical'),
(1970, 'L_DIGITAL', 'Digital', 'Digital'),
(1971, 'L_DOWNLOAD_NOTE', 'Note: Your eligible downloads will be reduced on clicking the "Download" button so please don''t cancel the download after clicking it.', 'Note: Your eligible downloads will be reduced on clicking the "Download" button so please don''t cancel the download after clicking it.'),
(1972, 'M_ENABLE_COD_ORDERS', 'Enable COD Orders', 'Enable COD Orders'),
(1973, 'M_ENABLE_COD_TEXT', 'You will have to keep minimum %s in your wallet to accept COD orders.', 'You will have to keep minimum %s in your wallet to accept COD orders.'),
(1974, 'M_COD_MIN_LIMIT_NOTIFICATION', 'COD Enabled, Please maintain %s balance.', 'COD Enabled, Please maintain %s balance.'),
(1975, 'M_ENABLE_COD', 'Enable COD', 'Enable COD'),
(1976, 'M_COD_ENABLED', 'COD Enabled', 'COD Enabled'),
(1977, 'L_COD', 'COD', 'COD'),
(1978, 'L_COD_CASH_ON_DELIVERY', 'COD (cash on delivery)', 'COD (cash on delivery)'),
(1980, 'M_BUYER_SELECTED_CASH_ON_DELIVERY', 'Buyer has selected "Cash on delivery" payment option.', 'Buyer has selected "Cash on delivery" payment option.'),
(1981, 'M_CASH_ON_DELIVERY', 'Cash on delivery', 'Cash on delivery'),
(1982, 'L_YET_TO_BE_RECEIVED_CASH_ON_DELIVERY', 'Yet to be received cash on delivery', 'Yet to be received cash on delivery'),
(1983, 'L_CASH_ON_DELIVERY', 'Cash on delivery', 'Cash on delivery'),
(1984, 'L_PAYMENT_TO_BE_RECEIVED_ON_CASH_ON_DELIVERY', 'Payment to be received in cash, on delivery.', 'Payment to be received in cash, on delivery.'),
(1985, 'M_SORRY_CASH_ON_DELIVERY_NOT_AVAILABLE', 'Sorry! Cash On Delivery option is not available on this order.\n\nCash On Delivery is available on COD enabled products & payable amount between %s and %s.', 'Sorry! Cash On Delivery option is not available on this order.'),
(1986, 'L_NOT_AVAILABLE', 'Not Available', 'Not Available'),
(1987, 'M_DISCOUNT_REWARD_WALLET_BENEFITS_NOT_APPLICABLE_COD', 'Discount Coupon, Reward Points and Wallet Benefits not applicable on cash on delivery orders, so we have removed this benefits from your cart.', 'Discount Coupon, Reward Points and Wallet Benefits not applicable on cash on delivery orders, so we have removed this benefits from your cart.'),
(1988, 'M_SELECT_CONDITION', 'Select Condition', 'Select Condition'),
(1989, 'L_RETURN_REFUND_CANNOT_COD_PLACED', 'This order is not available for refund/return. Refund/Return request can be placed on non ''cash on delivery'' orders only.', 'This order is not available for refund/return. Refund/Return request can be placed on non ''cash on delivery'' orders only.'),
(1990, 'M_CHARGED_TAX_COLLECTED_FOR_ORDER', 'Charged tax collected, from ''cash on delivery'' order %s.', 'Charged tax collected, from ''cash on delivery'' order %s.'),
(1991, 'M_ERROR_DOWNLOAD_EXPIRED', 'Error: Available download limit or date expired.', 'Error: Available download limit or date expired.'),
(1992, 'L_YOU_HAVE_NOT_PLACED_ANY_ORDER', 'You have not placed any order with us.', 'You have not placed any order with us.'),
(1993, 'L_YOU_HAVE_NOT_RECEIVED_ANY_ORDER', 'You have not received any order.', 'You have not received any order.'),
(1995, 'L_YOU_DO_NOT_HAVE_ACTIVITIES', 'You do not have any activity record with us currently.', 'You do not have any activity record with us currently.'),
(1996, 'L_YOU_NOT_HAVE_ANY_CANCELLATION_REQUEST', 'You do not have any cancellation request record currently.', 'You do not have any cancellation request record currently.'),
(1998, 'L_YOU_NOT_HAVE_ANY_WALLET_RECORD', 'You do not have any wallet record.', 'You do not have any wallet record.'),
(1999, 'L_YOU_HAVE_NOT_ADDED_PROMOTION', 'You have not added any promotion.', 'You have not added any promotion.'),
(2000, 'L_YOU_DO_NOT_HAVE_ANY_DOWNLOADS', 'You do not have any downloadable file(s) record.', 'You do not have any downloadable file(s) record.'),
(2001, 'L_YOU_DO_NOT_HAVE_ANY_FAVORITE_ITEMS', 'You do not have any favorite item.', 'You do not have any favorite item.'),
(2002, 'L_YOU_DO_NOT_HAVE_ANY_FAVORITE_SHOP', 'You do not have any favorite shop.', 'You do not have any favorite shop.'),
(2003, 'L_YOU_DO_NOT_HAVE_ANY_MESSAGE', 'You do not have any message(s).', 'You do not have any message(s).'),
(2004, 'L_YOU_DO_NOT_HAVE_ANY_OPTION', 'You have not added option/variant.', 'You have not added option/variant.'),
(2005, 'L_YOU_DO_NOT_HAVE_PAUSED_LISTINGS', 'You do not have any paused/disabled product''s listings.', 'You do not have any paused/disabled product''s listings.'),
(2006, 'L_YOU_DO_NOT_HAVE_LISTINGS', 'You have not listed any product, please click on ''Add Product'' button to start listing your product(s).', 'You have not listed any product, please click on ''Add Product'' button to start listing your product(s).'),
(2007, 'L_YOU_DO_NOT_HAVE_RETURN_REQUEST', 'You do not have any return request record currently.', 'You do not have any return request record currently.'),
(2008, 'L_YOU_NOT_HAVE_ANY_REWARD_RECORD', 'You have not earned reward points.', 'You have not earned reward points.'),
(2009, 'L_YOU_NOT_HAVE_ANY_RECORD_LIST', 'You do not have any record in this list.', 'You do not have any record in this list.'),
(2010, 'L_YOU_DO_NOT_HAVE_RECORD_THIS_SECTION', 'You do not have any record in this section.', 'You do not have any record in this section.'),
(2011, 'L_THIS_SHOP_HAS_NOT_RECEIVED_REVIEW', 'This shop has not received review', 'This shop has not received any review/rating yet.'),
(2012, 'L_WE_COULD_NOT_FIND_WHAT_YOU_LOOKING_FOR', 'WHOOPS! WE COULDNâ€™T FIND WHAT YOU WERE LOOKING FOR', 'WHOOPS! WE COULDNâ€™T FIND WHAT YOU WERE LOOKING FOR'),
(2013, 'M_SHOW_PASSWORD', 'Show Password', 'Show Password'),
(2014, 'M_HIDE_PASSWORD', 'Hide Password', 'Hide Password'),
(2015, 'M_STRENGTH', 'Strength', 'Strength'),
(2016, 'M_VERY_WEAK', 'very weak', 'very weak'),
(2017, 'M_WEAK', 'weak', 'weak'),
(2018, 'M_VERY_MEDIUM', 'very medium', 'very medium'),
(2019, 'M_STRONG', 'strong', 'strong'),
(2020, 'L_ARE_YOU_SURE_DELETE_PRODUCT', 'Are you sure you want to delete this product?', 'Are you sure you want to delete this product?'),
(2021, 'L_UPDATING_ORDER_IN_DATABASE', 'Updating the sort order in the database.', 'Updating the sort order in the database.'),
(2022, 'L_DATABASE_HAS_BEEN_UPDATED', 'Database has been updated.', 'Database has been updated.'),
(2023, 'L_FILE_COULD_NOT_UPLOADED_UNKNOWN_REASON', 'Warning: File could not be uploaded for an unknown reason!', 'Warning: File could not be uploaded for an unknown reason!'),
(2024, 'L_INCORRECT_FILETYPE', 'Warning: Incorrect file type!', 'Warning: Incorrect file type!'),
(2025, 'L_FILENAME_MUST_BETWEEN_3_AND_255', 'Filename must between 3 and 255', 'Filename must between 3 and 255'),
(2026, 'M_YOUR_IMAGE_UPLOADED_SUCCESSFULLY', 'Your Image Uploaded Successfully', 'Your Image Uploaded Successfully'),
(2027, 'M_SPONSORED', 'Sponsored', 'Sponsored'),
(2028, 'M_HAVE_COUPON', 'Have a coupon?', 'Have a coupon?'),
(2029, 'L_MARKED_FAVORITE_SHOP', 'Shop has been added to your favorites.', 'Shop has been added to your favorites.'),
(2030, 'L_REMOVED_FROM_FAVORITE_SHOP', 'Shop has been removed from your favorites.', 'Shop has been removed from your favorites.'),
(2031, 'L_REMOVED_FROM_FAVORITE_PRODUCT', 'Product has been removed from your favorites.', 'Product has been removed from your favorites.'),
(2032, 'L_MARKED_FAVORITE_PRODUCT', 'Product has been added to your favorites.', 'Product has been added to your favorites.'),
(2033, 'L_ADDED_LIST', 'Your list added successfully.', 'Your list added successfully.'),
(2034, 'L_REMOVED_LIST_PRODUCT', 'Product has been removed from list.', 'Product has been removed from list.'),
(2035, 'L_ADDED_LIST_PRODUCT', 'Product has been added to list.', 'Product has been added to list.'),
(2039, 'M_JS_ERROR_FILE_SIZE', '{file_name} is too large, please select file with max {file_size}.', '{file_name} is too large, please select file with max {file_size}.'),
(2040, 'M_JS_ERROR_FILE_EXTENSION', '{file_name} is invalid file, allowed extensions are: {allowed_extensions}', '{file_name} is invalid file, allowed extensions are: {allowed_extensions}'),
(2041, 'M_CURRENTLY_ACTIVE', 'Currently Active', 'Currently Active'),
(2042, 'M_PROMOTION_BANNER_PUBLISHED_ADMIN_APPROVAL', 'The Banner will be published after approval from Portal Admin Team.', 'The Banner will be published after approval from Portal Admin Team.'),
(2043, 'L_IS_APPROVED', 'Is Approved', 'Is Approved'),
(2044, 'M_VIEW_WIRE_FRAME', 'View Wire Frame', 'View Wire Frame'),
(2045, 'L_WE_COULD_NOT_FIND_MATCHES', 'WE COULDN''T FIND ANY MATCHES!', 'WE COULDN''T FIND ANY MATCHES!'),
(2046, 'L_TRY_DIFFERENT_KEYWORDS_OR_FILTERS', 'Try different keyword(s) with other text.', 'Try different keywords or filters'),
(2047, 'L_TRY_DIFFERENT_KEYWORDS', 'Please check if you misspelt something or try searching again with fewer keywords.', 'Please check if you misspelt something or try searching again with fewer keywords.'),
(2048, 'L_TRY_DIFFERENT_KEYWORDS_FILTERS', 'Try different keyword(s) or filter(s).', 'Try different keyword(s) or filter(s).'),
(2049, 'L_POPULAR_SEARCHES', 'Popular Searches:', 'Popular Searches:'),
(2050, 'L_INVOICE', 'Invoice', 'Invoice'),
(2051, 'L_ORDER_DETAILS', 'Order Details', 'Order Details'),
(2052, 'M_ATTACHMENT', 'Attachment', 'Attachment'),
(2053, 'L_YOUR_COMPANY_DETAILS', 'Your Company Details', 'Your Company Details'),
(2054, 'L_ENTER_YOUR_COUPON', 'Enter your coupon', 'Enter your coupon'),
(2055, 'M_VIEW', 'View', 'View'),
(2056, 'L_SUBSCRIPTION_ABOUT_EXPIRE', 'Your subscription is about to expire on %s. Please <a href="%s">click here</a> to renew your subscription.', 'Your subscription is about to expire on %s. Please <a href="%s">click here</a> to renew your subscription.'),
(2057, 'L_WEEKS', 'Weeks', 'Weeks'),
(2058, 'L_MONTHS', 'Months', 'Months'),
(2059, 'L_YEARS', 'Years', 'Years'),
(2060, 'M_PLEASE_WAIT', 'Please wait', 'Please wait'),
(2061, 'L_NOT_ELIGIBLE_FOR_SHIPPING', 'Not eligible for shipping', 'Not eligible for shipping'),
(2062, 'L_IMAGE_SAVED', 'Image saved', 'Image saved'),
(2063, 'L_IMAGE_WITH_ORIENTATION_SAVED', 'Image with orientation saved', 'Image with orientation saved'),
(2064, 'L_IMAGE_ORDERING_HAS_BEEN_UPDATED', 'Image ordering has been updated', 'Image ordering has been updated'),
(2065, 'L_LEFT_ROTATE', 'Left Rotate', 'Left Rotate'),
(2066, 'L_RIGHT_ROTATE', 'Right Rotate', 'Right Rotate'),
(2067, 'L_SAVE_IMAGE', 'Save Image', 'Save Image'),
(2068, 'L_UN-FAVORITE', 'Un-Favorite', 'Un-Favorite');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_response_ip` varchar(255) NOT NULL,
  `log_message` text NOT NULL,
  `log_url` varchar(255) NOT NULL,
  `log_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_navigations`
--

CREATE TABLE `tbl_navigations` (
  `nav_id` int(11) NOT NULL,
  `nav_name` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nav_status` tinyint(3) DEFAULT NULL,
  `nav_ismultilevel` tinyint(1) NOT NULL,
  `nav_type` tinyint(1) NOT NULL,
  `nav_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbl_navigations`
--

INSERT INTO `tbl_navigations` (`nav_id`, `nav_name`, `nav_status`, `nav_ismultilevel`, `nav_type`, `nav_is_deleted`) VALUES
(1, 'Header Navigation - Mobile Only', 1, 0, 1, 0),
(2, 'Footer Navigation - Mobile Only', 1, 0, 1, 0),
(3, 'Extras', 1, 0, 2, 0),
(4, 'Way to Shop', 1, 0, 2, 0),
(5, 'Quick Links', 1, 0, 2, 0),
(6, 'Company', 1, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nav_links`
--

CREATE TABLE `tbl_nav_links` (
  `nl_id` int(11) NOT NULL,
  `nl_caption` text COLLATE latin1_general_ci NOT NULL,
  `nl_cms_page_id` int(11) NOT NULL,
  `nl_html` text COLLATE latin1_general_ci NOT NULL,
  `nl_target` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nl_type` int(11) NOT NULL COMMENT '0->CMS page, 1->custom',
  `nl_nav_id` int(11) NOT NULL,
  `nl_parent_id` int(11) NOT NULL,
  `nl_code` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nl_bullet_image` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nl_login_protected` tinyint(1) NOT NULL,
  `nl_display_order` int(11) NOT NULL,
  `nl_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbl_nav_links`
--

INSERT INTO `tbl_nav_links` (`nl_id`, `nl_caption`, `nl_cms_page_id`, `nl_html`, `nl_target`, `nl_type`, `nl_nav_id`, `nl_parent_id`, `nl_code`, `nl_bullet_image`, `nl_login_protected`, `nl_display_order`, `nl_is_deleted`) VALUES
(1, 'Login', 4, '{SITEROOT}user/account', '_self', 2, 1, 0, '', '', 2, 1, 0),
(2, 'Sign Up', 4, '{SITEROOT}user/account', '_self', 2, 1, 0, '', '', 2, 2, 0),
(3, 'My Account', 4, '{SITEROOT}account/dashboard_buyer', '_self', 2, 1, 0, '', '', 1, 4, 0),
(4, 'Change Password', 7, '{SITEROOT}account/change_password', '_self', 2, 1, 0, '', '', 1, 5, 0),
(5, 'Checkout', 4, '{SITEROOT}cart/checkout', '_self', 2, 1, 0, '', '', 0, 6, 0),
(6, 'What is Yokart', 8, '', '_self', 0, 2, 0, '', '', 0, 1, 0),
(7, 'About Us', 4, '', '_self', 0, 2, 0, '', '', 0, 7, 0),
(8, 'Terms & Conditions', 10, '', '_self', 0, 2, 0, '', '', 0, 8, 0),
(9, 'Featured Stores', 4, '{SITEROOT}shops/featured', '_self', 2, 2, 0, '', '', 0, 3, 0),
(10, 'FAQs', 4, '{SITEROOT}faqs', '_self', 2, 2, 0, '', '', 0, 5, 0),
(11, 'Contact Us', 4, '{SITEROOT}custom/contact_us', '_self', 2, 2, 0, '', '', 0, 6, 0),
(12, 'FAQs', 4, '{SITEROOT}faqs', '_self', 2, 3, 0, '', '', 0, 2, 0),
(13, 'Testimonials', 4, '{SITEROOT}testimonials', '_self', 2, 3, 0, '', '', 0, 3, 0),
(14, 'Offers', 4, '{SITEROOT}offers', '_self', 2, 3, 0, '', '', 0, 4, 0),
(15, 'All Products', 4, '{SITEROOT}products', '_self', 2, 4, 0, '', '', 0, 1, 0),
(16, 'Top 50', 4, '{SITEROOT}products/top_50', '_self', 2, 4, 0, '', '', 0, 4, 0),
(17, 'New Stuff', 4, '{SITEROOT}products/new_stuff', '_self', 2, 4, 0, '', '', 0, 5, 0),
(18, 'Privacy Policy', 9, '', '_self', 0, 5, 0, '', '', 0, 1, 0),
(19, 'Terms & Conditions', 10, '', '_self', 0, 5, 0, '', '', 0, 2, 0),
(20, 'Policies & Regulations', 11, '', '_self', 0, 5, 0, '', '', 0, 3, 0),
(21, 'Contact Us', 4, '{SITEROOT}custom/contact_us', '_self', 2, 6, 0, '', '', 0, 1, 0),
(23, 'About Us', 4, '', '_self', 0, 6, 0, '', '', 0, 3, 0),
(24, 'Forgot Password', 4, '{SITEROOT}user/forgot_password', '_self', 2, 1, 0, '', '', 2, 3, 0),
(25, 'About Us', 4, '', '_self', 0, 1, 0, '', '', 0, 7, 0),
(26, 'How it works', 7, '', '_self', 0, 1, 0, '', '', 0, 8, 0),
(27, 'Contact Us', 4, '{SITEROOT}custom/contact_us', '_self', 2, 1, 0, '', '', 0, 9, 0),
(28, 'Logout', 4, '{SITEROOT}account/logout', '_self', 2, 1, 0, '', '', 1, 10, 0),
(29, 'Sitemap', 4, '{SITEROOT}custom/sitemap', '_self', 2, 6, 0, '', '', 0, 4, 0),
(30, 'Affiliates', 4, '{SITEROOT}affiliate', '_self', 2, 3, 0, '', '', 0, 1, 0),
(31, 'Featured Products', 4, '{SITEROOT}products/featured', '_self', 2, 4, 0, '', '', 0, 2, 0),
(32, 'Featured Shops', 4, '{SITEROOT}shops/featured', '_self', 2, 4, 0, '', '', 0, 3, 0),
(33, 'Featured Products', 4, '{SITEROOT}products/featured', '_self', 2, 2, 0, '', '', 0, 4, 0),
(34, 'Affiliates', 4, '{SITEROOT}affiliate', '_self', 2, 2, 0, '', '', 0, 2, 0),
(35, 'Advertise With Us', 4, '{SITEROOT}user/advertise', '_self', 2, 3, 0, '', '', 0, 2, 0),
(36, 'Blog', 0, '{SITEROOT}blog', '_self', 2, 6, 0, '', '', 0, 2, 0),
(37, 'How it works', 7, '', '_self', 0, 5, 0, '', '', 0, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_options`
--

CREATE TABLE `tbl_options` (
  `option_id` bigint(20) NOT NULL,
  `option_type` varchar(200) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_display_order` int(11) NOT NULL,
  `option_is_deleted` tinyint(1) NOT NULL,
  `option_owner` char(1) NOT NULL,
  `option_created_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_option_values`
--

CREATE TABLE `tbl_option_values` (
  `option_value_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `option_value_name` varchar(255) NOT NULL,
  `option_value_display_order` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL,
  `order_reference` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_invoice_number` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_user_id` int(11) NOT NULL,
  `order_customer_group` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_markup_used` decimal(10,4) NOT NULL,
  `order_user_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_user_email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_user_phone` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_user_fax` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_address2` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_city` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_postcode` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_state` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_country` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_country_id` int(11) NOT NULL,
  `order_shipping_phone` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_method` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_shipping_required` tinyint(1) NOT NULL,
  `order_billing_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_billing_address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_billing_address2` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_billing_city` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_billing_postcode` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `order_billing_state` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_billing_country` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_billing_country_id` int(11) NOT NULL,
  `order_billing_phone` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_payment_method` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_payment_method_id` int(11) NOT NULL,
  `order_date_added` datetime NOT NULL,
  `order_date_updated` datetime NOT NULL,
  `order_payment_status` tinyint(1) NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `order_ip_address` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `order_forwarded_ip` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_user_agent` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_accept_language` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_payment_gateway_charges` decimal(10,4) NOT NULL,
  `order_discount_coupon` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_discount_total` decimal(10,4) NOT NULL,
  `order_reward_points` int(11) NOT NULL,
  `order_cart_total` decimal(10,4) NOT NULL,
  `order_cart_total_without_tax` decimal(10,4) NOT NULL,
  `order_shipping_charged` decimal(10,4) NOT NULL,
  `order_tax_charged` decimal(10,4) NOT NULL,
  `order_value_discount` decimal(10,4) NOT NULL,
  `order_value_discount_label` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_sub_total` decimal(10,4) NOT NULL,
  `order_net_charged` decimal(10,4) NOT NULL,
  `order_credits_charged` decimal(10,4) NOT NULL,
  `order_actual_paid` decimal(10,4) NOT NULL,
  `order_site_commission` decimal(10,4) NOT NULL,
  `order_language` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_currency` int(11) NOT NULL,
  `order_currency_code` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `order_currency_symbol_left` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `order_currency_symbol_right` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `order_currency_value` decimal(30,10) NOT NULL,
  `order_customer_comments` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `order_vat_perc` decimal(10,4) NOT NULL,
  `order_wallet_selected` tinyint(1) NOT NULL,
  `order_affiliate_id` int(11) NOT NULL,
  `order_affiliate_commission` decimal(10,4) NOT NULL,
  `order_referrer_id` int(11) NOT NULL,
  `order_referrer_reward_points` int(11) NOT NULL,
  `order_referee_reward_points` int(11) NOT NULL,
  `order_is_cod` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_status`
--

CREATE TABLE `tbl_orders_status` (
  `orders_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `public_flag` int(11) DEFAULT '1',
  `is_digital` int(11) DEFAULT '0',
  `orders_status_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbl_orders_status`
--

INSERT INTO `tbl_orders_status` (`orders_status_id`, `language_id`, `orders_status_name`, `priority`, `public_flag`, `is_digital`, `orders_status_is_deleted`) VALUES
(1, 1, 'Payment Pending', 1, 0, 0, 0),
(2, 1, 'Payment Confirmed', 2, 1, 0, 0),
(4, 1, 'In Process', 4, 1, 0, 0),
(5, 1, 'Shipped', 5, 1, 0, 0),
(6, 1, 'Delivered', 6, 1, 0, 0),
(7, 1, 'Completed', 9, 1, 0, 0),
(8, 1, 'Cancelled', 8, 1, 0, 0),
(9, 1, 'Refunded/Completed', 10, 1, 0, 0),
(11, 1, 'Return Requested', 7, 1, 0, 0),
(13, 1, 'Approved', 3, 1, 1, 0),
(14, 1, 'Cash on Delivery', 2, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_status_history`
--

CREATE TABLE `tbl_orders_status_history` (
  `orders_status_history_id` bigint(20) NOT NULL,
  `orders_id` bigint(20) NOT NULL,
  `opr_id` bigint(20) NOT NULL,
  `orders_status_id` int(11) NOT NULL,
  `orders_payment_status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` tinyint(1) NOT NULL,
  `comments` text COLLATE latin1_general_ci NOT NULL,
  `tracking_number` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `append_comments` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_cancel_requests`
--

CREATE TABLE `tbl_order_cancel_requests` (
  `cancellation_request_id` int(11) NOT NULL,
  `cancellation_request_user_id` int(11) NOT NULL,
  `cancellation_request_order` int(11) NOT NULL,
  `cancellation_request_reason` int(11) NOT NULL,
  `cancellation_request_message` text COLLATE latin1_general_ci NOT NULL,
  `cancellation_request_date` date NOT NULL,
  `cancellation_request_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_payments`
--

CREATE TABLE `tbl_order_payments` (
  `op_payment_id` bigint(20) NOT NULL,
  `op_order_id` int(11) NOT NULL,
  `op_payment_method` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `op_gateway_txn_id` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `op_amount` decimal(10,4) NOT NULL,
  `op_gateway_status` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `op_comments` text COLLATE latin1_general_ci NOT NULL,
  `op_gateway_response` text COLLATE latin1_general_ci NOT NULL,
  `op_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_pp_adaptive_payments`
--

CREATE TABLE `tbl_order_pp_adaptive_payments` (
  `ppadappay_id` int(11) NOT NULL,
  `ppadappay_order_id` int(11) NOT NULL,
  `ppadappay_pay_key` varchar(50) NOT NULL,
  `ppadappay_primary_payment_status` tinyint(1) NOT NULL COMMENT '0->Pending, 1->Complete, 2->Declined',
  `ppadappay_chained_payments_status` int(11) NOT NULL COMMENT '-1->No Secondary Receiver, 0->Pending, 1->Executed, 2->Execution Failed, 3->Execution Cancelled',
  `ppadappay_status` tinyint(1) NOT NULL,
  `ppadappay_to_be_executed_on` datetime NOT NULL COMMENT 'If there are secondary receivers then the pay key should be executed on this date.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_pp_adaptive_payment_transactions`
--

CREATE TABLE `tbl_order_pp_adaptive_payment_transactions` (
  `ppaptrans_id` int(11) NOT NULL,
  `ppaptrans_order_id` int(11) NOT NULL,
  `ppaptrans_ppadappay_id` int(11) NOT NULL,
  `ppaptrans_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ppaptrans_type` varchar(30) NOT NULL,
  `ppaptrans_status` varchar(30) NOT NULL,
  `ppaptrans_request` text CHARACTER SET latin1 NOT NULL,
  `ppaptrans_response` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_products`
--

CREATE TABLE `tbl_order_products` (
  `opr_id` int(11) NOT NULL,
  `opr_order_id` int(11) NOT NULL,
  `opr_order_invoice_number` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `opr_product_id` int(11) NOT NULL,
  `opr_product_type` int(11) NOT NULL,
  `opr_qty` int(11) NOT NULL,
  `opr_name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `opr_sku` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `opr_brand` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `opr_model` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `opr_shop_owner_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `opr_shop_owner_username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `opr_shop_owner_email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `opr_shop_owner_phone` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `opr_product_shop` int(11) NOT NULL,
  `opr_product_shop_name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `opr_retail_price` decimal(10,4) NOT NULL,
  `opr_sale_price` decimal(10,4) NOT NULL,
  `opr_discount_total` decimal(10,4) NOT NULL,
  `opr_customer_buying_price` decimal(10,4) NOT NULL,
  `opr_customization_price` decimal(10,4) NOT NULL,
  `opr_customer_customization_price` decimal(10,4) NOT NULL,
  `opr_commission_charged` decimal(10,4) NOT NULL,
  `opr_commission_percentage` decimal(10,2) NOT NULL,
  `opr_customization_weight` decimal(10,4) NOT NULL,
  `opr_weight` int(11) NOT NULL,
  `opr_ship_free` tinyint(1) NOT NULL,
  `opr_tax_free` tinyint(1) NOT NULL,
  `opr_string` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `opr_customization_string` text COLLATE latin1_general_ci NOT NULL,
  `opr_option_id` bigint(20) NOT NULL,
  `opr_shipping_required` tinyint(1) NOT NULL,
  `opr_shipping` bigint(255) NOT NULL,
  `opr_shipping_days` int(11) NOT NULL,
  `opr_shipping_company` int(11) NOT NULL,
  `opr_shipping_label` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `opr_shipping_charges` decimal(10,4) NOT NULL,
  `opr_shipped_date` datetime NOT NULL,
  `opr_delivered_date` datetime NOT NULL,
  `opr_completion_date` datetime NOT NULL,
  `opr_qty_tax` decimal(10,4) NOT NULL,
  `opr_tax` decimal(10,4) NOT NULL,
  `opr_net_charged` decimal(10,4) NOT NULL,
  `opr_refund_qty` int(11) NOT NULL,
  `opr_refund_amount` decimal(10,4) NOT NULL,
  `opr_refund_commission` decimal(10,4) NOT NULL,
  `opr_refund_tax` decimal(10,4) NOT NULL,
  `opr_status` int(1) NOT NULL,
  `opr_vendor_credited` tinyint(1) NOT NULL,
  `opr_affiliate_commission_percentage` decimal(10,2) NOT NULL,
  `opr_affiliate_commission` decimal(10,4) NOT NULL,
  `opr_cod_order` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_product_files`
--

CREATE TABLE `tbl_order_product_files` (
  `opf_id` bigint(20) NOT NULL,
  `opf_opr_id` int(11) NOT NULL,
  `opf_file_download_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `opf_file_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `opf_file_type` int(11) NOT NULL,
  `opf_file_max_download_times` int(11) NOT NULL,
  `opf_file_can_be_downloaded_within_days` int(11) NOT NULL,
  `opf_remaining_downloaded_times` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_product_options`
--

CREATE TABLE `tbl_order_product_options` (
  `order_option_id` bigint(20) NOT NULL,
  `order_option_order_id` int(11) NOT NULL,
  `order_option_sub_order_id` int(11) NOT NULL,
  `order_option_product_id` int(11) NOT NULL,
  `order_option_product_option_id` int(11) NOT NULL,
  `order_option_product_option_value_id` int(11) NOT NULL,
  `order_option_name` varchar(255) NOT NULL,
  `order_option_value` text NOT NULL,
  `order_option_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_methods`
--

CREATE TABLE `tbl_payment_methods` (
  `pmethod_id` int(11) NOT NULL,
  `pmethod_name` varchar(50) NOT NULL DEFAULT '',
  `pmethod_details` varchar(255) NOT NULL DEFAULT '',
  `pmethod_status` tinyint(4) NOT NULL DEFAULT '0',
  `pmethod_icon` varchar(255) NOT NULL,
  `pmethod_code` varchar(50) NOT NULL DEFAULT '',
  `pmethod_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_methods`
--

INSERT INTO `tbl_payment_methods` (`pmethod_id`, `pmethod_name`, `pmethod_details`, `pmethod_status`, `pmethod_icon`, `pmethod_code`, `pmethod_display_order`) VALUES
(7, 'Amazon', 'Amazon -  payment method description will go here.', 0, 'amazonpay.png', 'amazon', 7),
(2, 'Credit Card - Authorize.Net (AIM)', 'Credit Card - Authorize.Net (AIM) -  payment method description will go here.', 0, 'creditcard.png', 'authorizeaim', 1),
(18, 'Cash on Delivery', 'Cash on Delivery -  payment method description will go here.', 0, 'cod.png', 'CASH_ON_DELIVERY', 3),
(8, 'CCAvenue', 'CCAvenue  -  payment method description will go here.', 0, 'ccavenue.png', 'CCAvenue', 5),
(11, 'Citrus', 'Citrus -  payment method description will go here.', 0, 'citrus.png', 'citrus', 11),
(6, 'Khipu', 'Khipu -  payment method description will go here.', 0, '', 'khipu', 6),
(5, 'Omise', 'Omise -  payment method description will go here.', 0, 'omise.png', 'omise', 5),
(17, 'PayPal Adaptive Payments', 'PayPal Adaptive Payments', 0, '465367_paypal.png', 'paypaladaptive', 4),
(3, 'PayPal Payments Standard', 'PayPal Payments Standard -  payment method description will go here.', 0, 'paypal.png', 'paypalstandard', 2),
(9, 'Paytm', 'Paytm -  payment method description will go here.', 0, 'paytm.png', 'paytm', 8),
(4, 'PayUbiz (India)', 'PayUbiz (India)  -  payment method description will go here.', 0, 'payu.png', 'payuindia', 3),
(16, 'PayU money (India)', 'PayU money (India) -  payment method description will go here.', 0, '845277_payu.png', 'payumoney', 15),
(10, 'Razorpay', 'Razorpay -  payment method description will go here.', 0, 'razorpay.png', 'razorpay', 9),
(13, 'Stripe', 'Stripe -  payment method description will go here.', 0, 'stripe.png', 'stripe', 13),
(1, 'Bank Transfer', 'Bank Transfer  -  payment method description will go here.', 1, 'emi.png', 'transferbank', 4),
(14, 'Twocheckout', 'Twocheckout -  payment method description will go here.', 0, '2co.png', 'twocheckout', 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_method_fields`
--

CREATE TABLE `tbl_payment_method_fields` (
  `pmf_id` int(11) NOT NULL,
  `pmf_pmethod_id` int(11) NOT NULL,
  `pmf_key` varchar(255) NOT NULL,
  `pmf_value` varchar(255) NOT NULL,
  `pmf_serialized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_method_fields`
--

INSERT INTO `tbl_payment_method_fields` (`pmf_id`, `pmf_pmethod_id`, `pmf_key`, `pmf_value`, `pmf_serialized`) VALUES
(1, 1, 'bank_details', 'Yokart Private Ltd. \r\n#3547637383 CRN Number,\r\nNear Churchwood City Lane,\r\nTransfer to Bank Details', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ppc_payment_methods`
--

CREATE TABLE `tbl_ppc_payment_methods` (
  `ppcpmethod_id` int(11) NOT NULL,
  `ppcpmethod_name` varchar(50) NOT NULL DEFAULT '',
  `ppcpmethod_details` varchar(255) NOT NULL DEFAULT '',
  `ppcpmethod_status` tinyint(4) NOT NULL DEFAULT '0',
  `ppcpmethod_icon` varchar(255) NOT NULL,
  `ppcpmethod_code` varchar(50) NOT NULL DEFAULT '',
  `ppcpmethod_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ppc_payment_methods`
--

INSERT INTO `tbl_ppc_payment_methods` (`ppcpmethod_id`, `ppcpmethod_name`, `ppcpmethod_details`, `ppcpmethod_status`, `ppcpmethod_icon`, `ppcpmethod_code`, `ppcpmethod_display_order`) VALUES
(1, 'PayPal Payments Standard', 'PayPal Payments Standard -  payment method description will go here.', 0, 'paypal.png', 'paypalstandard', 2),
(2, 'Bank Transfer', 'Bank Transfer -  payment method description will go here.', 1, 'emi.png', 'transferbank', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ppc_payment_method_fields`
--

CREATE TABLE `tbl_ppc_payment_method_fields` (
  `ppcpmf_id` int(11) NOT NULL,
  `ppcpmf_pmethod_id` int(11) NOT NULL,
  `ppcpmf_key` varchar(255) NOT NULL,
  `ppcpmf_value` varchar(255) NOT NULL,
  `ppcpmf_serialized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `prod_id` bigint(20) NOT NULL,
  `prod_added_by` bigint(20) NOT NULL,
  `prod_category` bigint(20) NOT NULL,
  `prod_type` tinyint(1) NOT NULL,
  `prod_sku` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `prod_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `prod_slug` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prod_image` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prod_brand` int(11) NOT NULL,
  `prod_model` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `prod_shop` int(11) NOT NULL,
  `prod_retail_price` decimal(10,4) NOT NULL,
  `prod_sale_price` decimal(10,4) NOT NULL,
  `prod_shipping` decimal(10,2) NOT NULL,
  `prod_stock` int(11) NOT NULL,
  `prod_shipping_country` int(11) NOT NULL,
  `prod_min_order_qty` int(11) NOT NULL,
  `prod_subtract_stock` tinyint(1) NOT NULL,
  `prod_requires_shipping` tinyint(1) NOT NULL,
  `prod_track_inventory` tinyint(1) NOT NULL,
  `prod_threshold_stock_level` int(11) NOT NULL,
  `prod_group` bigint(20) NOT NULL,
  `prod_markup` decimal(10,2) NOT NULL,
  `prod_markup_type` char(1) COLLATE latin1_general_ci NOT NULL,
  `prod_view_count` bigint(20) NOT NULL,
  `prod_sold_count` bigint(20) NOT NULL,
  `prod_condition` char(1) COLLATE latin1_general_ci NOT NULL,
  `prod_condition_level` tinyint(4) NOT NULL,
  `prod_added_on` datetime NOT NULL,
  `prod_published_on` datetime NOT NULL,
  `prod_status` tinyint(4) NOT NULL,
  `prod_is_expired` tinyint(4) NOT NULL,
  `prod_is_deleted` tinyint(1) NOT NULL,
  `prod_display_order` bigint(20) NOT NULL,
  `prod_enable_cod_orders` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_browsing_history`
--

CREATE TABLE `tbl_products_browsing_history` (
  `pbhistory_id` bigint(20) NOT NULL,
  `pbhistory_user_id` int(11) NOT NULL,
  `pbhistory_sessionid` varchar(20) NOT NULL,
  `pbhistory_datetime` datetime NOT NULL,
  `pbhistory_prod_id` bigint(20) NOT NULL,
  `pbhistory_seconds_spent` int(11) NOT NULL,
  `pbhistory_visits_count` int(11) NOT NULL,
  `pbhistory_is_ordered` tinyint(1) NOT NULL,
  `pbhistory_is_order_returned` tinyint(1) NOT NULL,
  `pbhistory_is_order_cancelled` tinyint(1) NOT NULL,
  `pbhistory_is_favorite` tinyint(1) NOT NULL,
  `pbhistory_is_included_in_wishlist` tinyint(1) NOT NULL,
  `pbhistory_is_in_cart` tinyint(1) NOT NULL,
  `pbhistory_is_removed_from_cart` tinyint(1) NOT NULL,
  `pbhistory_is_blocked` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_addons`
--

CREATE TABLE `tbl_product_addons` (
  `addon_source_id` int(11) NOT NULL,
  `addon_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_attributes`
--

CREATE TABLE `tbl_product_attributes` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_brands`
--

CREATE TABLE `tbl_product_brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `brand_description` text COLLATE latin1_general_ci NOT NULL,
  `brand_is_deleted` tinyint(1) NOT NULL,
  `brand_status` tinyint(1) NOT NULL,
  `brand_meta_title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `brand_meta_keywords` text COLLATE latin1_general_ci NOT NULL,
  `brand_meta_description` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbl_product_brands`
--

INSERT INTO `tbl_product_brands` (`brand_id`, `brand_name`, `brand_slug`, `brand_description`, `brand_is_deleted`, `brand_status`, `brand_meta_title`, `brand_meta_keywords`, `brand_meta_description`) VALUES
(1, 'Samsung', 'samsung', 'Samsung - description will go here', 0, 1, 'Samsung - Page Title', 'Samsung - Meta Keywords', 'Samsung - Meta Description'),
(2, 'Panasonic', 'panasonic', 'Panasonic', 0, 1, 'Panasonic', 'Panasonic', 'Panasonic'),
(3, 'Nokia', 'nokia', 'Nokia', 0, 1, 'Nokia', 'Nokia', 'Nokia'),
(4, 'Reebok', 'reebok', 'Reebok', 0, 1, 'Reebok', 'Reebok', 'Reebok'),
(5, 'Nike', 'nike', 'Nike', 0, 1, 'Nike', '', ''),
(6, 'Puma', 'puma', 'Puma', 0, 1, 'Puma', '', ''),
(7, 'LG', 'lg', 'LG', 0, 1, 'LG', '', ''),
(8, 'Sony', 'sony', 'Sony', 0, 1, 'Sony', '', ''),
(9, 'Canon', 'canon', 'Canon', 0, 1, 'Canon', '', ''),
(10, 'Nestle', 'nestle', 'Nestle', 0, 1, 'Nestle', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_discounts`
--

CREATE TABLE `tbl_product_discounts` (
  `pdiscount_id` bigint(20) NOT NULL,
  `pdiscount_product_id` int(11) NOT NULL,
  `pdiscount_priority` int(11) NOT NULL,
  `pdiscount_qty` int(11) NOT NULL,
  `pdiscount_price` decimal(10,4) NOT NULL,
  `pdiscount_start_date` date NOT NULL,
  `pdiscount_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_files`
--

CREATE TABLE `tbl_product_files` (
  `pfile_id` int(11) NOT NULL,
  `pfile_product_id` int(11) NOT NULL,
  `pfile_download_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pfile_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pfile_type` int(11) NOT NULL,
  `pfile_max_download_times` int(11) NOT NULL,
  `pfile_can_be_downloaded_within_days` int(11) NOT NULL,
  `pfile_is_digital` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_filter`
--

CREATE TABLE `tbl_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_groups`
--

CREATE TABLE `tbl_product_groups` (
  `pgroup_id` int(11) NOT NULL,
  `pgroup_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `pgroup_description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `pgroup_markup` decimal(10,2) NOT NULL,
  `pgroup_markup_type` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `pgroup_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_images`
--

CREATE TABLE `tbl_product_images` (
  `image_id` bigint(20) NOT NULL,
  `image_prod_id` bigint(20) NOT NULL,
  `image_session` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `image_file` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `image_default` tinyint(1) NOT NULL,
  `image_temp` tinyint(1) NOT NULL DEFAULT '1',
  `image_ordering` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_option`
--

CREATE TABLE `tbl_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_option_value`
--

CREATE TABLE `tbl_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_properties`
--

CREATE TABLE `tbl_product_properties` (
  `property_id` bigint(20) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `property_description` text NOT NULL,
  `property_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_property_options`
--

CREATE TABLE `tbl_product_property_options` (
  `option_id` bigint(20) NOT NULL,
  `option_property` int(11) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_description` text NOT NULL,
  `option_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_relations`
--

CREATE TABLE `tbl_product_relations` (
  `relation_source_id` int(11) NOT NULL,
  `relation_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_shipping_rates`
--

CREATE TABLE `tbl_product_shipping_rates` (
  `pship_id` int(11) NOT NULL,
  `pship_prod_id` bigint(20) NOT NULL,
  `pship_country` int(11) NOT NULL,
  `pship_company` int(11) NOT NULL,
  `pship_duration` int(11) NOT NULL,
  `pship_charges` decimal(10,4) NOT NULL,
  `pship_additional_charges` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_specials`
--

CREATE TABLE `tbl_product_specials` (
  `pspecial_id` bigint(20) NOT NULL,
  `pspecial_product_id` int(11) NOT NULL,
  `pspecial_priority` int(11) NOT NULL,
  `pspecial_price` decimal(10,4) NOT NULL,
  `pspecial_start_date` date NOT NULL,
  `pspecial_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_tags`
--

CREATE TABLE `tbl_product_tags` (
  `ptag_id` bigint(20) NOT NULL,
  `ptag_name` varchar(255) NOT NULL,
  `ptag_owner` char(1) NOT NULL DEFAULT 'A',
  `ptag_added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_temp_images`
--

CREATE TABLE `tbl_product_temp_images` (
  `image_id` bigint(20) NOT NULL,
  `image_prod_id` bigint(20) NOT NULL,
  `image_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_default` tinyint(1) NOT NULL,
  `image_temp` tinyint(1) NOT NULL DEFAULT '1',
  `image_downloaded` tinyint(1) NOT NULL COMMENT '1 => downloaded',
  `image_scrapped` datetime NOT NULL,
  `old_image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_to_tags`
--

CREATE TABLE `tbl_product_to_tags` (
  `pt_product_id` int(11) NOT NULL,
  `pt_tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prod_details`
--

CREATE TABLE `tbl_prod_details` (
  `prod_id` int(11) NOT NULL,
  `prod_length` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prod_width` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prod_height` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prod_weight` decimal(10,2) NOT NULL,
  `prod_length_class` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prod_weight_class` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prod_tags` text COLLATE latin1_general_ci NOT NULL,
  `prod_youtube_video` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prod_short_desc` text COLLATE latin1_general_ci NOT NULL,
  `prod_long_desc` text COLLATE latin1_general_ci NOT NULL,
  `prod_meta_title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prod_meta_keywords` text COLLATE latin1_general_ci NOT NULL,
  `prod_meta_description` text COLLATE latin1_general_ci NOT NULL,
  `prod_featuered` tinyint(1) NOT NULL,
  `prod_ship_free` tinyint(1) NOT NULL,
  `prod_tax_free` tinyint(1) NOT NULL,
  `prod_available_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prod_refund_requests`
--

CREATE TABLE `tbl_prod_refund_requests` (
  `refund_id` int(11) NOT NULL,
  `refund_user_id` int(11) NOT NULL,
  `refund_prod_id` int(11) NOT NULL,
  `refund_order` int(11) NOT NULL,
  `refund_qty` int(11) NOT NULL,
  `refund_reason` int(11) NOT NULL,
  `refund_or_replace` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `refund_request_date` date NOT NULL,
  `refund_request_status` tinyint(4) NOT NULL,
  `refund_request_action_by` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'U',
  `refund_request_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prod_refund_request_messages`
--

CREATE TABLE `tbl_prod_refund_request_messages` (
  `refmsg_id` bigint(20) NOT NULL,
  `refmsg_request` int(11) NOT NULL,
  `refmsg_from` int(11) NOT NULL,
  `refmsg_text` text NOT NULL,
  `refmsg_attachment` varchar(255) NOT NULL,
  `refmsg_date` datetime NOT NULL,
  `refmsg_is_deleted` tinyint(1) NOT NULL,
  `refmsg_from_type` char(1) NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prod_reviews`
--

CREATE TABLE `tbl_prod_reviews` (
  `review_id` int(11) NOT NULL,
  `review_user_id` int(11) NOT NULL,
  `review_prod_id` int(11) NOT NULL,
  `review_order` int(11) NOT NULL,
  `review_rating` int(11) NOT NULL,
  `review_title` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `review_text` text COLLATE latin1_general_ci NOT NULL,
  `reviewed_on` datetime NOT NULL,
  `review_status` tinyint(4) NOT NULL,
  `review_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotions`
--

CREATE TABLE `tbl_promotions` (
  `promotion_id` bigint(20) NOT NULL,
  `promotion_user_id` int(11) NOT NULL,
  `promotion_type` tinyint(1) NOT NULL COMMENT '1 = Products, 2 = Shop, 3 = Banners',
  `promotion_product_id` int(11) NOT NULL,
  `promotion_shop_id` int(11) NOT NULL,
  `promotion_banner_name` varchar(255) NOT NULL,
  `promotion_banner_position` varchar(5) NOT NULL,
  `promotion_banner_file` varchar(255) NOT NULL,
  `promotion_banner_url` varchar(255) NOT NULL,
  `promotion_banner_target` varchar(100) NOT NULL,
  `promotion_cost` decimal(10,4) NOT NULL,
  `promotion_budget` decimal(10,4) NOT NULL,
  `promotion_budget_period` varchar(2) NOT NULL,
  `promotion_start_date` date NOT NULL,
  `promotion_end_date` date NOT NULL,
  `promotion_resumption_date` datetime NOT NULL,
  `promotion_start_time` time NOT NULL,
  `promotion_end_time` time NOT NULL,
  `promotion_added_date` datetime NOT NULL,
  `promotion_status` tinyint(1) NOT NULL,
  `promotion_is_approved` tinyint(1) NOT NULL,
  `promotion_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotions_charges`
--

CREATE TABLE `tbl_promotions_charges` (
  `pcharge_id` bigint(20) NOT NULL,
  `pcharge_user_id` int(11) NOT NULL,
  `pcharge_promotion_id` int(11) NOT NULL,
  `pcharge_charged_amount` decimal(10,4) NOT NULL,
  `pcharge_clicks` int(11) NOT NULL,
  `pcharge_date` datetime NOT NULL,
  `pcharge_start_click_id` bigint(20) NOT NULL,
  `pcharge_end_click_id` bigint(20) NOT NULL,
  `pcharge_start_date` datetime NOT NULL,
  `pcharge_end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotions_clicks`
--

CREATE TABLE `tbl_promotions_clicks` (
  `pclick_id` bigint(20) NOT NULL,
  `pclick_promotion_id` int(11) NOT NULL,
  `pclick_user_id` int(11) NOT NULL,
  `pclick_datetime` datetime NOT NULL,
  `pclick_ip` varchar(50) NOT NULL,
  `pclick_cost` decimal(10,4) NOT NULL,
  `pclick_session_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotions_logs`
--

CREATE TABLE `tbl_promotions_logs` (
  `lprom_id` int(11) NOT NULL,
  `lprom_date` date NOT NULL,
  `lprom_impressions` int(11) NOT NULL DEFAULT '1',
  `lprom_clicks` int(11) NOT NULL,
  `lprom_orders` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_promotions_logs`
--

INSERT INTO `tbl_promotions_logs` (`lprom_id`, `lprom_date`, `lprom_impressions`, `lprom_clicks`, `lprom_orders`) VALUES
(1, '2016-12-26', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recharge_wallet_requests`
--

CREATE TABLE `tbl_recharge_wallet_requests` (
  `rwr_id` bigint(20) NOT NULL,
  `rwr_invoice_number` varchar(50) NOT NULL,
  `rwr_member_id` bigint(20) NOT NULL,
  `rwr_member_type` char(1) NOT NULL,
  `rwr_amount` decimal(10,4) NOT NULL,
  `rwr_date` datetime NOT NULL,
  `rwr_status` tinyint(1) NOT NULL,
  `rwr_payment_txn_id` varchar(50) NOT NULL,
  `rwr_payment_mode` varchar(100) NOT NULL,
  `rwr_response` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_report_reasons`
--

CREATE TABLE `tbl_report_reasons` (
  `reportreason_id` int(11) NOT NULL,
  `reportreason_title` varchar(255) NOT NULL,
  `reportreason_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_report_reasons`
--

INSERT INTO `tbl_report_reasons` (`reportreason_id`, `reportreason_title`, `reportreason_description`) VALUES
(4, 'Report Reason 1', 'Report Reason 1 - Description'),
(5, 'Report Reason 2', 'Report Reason 2 - Description'),
(6, 'Fake Shop', 'This is a Fake Shop'),
(7, 'Duplicate Products', 'This shop has duplicate products'),
(8, 'Fake Products', 'This shop has Fake Products');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_return_reasons`
--

CREATE TABLE `tbl_return_reasons` (
  `returnreason_id` int(11) NOT NULL,
  `returnreason_title` varchar(255) NOT NULL,
  `returnreason_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_return_reasons`
--

INSERT INTO `tbl_return_reasons` (`returnreason_id`, `returnreason_title`, `returnreason_description`) VALUES
(1, 'Wrong Product', 'Wrong Product'),
(2, 'Not happy with the product', 'Not happy with the product'),
(3, 'Defective Product', 'Defective Product'),
(4, 'Damaged', 'Damaged'),
(5, 'Missing Product/Accessories', 'Missing Product/Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_search_items`
--

CREATE TABLE `tbl_search_items` (
  `searchitem_id` int(11) NOT NULL,
  `searchitem_keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `searchitem_count` int(11) NOT NULL DEFAULT '1',
  `searchitem_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_companies`
--

CREATE TABLE `tbl_shipping_companies` (
  `scompany_id` int(11) NOT NULL,
  `scompany_name` varchar(255) NOT NULL,
  `scompany_website` varchar(255) NOT NULL,
  `scompany_comments` text NOT NULL,
  `scompany_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_shipping_companies`
--

INSERT INTO `tbl_shipping_companies` (`scompany_id`, `scompany_name`, `scompany_website`, `scompany_comments`, `scompany_is_deleted`) VALUES
(1, 'Fedex', 'http://www.fedex.com', 'Fedex comments', 0),
(2, 'Redex', 'http://www.redex.com', 'Easy Mobility - Comments', 0),
(3, 'Gati', '', 'Gati', 1),
(4, 'abcx', 'aa', 'abc', 1),
(5, 'DHL', 'DHL', '', 0),
(6, 'TEST', 'test.com', 'test test', 1),
(7, 'Fadex', 'Fadex.com', 'Fadex', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_durations`
--

CREATE TABLE `tbl_shipping_durations` (
  `sduration_id` int(11) NOT NULL,
  `sduration_label` varchar(255) NOT NULL,
  `sduration_from` int(11) NOT NULL,
  `sduration_to` int(11) NOT NULL,
  `sduration_days_or_weeks` char(1) NOT NULL,
  `sduration_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_shipping_durations`
--

INSERT INTO `tbl_shipping_durations` (`sduration_id`, `sduration_label`, `sduration_from`, `sduration_to`, `sduration_days_or_weeks`, `sduration_is_deleted`) VALUES
(1, '1 to 3 Business Days', 10, 10, 'W', 0),
(2, '2 to 4 Business Days', 2, 4, 'D', 1),
(3, '3 to 5 Business Days', 3, 5, 'D', 0),
(4, '4 to 6 Business Days', 4, 6, 'D', 0),
(5, '5 to 7 Business Days', 5, 7, 'D', 0),
(6, '6 to 8 Business Days', 6, 8, 'D', 0),
(7, '4 to 10 Weeks', 4, 10, 'W', 1),
(8, 'test-x', 1, 2, 'D', 1),
(9, '2-3 week', 2, 3, 'W', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shops`
--

CREATE TABLE `tbl_shops` (
  `shop_id` bigint(20) NOT NULL,
  `shop_user_id` int(11) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `shop_title` varchar(255) NOT NULL,
  `shop_description` text NOT NULL,
  `shop_contact_person` varchar(255) NOT NULL,
  `shop_address_line_1` varchar(255) NOT NULL,
  `shop_address_line_2` varchar(255) NOT NULL,
  `shop_postcode` varchar(25) NOT NULL,
  `shop_state` int(11) NOT NULL,
  `shop_country` int(11) NOT NULL,
  `shop_city` varchar(255) NOT NULL,
  `shop_phone` varchar(50) NOT NULL,
  `shop_logo` varchar(200) NOT NULL,
  `shop_banner` varchar(255) NOT NULL,
  `shop_payment_policy` text NOT NULL,
  `shop_delivery_policy` text NOT NULL,
  `shop_refund_policy` text NOT NULL,
  `shop_additional_info` text NOT NULL,
  `shop_sales` int(11) NOT NULL,
  `shop_seller_info` text NOT NULL,
  `shop_page_title` varchar(255) NOT NULL,
  `shop_meta_keywords` text NOT NULL,
  `shop_meta_description` text NOT NULL,
  `shop_payment_paypal_firstname` varchar(255) NOT NULL,
  `shop_payment_paypal_lastname` varchar(255) NOT NULL,
  `shop_payment_paypal_account` varchar(200) NOT NULL,
  `shop_paypal_account_verified` tinyint(1) NOT NULL,
  `shop_enable_cod_orders` tinyint(1) NOT NULL,
  `shop_tax_vat` decimal(10,4) NOT NULL,
  `shop_featured` tinyint(1) NOT NULL,
  `shop_status` tinyint(1) NOT NULL,
  `shop_vendor_display_status` tinyint(1) NOT NULL,
  `shop_date` date NOT NULL,
  `shop_update_date` date NOT NULL,
  `shop_is_default` tinyint(1) NOT NULL,
  `shop_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop_reports`
--

CREATE TABLE `tbl_shop_reports` (
  `sreport_id` bigint(20) NOT NULL,
  `sreport_shop` int(11) NOT NULL,
  `sreport_reason` int(11) NOT NULL,
  `sreport_message` text NOT NULL,
  `sreport_reported_by` int(11) NOT NULL,
  `sreport_date` datetime NOT NULL,
  `sreport_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slides`
--

CREATE TABLE `tbl_slides` (
  `slide_id` int(11) NOT NULL,
  `slide_title` varchar(255) NOT NULL,
  `slide_image_path` varchar(255) NOT NULL,
  `slide_url` varchar(255) NOT NULL,
  `slide_status` tinyint(4) NOT NULL,
  `slide_start_date` date NOT NULL,
  `slide_end_date` date NOT NULL,
  `slide_link_newtab` tinyint(4) NOT NULL DEFAULT '1',
  `slide_is_deleted` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_slides`
--

INSERT INTO `tbl_slides` (`slide_id`, `slide_title`, `slide_image_path`, `slide_url`, `slide_status`, `slide_start_date`, `slide_end_date`, `slide_link_newtab`, `slide_is_deleted`) VALUES
(1, 'Slide - 1', 'slide-1.jpg', '', 1, '0000-00-00', '0000-00-00', 1, 0),
(2, 'Slide - 2', 'slide-2.jpg', '', 1, '0000-00-00', '0000-00-00', 1, 0),
(3, 'Slide - 3', 'slide-3.jpg', '', 1, '0000-00-00', '0000-00-00', 1, 0),
(4, 'Slide - 4', 'slide-4.jpg', '', 1, '0000-00-00', '0000-00-00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smart_log_actions`
--

CREATE TABLE `tbl_smart_log_actions` (
  `slog_id` bigint(20) NOT NULL,
  `slog_ip` varchar(100) NOT NULL,
  `slog_datetime` datetime NOT NULL,
  `slog_action` varchar(100) NOT NULL,
  `slog_record_id` int(11) NOT NULL,
  `slog_type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smart_products_weightage`
--

CREATE TABLE `tbl_smart_products_weightage` (
  `spw_product_id` bigint(20) NOT NULL,
  `spw_weightage` decimal(10,2) NOT NULL,
  `spw_custom_weightage` decimal(10,2) NOT NULL,
  `spw_custom_weightage_valid_till` date NOT NULL,
  `spw_is_excluded` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smart_related_products`
--

CREATE TABLE `tbl_smart_related_products` (
  `tsrp_source_product_id` int(11) NOT NULL,
  `tsrp_related_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smart_user_activity_browsing`
--

CREATE TABLE `tbl_smart_user_activity_browsing` (
  `uab_id` bigint(20) NOT NULL,
  `uab_session_id` varchar(50) NOT NULL,
  `uab_user_id` int(11) NOT NULL,
  `uab_record_id` int(11) NOT NULL,
  `uab_record_type` int(11) NOT NULL COMMENT '1=Products,2=Brands,3=Category,4 = Tags   ',
  `uab_last_action_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smart_weightage_settings`
--

CREATE TABLE `tbl_smart_weightage_settings` (
  `event_key` varchar(100) NOT NULL,
  `event_weightage` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_smart_weightage_settings`
--

INSERT INTO `tbl_smart_weightage_settings` (`event_key`, `event_weightage`) VALUES
('products#view', '1.00'),
('products#time_spent', '1.00'),
('products#cart', '2.00'),
('products#cart_remove', '-1.00'),
('products#favorite', '3.00'),
('products#unfavorite', '-2.00'),
('products#wishlist', '5.00'),
('products#unwishlist', '-3.00'),
('products#rating_multiply_factor', '5.00'),
('products#order_paid', '5.00'),
('products#order_cancelled', '-3.00'),
('products#order_completed', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_platforms`
--

CREATE TABLE `tbl_social_platforms` (
  `splatform_id` int(11) NOT NULL,
  `splatform_title` varchar(255) NOT NULL,
  `splatform_url` varchar(255) NOT NULL,
  `splatform_icon_file` varchar(255) NOT NULL,
  `splatform_status` tinyint(1) NOT NULL,
  `splatform_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_social_platforms`
--

INSERT INTO `tbl_social_platforms` (`splatform_id`, `splatform_title`, `splatform_url`, `splatform_icon_file`, `splatform_status`, `splatform_is_deleted`) VALUES
(1, 'Facebook', 'http://www.facebook.com', 'fb.svg', 1, 0),
(2, 'Linked In', 'http://www.linkedin.com', 'in.svg', 1, 0),
(3, 'Twiiter', 'http://www.twitter.com', 'tw.svg', 1, 0),
(4, 'Google Plus', 'http://www.googleplus.com', 'google.svg', 1, 0),
(5, 'Youtube', 'http://www.youtube.com', 'yt.svg', 1, 0),
(6, 'Pinterest', 'http://www.pinterest.com', 'pinterest.svg', 1, 0),
(7, 'Instagram', 'http://www.instagram.com', 'instagram-logo.svg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_states`
--

CREATE TABLE `tbl_states` (
  `state_id` int(10) UNSIGNED NOT NULL,
  `zone_id` int(11) NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `state_code` varchar(25) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_delete` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_states`
--

INSERT INTO `tbl_states` (`state_id`, `zone_id`, `country_id`, `state_code`, `state_name`, `state_delete`) VALUES
(3199, 1, 3, '', 'Test', 0),
(4, 1, 1, '', 'Baghlan', 0),
(5, 1, 1, '', 'Balkh', 0),
(6, 1, 1, '', 'Bamian', 0),
(7, 1, 1, '', 'Farah', 0),
(8, 1, 1, '', 'Faryab', 0),
(9, 1, 1, '', 'Ghazni', 0),
(10, 1, 1, '', 'Ghowr', 0),
(11, 1, 1, '', 'Helmand', 0),
(12, 1, 1, '', 'Herat', 0),
(13, 1, 1, '', 'Jowzjan', 0),
(14, 1, 1, '', 'Kabol', 0),
(15, 1, 1, '', 'Kandahar', 0),
(16, 1, 1, '', 'Kapisa', 0),
(17, 1, 1, '', 'Konar', 0),
(18, 1, 1, '', 'Kondoz', 0),
(19, 1, 1, '', 'Khowst', 0),
(20, 1, 1, '', 'Laghman', 0),
(21, 1, 1, '', 'Lowgar', 0),
(22, 1, 1, '', 'Nangarhar', 0),
(23, 1, 1, '', 'Nimruz', 0),
(24, 1, 1, '', 'Oruzgan', 0),
(25, 1, 1, '', 'Paktia', 0),
(26, 1, 1, '', 'Paktika', 0),
(28, 1, 1, '', 'Samangan', 0),
(29, 1, 1, '', 'Sar-e Pol', 0),
(30, 1, 1, '', 'Takhar', 0),
(31, 1, 1, '', 'Vardak', 0),
(32, 1, 1, '', 'Zabol', 0),
(33, 1, 1, '', 'Others', 0),
(34, 1, 2, '', 'Beratit', 0),
(35, 1, 2, '', 'Dibres', 0),
(36, 1, 2, '', 'Durresit', 0),
(37, 1, 2, '', 'Elbasanit', 0),
(38, 1, 2, '', 'Fierit', 0),
(39, 1, 2, '', 'Gjirokastres', 0),
(40, 1, 2, '', 'Korces', 0),
(41, 1, 2, '', 'Kukesit', 0),
(42, 1, 2, '', 'Lezhes', 0),
(43, 1, 2, '', 'Shkodres', 0),
(44, 1, 2, '', 'Tiranes', 0),
(45, 1, 2, '', 'Vlores', 0),
(46, 1, 2, '', 'Others', 0),
(47, 1, 3, '', 'All Regions', 0),
(48, 1, 3, '', 'Adrar', 0),
(49, 1, 3, '', 'Ain Defla', 0),
(50, 1, 3, '', 'Ain Temouchent', 0),
(51, 1, 3, '', 'Alger', 0),
(52, 1, 3, '', 'Annaba', 0),
(53, 1, 3, '', 'Batna', 0),
(54, 1, 3, '', 'Bechar', 0),
(55, 1, 3, '', 'Bejaia', 0),
(56, 1, 3, '', 'Biskra', 0),
(57, 1, 3, '', 'Blida', 0),
(58, 1, 3, '', 'Bordj Bou Arreridj', 0),
(59, 1, 3, '', 'Bouira', 0),
(60, 1, 3, '', 'Boumerdes', 0),
(61, 1, 3, '', 'Chlef', 0),
(62, 1, 3, '', 'Constantine', 0),
(63, 1, 3, '', 'Djelfa', 0),
(64, 1, 3, '', 'El Bayadh', 0),
(65, 1, 3, '', 'El Oued', 0),
(66, 1, 3, '', 'Ghardaia', 0),
(67, 1, 3, '', 'Guelma', 0),
(68, 1, 3, '', 'Illizi', 0),
(69, 1, 3, '', 'Jijel', 0),
(70, 1, 3, '', 'Khenchela', 0),
(71, 1, 3, '', 'Laghouat', 0),
(72, 1, 3, '', 'Mascara', 0),
(73, 1, 3, '', 'Medea', 0),
(74, 1, 3, '', 'Mila', 0),
(75, 1, 3, '', 'Mostaganem', 0),
(76, 1, 3, '', 'MSila', 0),
(77, 1, 3, '', 'Naama', 0),
(78, 1, 3, '', 'Oran', 0),
(79, 1, 3, '', 'Ouargla', 0),
(80, 1, 3, '', 'Oum el Bouaghi', 0),
(81, 1, 3, '', 'Relizane', 0),
(82, 1, 3, '', 'Saida', 0),
(83, 1, 3, '', 'Setif', 0),
(84, 1, 3, '', 'Sidi Bel Abbes', 0),
(85, 1, 3, '', 'Skikda', 0),
(86, 1, 3, '', 'Souk Ahras', 0),
(87, 1, 3, '', 'Tamanghasset', 0),
(88, 1, 3, '', 'Tebessa', 0),
(89, 1, 3, '', 'Tiaret', 0),
(90, 1, 3, '', 'Tindouf', 0),
(91, 1, 3, '', 'Tipaza', 0),
(92, 1, 3, '', 'Tissemsilt', 0),
(93, 1, 3, '', 'Tizi Ouzou', 0),
(94, 1, 3, '', 'Tlemcen', 0),
(95, 1, 3, '', 'Others', 0),
(96, 1, 4, '', 'All Regions', 0),
(97, 1, 4, '', 'Others', 0),
(98, 1, 5, '', 'Eastern-Ituau County', 0),
(99, 1, 5, '', 'Eastern-MaOputasi County', 0),
(100, 1, 5, '', 'Eastern-SaOle County', 0),
(101, 1, 5, '', 'Eastern-Sua County', 0),
(102, 1, 5, '', 'Eastern-Vaifanua County', 0),
(103, 1, 5, '', 'Manua-Faleasao County', 0),
(104, 1, 5, '', 'Manua-Fitiuta County', 0),
(105, 1, 5, '', 'Manua-Ofu County', 0),
(106, 1, 5, '', 'Manua-Olosega County', 0),
(107, 1, 5, '', 'Manua-Tau County', 0),
(108, 1, 5, '', 'Rose Atoll', 0),
(109, 1, 5, '', 'Swains Island', 0),
(110, 1, 5, '', 'Western-Lealataua County', 0),
(111, 1, 5, '', 'Western-Leasina County', 0),
(112, 1, 5, '', 'Western-Tualatai County', 0),
(113, 1, 5, '', 'Western-Tualauta County', 0),
(114, 1, 5, '', 'Others', 0),
(115, 1, 6, '', 'All Regions', 0),
(116, 1, 6, '', 'Bengo', 0),
(117, 1, 6, '', 'Benguela', 0),
(118, 1, 6, '', 'Bie', 0),
(119, 1, 6, '', 'Cabinda', 0),
(120, 1, 6, '', 'Cuando Cubango', 0),
(121, 1, 6, '', 'Cuanza Norte', 0),
(122, 1, 6, '', 'Cuanza Sul', 0),
(123, 1, 6, '', 'Cunene', 0),
(124, 1, 6, '', 'Huambo', 0),
(125, 1, 6, '', 'Huila', 0),
(126, 1, 6, '', 'Luanda', 0),
(127, 1, 6, '', 'Lunda Norte', 0),
(128, 1, 6, '', 'Lunda Sul', 0),
(129, 1, 6, '', 'Malanje', 0),
(130, 1, 6, '', 'Moxico', 0),
(131, 1, 6, '', 'Namibe', 0),
(132, 1, 6, '', 'Uige', 0),
(133, 1, 6, '', 'Zaire', 0),
(134, 1, 6, '', 'Others', 0),
(135, 1, 7, '', 'All Regions', 0),
(136, 1, 7, '', 'Others', 0),
(137, 1, 8, '', 'All Regions', 0),
(138, 1, 8, '', 'Others', 0),
(139, 1, 9, '', 'All Regions', 0),
(140, 1, 9, '', 'Barbuda', 0),
(141, 1, 9, '', 'Saint George', 0),
(142, 1, 9, '', 'Saint John', 0),
(143, 1, 9, '', 'Saint Mary', 0),
(144, 1, 9, '', 'Saint Paul', 0),
(145, 1, 9, '', 'Saint Peter', 0),
(146, 1, 9, '', 'Saint Philip', 0),
(147, 1, 9, '', 'Others', 0),
(148, 1, 10, '', 'Buenos Aires', 0),
(149, 1, 10, '', 'Catamarca', 0),
(150, 1, 10, '', 'Chaco', 0),
(151, 1, 10, '', 'Chubut', 0),
(152, 1, 10, '', 'Cordoba', 0),
(153, 1, 10, '', 'Corrientes', 0),
(154, 1, 10, '', 'Distrito Federal', 0),
(155, 1, 10, '', 'Entre Rios', 0),
(156, 1, 10, '', 'Formosa', 0),
(157, 1, 10, '', 'Jujuy', 0),
(158, 1, 10, '', 'Mendoza', 0),
(159, 1, 10, '', 'Misiones', 0),
(160, 1, 10, '', 'Neuquen', 0),
(161, 1, 10, '', 'Pampa', 0),
(162, 1, 10, '', 'Rio Negro', 0),
(163, 1, 10, '', 'Rioja', 0),
(164, 1, 10, '', 'Salta', 0),
(165, 1, 10, '', 'San Juan', 0),
(166, 1, 10, '', 'San Luis', 0),
(167, 1, 10, '', 'Santa Cruz', 0),
(168, 1, 10, '', 'Santa Fe', 0),
(169, 1, 10, '', 'Santiago del Estero', 0),
(170, 1, 10, '', 'Tierra del Fuego', 0),
(171, 1, 10, '', 'Tucuman', 0),
(172, 1, 10, '', 'Others', 0),
(173, 1, 11, '', 'Akhuryani Shrjan ', 0),
(174, 1, 11, '', ' Amasiayi Shrjan ', 0),
(175, 1, 11, '', ' Aparani Shrjan ', 0),
(176, 1, 11, '', 'Armaviri Marz', 0),
(177, 1, 11, '', 'Gegharkuniki Marz', 0),
(178, 1, 11, '', 'Kaghak Ararat', 0),
(179, 1, 11, '', 'Kaghak Abovyan', 0),
(180, 1, 11, '', 'Kaghak Goris', 0),
(181, 1, 11, '', 'Kaghak Ijevan', 0),
(182, 1, 11, '', 'Kaghak Jermuk', 0),
(183, 1, 11, '', 'Kaghak Yerevan', 0),
(184, 1, 11, '', 'Kaghak Alaverdi', 0),
(185, 1, 11, '', 'Others', 0),
(186, 1, 12, '', 'All Regions', 0),
(187, 1, 12, '', 'Others', 0),
(188, 1, 13, '', 'Ashmore Reef', 0),
(189, 1, 13, '', 'Cartier Reef', 0),
(190, 1, 13, '', 'Others', 0),
(191, 1, 14, '', 'All Regions', 0),
(192, 1, 14, '', 'Australian Capital Territory', 0),
(193, 1, 14, '', 'Northern Territory', 0),
(194, 1, 14, '', 'New South Wales', 0),
(195, 1, 14, '', 'Queensland', 0),
(196, 1, 14, '', 'South Australia', 0),
(197, 1, 14, '', 'Tasmania', 0),
(198, 1, 14, '', 'Victoria', 0),
(199, 1, 14, '', 'Western Australia', 0),
(200, 1, 14, '', 'Others', 0),
(201, 1, 15, '', 'All Regions', 0),
(202, 1, 15, '', 'Burgenland', 0),
(203, 1, 15, '', 'Karnten', 0),
(204, 1, 15, '', 'Niederosterreich', 0),
(205, 1, 15, '', 'Oberosterreich', 0),
(206, 1, 15, '', 'Salzburg', 0),
(207, 1, 15, '', 'Steiermark', 0),
(208, 1, 15, '', 'Tirol', 0),
(209, 1, 15, '', 'Vorarlberg', 0),
(210, 1, 15, '', 'Wien', 0),
(211, 1, 15, '', 'Others', 0),
(212, 1, 16, '', 'All Regions', 0),
(213, 1, 16, '', 'Abseron ', 0),
(214, 1, 16, '', 'Agcabadi', 0),
(215, 1, 16, '', 'Agdam', 0),
(216, 1, 16, '', 'Agdas', 0),
(217, 1, 16, '', 'Agstafa', 0),
(218, 1, 16, '', 'Agsu ', 0),
(219, 1, 16, '', 'Ali Bayramli Sahari', 0),
(220, 1, 16, '', 'Astara ', 0),
(221, 1, 16, '', 'Baki Sahari', 0),
(222, 1, 16, '', 'Balakan ', 0),
(223, 1, 16, '', 'Barda ', 0),
(224, 1, 16, '', 'Beylaqan ', 0),
(225, 1, 16, '', 'Bilasuvar ', 0),
(226, 1, 16, '', 'Cabrayil ', 0),
(227, 1, 16, '', 'Calilabad ', 0),
(228, 1, 16, '', 'Daskasan ', 0),
(229, 1, 16, '', 'Davaci ', 0),
(230, 1, 16, '', 'Fuzuli ', 0),
(231, 1, 16, '', 'Gadabay ', 0),
(232, 1, 16, '', 'Ganca Sahari', 0),
(233, 1, 16, '', 'Goranboy ', 0),
(234, 1, 16, '', 'Goycay ', 0),
(235, 1, 16, '', 'Haciqabul ', 0),
(236, 1, 16, '', 'Imisli ', 0),
(237, 1, 16, '', 'Ismayilli ', 0),
(238, 1, 16, '', 'Kalbacar ', 0),
(239, 1, 16, '', 'Kurdamir ', 0),
(240, 1, 16, '', 'Lacin ', 0),
(241, 1, 16, '', 'Lankaran ', 0),
(242, 1, 16, '', 'Lankaran Sahari', 0),
(243, 1, 16, '', 'Lerik ', 0),
(244, 1, 16, '', 'Masalli ', 0),
(245, 1, 16, '', 'Mingacevir Sahari', 0),
(246, 1, 16, '', 'Naftalan Sahari', 0),
(247, 1, 16, '', 'Naxcivan Muxtar Respublikasi', 0),
(248, 1, 16, '', 'Neftcala ', 0),
(249, 1, 16, '', 'Oguz ', 0),
(250, 1, 16, '', 'Qabala ', 0),
(251, 1, 16, '', 'Qax ', 0),
(252, 1, 16, '', 'Qazax ', 0),
(253, 1, 16, '', 'Qobustan ', 0),
(254, 1, 16, '', 'Quba ', 0),
(255, 1, 16, '', 'Qubadli ', 0),
(256, 1, 16, '', 'Qusar ', 0),
(257, 1, 16, '', 'Saatli ', 0),
(258, 1, 16, '', 'Sabirabad ', 0),
(259, 1, 16, '', 'Saki ', 0),
(260, 1, 16, '', 'Saki Sahari', 0),
(261, 1, 16, '', 'Salyan ', 0),
(262, 1, 16, '', 'Samaxi ', 0),
(263, 1, 16, '', 'Samkir ', 0),
(264, 1, 16, '', 'Samux ', 0),
(265, 1, 16, '', 'Siyazan ', 0),
(266, 1, 16, '', 'Sumqayit Sahari', 0),
(267, 1, 16, '', 'Susa ', 0),
(268, 1, 16, '', 'Susa Sahari', 0),
(269, 1, 16, '', 'Tartar ', 0),
(270, 1, 16, '', 'Tovuz ', 0),
(271, 1, 16, '', 'Ucar ', 0),
(272, 1, 16, '', 'Xacmaz ', 0),
(273, 1, 16, '', 'Xankandi Sahari', 0),
(274, 1, 16, '', 'Xanlar ', 0),
(275, 1, 16, '', 'Xizi ', 0),
(276, 1, 16, '', 'Xocali ', 0),
(277, 1, 16, '', 'Xocavand ', 0),
(278, 1, 16, '', 'Yardimli ', 0),
(279, 1, 16, '', 'Yevlax ', 0),
(280, 1, 16, '', 'Yevlax Sahari', 0),
(281, 1, 16, '', 'Zangilan ', 0),
(282, 1, 16, '', 'Zaqatala ', 0),
(283, 1, 16, '', 'Zardab', 0),
(284, 1, 16, '', 'Others', 0),
(285, 1, 17, '', 'Acklins and Crooked Islands', 0),
(286, 1, 17, '', 'Bimini', 0),
(287, 1, 17, '', 'Cat Island', 0),
(288, 1, 17, '', 'Exuma', 0),
(289, 1, 17, '', 'Freeport', 0),
(290, 1, 17, '', 'Fresh Creek', 0),
(291, 1, 17, '', 'Governors Harbour', 0),
(292, 1, 17, '', 'Green Turtle Cay', 0),
(293, 1, 17, '', 'Harbour Island', 0),
(294, 1, 17, '', 'High Rock', 0),
(295, 1, 17, '', 'Inagua', 0),
(296, 1, 17, '', 'Kemps Bay', 0),
(297, 1, 17, '', 'Long Island', 0),
(298, 1, 17, '', 'Marsh Harbour', 0),
(299, 1, 17, '', 'Mayaguana', 0),
(300, 1, 17, '', 'New Providence', 0),
(301, 1, 17, '', 'Nichollstown and Berry Islands', 0),
(302, 1, 17, '', 'Ragged Island', 0),
(303, 1, 17, '', 'Rock Sound', 0),
(304, 1, 17, '', 'San Salvador and Rum Cay', 0),
(305, 1, 17, '', 'Sandy Point', 0),
(306, 1, 17, '', 'Others', 0),
(307, 1, 18, '', 'Al Hadd', 0),
(308, 1, 18, '', 'Al Manamah', 0),
(309, 1, 18, '', 'Al Mintaqah al Gharbiyah', 0),
(310, 1, 18, '', 'Al Mintaqah al Wusta', 0),
(311, 1, 18, '', 'Al Mintaqah ash Shamaliyah', 0),
(312, 1, 18, '', 'Al Muharraq', 0),
(313, 1, 18, '', 'Ar Rifa` wa al Mintaqah al Janubiyah', 0),
(314, 1, 18, '', 'Jidd Hafs', 0),
(315, 1, 18, '', 'Madinat Hamad', 0),
(316, 1, 18, '', 'Madinat `Isa', 0),
(317, 1, 18, '', 'Mintaqat Juzur Hawar', 0),
(318, 1, 18, '', 'Sitrah', 0),
(319, 1, 18, '', 'Others', 0),
(320, 1, 19, '', 'Barisal', 0),
(321, 1, 19, '', 'Chittagong', 0),
(322, 1, 19, '', 'Dhaka', 0),
(323, 1, 19, '', 'Khulna', 0),
(324, 1, 19, '', 'Rajshahi', 0),
(325, 1, 19, '', 'Others', 0),
(326, 1, 20, '', 'All Regions', 0),
(327, 1, 20, '', 'Christ Church', 0),
(328, 1, 20, '', 'Saint Andrew', 0),
(329, 1, 20, '', 'Saint George', 0),
(330, 1, 20, '', 'Saint James', 0),
(331, 1, 20, '', 'Saint John', 0),
(332, 1, 20, '', 'Saint Joseph', 0),
(333, 1, 20, '', 'Saint Lucy', 0),
(334, 1, 20, '', 'Saint Michael', 0),
(335, 1, 20, '', 'Saint Peter', 0),
(336, 1, 20, '', 'Saint Philip', 0),
(337, 1, 20, '', 'Saint Thomas', 0),
(338, 1, 20, '', 'Others', 0),
(339, 1, 21, '', 'All Regions', 0),
(340, 1, 21, '', 'Brestskaya Voblasts', 0),
(341, 1, 21, '', 'Hrodzyenskaya Voblasts', 0),
(342, 1, 21, '', 'Minskaya Voblasts', 0),
(343, 1, 21, '', 'Others', 0),
(344, 1, 22, '', 'All Regions', 0),
(345, 1, 22, '', 'Antwerpen', 0),
(346, 1, 22, '', 'Brabant', 0),
(347, 1, 22, '', 'Hainaut', 0),
(348, 1, 22, '', 'Liege', 0),
(349, 1, 22, '', 'Limburg', 0),
(350, 1, 22, '', 'Luxembourg', 0),
(351, 1, 22, '', 'Namur', 0),
(352, 1, 22, '', 'Oost-Vlaanderen', 0),
(353, 1, 22, '', 'West-Vlaanderen', 0),
(354, 1, 22, '', 'Others', 0),
(355, 1, 23, '', 'Belize', 0),
(356, 1, 23, '', 'Cayo', 0),
(357, 1, 23, '', 'Corozal', 0),
(358, 1, 23, '', 'Orange Walk', 0),
(359, 1, 23, '', 'Stann Creek', 0),
(360, 1, 23, '', 'Toledo', 0),
(361, 1, 23, '', 'Others', 0),
(362, 1, 24, '', 'All Regions', 0),
(363, 1, 24, '', 'Others', 0),
(364, 1, 25, '', 'Devonshire Parish', 0),
(365, 1, 25, '', 'Hamilton', 0),
(366, 1, 25, '', 'Hamilton Parish', 0),
(367, 1, 25, '', 'Paget Parish', 0),
(368, 1, 25, '', 'Saint George', 0),
(369, 1, 25, '', 'Saint Georges Parish', 0),
(370, 1, 25, '', 'Sandys Parish', 0),
(371, 1, 25, '', 'Smiths Parish', 0),
(372, 1, 25, '', 'Warwick Parish', 0),
(373, 1, 25, '', 'Others', 0),
(374, 1, 26, '', 'All Regions', 0),
(375, 1, 26, '', 'Bumthang', 0),
(376, 1, 26, '', 'Chhukha', 0),
(377, 1, 26, '', 'Chirang', 0),
(378, 1, 26, '', 'Daga', 0),
(379, 1, 26, '', 'Geylegphug', 0),
(380, 1, 26, '', 'Ha', 0),
(381, 1, 26, '', 'Lhuntshi', 0),
(382, 1, 26, '', 'Mongar', 0),
(383, 1, 26, '', 'Paro', 0),
(384, 1, 26, '', 'Pemagatsel', 0),
(385, 1, 26, '', 'Punakha', 0),
(386, 1, 26, '', 'Samchi', 0),
(387, 1, 26, '', 'Samdrup Jongkhar', 0),
(388, 1, 26, '', 'Shemgang', 0),
(389, 1, 26, '', 'Tashigang', 0),
(390, 1, 26, '', 'Thimphu', 0),
(391, 1, 26, '', 'Tongsa', 0),
(392, 1, 26, '', 'Wangdi Phodrang', 0),
(393, 1, 26, '', 'Others', 0),
(394, 1, 27, '', 'All Regions', 0),
(395, 1, 27, '', 'Chuquisaca', 0),
(396, 1, 27, '', 'Cochabamba', 0),
(397, 1, 27, '', 'La Paz', 0),
(398, 1, 27, '', 'Departamento del Beni', 0),
(399, 1, 27, '', 'Others', 0),
(400, 1, 28, '', 'All Regions', 0),
(401, 1, 28, '', 'Federacija Bosne i Hercegovine', 0),
(402, 1, 28, '', 'Republika Srpska', 0),
(403, 1, 28, '', 'Others', 0),
(404, 1, 29, '', 'All Regions', 0),
(405, 1, 29, '', 'Kweneng', 0),
(406, 1, 29, '', 'South-East', 0),
(407, 1, 29, '', 'Others', 0),
(408, 1, 30, '', 'All Regions', 0),
(409, 1, 30, '', 'Acre', 0),
(410, 1, 30, '', 'Alagoas', 0),
(411, 1, 30, '', 'Maranhao', 0),
(412, 1, 30, '', 'Mato Grosso', 0),
(413, 1, 30, '', 'Mato Grosso do Sul', 0),
(414, 1, 30, '', 'Minas Gerais', 0),
(415, 1, 30, '', 'Para', 0),
(416, 1, 30, '', 'Paraiba', 0),
(417, 1, 30, '', 'Parana', 0),
(418, 1, 30, '', 'Piaui', 0),
(419, 1, 30, '', 'Others', 0),
(420, 1, 31, '', 'All Regions', 0),
(421, 1, 31, '', 'Others', 0),
(422, 1, 32, '', 'All Regions', 0),
(423, 1, 32, '', 'Others', 0),
(424, 1, 33, '', 'Blagoevgrad', 0),
(425, 1, 33, '', 'Burgas', 0),
(426, 1, 33, '', 'Dobrich', 0),
(427, 1, 33, '', 'Gabrovo', 0),
(428, 1, 33, '', 'Khaskovo', 0),
(429, 1, 33, '', 'Kurdzhali', 0),
(430, 1, 33, '', 'Kyustendil', 0),
(431, 1, 33, '', 'Lovech', 0),
(432, 1, 33, '', 'Montana', 0),
(433, 1, 33, '', 'Pazardzhik', 0),
(434, 1, 33, '', 'Pernik', 0),
(435, 1, 33, '', 'Pleven', 0),
(436, 1, 33, '', 'Plovdiv', 0),
(437, 1, 33, '', 'Razgrad', 0),
(438, 1, 33, '', 'Ruse', 0),
(439, 1, 33, '', 'Shumen', 0),
(440, 1, 33, '', 'Silistra', 0),
(441, 1, 33, '', 'Sliven', 0),
(442, 1, 33, '', 'Smolyan', 0),
(443, 1, 33, '', 'Sofiya', 0),
(444, 1, 33, '', 'Sofiya-Grad', 0),
(445, 1, 33, '', 'Stara Zagora', 0),
(446, 1, 33, '', 'Turgovishte', 0),
(447, 1, 33, '', 'Varna', 0),
(448, 1, 33, '', 'Veliko Turnovo', 0),
(449, 1, 33, '', 'Vidin', 0),
(450, 1, 33, '', 'Vratsa', 0),
(451, 1, 33, '', 'Yambol', 0),
(452, 1, 33, '', 'Others', 0),
(453, 1, 34, '', 'All Regions', 0),
(454, 1, 34, '', 'Bale', 0),
(455, 1, 34, '', 'Bam', 0),
(456, 1, 34, '', 'Banwa', 0),
(457, 1, 34, '', 'Bazega', 0),
(458, 1, 34, '', 'Boulgou', 0),
(459, 1, 34, '', 'Boulkiemde', 0),
(460, 1, 34, '', 'Ganzourgou', 0),
(461, 1, 34, '', 'Gourma', 0),
(462, 1, 34, '', 'Houet', 0),
(463, 1, 34, '', 'Ioba', 0),
(464, 1, 34, '', 'Kadiogo', 0),
(465, 1, 34, '', 'Kenedougou', 0),
(466, 1, 34, '', 'Koulpelogo', 0),
(467, 1, 34, '', 'Kouritenga', 0),
(468, 1, 34, '', 'Kourweogo', 0),
(469, 1, 34, '', 'la Bougouriba', 0),
(470, 1, 34, '', 'la Comoe', 0),
(471, 1, 34, '', 'la Gnagna', 0),
(472, 1, 34, '', 'la Komondjari', 0),
(473, 1, 34, '', 'la Kompienga', 0),
(474, 1, 34, '', 'la Kossi', 0),
(475, 1, 34, '', 'la Leraba', 0),
(476, 1, 34, '', 'la Sissili', 0),
(477, 1, 34, '', 'la Tapoa', 0),
(478, 1, 34, '', 'l Oudalan', 0),
(479, 1, 34, '', 'Loroum', 0),
(480, 1, 34, '', 'Mouhoun', 0),
(481, 1, 34, '', 'Nahouri', 0),
(482, 1, 34, '', 'Namentenga', 0),
(483, 1, 34, '', 'Nayala', 0),
(484, 1, 34, '', 'Noumbiel', 0),
(485, 1, 34, '', 'Oubritenga', 0),
(486, 1, 34, '', 'Passore', 0),
(487, 1, 34, '', 'Poni', 0),
(488, 1, 34, '', 'Sanguie', 0),
(489, 1, 34, '', 'Sanmatenga', 0),
(490, 1, 34, '', 'Seno', 0),
(491, 1, 34, '', 'Soum', 0),
(492, 1, 34, '', 'Sourou', 0),
(493, 1, 34, '', 'Tuy', 0),
(494, 1, 34, '', 'Yagha', 0),
(495, 1, 34, '', 'Yatenga', 0),
(496, 1, 34, '', 'Ziro', 0),
(497, 1, 34, '', 'Zondoma', 0),
(498, 1, 34, '', 'Zoundweogo', 0),
(499, 1, 34, '', 'Others', 0),
(500, 1, 35, '', 'All Regions', 0),
(501, 1, 35, '', 'Ayeyarwady', 0),
(502, 1, 35, '', 'Bago', 0),
(503, 1, 35, '', 'Chin State', 0),
(504, 1, 35, '', 'Kachin State', 0),
(505, 1, 35, '', 'Kayah State', 0),
(506, 1, 35, '', 'Kayin State', 0),
(507, 1, 35, '', 'Magway', 0),
(508, 1, 35, '', 'Mandalay', 0),
(509, 1, 35, '', 'Mon State', 0),
(510, 1, 35, '', 'Rakhine State', 0),
(511, 1, 35, '', 'Sagaing', 0),
(512, 1, 35, '', 'Shan State', 0),
(513, 1, 35, '', 'Tanintharyi', 0),
(514, 1, 35, '', 'Yangon', 0),
(515, 1, 35, '', 'Others', 0),
(516, 1, 36, '', 'Bubanza', 0),
(517, 1, 36, '', 'Bujumbura', 0),
(518, 1, 36, '', 'Bururi', 0),
(519, 1, 36, '', 'Cankuzo', 0),
(520, 1, 36, '', 'Cibitoke', 0),
(521, 1, 36, '', 'Gitega', 0),
(522, 1, 36, '', 'Karuzi', 0),
(523, 1, 36, '', 'Kayanza', 0),
(524, 1, 36, '', 'Kirundo', 0),
(525, 1, 36, '', 'Makamba', 0),
(526, 1, 36, '', 'Muyinga', 0),
(527, 1, 36, '', 'Ngozi', 0),
(528, 1, 36, '', 'Rutana', 0),
(529, 1, 36, '', 'Ruyigi', 0),
(530, 1, 36, '', 'Others', 0),
(531, 1, 37, '', 'All Regions', 0),
(532, 1, 37, '', 'Banteay Mean Cheay', 0),
(533, 1, 37, '', 'Batdambang', 0),
(534, 1, 37, '', 'Kampong Cham', 0),
(535, 1, 37, '', 'Kampong Chhnang', 0),
(536, 1, 37, '', 'Kampong Spoe', 0),
(537, 1, 37, '', 'Kampong Thum', 0),
(538, 1, 37, '', 'Kampot', 0),
(539, 1, 37, '', 'Kandal', 0),
(540, 1, 37, '', 'Kaoh Kong', 0),
(541, 1, 37, '', 'Kracheh', 0),
(542, 1, 37, '', 'Mondol Kiri', 0),
(543, 1, 37, '', 'Pouthisat', 0),
(544, 1, 37, '', 'Preah Vihear', 0),
(545, 1, 37, '', 'Prey Veng', 0),
(546, 1, 37, '', 'Rotanah Kiri', 0),
(547, 1, 37, '', 'Siem Reab', 0),
(548, 1, 37, '', 'Stoeng Treng', 0),
(549, 1, 37, '', 'Svay Rieng', 0),
(550, 1, 37, '', 'Takev', 0),
(551, 1, 37, '', 'Others', 0),
(552, 1, 38, '', 'All Regions', 0),
(553, 1, 38, '', 'East Province', 0),
(554, 1, 38, '', 'l Adamaoua', 0),
(555, 1, 38, '', 'lExtreme-Nord', 0),
(556, 1, 38, '', 'l Ouest', 0),
(557, 1, 38, '', 'Province du Centre', 0),
(558, 1, 38, '', 'Province du Littoral', 0),
(559, 1, 38, '', 'Province du Nord', 0),
(560, 1, 38, '', 'Province du Nord-Ouest', 0),
(561, 1, 38, '', 'South Province', 0),
(562, 1, 38, '', 'Others', 0),
(563, 1, 39, '', 'All Regions', 0),
(564, 1, 39, '', 'Alberta', 0),
(565, 1, 39, '', 'British Columbia', 0),
(566, 1, 39, '', 'Ile-du-Prince-Edouard', 0),
(567, 1, 39, '', 'Manitoba', 0),
(568, 1, 39, '', 'New Brunswick', 0),
(569, 1, 39, '', 'Newfoundland and Labrador', 0),
(570, 1, 39, '', 'Nord-Ouest', 0),
(571, 1, 39, '', 'Nouvelle-Ecosse', 0),
(572, 1, 39, '', 'Nunavut', 0),
(573, 1, 39, '', 'Ontario', 0),
(574, 1, 39, '', 'Quebec', 0),
(575, 1, 39, '', 'Saskatchewan', 0),
(576, 1, 39, '', 'Yukon', 0),
(577, 1, 39, '', 'Others', 0),
(578, 1, 40, '', 'All Regions', 0),
(579, 1, 40, '', 'Others', 0),
(580, 1, 41, '', 'All Regions', 0),
(581, 1, 41, '', 'Others', 0),
(582, 1, 42, '', 'All Regions', 0),
(583, 1, 42, '', 'Bamingui-Bangoran', 0),
(584, 1, 42, '', 'Commune de Bangui', 0),
(585, 1, 42, '', 'Lobaye', 0),
(586, 1, 42, '', 'Ouaka', 0),
(587, 1, 42, '', 'Others', 0),
(588, 1, 43, '', 'All Regions', 0),
(589, 1, 43, '', 'Batha', 0),
(590, 1, 43, '', 'Biltine', 0),
(591, 1, 43, '', 'Borkou-Ennedi-Tibesti', 0),
(592, 1, 43, '', 'Chari-Baguirmi', 0),
(593, 1, 43, '', 'Guera', 0),
(594, 1, 43, '', 'Kanem', 0),
(595, 1, 43, '', 'Lac', 0),
(596, 1, 43, '', 'Logone Occidental', 0),
(597, 1, 43, '', 'Logone Oriental', 0),
(598, 1, 43, '', 'Mayo-Kebbi', 0),
(599, 1, 43, '', 'Moyen-Chari', 0),
(600, 1, 43, '', 'Ouaddai', 0),
(601, 1, 43, '', 'Salamat', 0),
(602, 1, 43, '', 'Tandjile', 0),
(603, 1, 43, '', 'Others', 0),
(604, 1, 44, '', 'All Regions', 0),
(605, 1, 44, '', 'Aisen del General Carlos Ibanez del Campo', 0),
(606, 1, 44, '', 'Antofagasta', 0),
(607, 1, 44, '', 'Araucania', 0),
(608, 1, 44, '', 'Atacama', 0),
(609, 1, 44, '', 'Biobio', 0),
(610, 1, 44, '', 'Coquimbo', 0),
(611, 1, 44, '', 'Libertador General Bernardo OHiggins', 0),
(612, 1, 44, '', 'Los Lagos', 0),
(613, 1, 44, '', 'Magallanes y de la Antartica Chilena', 0),
(614, 1, 44, '', 'Maule', 0),
(615, 1, 44, '', 'Metropolitana de Santiago', 0),
(616, 1, 44, '', 'Tarapaca', 0),
(617, 1, 44, '', 'Valparaiso', 0),
(618, 1, 44, '', 'Others', 0),
(619, 1, 45, '', 'Anhui Sheng', 0),
(620, 1, 45, '', 'Beijing Shi', 0),
(621, 1, 45, '', 'Chongqing Shi', 0),
(622, 1, 45, '', 'Fujian Sheng', 0),
(623, 1, 45, '', 'Gansu Sheng', 0),
(624, 1, 45, '', 'Guangdong Sheng', 0),
(625, 1, 45, '', 'Guangxi Zhuangzu Zizhiqu', 0),
(626, 1, 45, '', 'Guizhou Sheng', 0),
(627, 1, 45, '', 'Hainan Sheng', 0),
(628, 1, 45, '', 'Hebei Sheng', 0),
(629, 1, 45, '', 'Heilongjiang Sheng', 0),
(630, 1, 45, '', 'Henan Sheng', 0),
(631, 1, 45, '', 'Hunan Sheng', 0),
(632, 1, 45, '', 'Jiangsu Sheng', 0),
(633, 1, 45, '', 'Jiangxi Sheng', 0),
(634, 1, 45, '', 'Jilin Sheng', 0),
(635, 1, 45, '', 'Nei Mongol Zizhiqu', 0),
(636, 1, 45, '', 'Ningxia Huizu Zizhiqu', 0),
(637, 1, 45, '', 'Qinghai Sheng', 0),
(638, 1, 45, '', 'Shaanxi Sheng', 0),
(639, 1, 45, '', 'Shanghai Shi', 0),
(640, 1, 45, '', 'Shanxi Sheng', 0),
(641, 1, 45, '', 'Sichuan Sheng', 0),
(642, 1, 45, '', 'Tianjin Shi', 0),
(643, 1, 45, '', 'Xinjiang Uygur Zizhiqu', 0),
(644, 1, 45, '', 'Xizang Zizhiqu', 0),
(645, 1, 45, '', 'Yunnan Sheng', 0),
(646, 1, 45, '', 'Zhejiang Sheng', 0),
(647, 1, 45, '', 'Others', 0),
(648, 1, 46, '', 'Settlement', 0),
(649, 1, 46, '', 'Others', 0),
(650, 1, 47, '', 'All Regions', 0),
(651, 1, 47, '', 'Others', 0),
(652, 1, 48, '', 'All Regions', 0),
(653, 1, 48, '', 'Others', 0),
(654, 1, 49, '', 'All Regions', 0),
(655, 1, 49, '', 'Amazonas', 0),
(656, 1, 49, '', 'Antioquia', 0),
(657, 1, 49, '', 'Cesar', 0),
(658, 1, 49, '', 'Choco', 0),
(659, 1, 49, '', 'Cordoba', 0),
(660, 1, 49, '', 'Guainia', 0),
(661, 1, 49, '', 'Guaviare', 0),
(662, 1, 49, '', 'Huila', 0),
(663, 1, 49, '', 'La Guajira', 0),
(664, 1, 49, '', 'Magdalena', 0),
(665, 1, 49, '', 'Meta', 0),
(666, 1, 49, '', 'Narino', 0),
(667, 1, 49, '', 'Norte de Santander', 0),
(668, 1, 49, '', 'Putumayo', 0),
(669, 1, 49, '', 'Quindio', 0),
(670, 1, 49, '', 'Risaralda', 0),
(671, 1, 49, '', 'Santander', 0),
(672, 1, 49, '', 'Santa Catalina,Archipielago de San Andres', 0),
(673, 1, 49, '', 'Others', 0),
(674, 1, 50, '', 'All Regions', 0),
(675, 1, 50, '', 'Anjouan', 0),
(676, 1, 50, '', 'Grande Comore', 0),
(677, 1, 50, '', 'Moheli', 0),
(678, 1, 50, '', 'Others', 0),
(679, 1, 51, '', 'All Regions', 0),
(680, 1, 51, '', 'Bouenza', 0),
(681, 1, 51, '', 'Commune de Brazzaville', 0),
(682, 1, 51, '', 'Cuvette', 0),
(683, 1, 51, '', 'Kouilou', 0),
(684, 1, 51, '', 'Lekoumou', 0),
(685, 1, 51, '', 'Likouala', 0),
(686, 1, 51, '', 'Niari', 0),
(687, 1, 51, '', 'Plateaux', 0),
(688, 1, 51, '', 'Pool', 0),
(689, 1, 51, '', 'Sangha', 0),
(690, 1, 51, '', 'Others', 0),
(691, 1, 52, '', 'All Regions', 0),
(692, 1, 52, '', 'Others', 0),
(693, 1, 53, '', 'Alajuela', 0),
(694, 1, 53, '', 'Cartago', 0),
(695, 1, 53, '', 'Guanacaste', 0),
(696, 1, 53, '', 'Heredia', 0),
(697, 1, 53, '', 'Limon', 0),
(698, 1, 53, '', 'Puntarenas', 0),
(699, 1, 53, '', 'San Jose', 0),
(700, 1, 53, '', 'Others', 0),
(701, 1, 54, '', 'All Regions', 0),
(702, 1, 54, '', 'Abengourou', 0),
(703, 1, 54, '', 'Abidjan', 0),
(704, 1, 54, '', 'Aboisso', 0),
(705, 1, 54, '', 'Adiake', 0),
(706, 1, 54, '', 'Adzope', 0),
(707, 1, 54, '', 'Agboville', 0),
(708, 1, 54, '', 'Alepe', 0),
(709, 1, 54, '', 'Beoumi', 0),
(710, 1, 54, '', 'Biankouma', 0),
(711, 1, 54, '', 'Bondoukou', 0),
(712, 1, 54, '', 'Bouafle', 0),
(713, 1, 54, '', 'Bouake', 0),
(714, 1, 54, '', 'Bouna', 0),
(715, 1, 54, '', 'Boundiali', 0),
(716, 1, 54, '', 'Dabakala', 0),
(717, 1, 54, '', 'Dabou', 0),
(718, 1, 54, '', 'Daloa', 0),
(719, 1, 54, '', 'Danane', 0),
(720, 1, 54, '', 'Daoukro', 0),
(721, 1, 54, '', 'Dimbokro', 0),
(722, 1, 54, '', 'Divo', 0),
(723, 1, 54, '', 'Ferkessedougou', 0),
(724, 1, 54, '', 'Gagnoa', 0),
(725, 1, 54, '', 'Grand-Bassam', 0),
(726, 1, 54, '', 'Guiglo', 0),
(727, 1, 54, '', 'Jacqueville', 0),
(728, 1, 54, '', 'Katiola', 0),
(729, 1, 54, '', 'Korhogo', 0),
(730, 1, 54, '', 'Man', 0),
(731, 1, 54, '', 'Mankono', 0),
(732, 1, 54, '', 'Mbahiakro', 0),
(733, 1, 54, '', 'Odienne', 0),
(734, 1, 54, '', 'Oume', 0),
(735, 1, 54, '', 'Sakassou', 0),
(736, 1, 54, '', 'San-Pedro', 0),
(737, 1, 54, '', 'Sassandra', 0),
(738, 1, 54, '', 'Seguela', 0),
(739, 1, 54, '', 'Sinfra', 0),
(740, 1, 54, '', 'Tabou', 0),
(741, 1, 54, '', 'Tanda', 0),
(742, 1, 54, '', 'Touba', 0),
(743, 1, 54, '', 'Toumodi', 0),
(744, 1, 54, '', 'Vavoua', 0),
(745, 1, 54, '', 'Zuenoula', 0),
(746, 1, 54, '', 'Others', 0),
(747, 1, 55, '', 'All Regions', 0),
(748, 1, 55, '', 'Bjelovarsko-Bilogorska', 0),
(749, 1, 55, '', 'Brodsko-Posavska', 0),
(750, 1, 55, '', 'Dubrovacko-Neretvanska', 0),
(751, 1, 55, '', 'Grad Zagreb', 0),
(752, 1, 55, '', 'Istarska', 0),
(753, 1, 55, '', 'Karlovacka', 0),
(754, 1, 55, '', 'Koprivnicko-Krizevacka', 0),
(755, 1, 55, '', 'Krapinsko-Zagorska', 0),
(756, 1, 55, '', 'Licko-Senjska', 0),
(757, 1, 55, '', 'Medimurska', 0),
(758, 1, 55, '', 'Osjecko-Baranjska', 0),
(759, 1, 55, '', 'Pozesko-Slavonska', 0),
(760, 1, 55, '', 'Primorsko-Goranska', 0),
(761, 1, 55, '', 'Sibensko-Kninska', 0),
(762, 1, 55, '', 'Sisacko-Moslavacka', 0),
(763, 1, 55, '', 'Splitsko-Dalmatinska', 0),
(764, 1, 55, '', 'Varazdinska', 0),
(765, 1, 55, '', 'Viroviticko-Podravska', 0),
(766, 1, 55, '', 'Vukovarsko-Srijemska', 0),
(767, 1, 55, '', 'Zagrebacka', 0),
(768, 1, 55, '', 'Others', 0),
(769, 1, 56, '', 'All Regions', 0),
(770, 1, 56, '', 'Guantanamo', 0),
(771, 1, 56, '', 'Holguin', 0),
(772, 1, 56, '', 'La Habana', 0),
(773, 1, 56, '', 'Pinar del Rio', 0),
(774, 1, 56, '', 'Others', 0),
(775, 1, 57, '', 'All Regions', 0),
(776, 1, 57, '', 'Others', 0),
(777, 1, 58, '', 'Central Bohemian', 0),
(778, 1, 58, '', 'Hradec Králové', 0),
(779, 1, 58, '', 'Karlovy Vary', 0),
(780, 1, 58, '', 'Liberec', 0),
(781, 1, 58, '', 'Moravian-Silesian', 0),
(782, 1, 58, '', 'Olomouc', 0),
(783, 1, 58, '', 'Pardubice', 0),
(784, 1, 58, '', 'Plzen Plzen', 0),
(785, 1, 58, '', 'Prague', 0),
(786, 1, 58, '', 'South Bohemian', 0),
(787, 1, 58, '', 'South Moravian', 0),
(788, 1, 58, '', 'Ústí nad Labem', 0),
(789, 1, 58, '', 'Vysocina', 0),
(790, 1, 58, '', 'Zlín Zlín', 0),
(791, 1, 58, '', 'Others', 0),
(792, 1, 59, '', 'All Regions', 0),
(793, 1, 59, '', 'Arhus', 0),
(794, 1, 59, '', 'Bornholms', 0),
(795, 1, 59, '', 'Frederiksberg Kommune', 0),
(796, 1, 59, '', 'Frederiksborg', 0),
(797, 1, 59, '', 'Fyns', 0),
(798, 1, 59, '', 'Kobenhavns', 0),
(799, 1, 59, '', 'Kobenhavns Kommune', 0),
(800, 1, 59, '', 'Nordjyllands', 0),
(801, 1, 59, '', 'Ribe', 0),
(802, 1, 59, '', 'Ringkobing', 0),
(803, 1, 59, '', 'Roskilde', 0),
(804, 1, 59, '', 'Sonderjyllands', 0),
(805, 1, 59, '', 'Storstroms', 0),
(806, 1, 59, '', 'Vejle', 0),
(807, 1, 59, '', 'Vestsjaellands', 0),
(808, 1, 59, '', 'Viborg', 0),
(809, 1, 59, '', 'Others', 0),
(810, 1, 60, '', 'Ali Sabih', 0),
(811, 1, 60, '', 'Dikhil', 0),
(812, 1, 60, '', 'Djibouti', 0),
(813, 1, 60, '', 'Obock', 0),
(814, 1, 60, '', 'Tadjoura', 0),
(815, 1, 60, '', 'Others', 0),
(816, 1, 61, '', 'Saint Andrew', 0),
(817, 1, 61, '', 'Saint David', 0),
(818, 1, 61, '', 'Saint George', 0),
(819, 1, 61, '', 'Saint John', 0),
(820, 1, 61, '', 'Saint Joseph', 0),
(821, 1, 61, '', 'Saint Luke', 0),
(822, 1, 61, '', 'Saint Mark', 0),
(823, 1, 61, '', 'Saint Patrick', 0),
(824, 1, 61, '', 'Saint Paul', 0),
(825, 1, 61, '', 'Saint Peter', 0),
(826, 1, 61, '', 'Others', 0),
(827, 1, 62, '', 'Azua', 0),
(828, 1, 62, '', 'Baoruco', 0),
(829, 1, 62, '', 'Barahona', 0),
(830, 1, 62, '', 'Dajabon', 0),
(831, 1, 62, '', 'Distrito Nacional', 0),
(832, 1, 62, '', 'Duarte', 0),
(833, 1, 62, '', 'El Seibo', 0),
(834, 1, 62, '', 'Elias Pina', 0),
(835, 1, 62, '', 'Espaillat', 0),
(836, 1, 62, '', 'Hato Mayor', 0),
(837, 1, 62, '', 'Independencia', 0),
(838, 1, 62, '', 'La Altagracia', 0),
(839, 1, 62, '', 'La Romana', 0),
(840, 1, 62, '', 'La Vega', 0),
(841, 1, 62, '', 'Maria Trinidad Sanchez', 0),
(842, 1, 62, '', 'Monsenor Nouel', 0),
(843, 1, 62, '', 'Monte Cristi', 0),
(844, 1, 62, '', 'Monte Plata', 0),
(845, 1, 62, '', ' Pedernales', 0),
(846, 1, 62, '', ' Peravia', 0),
(847, 1, 62, '', 'Puerto Plata', 0),
(848, 1, 62, '', 'Salcedo', 0),
(849, 1, 62, '', 'Samana', 0),
(850, 1, 62, '', 'San Cristobal', 0),
(851, 1, 62, '', 'San Juan', 0),
(852, 1, 62, '', 'San Pedro de Macoris', 0),
(853, 1, 62, '', 'Sanchez Ramirez', 0),
(854, 1, 62, '', 'Santiago', 0),
(855, 1, 62, '', 'Santiago Rodriguez', 0),
(856, 1, 62, '', 'Valverde', 0),
(857, 1, 62, '', 'Others', 0),
(858, 1, 63, '', 'Azuay', 0),
(859, 1, 63, '', 'Bolivar', 0),
(860, 1, 63, '', 'Canar', 0),
(861, 1, 63, '', 'Carchi', 0),
(862, 1, 63, '', 'Chimborazo', 0),
(863, 1, 63, '', 'Cotopaxi', 0),
(864, 1, 63, '', 'El Oro', 0),
(865, 1, 63, '', 'Esmeraldas', 0),
(866, 1, 63, '', 'Francisco de Orellana', 0),
(867, 1, 63, '', 'Galapagos', 0),
(868, 1, 63, '', 'Guayas', 0),
(869, 1, 63, '', 'Imbabura', 0),
(870, 1, 63, '', 'Loja', 0),
(871, 1, 63, '', 'Los Rios', 0),
(872, 1, 63, '', 'Manabi', 0),
(873, 1, 63, '', 'Morona Santiago', 0),
(874, 1, 63, '', 'Napo', 0),
(875, 1, 63, '', 'Pastaza', 0),
(876, 1, 63, '', 'Pichincha', 0),
(877, 1, 63, '', 'Sucumbios', 0),
(878, 1, 63, '', 'Tungurahua', 0),
(879, 1, 63, '', 'Zamora Chinchipe', 0),
(880, 1, 63, '', 'Others', 0),
(881, 1, 64, '', 'All Regions', 0),
(882, 1, 64, '', 'Muhafazat ad Daqahliyah', 0),
(883, 1, 64, '', 'Muhafazat al Bahr al Ahmar', 0),
(884, 1, 64, '', 'Muhafazat al Buhayrah', 0),
(885, 1, 64, '', 'Muhafazat al Fayyum', 0),
(886, 1, 64, '', 'Muhafazat al Gharbiyah', 0),
(887, 1, 64, '', 'Muhafazat al Iskandariyah', 0),
(888, 1, 64, '', 'Muhafazat al Isma`iliyah', 0),
(889, 1, 64, '', 'Muhafazat al Jizah', 0),
(890, 1, 64, '', 'Muhafazat al Minufiyah', 0),
(891, 1, 64, '', 'Muhafazat al Minya', 0),
(892, 1, 64, '', 'Muhafazat al Qahirah', 0),
(893, 1, 64, '', 'Muhafazat al Qalyubiyah', 0),
(894, 1, 64, '', 'Muhafazat al Wadi al Jadid', 0),
(895, 1, 64, '', 'Muhafazat as Suways', 0),
(896, 1, 64, '', 'Muhafazat ash Sharqiyah', 0),
(897, 1, 64, '', 'Muhafazat Aswan', 0),
(898, 1, 64, '', 'Muhafazat Asyut', 0),
(899, 1, 64, '', 'Muhafazat Bur Sa`id', 0),
(900, 1, 64, '', 'Muhafazat Dumyat', 0),
(901, 1, 64, '', 'Muhafazat Janub Sina', 0),
(902, 1, 64, '', 'Muhafazat Kafr ash Shaykh', 0),
(903, 1, 64, '', 'Muhafazat Matruh', 0),
(904, 1, 64, '', 'Muhafazat Qina', 0),
(905, 1, 64, '', 'Muhafazat Shamal Sina', 0),
(906, 1, 64, '', 'Muhafazat Suhaj', 0),
(907, 1, 64, '', 'Others', 0),
(908, 1, 65, '', 'Ahuachapan', 0),
(909, 1, 65, '', 'Cabanas', 0),
(910, 1, 65, '', 'Chalatenango', 0),
(911, 1, 65, '', 'Cuscatlan', 0),
(912, 1, 65, '', 'La Libertad', 0),
(913, 1, 65, '', 'La Paz', 0),
(914, 1, 65, '', 'La Union', 0),
(915, 1, 65, '', 'Morazan', 0),
(916, 1, 65, '', 'San Miguel', 0),
(917, 1, 65, '', 'San Salvador', 0),
(918, 1, 65, '', 'San Vicente', 0),
(919, 1, 65, '', 'Santa Ana', 0),
(920, 1, 65, '', 'Sonsonate', 0),
(921, 1, 65, '', 'Usulutan', 0),
(922, 1, 65, '', 'Others', 0),
(923, 1, 66, '', 'Annobon', 0),
(924, 1, 66, '', 'Kie-Ntem', 0),
(925, 1, 66, '', 'Others', 0),
(926, 1, 67, '', 'All Regions', 0),
(927, 1, 67, '', 'Others', 0),
(928, 1, 68, '', 'Harjumaa', 0),
(929, 1, 68, '', 'Hiiumaa', 0),
(930, 1, 68, '', 'Ida-Virumaa', 0),
(931, 1, 68, '', 'Jarvamaa', 0),
(932, 1, 68, '', 'Jogevamaa', 0),
(933, 1, 68, '', 'Kohtla-Jarve', 0),
(934, 1, 68, '', 'Laanemaa', 0),
(935, 1, 68, '', 'Laane-Virumaa', 0),
(936, 1, 68, '', 'Parnumaa', 0),
(937, 1, 68, '', 'Polvamaa', 0),
(938, 1, 68, '', 'Raplamaa', 0),
(939, 1, 68, '', 'Saaremaa', 0),
(940, 1, 68, '', 'Tartumaa', 0),
(941, 1, 68, '', 'Valgamaa', 0),
(942, 1, 68, '', 'Viljandimaa', 0),
(943, 1, 68, '', 'Vorumaa', 0),
(944, 1, 68, '', 'Others', 0),
(945, 1, 69, '', 'All Regions', 0),
(946, 1, 69, '', 'Welega Kifle Hager', 0),
(947, 1, 69, '', 'Others', 0),
(948, 1, 70, '', 'All Regions', 0),
(949, 1, 70, '', 'Others', 0),
(950, 1, 71, '', 'All Regions', 0),
(951, 1, 71, '', 'Others', 0),
(952, 1, 72, '', 'Faeroerne', 0),
(953, 1, 72, '', 'Others', 0),
(954, 1, 73, '', 'All Regions', 0),
(955, 1, 73, '', 'Others', 0),
(956, 1, 74, '', 'Ahvenanmaan', 0),
(957, 1, 74, '', 'All Regions', 0),
(958, 1, 74, '', 'Etela-Suomen', 0),
(959, 1, 74, '', 'Ita-Suomen', 0),
(960, 1, 74, '', 'Lansi-Suomen', 0),
(961, 1, 74, '', 'Lapin', 0),
(962, 1, 74, '', 'Oulun', 0),
(963, 1, 74, '', 'Others', 0),
(964, 1, 75, '', 'Alsace', 0),
(965, 1, 75, '', 'Aquitaine', 0),
(966, 1, 75, '', 'Auvergne', 0),
(967, 1, 75, '', 'Basse-Normandie', 0),
(968, 1, 75, '', 'Others', 0),
(969, 1, 76, '', 'Departement de la Guyane', 0),
(970, 1, 76, '', 'Others', 0),
(971, 1, 77, '', 'Territoire de la Polynesie Francaise', 0),
(972, 1, 77, '', 'Others', 0),
(973, 1, 78, '', 'Territoire des Terres Australes et Antarctiques Francaises', 0),
(974, 1, 78, '', 'Others', 0),
(975, 1, 79, '', 'Estuaire', 0),
(976, 1, 79, '', 'Ogooue-Ivindo', 0),
(977, 1, 79, '', 'Ogooue-Lolo', 0),
(978, 1, 79, '', 'Ogooue-Maritime', 0),
(979, 1, 79, '', 'Ngounie', 0),
(980, 1, 79, '', 'Nyanga', 0),
(981, 1, 79, '', 'Haut-Ogooue', 0),
(982, 1, 79, '', 'Moyen-Ogooue', 0),
(983, 1, 79, '', 'Woleu-Ntem', 0),
(984, 1, 79, '', 'Others', 0),
(985, 1, 80, '', 'All Regions', 0),
(986, 1, 80, '', 'Banjul', 0),
(987, 1, 80, '', 'Lower River Division', 0),
(988, 1, 80, '', 'North Bank Division', 0),
(989, 1, 80, '', 'Western Division', 0),
(990, 1, 80, '', 'Others', 0),
(991, 1, 81, '', 'All Regions', 0),
(992, 1, 81, '', 'Others', 0),
(993, 1, 82, '', 'Abashis Raioni', 0),
(994, 1, 82, '', 'Akhalkalakis Raioni', 0),
(995, 1, 82, '', 'Akhaltsikhis Raioni', 0),
(996, 1, 82, '', 'Akhmetis Raioni', 0),
(997, 1, 82, '', 'All Regions', 0),
(998, 1, 82, '', 'Ambrolauris Raioni', 0),
(999, 1, 82, '', 'Aspindzis Raioni', 0),
(1000, 1, 82, '', 'Borjomis Raioni', 0),
(1001, 1, 82, '', 'Dedoplistsqaros Raioni', 0),
(1002, 1, 82, '', 'Kalaki Chiatura', 0),
(1003, 1, 82, '', 'Karelis Raioni', 0),
(1004, 1, 82, '', 'Kharagaulis Raioni', 0),
(1005, 1, 82, '', 'Khashuris Raioni', 0),
(1006, 1, 82, '', 'Lagodekhis Raioni', 0),
(1007, 1, 82, '', 'Ninotsmindis Raioni', 0),
(1008, 1, 82, '', 'Onis Raioni', 0),
(1009, 1, 82, '', 'Qvarlis Raioni', 0),
(1010, 1, 82, '', 'Sachkheris Raioni', 0),
(1011, 1, 82, '', 'Sokhumis Raioni', 0),
(1012, 1, 82, '', 'Telavis Raioni', 0),
(1013, 1, 82, '', 'Zestaponis Raioni', 0),
(1014, 1, 82, '', 'Others', 0),
(1015, 1, 83, '', 'All Regions', 0),
(1016, 1, 83, '', 'Baden-Wurttemberg', 0),
(1017, 1, 83, '', 'Bayern', 0),
(1018, 1, 83, '', 'Berlin', 0),
(1019, 1, 83, '', 'Brandenburg', 0),
(1020, 1, 83, '', 'Freie Hansestadt Bremen', 0),
(1021, 1, 83, '', 'Freie und Hansestadt Hamburg', 0),
(1022, 1, 83, '', 'Hessen', 0),
(1023, 1, 83, '', 'Mecklenburg-Vorpommern', 0),
(1024, 1, 83, '', 'Niedersachsen', 0),
(1025, 1, 83, '', 'Nordrhein-Westfalen', 0),
(1026, 1, 83, '', 'Rheinland-Pfalz', 0),
(1027, 1, 83, '', 'Saarland', 0),
(1028, 1, 83, '', 'Sachsen', 0),
(1029, 1, 83, '', 'Sachsen-Anhalt', 0),
(1030, 1, 83, '', 'Schleswig-Holstein', 0),
(1031, 1, 83, '', 'Thuringen', 0),
(1032, 1, 83, '', 'Others', 0),
(1033, 1, 84, '', 'Northern Region', 0),
(1034, 1, 84, '', 'Upper East Region', 0),
(1035, 1, 84, '', 'Upper West Region', 0),
(1036, 1, 84, '', 'Volta Region', 0),
(1037, 1, 84, '', 'Western Region', 0),
(1038, 1, 84, '', 'Others', 0),
(1039, 1, 85, '', 'All Region', 0),
(1040, 1, 85, '', 'Others', 0),
(1041, 1, 86, '', 'All Region', 0),
(1042, 1, 86, '', 'Others', 0),
(1043, 1, 87, '', 'Achaias', 0),
(1044, 1, 87, '', 'Aitolias kai Akarnanias', 0),
(1045, 1, 87, '', 'Argolidos', 0),
(1046, 1, 87, '', 'Arkadias', 0),
(1047, 1, 87, '', 'Artis', 0),
(1048, 1, 87, '', 'Attikis', 0),
(1049, 1, 87, '', 'Chalkidikis', 0),
(1050, 1, 87, '', 'Chanion', 0),
(1051, 1, 87, '', 'Chiou', 0),
(1052, 1, 87, '', 'Dodekanisou', 0),
(1053, 1, 87, '', 'Dramas', 0),
(1054, 1, 87, '', 'Evrou', 0),
(1055, 1, 87, '', 'Evrytanias', 0),
(1056, 1, 87, '', 'Evvoias', 0),
(1057, 1, 87, '', 'Florinis', 0),
(1058, 1, 87, '', 'Fokidos', 0),
(1059, 1, 87, '', 'Fthiotidos', 0),
(1060, 1, 87, '', 'Grevenon', 0),
(1061, 1, 87, '', 'Ileias', 0),
(1062, 1, 87, '', 'Imathias', 0),
(1063, 1, 87, '', 'Ioanninon', 0),
(1064, 1, 87, '', 'Irakleiou', 0),
(1065, 1, 87, '', 'Karditsis', 0),
(1066, 1, 87, '', 'Kastorias', 0),
(1067, 1, 87, '', 'Kavalas', 0),
(1068, 1, 87, '', 'Kefallinias', 0),
(1069, 1, 87, '', 'Kerkyras', 0),
(1070, 1, 87, '', 'Kilkis', 0),
(1071, 1, 87, '', 'Korinthias', 0),
(1072, 1, 87, '', 'Kozanis', 0),
(1073, 1, 87, '', 'Kykladon', 0),
(1074, 1, 87, '', 'Lakonias', 0),
(1075, 1, 87, '', 'Larisis', 0),
(1076, 1, 87, '', 'Lasithiou', 0),
(1077, 1, 87, '', 'Lefkados', 0),
(1078, 1, 87, '', 'Lesvou', 0),
(1079, 1, 87, '', 'Magnisias', 0),
(1080, 1, 87, '', 'Messinias', 0),
(1081, 1, 87, '', 'Pellis', 0),
(1082, 1, 87, '', 'Pierias', 0),
(1083, 1, 87, '', 'Piraios', 0),
(1084, 1, 87, '', 'Prevezis', 0),
(1085, 1, 87, '', 'Rethymnis', 0),
(1086, 1, 87, '', 'Rodopis', 0),
(1087, 1, 87, '', 'Samou', 0),
(1088, 1, 87, '', 'Serron', 0),
(1089, 1, 87, '', 'Thesprotias', 0),
(1090, 1, 87, '', 'Thessalonikis', 0),
(1091, 1, 87, '', 'Trikalon', 0),
(1092, 1, 87, '', 'Voiotias', 0),
(1093, 1, 87, '', 'Xanthis', 0),
(1094, 1, 87, '', 'Zakynthou', 0),
(1095, 1, 87, '', 'Others', 0),
(1096, 1, 88, '', 'All Regions', 0),
(1097, 1, 88, '', 'Others', 0),
(1098, 1, 89, '', 'All Regions', 0),
(1099, 1, 89, '', 'Saint Andrew', 0),
(1100, 1, 89, '', 'Saint David', 0),
(1101, 1, 89, '', 'Saint George', 0),
(1102, 1, 89, '', 'Saint John', 0),
(1103, 1, 89, '', 'Saint Mark', 0),
(1104, 1, 89, '', 'Saint Patrick', 0),
(1105, 1, 89, '', 'Others', 0),
(1106, 1, 90, '', 'La Guadeloupe', 0),
(1107, 1, 90, '', 'Others', 0),
(1108, 1, 91, '', 'All Regions', 0),
(1109, 1, 91, '', 'Others', 0),
(1110, 1, 92, '', 'Alta Verapaz', 0),
(1111, 1, 92, '', 'Baja Verapaz', 0),
(1112, 1, 92, '', 'Chimaltenango', 0),
(1113, 1, 92, '', 'Chiquimula', 0),
(1114, 1, 92, '', 'Departamento del Peten', 0),
(1115, 1, 92, '', 'Departamento del Quiche', 0),
(1116, 1, 92, '', 'El Progreso', 0),
(1117, 1, 92, '', 'Escuintla', 0),
(1118, 1, 92, '', 'Guatemala', 0),
(1119, 1, 92, '', 'Huehuetenango', 0),
(1120, 1, 92, '', 'Izabal', 0),
(1121, 1, 92, '', 'Jalapa', 0),
(1122, 1, 92, '', 'Jutiapa', 0),
(1123, 1, 92, '', 'Quetzaltenango', 0),
(1124, 1, 92, '', 'Retalhuleu', 0),
(1125, 1, 92, '', 'Sacatepequez', 0),
(1126, 1, 92, '', 'San Marcos', 0),
(1127, 1, 92, '', 'Santa Rosa', 0),
(1128, 1, 92, '', 'Solola', 0),
(1129, 1, 92, '', 'Suchitepequez', 0),
(1130, 1, 92, '', 'Totonicapan', 0),
(1131, 1, 92, '', 'Zacapa', 0),
(1132, 1, 92, '', 'Others', 0),
(1133, 1, 93, '', 'All Regions', 0),
(1134, 1, 93, '', 'Others', 0),
(1135, 1, 94, '', 'All Regions', 0),
(1136, 1, 94, '', 'Beyla', 0),
(1137, 1, 94, '', 'Boffa', 0),
(1138, 1, 94, '', 'Boke', 0),
(1139, 1, 94, '', 'Capitale dEtat-Zone Speciale de Conakry', 0),
(1140, 1, 94, '', 'Dabola', 0),
(1141, 1, 94, '', 'Dalaba', 0),
(1142, 1, 94, '', 'Dinguiraye', 0),
(1143, 1, 94, '', 'Faranah', 0),
(1144, 1, 94, '', 'Forecariah', 0),
(1145, 1, 94, '', 'Fria', 0),
(1146, 1, 94, '', 'Gaoual', 0),
(1147, 1, 94, '', 'Guekedou', 0),
(1148, 1, 94, '', 'Kerouane', 0),
(1149, 1, 94, '', 'Kindia', 0),
(1150, 1, 94, '', 'Kissidougou', 0),
(1151, 1, 94, '', 'Koundara', 0),
(1152, 1, 94, '', 'Kouroussa', 0),
(1153, 1, 94, '', 'Macenta', 0),
(1154, 1, 94, '', 'Mali', 0),
(1155, 1, 94, '', 'Mamou', 0),
(1156, 1, 94, '', 'Pita', 0),
(1157, 1, 94, '', 'Telimele', 0),
(1158, 1, 94, '', 'Tougue', 0),
(1159, 1, 94, '', 'Yomou', 0),
(1160, 1, 94, '', 'Others', 0),
(1161, 1, 95, '', 'All Regions', 0),
(1162, 1, 95, '', 'Bafata', 0),
(1163, 1, 95, '', 'Bissau', 0),
(1164, 1, 95, '', 'Cacheu', 0),
(1165, 1, 95, '', 'Gabu', 0),
(1166, 1, 95, '', 'Oio', 0),
(1167, 1, 95, '', 'Others', 0),
(1168, 1, 96, '', 'Barima-Waini Region', 0),
(1169, 1, 96, '', 'Cuyuni-Mazaruni Region', 0),
(1170, 1, 96, '', 'Demerara-Mahaica Region', 0),
(1171, 1, 96, '', 'East Berbice-Corentyne Region', 0),
(1172, 1, 96, '', 'Essequibo Islands-West Demerara Region', 0),
(1173, 1, 96, '', 'Mahaica-Berbice Region', 0),
(1174, 1, 96, '', 'Pomeroon-Supenaam Region', 0),
(1175, 1, 96, '', 'Potaro-Siparuni Region', 0),
(1176, 1, 96, '', 'Upper Demerara-Berbice Region', 0),
(1177, 1, 96, '', 'Upper Takutu-Upper Essequibo Region', 0),
(1178, 1, 96, '', 'Others', 0),
(1179, 1, 97, '', 'Artibonite', 0),
(1180, 1, 97, '', 'Centre', 0),
(1181, 1, 97, '', 'GrandAnse', 0),
(1182, 1, 97, '', 'Nord', 0),
(1183, 1, 97, '', 'Nord-Est', 0),
(1184, 1, 97, '', 'Nord-Ouest', 0),
(1185, 1, 97, '', 'Ouest', 0),
(1186, 1, 97, '', 'Sud', 0),
(1187, 1, 97, '', 'Sud-Est', 0),
(1188, 1, 97, '', 'Others', 0),
(1189, 1, 98, '', 'All Regions', 0),
(1190, 1, 98, '', 'Others', 0),
(1191, 1, 99, '', 'All Regions', 0),
(1192, 1, 99, '', 'Others', 0),
(1193, 1, 100, '', 'All Regions', 0),
(1194, 1, 100, '', 'Atlantida', 0),
(1195, 1, 100, '', 'Choluteca', 0),
(1196, 1, 100, '', 'Colon', 0),
(1197, 1, 100, '', 'Comayagua', 0),
(1198, 1, 100, '', 'Copan', 0),
(1199, 1, 100, '', 'Cortes', 0),
(1200, 1, 100, '', 'El Paraiso', 0),
(1201, 1, 100, '', 'Francisco Morazan', 0),
(1202, 1, 100, '', 'Gracias a Dios', 0),
(1203, 1, 100, '', 'Intibuca', 0),
(1204, 1, 100, '', 'Islas de la Bahia', 0),
(1205, 1, 100, '', 'La Paz', 0),
(1206, 1, 100, '', 'Lempira', 0),
(1207, 1, 100, '', 'Ocotepeque', 0),
(1208, 1, 100, '', 'Olancho', 0),
(1209, 1, 100, '', 'Santa Barbara', 0),
(1210, 1, 100, '', 'Valle', 0),
(1211, 1, 100, '', 'Yoro', 0),
(1212, 1, 100, '', 'Others', 0),
(1213, 1, 101, '', 'All Regions', 0),
(1214, 1, 101, '', 'Others', 0),
(1215, 1, 102, '', 'All Regions', 0),
(1216, 1, 102, '', 'Others', 0),
(1217, 1, 103, '', 'Bacs-Kiskun', 0),
(1218, 1, 103, '', 'Baranya', 0),
(1219, 1, 103, '', 'Bekes', 0),
(1220, 1, 103, '', 'Borsod-Abauj-Zemplen', 0),
(1221, 1, 103, '', 'Budapest Fovaros', 0),
(1222, 1, 103, '', 'Csongrad', 0),
(1223, 1, 103, '', 'Debreceni Varos', 0),
(1224, 1, 103, '', 'Fejer', 0),
(1225, 1, 103, '', 'Gyori Varos', 0),
(1226, 1, 103, '', 'Hajdu-Bihar', 0),
(1227, 1, 103, '', 'Heves', 0),
(1228, 1, 103, '', 'Jasz-Nagykun-Szolnok', 0),
(1229, 1, 103, '', 'Komarom-Esztergom', 0),
(1230, 1, 103, '', 'Miskolci Varos', 0),
(1231, 1, 103, '', 'Nograd', 0),
(1232, 1, 103, '', 'Pecsi Varos', 0),
(1233, 1, 103, '', 'Pest', 0),
(1234, 1, 103, '', 'Somogy', 0),
(1235, 1, 103, '', 'Szabolcs-Szatmar-Bereg', 0),
(1236, 1, 103, '', 'Szegedi Varos', 0),
(1237, 1, 103, '', 'Tolna', 0),
(1238, 1, 103, '', 'Vas', 0),
(1239, 1, 103, '', 'Veszprem', 0),
(1240, 1, 103, '', 'Zala', 0),
(1241, 1, 103, '', 'Others', 0),
(1242, 1, 104, '', 'All Regions', 0),
(1243, 1, 104, '', 'Arnessysla', 0),
(1244, 1, 104, '', 'Austur-Bardhastrandarsysla', 0),
(1245, 1, 104, '', 'Austur-Hunavatnssysla', 0),
(1246, 1, 104, '', 'Austur-Skaftafellssysla', 0),
(1247, 1, 104, '', 'Borgarfjardharsysla', 0),
(1248, 1, 104, '', 'Dalasysla', 0),
(1249, 1, 104, '', 'Eyjafjardharsysla', 0),
(1250, 1, 104, '', 'Gullbringusysla', 0),
(1251, 1, 104, '', 'Kjosarsysla', 0),
(1252, 1, 104, '', 'Myrasysla', 0),
(1253, 1, 104, '', 'Nordhur-Isafjardharsysla', 0),
(1254, 1, 104, '', 'Nordhur-Mulasysla', 0),
(1255, 1, 104, '', 'Nordhur-Thingeyjarsysla', 0),
(1256, 1, 104, '', 'Rangarvallasysla', 0),
(1257, 1, 104, '', 'Skagafjardharsysla', 0),
(1258, 1, 104, '', 'Snaefellsnessysla- og Hnappadalssysla', 0),
(1259, 1, 104, '', 'Strandasysla', 0),
(1260, 1, 104, '', 'Sudhur-Mulasysla', 0),
(1261, 1, 104, '', 'Sudhur-Thingeyjarsysla', 0),
(1262, 1, 104, '', 'Vestur-Bardhastrandarsysla', 0),
(1263, 1, 104, '', 'Vestur-Hunavatnssysla', 0),
(1264, 1, 104, '', 'Vestur-Isafjardharsysla', 0),
(1265, 1, 104, '', 'Vestur-Skaftafellssysla', 0),
(1266, 1, 104, '', 'Others', 0),
(1267, 1, 105, '', 'Andaman and Nicobar', 0),
(1268, 1, 105, '', 'Andhra Pradesh', 0),
(1269, 1, 105, '', 'Arunachal Pradesh', 0),
(1270, 1, 105, '', 'Assam', 0),
(1271, 1, 105, '', 'Bihar', 0),
(1272, 1, 105, '', 'Chandigarh', 0),
(1273, 1, 105, '', 'Chhattisgarh', 0),
(1274, 1, 105, '', 'Dadra and Nagar Haveli', 0),
(1275, 1, 105, '', 'Daman and Diu', 0),
(1276, 1, 105, '', 'Delhi', 0),
(1277, 1, 105, '', 'Goa', 0),
(1278, 1, 105, '', 'Gujarat', 0),
(1279, 1, 105, '', 'Haryana', 0),
(1280, 1, 105, '', 'Himachal Pradesh', 0),
(1281, 1, 105, '', 'Jammu and Kashmir', 0),
(1282, 1, 105, '', 'Jharkand', 0),
(1283, 1, 105, '', 'Karnataka', 0),
(1284, 1, 105, '', 'Kerala', 0),
(1285, 1, 105, '', 'Lakshadeep', 0),
(1286, 1, 105, '', 'Madhya Pradesh', 0),
(1287, 1, 105, '', 'Maharashtra', 0),
(1288, 1, 105, '', 'Manipur', 0),
(1289, 1, 105, '', 'Meghalaya', 0),
(1290, 1, 105, '', 'Mizoram', 0),
(1291, 1, 105, '', 'Nagaland', 0),
(1292, 1, 105, '', 'Orissa', 0),
(1293, 1, 105, '', 'Pondicherry', 0),
(1294, 1, 105, '', 'Punjab', 0),
(1295, 1, 105, '', 'Rajasthan', 0),
(1296, 1, 105, '', 'Sikkim', 0),
(1297, 1, 105, '', 'Tamil Nadu', 0),
(1298, 1, 105, '', 'Tripura', 0),
(1299, 1, 105, '', 'Uttar Pradesh', 0),
(1300, 1, 105, '', 'Uttaranchal', 0),
(1301, 1, 105, '', 'West Bengal', 0),
(1302, 1, 105, '', 'Others', 0),
(1303, 1, 106, '', 'All Regions', 0),
(1304, 1, 106, '', 'Bali', 0),
(1305, 1, 106, '', 'Bengkulu', 0),
(1306, 1, 106, '', 'Daerah Istimewa Aceh', 0),
(1307, 1, 106, '', 'Daerah Istimewa Yogyakarta', 0),
(1308, 1, 106, '', 'Daerah Khusus Ibukota Jakarta Raya', 0),
(1309, 1, 106, '', 'Jambi', 0),
(1310, 1, 106, '', 'Jawa Barat', 0),
(1311, 1, 106, '', 'Jawa Tengah', 0),
(1312, 1, 106, '', 'Jawa Timur', 0),
(1313, 1, 106, '', 'Kalimantan Barat', 0),
(1314, 1, 106, '', 'Kalimantan Selatan', 0),
(1315, 1, 106, '', 'Kalimantan Tengah', 0),
(1316, 1, 106, '', 'Kalimantan Timur', 0),
(1317, 1, 106, '', 'Lampung', 0),
(1318, 1, 106, '', 'Maluku', 0),
(1319, 1, 106, '', 'Nusa Tenggara Barat', 0),
(1320, 1, 106, '', 'Nusa Tenggara Timur', 0),
(1321, 1, 106, '', 'Papua', 0),
(1322, 1, 106, '', 'Riau', 0),
(1323, 1, 106, '', 'Sulawesi Selatan', 0),
(1324, 1, 106, '', 'Sulawesi Tengah', 0),
(1325, 1, 106, '', 'Sulawesi Tenggara', 0),
(1326, 1, 106, '', 'Sulawesi Utara', 0),
(1327, 1, 106, '', 'Sumatera Barat', 0),
(1328, 1, 106, '', 'Sumatera Utara', 0),
(1329, 1, 106, '', 'Others', 0),
(1330, 1, 107, '', 'Ardabil', 0),
(1331, 1, 107, '', 'Azarbayjan-e Gharbi', 0),
(1332, 1, 107, '', 'Azarbayjan-e Sharqi', 0),
(1333, 1, 107, '', 'Bushehr', 0),
(1334, 1, 107, '', 'Chahar Mahall va Bakhtiari', 0),
(1335, 1, 107, '', 'Esfahan', 0),
(1336, 1, 107, '', 'Fars', 0),
(1337, 1, 107, '', 'Gilan', 0),
(1338, 1, 107, '', 'Golestan', 0),
(1339, 1, 107, '', 'Hamadan', 0),
(1340, 1, 107, '', 'Hormozgan', 0),
(1341, 1, 107, '', 'Ilam', 0),
(1342, 1, 107, '', 'Kerman', 0),
(1343, 1, 107, '', 'Kermanshah', 0),
(1344, 1, 107, '', 'Khorasan', 0),
(1345, 1, 107, '', 'Khuzestan', 0),
(1346, 1, 107, '', 'Kohgiluyeh va Buyer Ahmad', 0),
(1347, 1, 107, '', 'Kordestan', 0),
(1348, 1, 107, '', 'Lorestan', 0),
(1349, 1, 107, '', 'Markazi', 0),
(1350, 1, 107, '', 'Mazandaran', 0),
(1351, 1, 107, '', 'Qazvin', 0),
(1352, 1, 107, '', 'Semnan', 0),
(1353, 1, 107, '', 'Sistan va Baluchestan', 0),
(1354, 1, 107, '', 'Tehran', 0),
(1355, 1, 107, '', 'Yazd', 0),
(1356, 1, 107, '', 'Others', 0),
(1357, 1, 108, '', 'All Regions', 0),
(1358, 1, 108, '', 'Al Anbar', 0),
(1359, 1, 108, '', 'Al Basrah', 0),
(1360, 1, 108, '', 'Al Muthanna', 0),
(1361, 1, 108, '', 'Al Qadisiyah', 0),
(1362, 1, 108, '', 'An Najaf', 0),
(1363, 1, 108, '', 'Arbil', 0),
(1364, 1, 108, '', 'As Sulaymaniyah', 0),
(1365, 1, 108, '', 'At Tamim', 0),
(1366, 1, 108, '', 'Babil', 0),
(1367, 1, 108, '', 'Baghdad', 0),
(1368, 1, 108, '', 'Dahuk', 0),
(1369, 1, 108, '', 'Dhi Qar', 0),
(1370, 1, 108, '', 'Diyala', 0),
(1371, 1, 108, '', 'Karbala', 0),
(1372, 1, 108, '', 'Maysan', 0),
(1373, 1, 108, '', 'Ninawa', 0),
(1374, 1, 108, '', 'Salah ad Din', 0),
(1375, 1, 108, '', 'Wasit', 0),
(1376, 1, 108, '', 'Others', 0),
(1377, 1, 109, '', 'All Regions', 0),
(1378, 1, 109, '', 'An Cabhan', 0),
(1379, 1, 109, '', 'An Clar', 0),
(1380, 1, 109, '', 'An Iarmhi', 0),
(1381, 1, 109, '', 'An Longfort', 0),
(1382, 1, 109, '', 'An Mhi', 0),
(1383, 1, 109, '', 'Baile Atha Cliath', 0),
(1384, 1, 109, '', 'Ciarrai', 0),
(1385, 1, 109, '', 'Cill Chainnigh', 0),
(1386, 1, 109, '', 'Cill Dara', 0),
(1387, 1, 109, '', 'Cill Mhantain', 0),
(1388, 1, 109, '', 'Corcaigh', 0),
(1389, 1, 109, '', 'County Carlow', 0),
(1390, 1, 109, '', 'County Donegal', 0),
(1391, 1, 109, '', 'County Leitrim', 0),
(1392, 1, 109, '', 'County Limerick', 0),
(1393, 1, 109, '', 'County Louth', 0),
(1394, 1, 109, '', 'County Monaghan', 0),
(1395, 1, 109, '', 'County Offaly', 0),
(1396, 1, 109, '', 'Gaillimh', 0),
(1397, 1, 109, '', 'Laois', 0),
(1398, 1, 109, '', 'Loch Garman', 0),
(1399, 1, 109, '', 'Maigh Eo', 0),
(1400, 1, 109, '', 'Port Lairge', 0),
(1401, 1, 109, '', 'Ros Comain', 0),
(1402, 1, 109, '', 'Sligeach', 0),
(1403, 1, 109, '', 'Tiobraid Arann', 0),
(1404, 1, 109, '', 'Others', 0),
(1405, 1, 110, '', 'All Regions', 0),
(1406, 1, 110, '', 'HaDarom', 0),
(1407, 1, 110, '', 'HaMerkaz', 0),
(1408, 1, 110, '', 'HaZafon', 0),
(1409, 1, 110, '', 'Tel Aviv', 0),
(1410, 1, 110, '', 'Yerushalayim', 0),
(1411, 1, 110, '', 'Others', 0),
(1412, 1, 111, '', 'Abruzzo', 0),
(1413, 1, 111, '', 'All Regions', 0),
(1414, 1, 111, '', 'Calabria', 0),
(1415, 1, 111, '', 'Campania', 0),
(1416, 1, 111, '', 'Emilia-Romagna', 0),
(1417, 1, 111, '', 'Friuli-Venezia Giulia', 0),
(1418, 1, 111, '', 'Lazio', 0),
(1419, 1, 111, '', 'Liguria', 0),
(1420, 1, 111, '', 'Lombardia', 0),
(1421, 1, 111, '', 'Marche', 0),
(1422, 1, 111, '', 'Molise', 0),
(1423, 1, 111, '', 'Piemonte', 0),
(1424, 1, 111, '', 'Puglia', 0),
(1425, 1, 111, '', 'Sardegna', 0),
(1426, 1, 111, '', 'Sicilia', 0),
(1427, 1, 111, '', 'Toscana', 0),
(1428, 1, 111, '', 'Trentino-Alto Adige', 0),
(1429, 1, 111, '', 'Umbria', 0),
(1430, 1, 111, '', 'Valle dAosta', 0),
(1431, 1, 111, '', 'Veneto', 0),
(1432, 1, 111, '', 'Others', 0),
(1433, 1, 112, '', 'All Regions', 0),
(1434, 1, 112, '', 'Clarendon', 0),
(1435, 1, 112, '', 'Hanover', 0),
(1436, 1, 112, '', 'Kingston', 0),
(1437, 1, 112, '', 'Manchester', 0),
(1438, 1, 112, '', 'Portland', 0),
(1439, 1, 112, '', 'Saint Andrew', 0),
(1440, 1, 112, '', 'Saint Ann', 0),
(1441, 1, 112, '', 'Saint Catherine', 0),
(1442, 1, 112, '', 'Saint Elizabeth', 0),
(1443, 1, 112, '', 'Saint James', 0),
(1444, 1, 112, '', 'Saint Mary', 0),
(1445, 1, 112, '', 'Saint Thomas', 0),
(1446, 1, 112, '', 'Trelawny', 0),
(1447, 1, 112, '', 'Westmoreland', 0),
(1448, 1, 112, '', 'Others', 0),
(1449, 1, 113, '', 'All Regions', 0),
(1450, 1, 113, '', 'Others', 0),
(1451, 1, 114, '', 'Aichi-ken', 0),
(1452, 1, 114, '', 'Akita-ken', 0),
(1453, 1, 114, '', 'All Regions', 0),
(1454, 1, 114, '', 'Aomori-ken', 0),
(1455, 1, 114, '', 'Chiba-ken', 0),
(1456, 1, 114, '', 'Ehime-ken', 0),
(1457, 1, 114, '', 'Fukui-ken', 0),
(1458, 1, 114, '', 'Fukuoka-ken', 0),
(1459, 1, 114, '', 'Fukushima-ken', 0),
(1460, 1, 114, '', 'Gifu-ken', 0),
(1461, 1, 114, '', 'Gumma-ken', 0),
(1462, 1, 114, '', 'Hiroshima-ken', 0),
(1463, 1, 114, '', 'Hokkaido', 0),
(1464, 1, 114, '', 'Hyogo-ken', 0),
(1465, 1, 114, '', 'Ibaraki-ken', 0),
(1466, 1, 114, '', 'Ishikawa-ken', 0),
(1467, 1, 114, '', 'Iwate-ken', 0),
(1468, 1, 114, '', 'Kagawa-ken', 0),
(1469, 1, 114, '', 'Kagoshima-ken', 0),
(1470, 1, 114, '', 'Kanagawa-ken', 0),
(1471, 1, 114, '', 'Kochi-ken', 0),
(1472, 1, 114, '', 'Kumamoto-ken', 0),
(1473, 1, 114, '', 'Kyoto-fu', 0),
(1474, 1, 114, '', 'Mie-ken', 0),
(1475, 1, 114, '', 'Miyagi-ken', 0),
(1476, 1, 114, '', 'Miyazaki-ken', 0),
(1477, 1, 114, '', 'Nagano-ken', 0),
(1478, 1, 114, '', 'Nagasaki-ken', 0),
(1479, 1, 114, '', 'Nara-ken', 0),
(1480, 1, 114, '', 'Niigata-ken', 0),
(1481, 1, 114, '', 'Oita-ken', 0),
(1482, 1, 114, '', 'Okayama-ken', 0),
(1483, 1, 114, '', 'Okinawa-ken', 0),
(1484, 1, 114, '', 'Osaka-fu', 0),
(1485, 1, 114, '', 'Saga-ken', 0),
(1486, 1, 114, '', 'Saitama-ken', 0),
(1487, 1, 114, '', 'Shiga-ken', 0);
INSERT INTO `tbl_states` (`state_id`, `zone_id`, `country_id`, `state_code`, `state_name`, `state_delete`) VALUES
(1488, 1, 114, '', 'Shimane-ken', 0),
(1489, 1, 114, '', 'Shizuoka-ken', 0),
(1490, 1, 114, '', 'Tochigi-ken', 0),
(1491, 1, 114, '', 'Tokushima-ken', 0),
(1492, 1, 114, '', 'Tokyo-to', 0),
(1493, 1, 114, '', 'Tottori-ken', 0),
(1494, 1, 114, '', 'Toyama-ken', 0),
(1495, 1, 114, '', 'Wakayama-ken', 0),
(1496, 1, 114, '', 'Yamagata-ken', 0),
(1497, 1, 114, '', 'Yamaguchi-ken', 0),
(1498, 1, 114, '', 'Yamanashi-ken', 0),
(1499, 1, 114, '', 'Others', 0),
(1500, 1, 115, '', 'All Regions', 0),
(1501, 1, 115, '', 'Others', 0),
(1502, 1, 116, '', 'All Regions', 0),
(1503, 1, 116, '', 'Others', 0),
(1504, 1, 117, '', 'All Regions', 0),
(1505, 1, 117, '', 'Others', 0),
(1506, 1, 118, '', 'All Regions', 0),
(1507, 1, 118, '', 'Al Balqa', 0),
(1508, 1, 118, '', 'Al Karak', 0),
(1509, 1, 118, '', 'Al `Aqabah', 0),
(1510, 1, 118, '', 'at Tafilah', 0),
(1511, 1, 118, '', '`Amman', 0),
(1512, 1, 118, '', 'Others', 0),
(1513, 1, 119, '', 'All Regions', 0),
(1514, 1, 119, '', 'Others', 0),
(1515, 1, 120, '', 'Akmolinskaya', 0),
(1516, 1, 120, '', 'Aktyubinskaya', 0),
(1517, 1, 120, '', 'Almatinskaya', 0),
(1518, 1, 120, '', 'Atyrau', 0),
(1519, 1, 120, '', 'Batys Qazaqstan', 0),
(1520, 1, 120, '', 'Gorod Almaty', 0),
(1521, 1, 120, '', 'Gorod Astana', 0),
(1522, 1, 120, '', 'Gorod Baykonyr', 0),
(1523, 1, 120, '', 'Karagandinskaya', 0),
(1524, 1, 120, '', 'Kokshetau', 0),
(1525, 1, 120, '', 'Kostanayskaya', 0),
(1526, 1, 120, '', 'Kyzylordinskaya', 0),
(1527, 1, 120, '', 'Mangghystau', 0),
(1528, 1, 120, '', 'Ongtustik Qazaqstan', 0),
(1529, 1, 120, '', 'Pavlodar', 0),
(1530, 1, 120, '', 'Severo-Kazakhstanskaya', 0),
(1531, 1, 120, '', 'Shyghys Qazaqstan', 0),
(1532, 1, 120, '', 'Zhambyl', 0),
(1533, 1, 120, '', 'Others', 0),
(1534, 1, 121, '', 'Central Province', 0),
(1535, 1, 121, '', 'Coast Province', 0),
(1536, 1, 121, '', 'Eastern Province', 0),
(1537, 1, 121, '', 'Nairobi Area', 0),
(1538, 1, 121, '', 'North Eastern Province', 0),
(1539, 1, 121, '', 'Nyanza Province', 0),
(1540, 1, 121, '', 'Rift Valley Province', 0),
(1541, 1, 121, '', 'Western Province', 0),
(1542, 1, 121, '', 'Others', 0),
(1543, 1, 122, '', 'All Regions', 0),
(1544, 1, 122, '', 'Others', 0),
(1545, 1, 123, '', 'All Regions', 0),
(1546, 1, 123, '', 'Chagang-do', 0),
(1547, 1, 123, '', 'Hamgyong-bukto', 0),
(1548, 1, 123, '', 'Hamgyong-namdo', 0),
(1549, 1, 123, '', 'Hwanghae-bukto', 0),
(1550, 1, 123, '', 'Hwanghae-namdo', 0),
(1551, 1, 123, '', 'Kaesong-si', 0),
(1552, 1, 123, '', 'Kangwon-do', 0),
(1553, 1, 123, '', 'Najin Sonbong-si', 0),
(1554, 1, 123, '', 'Nampo-si', 0),
(1555, 1, 123, '', 'Pyongan-bukto', 0),
(1556, 1, 123, '', 'Pyongan-namdo', 0),
(1557, 1, 123, '', 'Pyongyang-si', 0),
(1558, 1, 123, '', 'Yanggang-do', 0),
(1559, 1, 123, '', 'Others', 0),
(1560, 1, 124, '', 'All Regions', 0),
(1561, 1, 124, '', 'Chungchong-bukto', 0),
(1562, 1, 124, '', 'Chungchong-namdo', 0),
(1563, 1, 124, '', 'Cheju-do', 0),
(1564, 1, 124, '', 'Cholla-bukto', 0),
(1565, 1, 124, '', 'Cholla-namdo', 0),
(1566, 1, 124, '', 'Inchon-gwangyoksi', 0),
(1567, 1, 124, '', 'Kangwon-do', 0),
(1568, 1, 124, '', 'Kwangju-gwangyoksi', 0),
(1569, 1, 124, '', 'Kyonggi-do', 0),
(1570, 1, 124, '', 'Kyongsang-bukto', 0),
(1571, 1, 124, '', 'Kyongsang-namdo', 0),
(1572, 1, 124, '', 'Pusan-gwangyoksi', 0),
(1573, 1, 124, '', 'Soul-tukpyolsi', 0),
(1574, 1, 124, '', 'Taegu-gwangyoksi', 0),
(1575, 1, 124, '', 'Taejon-gwangyoksi', 0),
(1576, 1, 124, '', 'Ulsan-gwangyoksi', 0),
(1577, 1, 124, '', 'Others', 0),
(1578, 1, 125, '', 'Muhafazat al Ahmadi', 0),
(1579, 1, 125, '', 'Muhafazat al `Asimah', 0),
(1580, 1, 125, '', 'MuhafazatalWafrah', 0),
(1581, 1, 125, '', 'Muhafazat Jahra', 0),
(1582, 1, 125, '', 'Others', 0),
(1583, 1, 126, '', 'All Regions', 0),
(1584, 1, 126, '', 'Batken', 0),
(1585, 1, 126, '', 'Chuy', 0),
(1586, 1, 126, '', 'Dzhalal-Abadskaya', 0),
(1587, 1, 126, '', 'Gorod Bishkek', 0),
(1588, 1, 126, '', 'Issyk-Kulskaya', 0),
(1589, 1, 126, '', 'Naryn', 0),
(1590, 1, 126, '', 'Talas', 0),
(1591, 1, 126, '', 'Others', 0),
(1592, 1, 127, '', 'All Regions', 0),
(1593, 1, 127, '', 'Attapu', 0),
(1594, 1, 127, '', 'Bokeo', 0),
(1595, 1, 127, '', 'Bolikhamxai', 0),
(1596, 1, 127, '', 'Champasak', 0),
(1597, 1, 127, '', 'Houaphan', 0),
(1598, 1, 127, '', 'Kampheng Nakhon Viangchan', 0),
(1599, 1, 127, '', 'Khammouan', 0),
(1600, 1, 127, '', 'Khetphiset Xaisomboun', 0),
(1601, 1, 127, '', 'Louangnamtha', 0),
(1602, 1, 127, '', 'Louangphrabang', 0),
(1603, 1, 127, '', 'Oudomxai', 0),
(1604, 1, 127, '', 'Phongsali', 0),
(1605, 1, 127, '', 'Savannakhet', 0),
(1606, 1, 127, '', 'Viangchan', 0),
(1607, 1, 127, '', 'Xaignabouli', 0),
(1608, 1, 127, '', 'Xekong', 0),
(1609, 1, 127, '', 'Xiangkhoang', 0),
(1610, 1, 127, '', 'Others', 0),
(1611, 1, 128, '', 'Aizkraukles Rajons', 0),
(1612, 1, 128, '', 'All Regions', 0),
(1613, 1, 128, '', 'Aluksnes Rajons', 0),
(1614, 1, 128, '', 'Balvu Rajons', 0),
(1615, 1, 128, '', 'Bauskas Rajons', 0),
(1616, 1, 128, '', 'Cesu Rajons', 0),
(1617, 1, 128, '', 'Daugavpils', 0),
(1618, 1, 128, '', 'Daugavpils Rajons', 0),
(1619, 1, 128, '', 'Dobeles Rajons', 0),
(1620, 1, 128, '', 'Gulbenes Rajons', 0),
(1621, 1, 128, '', 'Jekabpils Rajons', 0),
(1622, 1, 128, '', 'Kraslavas Rajons', 0),
(1623, 1, 128, '', 'Kuldigas Rajons', 0),
(1624, 1, 128, '', 'Liepaja', 0),
(1625, 1, 128, '', 'Liepajas Rajons', 0),
(1626, 1, 128, '', 'Limbazu Rajons', 0),
(1627, 1, 128, '', 'Ludzas Rajons', 0),
(1628, 1, 128, '', 'Madonas Rajons', 0),
(1629, 1, 128, '', 'Ogres Rajons', 0),
(1630, 1, 128, '', 'Preilu Rajons', 0),
(1631, 1, 128, '', 'Rezekne', 0),
(1632, 1, 128, '', 'Rezeknes Rajons', 0),
(1633, 1, 128, '', 'Riga', 0),
(1634, 1, 128, '', 'Rigas Rajons', 0),
(1635, 1, 128, '', 'Saldus Rajons', 0),
(1636, 1, 128, '', 'Talsu Rajons', 0),
(1637, 1, 128, '', 'Tukuma Rajons', 0),
(1638, 1, 128, '', 'Valkas Rajons', 0),
(1639, 1, 128, '', 'Valmieras Rajons', 0),
(1640, 1, 128, '', 'Ventspils', 0),
(1641, 1, 128, '', 'Ventspils Rajons', 0),
(1642, 1, 128, '', 'Others', 0),
(1643, 1, 129, '', 'All Regions', 0),
(1644, 1, 129, '', 'Beqaa', 0),
(1645, 1, 129, '', 'Beyrouth', 0),
(1646, 1, 129, '', 'Liban-Nord', 0),
(1647, 1, 129, '', 'Liban-Sud', 0),
(1648, 1, 129, '', 'Mont-Liban', 0),
(1649, 1, 129, '', 'Others', 0),
(1650, 1, 130, '', 'All Regions', 0),
(1651, 1, 130, '', 'Leribe', 0),
(1652, 1, 130, '', 'Others', 0),
(1653, 1, 131, '', 'All Regions', 0),
(1654, 1, 131, '', 'Bomi', 0),
(1655, 1, 131, '', 'Bong', 0),
(1656, 1, 131, '', 'Grand Bassa', 0),
(1657, 1, 131, '', 'Grand Cape Mount', 0),
(1658, 1, 131, '', 'Grand Gedeh', 0),
(1659, 1, 131, '', 'Grand Kru', 0),
(1660, 1, 131, '', 'Lofa', 0),
(1661, 1, 131, '', 'Margibi', 0),
(1662, 1, 131, '', 'Maryland', 0),
(1663, 1, 131, '', 'Montserrado', 0),
(1664, 1, 131, '', 'Nimba', 0),
(1665, 1, 131, '', 'River Cess', 0),
(1666, 1, 131, '', 'Sinoe', 0),
(1667, 1, 131, '', 'Others', 0),
(1668, 1, 132, '', 'Ajdabiya', 0),
(1669, 1, 132, '', 'Al Abyar', 0),
(1670, 1, 132, '', 'Al Bayda', 0),
(1671, 1, 132, '', 'Al Fatih', 0),
(1672, 1, 132, '', 'Al Jabal Al Akhdar', 0),
(1673, 1, 132, '', 'Al Jufrah', 0),
(1674, 1, 132, '', 'Al Jumayl', 0),
(1675, 1, 132, '', 'Al Kufrah', 0),
(1676, 1, 132, '', 'Al Marj', 0),
(1677, 1, 132, '', 'Al Qarabull', 0),
(1678, 1, 132, '', 'Al Qubbah', 0),
(1679, 1, 132, '', 'Al `Aziziyah', 0),
(1680, 1, 132, '', 'an Nuqat Al Khams', 0),
(1681, 1, 132, '', 'ash Shati', 0),
(1682, 1, 132, '', 'Awbari', 0),
(1683, 1, 132, '', 'az Zawiyah', 0),
(1684, 1, 132, '', 'Banghazi', 0),
(1685, 1, 132, '', 'Bani Walid', 0),
(1686, 1, 132, '', 'Bin Jawwad', 0),
(1687, 1, 132, '', 'Darnah', 0),
(1688, 1, 132, '', 'Ghadamis', 0),
(1689, 1, 132, '', 'Ghat', 0),
(1690, 1, 132, '', 'Jadu', 0),
(1691, 1, 132, '', 'Jalu', 0),
(1692, 1, 132, '', 'Janzur', 0),
(1693, 1, 132, '', 'Misratah', 0),
(1694, 1, 132, '', 'Mizdah', 0),
(1695, 1, 132, '', 'Murzuq', 0),
(1696, 1, 132, '', 'Nalut', 0),
(1697, 1, 132, '', 'Qaminis', 0),
(1698, 1, 132, '', 'Qasr Bin Ghashir', 0),
(1699, 1, 132, '', 'Sabha', 0),
(1700, 1, 132, '', 'Sabratah', 0),
(1701, 1, 132, '', 'Sawfajjin', 0),
(1702, 1, 132, '', 'Shahhat', 0),
(1703, 1, 132, '', 'Surt', 0),
(1704, 1, 132, '', 'Tarabulus', 0),
(1705, 1, 132, '', 'Tarhunah', 0),
(1706, 1, 132, '', 'Tubruq', 0),
(1707, 1, 132, '', 'Tukrah', 0),
(1708, 1, 132, '', 'Yafran', 0),
(1709, 1, 132, '', 'Zlitan', 0),
(1710, 1, 132, '', 'Others', 0),
(1711, 1, 133, '', 'Balzers', 0),
(1712, 1, 133, '', 'Others', 0),
(1713, 1, 134, '', 'All Regions', 0),
(1714, 1, 134, '', 'Alytaus', 0),
(1715, 1, 134, '', 'Kauno', 0),
(1716, 1, 134, '', 'Klaipedos', 0),
(1717, 1, 134, '', 'Marijampoles', 0),
(1718, 1, 134, '', 'Panevezio', 0),
(1719, 1, 134, '', 'Siauliu', 0),
(1720, 1, 134, '', 'Taurages', 0),
(1721, 1, 134, '', 'Telsiu', 0),
(1722, 1, 134, '', 'Utenos', 0),
(1723, 1, 134, '', 'Vilniaus', 0),
(1724, 1, 134, '', 'Others', 0),
(1725, 1, 135, '', 'All Regions', 0),
(1726, 1, 135, '', 'Diekirch', 0),
(1727, 1, 135, '', 'Grevenmacher', 0),
(1728, 1, 135, '', 'Others', 0),
(1729, 1, 136, '', 'All Regions', 0),
(1730, 1, 136, '', 'Concelho das Ilhas', 0),
(1731, 1, 136, '', 'Others', 0),
(1732, 1, 137, '', 'Aracinovo', 0),
(1733, 1, 137, '', 'Bac', 0),
(1734, 1, 137, '', 'Belcista', 0),
(1735, 1, 137, '', 'Berovo', 0),
(1736, 1, 137, '', 'Bistrica', 0),
(1737, 1, 137, '', 'Bitola', 0),
(1738, 1, 137, '', 'Blatec', 0),
(1739, 1, 137, '', 'Bogdanci', 0),
(1740, 1, 137, '', 'Bogomila', 0),
(1741, 1, 137, '', 'Bogovinje', 0),
(1742, 1, 137, '', 'Bosilovo', 0),
(1743, 1, 137, '', 'Brvenica', 0),
(1744, 1, 137, '', 'Capari', 0),
(1745, 1, 137, '', 'Caska', 0),
(1746, 1, 137, '', 'Cegrane', 0),
(1747, 1, 137, '', 'Cesinovo', 0),
(1748, 1, 137, '', 'Cucer-Sandevo', 0),
(1749, 1, 137, '', 'Debar', 0),
(1750, 1, 137, '', 'Delcevo', 0),
(1751, 1, 137, '', 'Delogozdi', 0),
(1752, 1, 137, '', 'Demir Hisar', 0),
(1753, 1, 137, '', 'Demir Kapija', 0),
(1754, 1, 137, '', 'Dobrusevo', 0),
(1755, 1, 137, '', 'Dolna Banjica', 0),
(1756, 1, 137, '', 'Dolneni', 0),
(1757, 1, 137, '', 'Drugovo', 0),
(1758, 1, 137, '', 'Dzepciste', 0),
(1759, 1, 137, '', 'Gevgelija', 0),
(1760, 1, 137, '', 'Gostivar', 0),
(1761, 1, 137, '', 'Gradsko', 0),
(1762, 1, 137, '', 'Ilinden', 0),
(1763, 1, 137, '', 'Izvor', 0),
(1764, 1, 137, '', 'Jegunovce', 0),
(1765, 1, 137, '', 'Kamenjane', 0),
(1766, 1, 137, '', 'Karbinci', 0),
(1767, 1, 137, '', 'Karpos', 0),
(1768, 1, 137, '', 'Kavadarci', 0),
(1769, 1, 137, '', 'Kicevo', 0),
(1770, 1, 137, '', 'Kisela Voda', 0),
(1771, 1, 137, '', 'Klecevce', 0),
(1772, 1, 137, '', 'Kocani', 0),
(1773, 1, 137, '', 'Konce', 0),
(1774, 1, 137, '', 'Kondovo', 0),
(1775, 1, 137, '', 'Konopiste', 0),
(1776, 1, 137, '', 'Kosel', 0),
(1777, 1, 137, '', 'Kratovo', 0),
(1778, 1, 137, '', 'Kriva Palanka', 0),
(1779, 1, 137, '', 'Krivogastani', 0),
(1780, 1, 137, '', 'Krusevo', 0),
(1781, 1, 137, '', 'Kuklis', 0),
(1782, 1, 137, '', 'Kukurecani', 0),
(1783, 1, 137, '', 'Kumanovo', 0),
(1784, 1, 137, '', 'Labunista', 0),
(1785, 1, 137, '', 'Lipkovo', 0),
(1786, 1, 137, '', 'Lozovo', 0),
(1787, 1, 137, '', 'Lukovo', 0),
(1788, 1, 137, '', 'Makedonska Kamenica', 0),
(1789, 1, 137, '', 'Makedonski Brod', 0),
(1790, 1, 137, '', 'Mavrovi Anovi', 0),
(1791, 1, 137, '', 'Meseista', 0),
(1792, 1, 137, '', 'Miravci', 0),
(1793, 1, 137, '', 'Mogila', 0),
(1794, 1, 137, '', 'Murtino', 0),
(1795, 1, 137, '', 'Negotino', 0),
(1796, 1, 137, '', 'Negotino-Polosko', 0),
(1797, 1, 137, '', 'Novaci', 0),
(1798, 1, 137, '', 'Novo Selo', 0),
(1799, 1, 137, '', 'Oblesevo', 0),
(1800, 1, 137, '', 'Ohrid', 0),
(1801, 1, 137, '', 'Orasac', 0),
(1802, 1, 137, '', 'Orizari', 0),
(1803, 1, 137, '', 'Oslomej', 0),
(1804, 1, 137, '', 'Pehcevo', 0),
(1805, 1, 137, '', 'Petrovec', 0),
(1806, 1, 137, '', 'Plasnica', 0),
(1807, 1, 137, '', 'Podares', 0),
(1808, 1, 137, '', 'Prilep', 0),
(1809, 1, 137, '', 'Probistip', 0),
(1810, 1, 137, '', 'Radovis', 0),
(1811, 1, 137, '', 'Rankovce', 0),
(1812, 1, 137, '', 'Resen', 0),
(1813, 1, 137, '', 'Rosoman', 0),
(1814, 1, 137, '', 'Rostusa', 0),
(1815, 1, 137, '', 'Samokov', 0),
(1816, 1, 137, '', 'Saraj', 0),
(1817, 1, 137, '', 'Sipkovica', 0),
(1818, 1, 137, '', 'Sopiste', 0),
(1819, 1, 137, '', 'Sopotnica', 0),
(1820, 1, 137, '', 'Srbinovo', 0),
(1821, 1, 137, '', 'Star Dojran', 0),
(1822, 1, 137, '', 'Staravina', 0),
(1823, 1, 137, '', 'Staro Nagoricane', 0),
(1824, 1, 137, '', 'Stip', 0),
(1825, 1, 137, '', 'Struga', 0),
(1826, 1, 137, '', 'Strumica', 0),
(1827, 1, 137, '', 'Others', 0),
(1828, 1, 138, '', 'All Regions', 0),
(1829, 1, 138, '', 'Antananarivo Faritany d', 0),
(1830, 1, 138, '', 'Antsiranana', 0),
(1831, 1, 138, '', 'Fianarantsoa', 0),
(1832, 1, 138, '', 'Mahajanga', 0),
(1833, 1, 138, '', 'Toamasina', 0),
(1834, 1, 138, '', 'Toliara', 0),
(1835, 1, 138, '', 'Others', 0),
(1836, 1, 139, '', 'All Regions', 0),
(1837, 1, 139, '', 'Others', 0),
(1838, 1, 140, '', 'Johor', 0),
(1839, 1, 140, '', 'Kedah', 0),
(1840, 1, 140, '', 'Kelantan', 0),
(1841, 1, 140, '', 'Melaka', 0),
(1842, 1, 140, '', 'Pahang', 0),
(1843, 1, 140, '', 'Perak', 0),
(1844, 1, 140, '', 'Perlis', 0),
(1845, 1, 140, '', 'Pulau Pinang', 0),
(1846, 1, 140, '', 'Selangor', 0),
(1847, 1, 140, '', 'Sembilan', 0),
(1848, 1, 140, '', 'State of Sabah', 0),
(1849, 1, 140, '', 'State of Sarawak', 0),
(1850, 1, 140, '', 'Terengganu', 0),
(1851, 1, 140, '', 'Wilayah Persekutuan', 0),
(1852, 1, 140, '', 'Wilayah Persekutuan Labuan', 0),
(1853, 1, 140, '', 'Others', 0),
(1854, 1, 141, '', 'All Regions', 0),
(1855, 1, 141, '', 'Kaafu Atholhu', 0),
(1856, 1, 141, '', 'Maale', 0),
(1857, 1, 141, '', 'Seenu Atholhu', 0),
(1858, 1, 141, '', 'Others', 0),
(1859, 1, 142, '', 'All Regions', 0),
(1860, 1, 142, '', 'District de Bamako', 0),
(1861, 1, 142, '', 'Gao', 0),
(1862, 1, 142, '', 'Kayes', 0),
(1863, 1, 142, '', 'Koulikoro', 0),
(1864, 1, 142, '', 'Mopti', 0),
(1865, 1, 142, '', 'Segou', 0),
(1866, 1, 142, '', 'Sikasso', 0),
(1867, 1, 142, '', 'Tombouctou', 0),
(1868, 1, 142, '', 'Others', 0),
(1869, 1, 143, '', 'All Regions', 0),
(1870, 1, 143, '', 'Others', 0),
(1871, 1, 144, '', 'All Regions', 0),
(1872, 1, 144, '', 'Others', 0),
(1873, 1, 145, '', 'All Regions', 0),
(1874, 1, 145, '', 'Others', 0),
(1875, 1, 146, '', 'La Martinique', 0),
(1876, 1, 146, '', 'Others', 0),
(1877, 1, 147, '', 'All Regions', 0),
(1878, 1, 147, '', 'L Adrar', 0),
(1879, 1, 147, '', 'Trarza', 0),
(1880, 1, 147, '', 'Others', 0),
(1881, 1, 148, '', 'All Regions', 0),
(1882, 1, 148, '', 'Flacq', 0),
(1883, 1, 148, '', 'Pamplemousses', 0),
(1884, 1, 148, '', 'Others', 0),
(1885, 1, 149, '', 'All Regions', 0),
(1886, 1, 149, '', 'Others', 0),
(1887, 1, 150, '', 'Aguascalientes', 0),
(1888, 1, 150, '', 'All Regions', 0),
(1889, 1, 150, '', 'Baja California', 0),
(1890, 1, 150, '', 'Baja California Sur', 0),
(1891, 1, 150, '', 'Campeche', 0),
(1892, 1, 150, '', 'Chiapas', 0),
(1893, 1, 150, '', 'Chihuahua', 0),
(1894, 1, 150, '', 'Coahuila de Zaragoza', 0),
(1895, 1, 150, '', 'Colima', 0),
(1896, 1, 150, '', 'Durango', 0),
(1897, 1, 150, '', 'Federal', 0),
(1898, 1, 150, '', 'Guanajuato', 0),
(1899, 1, 150, '', 'Guerrero', 0),
(1900, 1, 150, '', 'Hidalgo', 0),
(1901, 1, 150, '', 'Jalisco', 0),
(1902, 1, 150, '', 'Mexico', 0),
(1903, 1, 150, '', 'Michoacan de Ocampo', 0),
(1904, 1, 150, '', 'Morelos', 0),
(1905, 1, 150, '', 'Nayarit', 0),
(1906, 1, 150, '', 'Nuevo Leon', 0),
(1907, 1, 150, '', 'Oaxaca', 0),
(1908, 1, 150, '', 'Puebla', 0),
(1909, 1, 150, '', 'Queretaro de Arteaga', 0),
(1910, 1, 150, '', 'Quintana Roo', 0),
(1911, 1, 150, '', 'San Luis Potosi', 0),
(1912, 1, 150, '', 'Sinaloa', 0),
(1913, 1, 150, '', 'Sonora', 0),
(1914, 1, 150, '', 'Tabasco', 0),
(1915, 1, 150, '', 'Tamaulipas', 0),
(1916, 1, 150, '', 'Tlaxcala', 0),
(1917, 1, 150, '', 'Veracruz-Llave', 0),
(1918, 1, 150, '', 'Yucatan', 0),
(1919, 1, 150, '', 'Zacatecas', 0),
(1920, 1, 150, '', 'Others', 0),
(1921, 1, 151, '', 'All Regions', 0),
(1922, 1, 151, '', 'Others', 0),
(1923, 1, 152, '', 'All Regions', 0),
(1924, 1, 152, '', 'Others', 0),
(1925, 1, 153, '', 'Balti', 0),
(1926, 1, 153, '', 'Cahul', 0),
(1927, 1, 153, '', 'Chisinau', 0),
(1928, 1, 153, '', 'Edinet', 0),
(1929, 1, 153, '', 'Lapusna', 0),
(1930, 1, 153, '', 'Orhei', 0),
(1931, 1, 153, '', 'Raionul Anenii Noi', 0),
(1932, 1, 153, '', 'Soroca', 0),
(1933, 1, 153, '', 'Tighina', 0),
(1934, 1, 153, '', 'Ungheni', 0),
(1935, 1, 153, '', 'Unitate Teritoriala Autonoma Gagauzia', 0),
(1936, 1, 153, '', 'Unitatea Teritoriala din Stinga Nistrului', 0),
(1937, 1, 153, '', 'Others', 0),
(1938, 1, 154, '', 'All Regions', 0),
(1939, 1, 154, '', 'Others', 0),
(1940, 1, 155, '', 'Arhangay', 0),
(1941, 1, 155, '', 'Bayan-Olgiy', 0),
(1942, 1, 155, '', 'Bayanhongor', 0),
(1943, 1, 155, '', 'Bulgan', 0),
(1944, 1, 155, '', 'Darhan Hot(Historical)', 0),
(1945, 1, 155, '', 'Darhan Uul', 0),
(1946, 1, 155, '', 'Dornod', 0),
(1947, 1, 155, '', 'Dornogovi', 0),
(1948, 1, 155, '', 'Dundgovi', 0),
(1949, 1, 155, '', 'Dzavhan', 0),
(1950, 1, 155, '', 'Govi-Altay', 0),
(1951, 1, 155, '', 'Govi-Sumber', 0),
(1952, 1, 155, '', 'Hentiy', 0),
(1953, 1, 155, '', 'Hovd', 0),
(1954, 1, 155, '', 'Hovsgol', 0),
(1955, 1, 155, '', 'Omnogovi', 0),
(1956, 1, 155, '', 'Orhon', 0),
(1957, 1, 155, '', 'Ovorhangay', 0),
(1958, 1, 155, '', 'Selenge', 0),
(1959, 1, 155, '', 'Suhbaatar', 0),
(1960, 1, 155, '', 'Tov', 0),
(1961, 1, 155, '', 'Ulaanbaatar Hot', 0),
(1962, 1, 155, '', 'Uvs', 0),
(1963, 1, 155, '', 'Others', 0),
(1964, 1, 156, '', 'Parish of Saint Anthony', 0),
(1965, 1, 156, '', 'Parish of Saint Georges', 0),
(1966, 1, 156, '', 'Parish of Saint Peter', 0),
(1967, 1, 156, '', 'Others', 0),
(1968, 1, 157, '', 'Agadir', 0),
(1969, 1, 157, '', 'Al Hoceima', 0),
(1970, 1, 157, '', 'Azilal', 0),
(1971, 1, 157, '', 'Beni Mellal', 0),
(1972, 1, 157, '', 'Ben Slimane', 0),
(1973, 1, 157, '', 'Boulemane', 0),
(1974, 1, 157, '', 'Casablanca', 0),
(1975, 1, 157, '', 'Chaouen', 0),
(1976, 1, 157, '', 'El Jadida', 0),
(1977, 1, 157, '', 'El Kelaa des Sraghna', 0),
(1978, 1, 157, '', 'Er Rachidia', 0),
(1979, 1, 157, '', 'Essaouira', 0),
(1980, 1, 157, '', 'Fes', 0),
(1981, 1, 157, '', 'Figuig', 0),
(1982, 1, 157, '', 'Ifrane', 0),
(1983, 1, 157, '', 'Kenitra', 0),
(1984, 1, 157, '', 'Khemisset', 0),
(1985, 1, 157, '', 'Khenifra', 0),
(1986, 1, 157, '', 'Khouribga', 0),
(1987, 1, 157, '', 'Laayoune', 0),
(1988, 1, 157, '', 'Larache', 0),
(1989, 1, 157, '', 'Marrakech', 0),
(1990, 1, 157, '', 'Meknes', 0),
(1991, 1, 157, '', 'Nador', 0),
(1992, 1, 157, '', 'Ouarzazate', 0),
(1993, 1, 157, '', 'Oujda', 0),
(1994, 1, 157, '', 'Rabat-Sale', 0),
(1995, 1, 157, '', 'Safi', 0),
(1996, 1, 157, '', 'Settat', 0),
(1997, 1, 157, '', 'Sidi Kacem', 0),
(1998, 1, 157, '', 'Tanger', 0),
(1999, 1, 157, '', 'Tan-Tan', 0),
(2000, 1, 157, '', 'Taounate', 0),
(2001, 1, 157, '', 'Taroudannt', 0),
(2002, 1, 157, '', 'Tata', 0),
(2003, 1, 157, '', 'Taza', 0),
(2004, 1, 157, '', 'Tetouan', 0),
(2005, 1, 157, '', 'Tiznit', 0),
(2006, 1, 157, '', 'Others', 0),
(2007, 1, 158, '', 'All Regions', 0),
(2008, 1, 158, '', 'Cabo Delgado', 0),
(2009, 1, 158, '', 'Gaza', 0),
(2010, 1, 158, '', 'Inhambane', 0),
(2011, 1, 158, '', 'Manica', 0),
(2012, 1, 158, '', 'Maputo', 0),
(2013, 1, 158, '', 'Nampula', 0),
(2014, 1, 158, '', 'Niassa', 0),
(2015, 1, 158, '', 'Sofala', 0),
(2016, 1, 158, '', 'Tete', 0),
(2017, 1, 158, '', 'Zambezia', 0),
(2018, 1, 158, '', 'Others', 0),
(2019, 1, 159, '', 'All Regions', 0),
(2020, 1, 159, '', 'Caprivi', 0),
(2021, 1, 159, '', 'Erongo', 0),
(2022, 1, 159, '', 'Hardap', 0),
(2023, 1, 159, '', 'Karas', 0),
(2024, 1, 159, '', 'Khomas', 0),
(2025, 1, 159, '', 'Kunene', 0),
(2026, 1, 159, '', 'Ohangwena', 0),
(2027, 1, 159, '', 'Okavango', 0),
(2028, 1, 159, '', 'Omaheke', 0),
(2029, 1, 159, '', 'Omusati', 0),
(2030, 1, 159, '', 'Oshana', 0),
(2031, 1, 159, '', 'Oshikoto', 0),
(2032, 1, 159, '', 'Otjozondjupa', 0),
(2033, 1, 159, '', 'Others', 0),
(2034, 1, 160, '', 'All Regions', 0),
(2035, 1, 160, '', 'Others', 0),
(2036, 1, 161, '', 'Bagmati Zone', 0),
(2037, 1, 161, '', 'Others', 0),
(2038, 1, 162, '', 'Drenthe', 0),
(2039, 1, 162, '', 'Flevoland', 0),
(2040, 1, 162, '', 'Friesland', 0),
(2041, 1, 162, '', 'Gelderland', 0),
(2042, 1, 162, '', 'Groningen', 0),
(2043, 1, 162, '', 'Limburg', 0),
(2044, 1, 162, '', 'Noord-Brabant', 0),
(2045, 1, 162, '', 'Noord-Holland', 0),
(2046, 1, 162, '', 'Overijssel', 0),
(2047, 1, 162, '', 'Utrecht', 0),
(2048, 1, 162, '', 'Zeeland', 0),
(2049, 1, 162, '', 'Zuid-Holland', 0),
(2050, 1, 162, '', 'Others', 0),
(2051, 1, 163, '', 'All Regions', 0),
(2052, 1, 163, '', 'Others', 0),
(2053, 1, 164, '', 'Nouvelle-Calédonie et Dépendances', 0),
(2054, 1, 164, '', 'Others', 0),
(2055, 1, 165, '', 'Akaroa County', 0),
(2056, 1, 165, '', 'Others', 0),
(2057, 1, 166, '', 'Autonoma Atlantico Norte', 0),
(2058, 1, 166, '', 'Autonoma Atlantico Sur', 0),
(2059, 1, 166, '', 'Boaco', 0),
(2060, 1, 166, '', 'Carazo', 0),
(2061, 1, 166, '', 'Chinandega', 0),
(2062, 1, 166, '', 'Chontales', 0),
(2063, 1, 166, '', 'Esteli', 0),
(2064, 1, 166, '', 'Granada', 0),
(2065, 1, 166, '', 'Jinotega', 0),
(2066, 1, 166, '', 'Leon', 0),
(2067, 1, 166, '', 'Madriz', 0),
(2068, 1, 166, '', 'Managua', 0),
(2069, 1, 166, '', 'Masaya', 0),
(2070, 1, 166, '', 'Matagalpa', 0),
(2071, 1, 166, '', 'Nueva Segovia', 0),
(2072, 1, 166, '', 'Rio San Juan', 0),
(2073, 1, 166, '', 'Rivas', 0),
(2074, 1, 166, '', 'Others', 0),
(2075, 1, 167, '', 'Agadez', 0),
(2076, 1, 167, '', 'Diffa', 0),
(2077, 1, 167, '', 'Dosso', 0),
(2078, 1, 167, '', 'Maradi', 0),
(2079, 1, 167, '', 'Niamey', 0),
(2080, 1, 167, '', 'Niamey', 0),
(2081, 1, 167, '', 'Tahoua', 0),
(2082, 1, 167, '', 'Tillaberi', 0),
(2083, 1, 167, '', 'Zinder', 0),
(2084, 1, 167, '', 'Others', 0),
(2085, 1, 168, '', 'Abuja Capital Territory', 0),
(2086, 1, 168, '', 'Adamawa', 0),
(2087, 1, 168, '', 'All Regions', 0),
(2088, 1, 168, '', 'Bauchi', 0),
(2089, 1, 168, '', 'Benue', 0),
(2090, 1, 168, '', 'Borno', 0),
(2091, 1, 168, '', 'Delta', 0),
(2092, 1, 168, '', 'Gombe', 0),
(2093, 1, 168, '', 'Jigawa', 0),
(2094, 1, 168, '', 'Kaduna', 0),
(2095, 1, 168, '', 'Katsina', 0),
(2096, 1, 168, '', 'Kwara', 0),
(2097, 1, 168, '', 'Lagos', 0),
(2098, 1, 168, '', 'Nassarawa', 0),
(2099, 1, 168, '', 'Niger', 0),
(2100, 1, 168, '', 'Ogun', 0),
(2101, 1, 168, '', 'Oyo', 0),
(2102, 1, 168, '', 'Plateau', 0),
(2103, 1, 168, '', 'Rivers', 0),
(2104, 1, 168, '', 'Sokoto', 0),
(2105, 1, 168, '', 'Zamfara', 0),
(2106, 1, 168, '', 'Others', 0),
(2107, 1, 169, '', 'All Regions', 0),
(2108, 1, 169, '', 'Others', 0),
(2109, 1, 170, '', 'All Regions', 0),
(2110, 1, 170, '', 'Others', 0),
(2111, 1, 171, '', 'All Regions', 0),
(2112, 1, 171, '', 'Others', 0),
(2113, 1, 172, '', 'All Regions', 0),
(2114, 1, 172, '', 'Others', 0),
(2115, 1, 173, '', 'Akershus', 0),
(2116, 1, 173, '', 'All Regions', 0),
(2117, 1, 173, '', 'Aust-Agder', 0),
(2118, 1, 173, '', 'Buskerud', 0),
(2119, 1, 173, '', 'Finnmark', 0),
(2120, 1, 173, '', 'Hedmark', 0),
(2121, 1, 173, '', 'Hordaland', 0),
(2122, 1, 173, '', 'More og Romsdal', 0),
(2123, 1, 173, '', 'Nord-Trondelag', 0),
(2124, 1, 173, '', 'Nordland', 0),
(2125, 1, 173, '', 'Oppland', 0),
(2126, 1, 173, '', 'Oslo', 0),
(2127, 1, 173, '', 'Ostfold', 0),
(2128, 1, 173, '', 'Rogaland', 0),
(2129, 1, 173, '', 'Sogn og Fjordane', 0),
(2130, 1, 173, '', 'Sor-Trondelag', 0),
(2131, 1, 173, '', 'Telemark', 0),
(2132, 1, 173, '', 'Troms', 0),
(2133, 1, 173, '', 'Vest-Agder', 0),
(2134, 1, 173, '', 'Vestfold', 0),
(2135, 1, 173, '', 'Others', 0),
(2136, 1, 174, '', 'Al Mintaqah ash Sharqiyah', 0),
(2137, 1, 174, '', 'Mintaqat al Batinah', 0),
(2138, 1, 174, '', 'Mintaqat az Zahirah', 0),
(2139, 1, 174, '', 'Mintaqat Masqat', 0),
(2140, 1, 174, '', 'Muhafazat Musandam', 0),
(2141, 1, 174, '', 'Muhafazat Zufar', 0),
(2142, 1, 174, '', 'Others', 0),
(2143, 1, 175, '', 'Balochistan', 0),
(2144, 1, 175, '', 'Federally Administered Tribal Areas', 0),
(2145, 1, 175, '', 'North-West Frontier Province', 0),
(2146, 1, 175, '', 'Punjab', 0),
(2147, 1, 175, '', 'Sind', 0),
(2148, 1, 175, '', 'Others', 0),
(2149, 1, 176, '', 'All Regions', 0),
(2150, 1, 176, '', 'Others', 0),
(2151, 1, 177, '', 'All Regions', 0),
(2152, 1, 177, '', 'Bocas del Toro', 0),
(2153, 1, 177, '', 'Veraguas', 0),
(2154, 1, 177, '', 'Others', 0),
(2155, 1, 178, '', 'All Regions', 0),
(2156, 1, 178, '', 'Sandaun', 0),
(2157, 1, 178, '', 'Others', 0),
(2158, 1, 179, '', 'Alto Paraguay', 0),
(2159, 1, 179, '', 'Alto Parana', 0),
(2160, 1, 179, '', 'Amambay', 0),
(2161, 1, 179, '', 'Boqueron', 0),
(2162, 1, 179, '', 'Caaguazu', 0),
(2163, 1, 179, '', 'Caazapa', 0),
(2164, 1, 179, '', 'Canindeyu', 0),
(2165, 1, 179, '', 'Concepcion', 0),
(2166, 1, 179, '', 'Departamento Central', 0),
(2167, 1, 179, '', 'Guaira', 0),
(2168, 1, 179, '', 'Itapua', 0),
(2169, 1, 179, '', 'la Cordillera', 0),
(2170, 1, 179, '', 'Misiones', 0),
(2171, 1, 179, '', 'Neembucu', 0),
(2172, 1, 179, '', 'Paraguari', 0),
(2173, 1, 179, '', 'Presidente Hayes', 0),
(2174, 1, 179, '', 'San Pedro', 0),
(2175, 1, 179, '', 'Others', 0),
(2176, 1, 180, '', 'All Regions', 0),
(2177, 1, 180, '', 'Amazonas', 0),
(2178, 1, 180, '', 'Ancash', 0),
(2179, 1, 180, '', 'Apurimac', 0),
(2180, 1, 180, '', 'Arequipa', 0),
(2181, 1, 180, '', 'Ayacucho', 0),
(2182, 1, 180, '', 'Cajamarca', 0),
(2183, 1, 180, '', 'Cusco', 0),
(2184, 1, 180, '', 'Huancavelica', 0),
(2185, 1, 180, '', 'Huanuco', 0),
(2186, 1, 180, '', 'Ica', 0),
(2187, 1, 180, '', 'Junin', 0),
(2188, 1, 180, '', 'La Libertad', 0),
(2189, 1, 180, '', 'Lambayeque', 0),
(2190, 1, 180, '', 'Lima', 0),
(2191, 1, 180, '', 'Loreto', 0),
(2192, 1, 180, '', 'Madre de Dios', 0),
(2193, 1, 180, '', 'Moquegua', 0),
(2194, 1, 180, '', 'Pasco', 0),
(2195, 1, 180, '', 'Piura', 0),
(2196, 1, 180, '', 'Provincia Constitucional del Callao', 0),
(2197, 1, 180, '', 'Puno', 0),
(2198, 1, 180, '', 'San Martin', 0),
(2199, 1, 180, '', 'Tacna', 0),
(2200, 1, 180, '', 'Tumbes', 0),
(2201, 1, 180, '', 'Ucayali', 0),
(2202, 1, 180, '', 'Others', 0),
(2203, 1, 181, '', 'Abra', 0),
(2204, 1, 181, '', 'Agusan del Norte', 0),
(2205, 1, 181, '', 'Agusan del Sur', 0),
(2206, 1, 181, '', 'Aklan', 0),
(2207, 1, 181, '', 'Albay', 0),
(2208, 1, 181, '', 'All Regions', 0),
(2209, 1, 181, '', 'Angeles City', 0),
(2210, 1, 181, '', 'Antique', 0),
(2211, 1, 181, '', 'Basilan', 0),
(2212, 1, 181, '', 'Bataan', 0),
(2213, 1, 181, '', 'Batanes', 0),
(2214, 1, 181, '', 'Batangas', 0),
(2215, 1, 181, '', 'Benguet', 0),
(2216, 1, 181, '', 'Bohol', 0),
(2217, 1, 181, '', 'Bukidnon', 0),
(2218, 1, 181, '', 'Bulacan', 0),
(2219, 1, 181, '', 'Cagayan', 0),
(2220, 1, 181, '', 'Camarines Norte', 0),
(2221, 1, 181, '', 'Camarines Sur', 0),
(2222, 1, 181, '', 'Camiguin', 0),
(2223, 1, 181, '', 'Capiz', 0),
(2224, 1, 181, '', 'Catanduanes', 0),
(2225, 1, 181, '', 'Cavite', 0),
(2226, 1, 181, '', 'Cebu', 0),
(2227, 1, 181, '', 'Davao del Norte', 0),
(2228, 1, 181, '', 'Davao del Sur', 0),
(2229, 1, 181, '', 'Davao Oriental', 0),
(2230, 1, 181, '', 'Eastern Samar', 0),
(2231, 1, 181, '', 'Ifugao', 0),
(2232, 1, 181, '', 'Ilocos Norte', 0),
(2233, 1, 181, '', 'Ilocos Sur', 0),
(2234, 1, 181, '', 'Iloilo', 0),
(2235, 1, 181, '', 'Isabela', 0),
(2236, 1, 181, '', 'Kalinga-Apayao', 0),
(2237, 1, 181, '', 'La Union', 0),
(2238, 1, 181, '', 'Laguna', 0),
(2239, 1, 181, '', 'Lanao del Norte', 0),
(2240, 1, 181, '', 'Lanao del Sur', 0),
(2241, 1, 181, '', 'Leyte', 0),
(2242, 1, 181, '', 'Maguindanao', 0),
(2243, 1, 181, '', 'Marinduque', 0),
(2244, 1, 181, '', 'Masbate', 0),
(2245, 1, 181, '', 'Mindoro Occidental', 0),
(2246, 1, 181, '', 'Mindoro Oriental', 0),
(2247, 1, 181, '', 'Misamis Occidental', 0),
(2248, 1, 181, '', 'Misamis Oriental', 0),
(2249, 1, 181, '', 'Mountain Province', 0),
(2250, 1, 181, '', 'Negros Oriental', 0),
(2251, 1, 181, '', 'North Cotabato', 0),
(2252, 1, 181, '', 'Northern Samar', 0),
(2253, 1, 181, '', 'Nueva Ecija', 0),
(2254, 1, 181, '', 'Nueva Vizcaya', 0),
(2255, 1, 181, '', 'Palawan', 0),
(2256, 1, 181, '', 'Pampanga', 0),
(2257, 1, 181, '', 'Pangasinan', 0),
(2258, 1, 181, '', 'Quirino', 0),
(2259, 1, 181, '', 'Rizal', 0),
(2260, 1, 181, '', 'Romblon', 0),
(2261, 1, 181, '', 'Samar', 0),
(2262, 1, 181, '', 'Siquijor', 0),
(2263, 1, 181, '', 'Sorsogon', 0),
(2264, 1, 181, '', 'South Cotabato', 0),
(2265, 1, 181, '', 'Southern Leyte', 0),
(2266, 1, 181, '', 'Sultan Kudarat', 0),
(2267, 1, 181, '', 'Sulu', 0),
(2268, 1, 181, '', 'Surigao del Norte', 0),
(2269, 1, 181, '', 'Surigao del Sur', 0),
(2270, 1, 181, '', 'Tarlac', 0),
(2271, 1, 181, '', 'Tawi-Tawi', 0),
(2272, 1, 181, '', 'Zambales', 0),
(2273, 1, 181, '', 'Zamboanga del Norte', 0),
(2274, 1, 181, '', 'Zamboanga del Sur', 0),
(2275, 1, 181, '', 'Others', 0),
(2276, 1, 182, '', 'All Regions', 0),
(2277, 1, 182, '', 'Others', 0),
(2278, 1, 183, '', 'All Regions', 0),
(2279, 1, 183, '', 'Wojewodztwo Bialostockie', 0),
(2280, 1, 183, '', 'Others', 0),
(2281, 1, 184, '', 'All Regions', 0),
(2282, 1, 184, '', 'Autonoma da Madeira', 0),
(2283, 1, 184, '', 'Autonoma dos Acores', 0),
(2284, 1, 184, '', 'Aveiro', 0),
(2285, 1, 184, '', 'Beja', 0),
(2286, 1, 184, '', 'Braga', 0),
(2287, 1, 184, '', 'Braganca', 0),
(2288, 1, 184, '', 'Castelo Branco', 0),
(2289, 1, 184, '', 'Coimbra', 0),
(2290, 1, 184, '', 'Evora', 0),
(2291, 1, 184, '', 'Faro', 0),
(2292, 1, 184, '', 'Guarda', 0),
(2293, 1, 184, '', 'Leiria', 0),
(2294, 1, 184, '', 'Lisboa', 0),
(2295, 1, 184, '', 'Portalegre', 0),
(2296, 1, 184, '', 'Porto', 0),
(2297, 1, 184, '', 'Santarem', 0),
(2298, 1, 184, '', 'Setubal', 0),
(2299, 1, 184, '', 'Viana do Castelo', 0),
(2300, 1, 184, '', 'Vila Real', 0),
(2301, 1, 184, '', 'Viseu', 0),
(2302, 1, 184, '', 'Others', 0),
(2303, 1, 185, '', 'All Regions', 0),
(2304, 1, 185, '', 'Others', 0),
(2305, 1, 186, '', 'All Regions', 0),
(2306, 1, 186, '', 'Others', 0),
(2307, 1, 187, '', 'La Reunion', 0),
(2308, 1, 187, '', 'Others', 0),
(2309, 1, 188, '', 'Alba', 0),
(2310, 1, 188, '', 'Arad', 0),
(2311, 1, 188, '', 'Arges', 0),
(2312, 1, 188, '', 'Bacau', 0),
(2313, 1, 188, '', 'Bihor', 0),
(2314, 1, 188, '', 'Bistrita-Nasaud', 0),
(2315, 1, 188, '', 'Botosani', 0),
(2316, 1, 188, '', 'Calarasi', 0),
(2317, 1, 188, '', 'Caras-Severin', 0),
(2318, 1, 188, '', 'Covurlui', 0),
(2319, 1, 188, '', 'Dambovita', 0),
(2320, 1, 188, '', 'Galati', 0),
(2321, 1, 188, '', 'Gorj', 0),
(2322, 1, 188, '', 'Harghita', 0),
(2323, 1, 188, '', 'Hunedoara', 0),
(2324, 1, 188, '', 'Ialomita', 0),
(2325, 1, 188, '', 'Iasi', 0),
(2326, 1, 188, '', 'Ilfov', 0),
(2327, 1, 188, '', 'Maramures', 0),
(2328, 1, 188, '', 'Mures', 0),
(2329, 1, 188, '', 'Neamt', 0),
(2330, 1, 188, '', 'Olt', 0),
(2331, 1, 188, '', 'Prahova', 0),
(2332, 1, 188, '', 'Salaj', 0),
(2333, 1, 188, '', 'Satu Mare', 0),
(2334, 1, 188, '', 'Sibiu', 0),
(2335, 1, 188, '', 'Suceava', 0),
(2336, 1, 188, '', 'Teleorman', 0),
(2337, 1, 188, '', 'Tulcea', 0),
(2338, 1, 188, '', 'Valcea', 0),
(2339, 1, 188, '', 'Vrancea', 0),
(2340, 1, 188, '', 'Others', 0),
(2341, 1, 189, '', 'Aginskiy Buryatskiy Avtonomnyy Okrug', 0),
(2342, 1, 189, '', 'Altayskiy Kray', 0),
(2343, 1, 189, '', 'Amurskaya Oblast', 0),
(2344, 1, 189, '', 'Arkhangelskaya Oblast', 0),
(2345, 1, 189, '', 'Astrakhanskaya Oblast', 0),
(2346, 1, 189, '', 'Belgorodskaya Oblast', 0),
(2347, 1, 189, '', 'Bryanskaya Oblast', 0),
(2348, 1, 189, '', 'Chechenskaya Respublika', 0),
(2349, 1, 189, '', 'Chelyabinskaya Oblast', 0),
(2350, 1, 189, '', 'Chitinskaya Oblast', 0),
(2351, 1, 189, '', 'Chuvashskaya Respublika', 0),
(2352, 1, 189, '', 'Gorod Moskva', 0),
(2353, 1, 189, '', 'Gorod Sankt-Peterburg', 0),
(2354, 1, 189, '', 'Irkutskaya Oblast', 0),
(2355, 1, 189, '', 'Ivanovskaya Oblast', 0),
(2356, 1, 189, '', 'Kabardino-Balkarskaya Respublika', 0),
(2357, 1, 189, '', 'Kaliningradskaya Oblast', 0),
(2358, 1, 189, '', 'Kaluzhskaya Oblast', 0),
(2359, 1, 189, '', 'Kamchatskaya Oblast', 0),
(2360, 1, 189, '', 'Karachayevo-Cherkesskaya Respublika', 0),
(2361, 1, 189, '', 'Kemerovskaya Oblast', 0),
(2362, 1, 189, '', 'Khabarovskiy Kray', 0),
(2363, 1, 189, '', 'Khanty-Mansiyskiy Avtonomnyy Okrug', 0),
(2364, 1, 189, '', 'Kirovskaya Oblast', 0),
(2365, 1, 189, '', 'Komi-Permyatskiy Avtonomnyy Okrug', 0),
(2366, 1, 189, '', 'Koryakskiy Avtonomnyy Okrug', 0),
(2367, 1, 189, '', 'Krasnodarskiy Kray', 0),
(2368, 1, 189, '', 'Kurganskaya Oblast', 0),
(2369, 1, 189, '', 'Kurskaya Oblast', 0),
(2370, 1, 189, '', 'Leningradskaya Oblast', 0),
(2371, 1, 189, '', 'Lipetskaya Oblast', 0),
(2372, 1, 189, '', 'Magadanskaya Oblast', 0),
(2373, 1, 189, '', 'Moskovskaya Oblast', 0),
(2374, 1, 189, '', 'Murmanskaya Oblast', 0),
(2375, 1, 189, '', 'Nenetskiy Avtonomnyy Okrug', 0),
(2376, 1, 189, '', 'Nizhegorodskaya Oblast', 0),
(2377, 1, 189, '', 'Novosibirskaya Oblast', 0),
(2378, 1, 189, '', 'Omskaya Oblast', 0),
(2379, 1, 189, '', 'Orenburgskaya Oblast', 0),
(2380, 1, 189, '', 'Orlovskaya Oblast', 0),
(2381, 1, 189, '', 'Permskaya Oblast', 0),
(2382, 1, 189, '', 'Primorskiy Kray', 0),
(2383, 1, 189, '', 'Pskovskaya Oblast', 0),
(2384, 1, 189, '', 'Respublika Adygeya', 0),
(2385, 1, 189, '', 'Respublika Altay', 0),
(2386, 1, 189, '', 'Respublika Bashkortostan', 0),
(2387, 1, 189, '', 'Respublika Buryatiya', 0),
(2388, 1, 189, '', 'Respublika Dagestan', 0),
(2389, 1, 189, '', 'Respublika Kalmykiya', 0),
(2390, 1, 189, '', 'Respublika Kareliya', 0),
(2391, 1, 189, '', 'Respublika Khakasiya', 0),
(2392, 1, 189, '', 'Respublika Komi', 0),
(2393, 1, 189, '', 'Respublika Mariy-El', 0),
(2394, 1, 189, '', 'Respublika Mordoviya', 0),
(2395, 1, 189, '', 'Respublika Sakha (Yakutiya)', 0),
(2396, 1, 189, '', 'Respublika Severnaya Osetiya-Alaniya', 0),
(2397, 1, 189, '', 'Respublika Tatarstan', 0),
(2398, 1, 189, '', 'Respublika Tyva', 0),
(2399, 1, 189, '', 'Rostovskaya Oblast', 0),
(2400, 1, 189, '', 'Ryazanskaya Oblast', 0),
(2401, 1, 189, '', 'Sakhalinskaya Oblast', 0),
(2402, 1, 189, '', 'Samarskaya Oblast', 0),
(2403, 1, 189, '', 'Saratovskaya Oblast', 0),
(2404, 1, 189, '', 'Smolenskaya Oblast', 0),
(2405, 1, 189, '', 'Stavropolskiy Kray', 0),
(2406, 1, 189, '', 'Sverdlovskaya Oblast', 0),
(2407, 1, 189, '', 'Tambovskaya Oblast', 0),
(2408, 1, 189, '', 'Taymyrskiy (Dolgano-Nenetskiy) Avtonomnyy Okrug', 0),
(2409, 1, 189, '', 'Tomskaya Oblast', 0),
(2410, 1, 189, '', 'Tulskaya Oblast', 0),
(2411, 1, 189, '', 'Tverskaya Oblast', 0),
(2412, 1, 189, '', 'Tyumenskaya Oblast', 0),
(2413, 1, 189, '', 'Udmurtskaya Respublika', 0),
(2414, 1, 189, '', 'Ulyanovskaya Oblast', 0),
(2415, 1, 189, '', 'Vladimirskaya Oblast', 0),
(2416, 1, 189, '', 'Volgogradskaya Oblast', 0),
(2417, 1, 189, '', 'Vologodskaya Oblast', 0),
(2418, 1, 189, '', 'Voronezhskaya Oblast', 0),
(2419, 1, 189, '', 'Yamalo-Nenetskiy Avtonomnyy Okrug', 0),
(2420, 1, 189, '', 'Yaroslavskaya Oblast', 0),
(2421, 1, 189, '', 'Yevreyskaya Avtonomnaya Oblast', 0),
(2422, 1, 189, '', 'Others', 0),
(2423, 1, 190, '', 'All Regions', 0),
(2424, 1, 190, '', 'Butare', 0),
(2425, 1, 190, '', 'Byumba', 0),
(2426, 1, 190, '', 'Cyangugu', 0),
(2427, 1, 190, '', 'Gikongoro', 0),
(2428, 1, 190, '', 'Gisenyi', 0),
(2429, 1, 190, '', 'Gitarama', 0),
(2430, 1, 190, '', 'Kibuye', 0),
(2431, 1, 190, '', 'Kigali', 0),
(2432, 1, 190, '', 'Ruhengeri', 0),
(2433, 1, 190, '', 'Prefegitura ya Kibunga', 0),
(2434, 1, 190, '', 'Others', 0),
(2435, 1, 191, '', 'All Regions', 0),
(2436, 1, 191, '', 'Others', 0),
(2437, 1, 192, '', 'Christ Church Nichola Town-Saint Kitts', 0),
(2438, 1, 192, '', 'Saint Anne Sandy Point-Saint Kitts', 0),
(2439, 1, 192, '', 'Saint George Basseterre-Saint Kitts', 0),
(2440, 1, 192, '', 'Saint George Gingerland-Nevis', 0),
(2441, 1, 192, '', 'Saint James Windward-Nevis', 0),
(2442, 1, 192, '', 'Saint John Capesterre-Saint Kitts', 0),
(2443, 1, 192, '', 'Saint John Figtree-Nevis', 0),
(2444, 1, 192, '', 'Saint Mary Cayon-Saint Kitts', 0),
(2445, 1, 192, '', 'Saint Paul Capesterre-Saint Kitts', 0),
(2446, 1, 192, '', 'Saint Paul Charlestown-Nevis', 0),
(2447, 1, 192, '', 'Saint Peter Basseterre-Saint Kitts', 0),
(2448, 1, 192, '', 'Saint Thomas Lowland-Nevis', 0),
(2449, 1, 192, '', 'Saint Thomas Middle Island-Saint Kitts', 0),
(2450, 1, 192, '', 'Trinity Palmetto Point-Saint Kitts', 0),
(2451, 1, 192, '', 'Others', 0),
(2452, 1, 193, '', 'All Regions', 0),
(2453, 1, 193, '', 'Others', 0),
(2454, 1, 194, '', 'All Regions', 0),
(2455, 1, 194, '', 'Others', 0),
(2456, 1, 195, '', 'Charlotte', 0),
(2457, 1, 195, '', 'Grenadines', 0),
(2458, 1, 195, '', 'Saint Andrew', 0),
(2459, 1, 195, '', 'Saint David', 0),
(2460, 1, 195, '', 'Saint George', 0),
(2461, 1, 195, '', 'Saint Patrick', 0),
(2462, 1, 195, '', 'Others', 0),
(2463, 1, 196, '', 'All Regions', 0),
(2464, 1, 196, '', 'Others', 0),
(2465, 1, 197, '', 'Chiesanuova', 0),
(2466, 1, 197, '', 'Others', 0),
(2467, 1, 198, '', 'All Regions', 0),
(2468, 1, 198, '', 'Others', 0),
(2469, 1, 199, '', 'Al ash Sharqiyah', 0),
(2470, 1, 199, '', 'All Regions', 0),
(2471, 1, 199, '', 'Al Bahah', 0),
(2472, 1, 199, '', 'Al Hudud ash Shamaliyah', 0),
(2473, 1, 199, '', 'Al Jawf', 0),
(2474, 1, 199, '', 'Al Madinah', 0),
(2475, 1, 199, '', 'Al Qasim', 0),
(2476, 1, 199, '', 'ar Riyad', 0),
(2477, 1, 199, '', 'Hail', 0),
(2478, 1, 199, '', 'Jizan', 0),
(2479, 1, 199, '', 'Makkah', 0),
(2480, 1, 199, '', 'Tabuk', 0),
(2481, 1, 199, '', 'Others', 0),
(2482, 1, 200, '', 'All Regions', 0),
(2483, 1, 200, '', 'Others', 0),
(2484, 1, 201, '', 'All Regions', 0),
(2485, 1, 201, '', 'Dakar', 0),
(2486, 1, 201, '', 'Diourbel', 0),
(2487, 1, 201, '', 'Fatick', 0),
(2488, 1, 201, '', 'Kaolack', 0),
(2489, 1, 201, '', 'Kolda', 0),
(2490, 1, 201, '', 'Louga', 0),
(2491, 1, 201, '', 'Saint-Louis', 0),
(2492, 1, 201, '', 'Tambacounda', 0),
(2493, 1, 201, '', 'Thies', 0),
(2494, 1, 201, '', 'Ziguinchor', 0),
(2495, 1, 201, '', 'Others', 0),
(2496, 1, 202, '', 'Crna Gora', 0),
(2497, 1, 202, '', 'Srbija', 0),
(2498, 1, 202, '', 'Others', 0),
(2499, 1, 203, '', 'All Regions', 0),
(2500, 1, 203, '', 'Beau Vallon', 0),
(2501, 1, 203, '', 'Others', 0),
(2502, 1, 204, '', 'All Regions', 0),
(2503, 1, 204, '', 'Eastern Province', 0),
(2504, 1, 204, '', 'Northern Province', 0),
(2505, 1, 204, '', 'Southern Province', 0),
(2506, 1, 204, '', 'Western Area', 0),
(2507, 1, 204, '', 'Others', 0),
(2508, 1, 205, '', 'All Regions', 0),
(2509, 1, 205, '', 'Others', 0),
(2510, 1, 206, '', 'All Regions', 0),
(2511, 1, 206, '', 'Banskobystricky', 0),
(2512, 1, 206, '', 'Bratislavsky', 0),
(2513, 1, 206, '', 'Kosicky', 0),
(2514, 1, 206, '', 'Nitriansky', 0),
(2515, 1, 206, '', 'Presovsky', 0),
(2516, 1, 206, '', 'Trenciansky', 0),
(2517, 1, 206, '', 'Trnavsky', 0),
(2518, 1, 206, '', 'Zilinsky', 0),
(2519, 1, 206, '', 'Others', 0),
(2520, 1, 207, '', 'Benedikt', 0),
(2521, 1, 207, '', 'Bohinj', 0),
(2522, 1, 207, '', 'Brezovica', 0),
(2523, 1, 207, '', 'Others', 0),
(2524, 1, 208, '', 'All Regions', 0),
(2525, 1, 208, '', 'Others', 0),
(2526, 1, 209, '', 'All Regions', 0),
(2527, 1, 209, '', 'Bakool', 0),
(2528, 1, 209, '', 'Banaadir', 0),
(2529, 1, 209, '', 'Bari', 0),
(2530, 1, 209, '', 'Bay', 0),
(2531, 1, 209, '', 'Galguduud', 0),
(2532, 1, 209, '', 'Gedo', 0),
(2533, 1, 209, '', 'Hiiraan', 0),
(2534, 1, 209, '', 'Jubbada Dhexe', 0),
(2535, 1, 209, '', 'Jubbada Hoose', 0),
(2536, 1, 209, '', 'Mudug', 0),
(2537, 1, 209, '', 'Nugaal', 0),
(2538, 1, 209, '', 'Sanaag', 0),
(2539, 1, 209, '', 'Shabeellaha Dhexe', 0),
(2540, 1, 209, '', 'Shabeellaha Hoose', 0),
(2541, 1, 209, '', 'Togdheer', 0),
(2542, 1, 209, '', 'Woqooyi Galbeed', 0),
(2543, 1, 209, '', 'Others', 0),
(2544, 1, 210, '', 'Free State', 0),
(2545, 1, 210, '', 'Eastern Cape', 0),
(2546, 1, 210, '', 'KwaZulu-Natal', 0),
(2547, 1, 210, '', 'Others', 0),
(2548, 1, 211, '', 'All Regions', 0),
(2549, 1, 211, '', 'Others', 0),
(2550, 1, 212, '', 'All Regions', 0),
(2551, 1, 212, '', 'Autonoma de Andalucia', 0),
(2552, 1, 212, '', 'Autonoma de Aragon', 0),
(2553, 1, 212, '', 'Autonoma de Canarias', 0),
(2554, 1, 212, '', 'Autonoma de Cantabria', 0),
(2555, 1, 212, '', 'Autonoma de Castilla y Leon', 0),
(2556, 1, 212, '', 'Autonoma de Castilla-La Mancha', 0),
(2557, 1, 212, '', 'Autonoma de Cataluna', 0),
(2558, 1, 212, '', 'Autonoma de Extremadura', 0),
(2559, 1, 212, '', 'Autonoma de Galicia', 0),
(2560, 1, 212, '', 'Autonoma de la Region de Murcia', 0),
(2561, 1, 212, '', 'Autonoma de La Rioja', 0),
(2562, 1, 212, '', 'Autonoma de las Islas Baleares', 0),
(2563, 1, 212, '', 'Autonoma del Pais Vasco', 0),
(2564, 1, 212, '', 'Autonoma del Principado de Asturias', 0),
(2565, 1, 212, '', 'de Madrid', 0),
(2566, 1, 212, '', 'Foral de Navarra', 0),
(2567, 1, 212, '', 'Valenciana', 0),
(2568, 1, 212, '', 'Others', 0),
(2569, 1, 213, '', 'All Regions', 0),
(2570, 1, 213, '', 'Others', 0),
(2571, 1, 214, '', 'Central Province', 0),
(2572, 1, 214, '', 'North Central Province', 0),
(2573, 1, 214, '', 'North Eastern Province', 0),
(2574, 1, 214, '', 'North Western Province', 0),
(2575, 1, 214, '', 'Province of Sabaragamuwa', 0),
(2576, 1, 214, '', 'Province of Uva', 0),
(2577, 1, 214, '', 'Southern Province', 0),
(2578, 1, 214, '', 'Western Province', 0),
(2579, 1, 214, '', 'Others', 0),
(2580, 1, 215, '', 'A`ali an Nil', 0),
(2581, 1, 215, '', 'Al Bahr Al Ahmar', 0),
(2582, 1, 215, '', 'Al Buhayrat', 0),
(2583, 1, 215, '', 'Al Jazirah', 0),
(2584, 1, 215, '', 'Al Khartum', 0),
(2585, 1, 215, '', 'All Regions', 0),
(2586, 1, 215, '', 'Al Wilayah Al Istiwaiyah', 0),
(2587, 1, 215, '', 'Al Wilayah Al Wusta', 0),
(2588, 1, 215, '', 'Al Wilayah ash Sharqiyah', 0),
(2589, 1, 215, '', 'Bahr Al Ghazal', 0),
(2590, 1, 215, '', 'Bahr Al Jabal', 0),
(2591, 1, 215, '', 'Darfur', 0),
(2592, 1, 215, '', 'Junqali', 0),
(2593, 1, 215, '', 'Kurdufan', 0),
(2594, 1, 215, '', 'Nahr an Nil', 0),
(2595, 1, 215, '', 'Others', 0),
(2596, 1, 216, '', 'All Regions', 0),
(2597, 1, 216, '', 'Brokopondo', 0),
(2598, 1, 216, '', 'Commewijne', 0),
(2599, 1, 216, '', 'Coronie', 0),
(2600, 1, 216, '', 'Marowijne', 0),
(2601, 1, 216, '', 'Nickerie', 0),
(2602, 1, 216, '', 'Para', 0),
(2603, 1, 216, '', 'Paramaribo', 0),
(2604, 1, 216, '', 'Saramacca', 0),
(2605, 1, 216, '', 'Sipaliwini', 0),
(2606, 1, 216, '', 'Wanica', 0),
(2607, 1, 216, '', 'Others', 0),
(2608, 1, 217, '', 'Svalbard', 0),
(2609, 1, 217, '', 'Others', 0),
(2610, 1, 218, '', 'All Regions', 0),
(2611, 1, 218, '', 'Hhohho', 0),
(2612, 1, 218, '', 'Manzini', 0),
(2613, 1, 218, '', 'Shiselweni', 0),
(2614, 1, 218, '', 'Others', 0),
(2615, 1, 219, '', 'All Regions', 0),
(2616, 1, 219, '', 'Alvsborgs', 0),
(2617, 1, 219, '', 'Blekinge', 0),
(2618, 1, 219, '', 'Dalarnas', 0),
(2619, 1, 219, '', 'Gavleborgs', 0),
(2620, 1, 219, '', 'Gotlands', 0),
(2621, 1, 219, '', 'Hallands', 0),
(2622, 1, 219, '', 'Jamtlands', 0),
(2623, 1, 219, '', 'Jonkopings', 0),
(2624, 1, 219, '', 'Kalmar', 0),
(2625, 1, 219, '', 'Kristianstads', 0),
(2626, 1, 219, '', 'Kronobergs', 0),
(2627, 1, 219, '', 'Norrbottens', 0),
(2628, 1, 219, '', 'Orebro', 0),
(2629, 1, 219, '', 'Ostergotlands', 0),
(2630, 1, 219, '', 'Sodermanlands', 0),
(2631, 1, 219, '', 'Stockholms', 0),
(2632, 1, 219, '', 'Uppsala', 0),
(2633, 1, 219, '', 'Varmlands', 0),
(2634, 1, 219, '', 'Vasterbottens', 0),
(2635, 1, 219, '', 'Vasternorrlands', 0),
(2636, 1, 219, '', 'Vastmanlands', 0),
(2637, 1, 219, '', 'Others', 0),
(2638, 1, 220, '', 'All Regions', 0),
(2639, 1, 220, '', 'Kanton Aargau', 0),
(2640, 1, 220, '', 'Others', 0),
(2641, 1, 221, '', 'All Regions', 0),
(2642, 1, 221, '', 'Al Hasakah', 0),
(2643, 1, 221, '', 'Al Ladhiqiyah', 0),
(2644, 1, 221, '', 'Al Qunaytirah', 0),
(2645, 1, 221, '', 'ar Raqqah', 0),
(2646, 1, 221, '', 'as Suwayda', 0),
(2647, 1, 221, '', 'Dar`a', 0),
(2648, 1, 221, '', 'Dayr az Zawr', 0),
(2649, 1, 221, '', 'Dimashq', 0),
(2650, 1, 221, '', 'Halab', 0),
(2651, 1, 221, '', 'Hamah', 0),
(2652, 1, 221, '', 'Hims', 0),
(2653, 1, 221, '', 'Idlib', 0),
(2654, 1, 221, '', 'Rif Dimashq', 0),
(2655, 1, 221, '', 'Tartus', 0),
(2656, 1, 221, '', 'Others', 0),
(2657, 1, 222, '', 'Fu-chien Sheng', 0),
(2658, 1, 222, '', 'Kao-hsiung Shih', 0),
(2659, 1, 222, '', 'Tai-pei Shih', 0),
(2660, 1, 222, '', 'Tai-wan Sheng', 0),
(2661, 1, 222, '', 'Others', 0),
(2662, 1, 223, '', 'Kulyabskaya Oblast', 0),
(2663, 1, 223, '', 'Khatlon', 0),
(2664, 1, 223, '', 'Mukhtori Kuhistoni Badakhshon', 0),
(2665, 1, 223, '', 'Sughd', 0),
(2666, 1, 223, '', 'Others', 0),
(2667, 1, 224, '', 'Alls', 0),
(2668, 1, 224, '', 'Kagera', 0),
(2669, 1, 224, '', 'Kigoma', 0),
(2670, 1, 224, '', 'Mwanza', 0),
(2671, 1, 224, '', 'Rukwa', 0),
(2672, 1, 224, '', 'Shinyanga', 0),
(2673, 1, 224, '', 'Tabora', 0),
(2674, 1, 224, '', 'Others', 0),
(2675, 1, 225, '', 'Amnat Charoen', 0),
(2676, 1, 225, '', 'Ang Thong', 0),
(2677, 1, 225, '', 'Buriram', 0),
(2678, 1, 225, '', 'Chanthaburi', 0),
(2679, 1, 225, '', 'Chachoengsao', 0),
(2680, 1, 225, '', 'Chai Nat', 0),
(2681, 1, 225, '', 'Chaiyaphum', 0),
(2682, 1, 225, '', 'Chiang Mai', 0),
(2683, 1, 225, '', 'Chiang Rai', 0),
(2684, 1, 225, '', 'Chon Buri', 0),
(2685, 1, 225, '', 'Chumphon', 0),
(2686, 1, 225, '', 'Kalasin', 0),
(2687, 1, 225, '', 'Kamphaeng Phet', 0),
(2688, 1, 225, '', 'Kanchanaburi', 0),
(2689, 1, 225, '', 'Khon Kaen', 0),
(2690, 1, 225, '', 'Krabi', 0),
(2691, 1, 225, '', 'Krung Thep Mahanakhon', 0),
(2692, 1, 225, '', 'Lampang', 0),
(2693, 1, 225, '', 'Lamphun', 0),
(2694, 1, 225, '', 'Loei', 0),
(2695, 1, 225, '', 'Lop Buri', 0),
(2696, 1, 225, '', 'Mae Hong Son', 0),
(2697, 1, 225, '', 'Maha Sarakham', 0),
(2698, 1, 225, '', 'Mukdahan', 0),
(2699, 1, 225, '', 'Nakhon Nayok', 0),
(2700, 1, 225, '', 'Nakhon Pathom', 0),
(2701, 1, 225, '', 'Nakhon Phanom', 0),
(2702, 1, 225, '', 'Nakhon Ratchasima', 0),
(2703, 1, 225, '', 'Nakhon Sawan', 0),
(2704, 1, 225, '', 'Nakhon Si Thammarat', 0),
(2705, 1, 225, '', 'Nan', 0),
(2706, 1, 225, '', 'Narathiwat', 0),
(2707, 1, 225, '', 'Nong Bua Lamphu', 0),
(2708, 1, 225, '', 'Nong Khai', 0),
(2709, 1, 225, '', 'Nonthaburi', 0),
(2710, 1, 225, '', 'Pathum Thani', 0),
(2711, 1, 225, '', 'Pattani', 0),
(2712, 1, 225, '', 'Phangnga', 0),
(2713, 1, 225, '', 'Phatthalung', 0),
(2714, 1, 225, '', 'Phayao', 0),
(2715, 1, 225, '', 'Phetchabun', 0),
(2716, 1, 225, '', 'Phetchaburi', 0),
(2717, 1, 225, '', 'Phichit', 0),
(2718, 1, 225, '', 'Phitsanulok', 0),
(2719, 1, 225, '', 'Phra Nakhon Si Ayutthaya', 0),
(2720, 1, 225, '', 'Phrae', 0),
(2721, 1, 225, '', 'Phuket', 0),
(2722, 1, 225, '', 'Prachin Buri', 0),
(2723, 1, 225, '', 'Prachuap Khiri Khan', 0),
(2724, 1, 225, '', 'Ranong', 0),
(2725, 1, 225, '', 'Ratchaburi', 0),
(2726, 1, 225, '', 'Rayong', 0),
(2727, 1, 225, '', 'Roi Et', 0),
(2728, 1, 225, '', 'Sa Kaeo', 0),
(2729, 1, 225, '', 'Sakon Nakhon', 0),
(2730, 1, 225, '', 'Samut Prakan', 0),
(2731, 1, 225, '', 'Samut Sakhon', 0),
(2732, 1, 225, '', 'Samut Songkhram', 0),
(2733, 1, 225, '', 'Sara Buri', 0),
(2734, 1, 225, '', 'Satun', 0),
(2735, 1, 225, '', 'Sing Buri', 0),
(2736, 1, 225, '', 'Sisaket', 0),
(2737, 1, 225, '', 'Songkhla', 0),
(2738, 1, 225, '', 'Sukhothai', 0),
(2739, 1, 225, '', 'Suphan Buri', 0),
(2740, 1, 225, '', 'Surat Thani', 0),
(2741, 1, 225, '', 'Surin', 0),
(2742, 1, 225, '', 'Tak', 0),
(2743, 1, 225, '', 'Trang', 0),
(2744, 1, 225, '', 'Trat', 0),
(2745, 1, 225, '', 'Ubon Ratchathani', 0),
(2746, 1, 225, '', 'Ubon-Ratchathani', 0),
(2747, 1, 225, '', 'Udon Thani', 0),
(2748, 1, 225, '', 'Uthai Thani', 0),
(2749, 1, 225, '', 'Uttaradit', 0),
(2750, 1, 225, '', 'Yala', 0),
(2751, 1, 225, '', 'Yasothon', 0),
(2752, 1, 225, '', 'Others', 0),
(2753, 1, 226, '', 'Arima', 0),
(2754, 1, 226, '', 'Caroni', 0),
(2755, 1, 226, '', 'Mayaro', 0),
(2756, 1, 226, '', 'Nariva', 0),
(2757, 1, 226, '', 'Port-of-Spain', 0),
(2758, 1, 226, '', 'Saint Andrew', 0),
(2759, 1, 226, '', 'Saint David', 0),
(2760, 1, 226, '', 'Saint George', 0),
(2761, 1, 226, '', 'Saint Patrick', 0),
(2762, 1, 226, '', 'San Fernando', 0),
(2763, 1, 226, '', 'Tobago', 0),
(2764, 1, 226, '', 'Victoria', 0),
(2765, 1, 226, '', 'Others', 0),
(2766, 1, 227, '', 'All Regions', 0),
(2767, 1, 227, '', 'Amlame', 0),
(2768, 1, 227, '', 'Aneho', 0),
(2769, 1, 227, '', 'Atakpame', 0),
(2770, 1, 227, '', 'Bafilo', 0),
(2771, 1, 227, '', 'Bassar', 0),
(2772, 1, 227, '', 'Dapaong', 0),
(2773, 1, 227, '', 'Kante', 0),
(2774, 1, 227, '', 'Klouto', 0),
(2775, 1, 227, '', 'Kpagouda', 0),
(2776, 1, 227, '', 'Lama-Kara', 0),
(2777, 1, 227, '', 'Lome', 0),
(2778, 1, 227, '', 'Mango', 0),
(2779, 1, 227, '', 'Niamtougou', 0),
(2780, 1, 227, '', 'Notse', 0),
(2781, 1, 227, '', 'Sotouboua', 0),
(2782, 1, 227, '', 'Tabligbo', 0),
(2783, 1, 227, '', 'Tchamba', 0),
(2784, 1, 227, '', 'Tsevie', 0),
(2785, 1, 227, '', 'Vogan', 0),
(2786, 1, 227, '', 'Others', 0),
(2787, 1, 228, '', 'All Regions', 0),
(2788, 1, 228, '', 'Others', 0),
(2789, 1, 229, '', 'All Regions', 0),
(2790, 1, 229, '', 'Others', 0),
(2791, 1, 230, '', 'Ariana', 0),
(2792, 1, 230, '', 'Beja', 0),
(2793, 1, 230, '', 'Ben Arous', 0),
(2794, 1, 230, '', 'Bizerte', 0),
(2795, 1, 230, '', 'El Kef', 0),
(2796, 1, 230, '', 'Gabes', 0),
(2797, 1, 230, '', 'Gafsa', 0),
(2798, 1, 230, '', 'Jendouba', 0),
(2799, 1, 230, '', 'Kairouan', 0),
(2800, 1, 230, '', 'Kasserine', 0),
(2801, 1, 230, '', 'Kebili', 0),
(2802, 1, 230, '', 'Mahdia', 0),
(2803, 1, 230, '', 'Medenine', 0),
(2804, 1, 230, '', 'Monastir', 0),
(2805, 1, 230, '', 'Nabeul', 0),
(2806, 1, 230, '', 'Sfax', 0),
(2807, 1, 230, '', 'Sidi Bou Zid', 0),
(2808, 1, 230, '', 'Siliana', 0),
(2809, 1, 230, '', 'Sousse', 0),
(2810, 1, 230, '', 'Tataouine', 0),
(2811, 1, 230, '', 'Tozeur', 0),
(2812, 1, 230, '', 'Tunis', 0),
(2813, 1, 230, '', 'Zaghouan', 0),
(2814, 1, 230, '', 'Wilayat Tunis al Janubiyah', 0),
(2815, 1, 230, '', 'Others', 0),
(2816, 1, 231, '', 'Adana', 0),
(2817, 1, 231, '', 'Adiyaman', 0),
(2818, 1, 231, '', 'Afyon', 0),
(2819, 1, 231, '', 'Agri', 0),
(2820, 1, 231, '', 'Amasya', 0),
(2821, 1, 231, '', 'Antalya', 0),
(2822, 1, 231, '', 'Ardahan', 0),
(2823, 1, 231, '', 'Artvin', 0),
(2824, 1, 231, '', 'Balikesir', 0),
(2825, 1, 231, '', 'Bilecik', 0),
(2826, 1, 231, '', 'Bingol', 0),
(2827, 1, 231, '', 'Bitlis', 0),
(2828, 1, 231, '', 'Bolu', 0),
(2829, 1, 231, '', 'Burdur', 0),
(2830, 1, 231, '', 'Bursa', 0),
(2831, 1, 231, '', 'Canakkale', 0),
(2832, 1, 231, '', 'Corum', 0),
(2833, 1, 231, '', 'Denizli', 0),
(2834, 1, 231, '', 'Diyarbakir', 0),
(2835, 1, 231, '', 'Elazig', 0),
(2836, 1, 231, '', 'Erzincan', 0),
(2837, 1, 231, '', 'Erzurum', 0),
(2838, 1, 231, '', 'Eskisehir', 0),
(2839, 1, 231, '', 'Gaziantep', 0),
(2840, 1, 231, '', 'Giresun', 0),
(2841, 1, 231, '', 'Hatay', 0),
(2842, 1, 231, '', 'Icel', 0),
(2843, 1, 231, '', 'Igdir', 0),
(2844, 1, 231, '', 'Isparta', 0),
(2845, 1, 231, '', 'Istanbul', 0),
(2846, 1, 231, '', 'Izmir', 0),
(2847, 1, 231, '', 'Kahramanmaras', 0),
(2848, 1, 231, '', 'Karaman', 0),
(2849, 1, 231, '', 'Kars', 0),
(2850, 1, 231, '', 'Kastamonu', 0),
(2851, 1, 231, '', 'Kayseri', 0),
(2852, 1, 231, '', 'Kilis', 0),
(2853, 1, 231, '', 'Kirklareli', 0),
(2854, 1, 231, '', 'Kirsehir', 0),
(2855, 1, 231, '', 'Kocaeli', 0),
(2856, 1, 231, '', 'Konya', 0),
(2857, 1, 231, '', 'Kutahya', 0),
(2858, 1, 231, '', 'Manisa', 0),
(2859, 1, 231, '', 'Mugla', 0),
(2860, 1, 231, '', 'Mus', 0),
(2861, 1, 231, '', 'Nevsehir', 0),
(2862, 1, 231, '', 'Nigde', 0),
(2863, 1, 231, '', 'Osmaniye', 0),
(2864, 1, 231, '', 'Rize', 0),
(2865, 1, 231, '', 'Sakarya', 0),
(2866, 1, 231, '', 'Samsun', 0),
(2867, 1, 231, '', 'Sanliurfa', 0),
(2868, 1, 231, '', 'Sinop', 0),
(2869, 1, 231, '', 'Sirnak', 0),
(2870, 1, 231, '', 'Sivas', 0),
(2871, 1, 231, '', 'Tokat', 0),
(2872, 1, 231, '', 'Trabzon', 0),
(2873, 1, 231, '', 'Tunceli', 0),
(2874, 1, 231, '', 'Usak', 0),
(2875, 1, 231, '', 'Yalova', 0),
(2876, 1, 231, '', 'Yozgat', 0),
(2877, 1, 231, '', 'Others', 0),
(2878, 1, 232, '', 'Ahal', 0),
(2879, 1, 232, '', 'All Regions', 0),
(2880, 1, 232, '', 'Balkan', 0),
(2881, 1, 232, '', 'Dasoguz', 0),
(2882, 1, 232, '', 'Lebap', 0),
(2883, 1, 232, '', 'Mary', 0),
(2884, 1, 232, '', 'Others', 0),
(2885, 1, 233, '', 'All Regions', 0),
(2886, 1, 233, '', 'Others', 0),
(2887, 1, 234, '', 'All Regions', 0),
(2888, 1, 234, '', 'Others', 0),
(2889, 1, 235, '', 'Adjumani', 0),
(2890, 1, 235, '', 'All Regions', 0),
(2891, 1, 235, '', 'Apac', 0),
(2892, 1, 235, '', 'Arua', 0),
(2893, 1, 235, '', 'Bugiri', 0),
(2894, 1, 235, '', 'Bundibugyo', 0),
(2895, 1, 235, '', 'Bushenyi', 0),
(2896, 1, 235, '', 'Busia', 0),
(2897, 1, 235, '', 'Busoga Province', 0),
(2898, 1, 235, '', 'Gulu', 0),
(2899, 1, 235, '', 'Hoima', 0),
(2900, 1, 235, '', 'Iganga', 0),
(2901, 1, 235, '', 'Jinja', 0),
(2902, 1, 235, '', 'Kabale', 0),
(2903, 1, 235, '', 'Kabarole', 0);
INSERT INTO `tbl_states` (`state_id`, `zone_id`, `country_id`, `state_code`, `state_name`, `state_delete`) VALUES
(2904, 1, 235, '', 'Kaberamaido', 0),
(2905, 1, 235, '', 'Kalangala', 0),
(2906, 1, 235, '', 'Kampala', 0),
(2907, 1, 235, '', 'Kamuli', 0),
(2908, 1, 235, '', 'Kamwenge', 0),
(2909, 1, 235, '', 'Kanungu', 0),
(2910, 1, 235, '', 'Kapchorwa', 0),
(2911, 1, 235, '', 'Kasese', 0),
(2912, 1, 235, '', 'Katakwi', 0),
(2913, 1, 235, '', 'Kayunga', 0),
(2914, 1, 235, '', 'Kibale', 0),
(2915, 1, 235, '', 'Kiboga', 0),
(2916, 1, 235, '', 'Kisoro', 0),
(2917, 1, 235, '', 'Kitgum', 0),
(2918, 1, 235, '', 'Kotido', 0),
(2919, 1, 235, '', 'Kumi', 0),
(2920, 1, 235, '', 'Kyenjojo', 0),
(2921, 1, 235, '', 'Lira', 0),
(2922, 1, 235, '', 'Luwero', 0),
(2923, 1, 235, '', 'Masaka', 0),
(2924, 1, 235, '', 'Masindi', 0),
(2925, 1, 235, '', 'Mayuge', 0),
(2926, 1, 235, '', 'Mbale', 0),
(2927, 1, 235, '', 'Mbarara', 0),
(2928, 1, 235, '', 'Moroto', 0),
(2929, 1, 235, '', 'Moyo', 0),
(2930, 1, 235, '', 'Mpigi', 0),
(2931, 1, 235, '', 'Mubende', 0),
(2932, 1, 235, '', 'Mukono', 0),
(2933, 1, 235, '', 'Nakapiripirit', 0),
(2934, 1, 235, '', 'Nakasongola', 0),
(2935, 1, 235, '', 'Nebbi', 0),
(2936, 1, 235, '', 'Ntungamo', 0),
(2937, 1, 235, '', 'Pader', 0),
(2938, 1, 235, '', 'Pallisa', 0),
(2939, 1, 235, '', 'Rakai', 0),
(2940, 1, 235, '', 'Rukungiri', 0),
(2941, 1, 235, '', 'Sembabule', 0),
(2942, 1, 235, '', 'Sironko', 0),
(2943, 1, 235, '', 'Soroti', 0),
(2944, 1, 235, '', 'Tororo', 0),
(2945, 1, 235, '', 'Wakiso', 0),
(2946, 1, 235, '', 'Yumbe', 0),
(2947, 1, 235, '', 'Others', 0),
(2948, 1, 236, '', 'Avtonomna Respublika Krym', 0),
(2949, 1, 236, '', 'Cherkas', 0),
(2950, 1, 236, '', 'Chernihivs', 0),
(2951, 1, 236, '', 'Chernivets', 0),
(2952, 1, 236, '', 'Dnipropetrovs', 0),
(2953, 1, 236, '', 'Donets', 0),
(2954, 1, 236, '', 'Ivano-Frankivs', 0),
(2955, 1, 236, '', 'Kharkivs', 0),
(2956, 1, 236, '', 'Khersons', 0),
(2957, 1, 236, '', 'Khmelnyts', 0),
(2958, 1, 236, '', 'Kirovohrads', 0),
(2959, 1, 236, '', 'Kyyivs', 0),
(2960, 1, 236, '', 'Luhans', 0),
(2961, 1, 236, '', 'Others', 0),
(2962, 1, 237, '', 'Abu Zaby', 0),
(2963, 1, 237, '', '`Ajman', 0),
(2964, 1, 237, '', 'Al Fujayrah', 0),
(2965, 1, 237, '', 'All Regions', 0),
(2966, 1, 237, '', 'Ash Shariqah', 0),
(2967, 1, 237, '', 'Dubayy', 0),
(2968, 1, 237, '', 'Ras al Khaymah', 0),
(2969, 1, 237, '', 'Umm al Qaywayn', 0),
(2970, 1, 237, '', 'Others', 0),
(2971, 1, 238, '', 'Aberdeen City', 0),
(2972, 1, 238, '', 'Others', 0),
(2973, 1, 239, '', 'Artigas', 0),
(2974, 1, 239, '', 'Canelones', 0),
(2975, 1, 239, '', 'Cerro Largo', 0),
(2976, 1, 239, '', 'Colonia', 0),
(2977, 1, 239, '', 'Durazno', 0),
(2978, 1, 239, '', 'Flores', 0),
(2979, 1, 239, '', 'Florida', 0),
(2980, 1, 239, '', 'Lavalleja', 0),
(2981, 1, 239, '', 'Maldonado', 0),
(2982, 1, 239, '', 'Montevideo', 0),
(2983, 1, 239, '', 'Paysandu', 0),
(2984, 1, 239, '', 'Rio Negro', 0),
(2985, 1, 239, '', 'Rivera', 0),
(2986, 1, 239, '', 'Rocha', 0),
(2987, 1, 239, '', 'Salto', 0),
(2988, 1, 239, '', 'San Jose', 0),
(2989, 1, 239, '', 'Soriano', 0),
(2990, 1, 239, '', 'Tacuarembo', 0),
(2991, 1, 239, '', 'Treinta y Tres', 0),
(2992, 1, 239, '', 'Others', 0),
(2993, 1, 240, '', 'Alabama', 0),
(2994, 1, 240, '', 'Alaska', 0),
(2995, 1, 240, '', 'American Samoa', 0),
(2996, 1, 240, '', 'Arizona', 0),
(2997, 1, 240, '', 'Arkansas', 0),
(2998, 1, 240, '', 'California', 0),
(2999, 1, 240, '', 'Colorado', 0),
(3000, 1, 240, '', 'Connecticut', 0),
(3001, 1, 240, '', 'Delaware', 0),
(3002, 1, 240, '', 'District of Columbia', 0),
(3003, 1, 240, '', 'Florida', 0),
(3004, 1, 240, '', 'Georgia', 0),
(3005, 1, 240, '', 'Guam', 0),
(3006, 1, 240, '', 'Hawaii', 0),
(3007, 1, 240, '', 'Idaho', 0),
(3008, 1, 240, '', 'Illinois', 0),
(3009, 1, 240, '', 'Indiana', 0),
(3010, 1, 240, '', 'Iowa', 0),
(3011, 1, 240, '', 'Kansas', 0),
(3012, 1, 240, '', 'Kentucky', 0),
(3013, 1, 240, '', 'Louisiana', 0),
(3014, 1, 240, '', 'Maine', 0),
(3015, 1, 240, '', 'Maryland', 0),
(3016, 1, 240, '', 'Massachusetts', 0),
(3017, 1, 240, '', 'Michigan', 0),
(3018, 1, 240, '', 'Minnesota', 0),
(3019, 1, 240, '', 'Mississippi', 0),
(3020, 1, 240, '', 'Missouri', 0),
(3021, 1, 240, '', 'Montana', 0),
(3022, 1, 240, '', 'Nevada', 0),
(3023, 1, 240, '', 'New Hampshire', 0),
(3024, 1, 240, '', 'New Jersey', 0),
(3025, 1, 240, '', 'New Mexico', 0),
(3026, 1, 240, '', 'New York', 0),
(3027, 1, 240, '', 'North Carolina', 0),
(3028, 1, 240, '', 'North Dakota', 0),
(3029, 1, 240, '', 'Northern Mariana Islands', 0),
(3030, 1, 240, '', 'Ohio', 0),
(3031, 1, 240, '', 'Oklahoma', 0),
(3032, 1, 240, '', 'Oregon', 0),
(3033, 1, 240, '', 'Pennsylvania', 0),
(3034, 1, 240, '', 'Puerto Rico', 0),
(3035, 1, 240, '', 'Rhode Island', 0),
(3036, 1, 240, '', 'South Carolina', 0),
(3037, 1, 240, '', 'South Dakota', 0),
(3038, 1, 240, '', 'Tennessee', 0),
(3039, 1, 240, '', 'Texas', 0),
(3040, 1, 240, '', 'Utah', 0),
(3041, 1, 240, '', 'Vermont', 0),
(3042, 1, 240, '', 'Virgin Islands', 0),
(3043, 1, 240, '', 'Virginia', 0),
(3044, 1, 240, '', 'Washington', 0),
(3045, 1, 240, '', 'West Virginia', 0),
(3046, 1, 240, '', 'Wisconsin', 0),
(3047, 1, 240, '', 'Wyoming', 0),
(3048, 1, 240, '', 'Others', 0),
(3049, 1, 241, '', 'Andijon', 0),
(3050, 1, 241, '', 'Buxoro', 0),
(3051, 1, 241, '', 'Farg`ona', 0),
(3052, 1, 241, '', 'Jizzax', 0),
(3053, 1, 241, '', 'Namangan', 0),
(3054, 1, 241, '', 'Navoiy', 0),
(3055, 1, 241, '', 'Qashqadaryo', 0),
(3056, 1, 241, '', 'Qoraqalpog`iston Respublikasi', 0),
(3057, 1, 241, '', 'Samarqand', 0),
(3058, 1, 241, '', 'Sirdaryo', 0),
(3059, 1, 241, '', 'Surxondaryo', 0),
(3060, 1, 241, '', 'Toshkent Shahri', 0),
(3061, 1, 241, '', 'Toshkent', 0),
(3062, 1, 241, '', 'Xorazm', 0),
(3063, 1, 241, '', 'Others', 0),
(3064, 1, 242, '', 'Ambrym', 0),
(3065, 1, 242, '', 'Aoba/Maewo', 0),
(3066, 1, 242, '', 'Efate', 0),
(3067, 1, 242, '', 'Epi', 0),
(3068, 1, 242, '', 'Malakula', 0),
(3069, 1, 242, '', 'Paama', 0),
(3070, 1, 242, '', 'Pentecote', 0),
(3071, 1, 242, '', 'Shepherd', 0),
(3072, 1, 242, '', 'Sanma', 0),
(3073, 1, 242, '', 'Tafea', 0),
(3074, 1, 242, '', 'Torba', 0),
(3075, 1, 242, '', 'Others', 0),
(3076, 1, 243, '', 'All Regions', 0),
(3077, 1, 243, '', 'Amazonas', 0),
(3078, 1, 243, '', 'Falcon', 0),
(3079, 1, 243, '', 'Guarico', 0),
(3080, 1, 243, '', 'Lara', 0),
(3081, 1, 243, '', 'Merida', 0),
(3082, 1, 243, '', 'Miranda', 0),
(3083, 1, 243, '', 'Nueva Esparta', 0),
(3084, 1, 243, '', 'Others', 0),
(3085, 1, 244, '', 'An Giang', 0),
(3086, 1, 244, '', 'Ba Ria-Vung Tau', 0),
(3087, 1, 244, '', 'Bac Giang', 0),
(3088, 1, 244, '', 'Bac Kan', 0),
(3089, 1, 244, '', 'Bac Lieu', 0),
(3090, 1, 244, '', 'Bac Ninh', 0),
(3091, 1, 244, '', 'Ben Tre', 0),
(3092, 1, 244, '', 'Binh Dinh', 0),
(3093, 1, 244, '', 'Binh Duong', 0),
(3094, 1, 244, '', 'Binh Phuoc', 0),
(3095, 1, 244, '', 'Binh Thuan', 0),
(3096, 1, 244, '', 'Ca Mau', 0),
(3097, 1, 244, '', 'Can Tho', 0),
(3098, 1, 244, '', 'Cao Bang', 0),
(3099, 1, 244, '', 'Da Nang', 0),
(3100, 1, 244, '', 'Dong Nai', 0),
(3101, 1, 244, '', 'Dong Thap', 0),
(3102, 1, 244, '', 'Gia Lai', 0),
(3103, 1, 244, '', 'Ha Giang', 0),
(3104, 1, 244, '', 'Ha Nam', 0),
(3105, 1, 244, '', 'Ha Tay', 0),
(3106, 1, 244, '', 'Ha Tinh', 0),
(3107, 1, 244, '', 'Hai Duong', 0),
(3108, 1, 244, '', 'Hoa Binh', 0),
(3109, 1, 244, '', 'Hung Yen', 0),
(3110, 1, 244, '', 'Khanh Hoa', 0),
(3111, 1, 244, '', 'Kien Giang', 0),
(3112, 1, 244, '', 'Kon Tum', 0),
(3113, 1, 244, '', 'Lai Chau', 0),
(3114, 1, 244, '', 'Lam Dong', 0),
(3115, 1, 244, '', 'Lang Son', 0),
(3116, 1, 244, '', 'Lao Cai', 0),
(3117, 1, 244, '', 'Long An', 0),
(3118, 1, 244, '', 'Nam Dinh', 0),
(3119, 1, 244, '', 'Nghe An', 0),
(3120, 1, 244, '', 'Ninh Binh', 0),
(3121, 1, 244, '', 'Ninh Thuan', 0),
(3122, 1, 244, '', 'Phu Tho', 0),
(3123, 1, 244, '', 'Phu Yen', 0),
(3124, 1, 244, '', 'Quang Binh', 0),
(3125, 1, 244, '', 'Quang Nam', 0),
(3126, 1, 244, '', 'Quang Ngai', 0),
(3127, 1, 244, '', 'Quang Ninh', 0),
(3128, 1, 244, '', 'Quang Tri', 0),
(3129, 1, 244, '', 'Soc Trang', 0),
(3130, 1, 244, '', 'Son La', 0),
(3131, 1, 244, '', 'Thai Binh', 0),
(3132, 1, 244, '', 'Thai Nguyen', 0),
(3133, 1, 244, '', 'Thanh Hoa', 0),
(3134, 1, 244, '', 'Thanh Pho Hai Phong', 0),
(3135, 1, 244, '', 'Thanh Pho Ho Chi Minh', 0),
(3136, 1, 244, '', 'Thu Do Ha Noi', 0),
(3137, 1, 244, '', 'Thua Thien-Hue', 0),
(3138, 1, 244, '', 'Tien Giang', 0),
(3139, 1, 244, '', 'Tinh)) ((Bac Thai', 0),
(3140, 1, 244, '', 'Tinh)) ((Ha Bac', 0),
(3141, 1, 244, '', 'Tinh)) ((Hai Hung', 0),
(3142, 1, 244, '', 'Tinh)) ((Minh Hai', 0),
(3143, 1, 244, '', 'Tinh)) ((Vinh Phu', 0),
(3144, 1, 244, '', 'Tra Vinh', 0),
(3145, 1, 244, '', 'Tuyen Quang', 0),
(3146, 1, 244, '', 'Vinh Long', 0),
(3147, 1, 244, '', 'Vinh Phuc', 0),
(3148, 1, 244, '', 'Yen Bai', 0),
(3149, 1, 244, '', 'Others', 0),
(3150, 1, 245, '', 'British Virgin Islands', 0),
(3151, 1, 245, '', 'United States Virgin Islands', 0),
(3152, 1, 245, '', 'Others', 0),
(3153, 1, 246, '', 'All Regions', 0),
(3154, 1, 246, '', 'Others', 0),
(3155, 1, 247, '', 'Territarie des lles wallis et Futuna', 0),
(3156, 1, 247, '', 'Others', 0),
(3157, 1, 248, '', 'All Regions', 0),
(3158, 1, 248, '', 'Others', 0),
(3159, 1, 249, '', 'All Regions', 0),
(3160, 1, 249, '', 'Others', 0),
(3161, 1, 250, '', 'All Regions', 0),
(3162, 1, 250, '', 'Baladiyat `Adan', 0),
(3163, 1, 250, '', 'Muhafazat Abyan', 0),
(3164, 1, 250, '', 'Muhafazat al Bayda', 0),
(3165, 1, 250, '', 'Muhafazat al Hudaydah', 0),
(3166, 1, 250, '', 'Muhafazat al Mahrah', 0),
(3167, 1, 250, '', 'Muhafazat al Mahwit', 0),
(3168, 1, 250, '', 'Muhafazat Hadramawt', 0),
(3169, 1, 250, '', 'Muhafazat Ta`izz', 0),
(3170, 1, 250, '', 'Muhafazat `Adan', 0),
(3171, 1, 250, '', 'Others', 0),
(3172, 1, 251, '', 'All Regions', 0),
(3173, 1, 251, '', 'Others', 0),
(3174, 1, 252, '', 'All Regions', 0),
(3175, 1, 252, '', 'Central Province', 0),
(3176, 1, 252, '', 'Copperbelt Province', 0),
(3177, 1, 252, '', 'Eastern Province', 0),
(3178, 1, 252, '', 'Luapula Province', 0),
(3179, 1, 252, '', 'Lusaka Province', 0),
(3180, 1, 252, '', 'North-Western Province', 0),
(3181, 1, 252, '', 'Northern Province', 0),
(3182, 1, 252, '', 'Southern Province', 0),
(3183, 1, 252, '', 'Western Province', 0),
(3184, 1, 252, '', 'Others', 0),
(3185, 1, 253, '', 'All Regions', 0),
(3186, 1, 253, '', 'Mashonaland East Province', 0),
(3187, 1, 253, '', 'Others', 0),
(3188, 1, 254, '', 'Others', 0),
(3200, 1, 105, '', 'punjab', 0),
(3204, 1, 238, '', 'New York', 0),
(3205, 1, 105, '', 'Haryana', 0),
(3211, 1, 240, '', 'chandigarh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_cart`
--

CREATE TABLE `tbl_subscription_cart` (
  `scart_user_id` varchar(100) NOT NULL,
  `scart_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_coupons`
--

CREATE TABLE `tbl_subscription_coupons` (
  `subscoupon_id` int(11) NOT NULL,
  `subscoupon_name` varchar(200) NOT NULL,
  `subscoupon_description` text NOT NULL,
  `subscoupon_code` varchar(35) NOT NULL,
  `subscoupon_merchantsubpack` int(11) NOT NULL,
  `subscoupon_discount_type` varchar(10) NOT NULL COMMENT 'Percentage or Absolute',
  `subscoupon_discount_value` decimal(10,2) NOT NULL,
  `subscoupon_max_discount_value` decimal(10,2) NOT NULL,
  `subscoupon_start_date` date NOT NULL,
  `subscoupon_end_date` date NOT NULL,
  `subscoupon_discount_valid_for` int(11) NOT NULL,
  `subscoupon_uses_per_coupon` int(11) NOT NULL,
  `subscoupon_uses_per_customer` int(11) NOT NULL,
  `subscoupon_active` tinyint(4) NOT NULL DEFAULT '1',
  `subscoupon_is_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_coupons_history`
--

CREATE TABLE `tbl_subscription_coupons_history` (
  `subscouponhistory_id` int(11) NOT NULL,
  `subscouponhistory_subscoupon_id` int(11) NOT NULL,
  `subscouponhistory_order_id` int(11) NOT NULL,
  `subscouponhistory_customer_id` int(11) NOT NULL,
  `subscouponhistory_amount` decimal(15,4) NOT NULL,
  `subscouponhistory_date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_merchant_packages`
--

CREATE TABLE `tbl_subscription_merchant_packages` (
  `merchantpack_id` int(11) NOT NULL,
  `merchantpack_name` varchar(200) NOT NULL,
  `merchantpack_description` text NOT NULL,
  `merchantpack_commission_rate` decimal(10,2) NOT NULL,
  `merchantpack_images_per_product` int(11) NOT NULL,
  `merchantpack_free_trial_days` int(11) NOT NULL,
  `merchantpack_max_products` int(11) NOT NULL COMMENT 'Allowed to post x products for this Package',
  `merchantpack_display_order` int(11) NOT NULL,
  `merchantpack_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subscription_merchant_packages`
--

INSERT INTO `tbl_subscription_merchant_packages` (`merchantpack_id`, `merchantpack_name`, `merchantpack_description`, `merchantpack_commission_rate`, `merchantpack_images_per_product`, `merchantpack_free_trial_days`, `merchantpack_max_products`, `merchantpack_display_order`, `merchantpack_active`) VALUES
(1, 'Novice', 'This is Description of Novice Package.', '10.00', 5, 7, 3, 1, 1),
(2, 'Enthusiast', 'This is Description of Enthusiast Package.', '8.00', 10, 7, 5, 2, 1),
(3, 'Expert', 'This is Description of Expert Package.', '6.00', 10, 7, 500, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_merchant_package_orders`
--

CREATE TABLE `tbl_subscription_merchant_package_orders` (
  `mporder_id` int(11) NOT NULL,
  `mporder_invoice_number` varchar(50) NOT NULL,
  `mporder_old_mporder_id` int(11) NOT NULL,
  `mporder_user_id` int(11) NOT NULL,
  `mporder_user_name` varchar(255) NOT NULL,
  `mporder_user_email` varchar(255) NOT NULL,
  `mporder_user_phone` varchar(50) NOT NULL,
  `mporder_payment_method` varchar(100) NOT NULL,
  `mporder_payment_method_code` varchar(100) NOT NULL,
  `mporder_payment_status` tinyint(1) NOT NULL COMMENT '0=> Payment not done, 1=> Payment completed',
  `mporder_mpo_status_id` tinyint(1) NOT NULL COMMENT '"mpo_status_id" from "tbl_merchant_package_orders_status", This is\r\n\r\nOrder Status',
  `mporder_merchantpack_id` int(11) NOT NULL COMMENT 'merchantpack_id from "tbl_merchant_packages"',
  `mporder_merchantpack_name` varchar(200) NOT NULL,
  `mporder_merchantpack_desc` text NOT NULL,
  `mporder_merchantpack_commission` decimal(10,2) NOT NULL,
  `mporder_merchantpack_max_products` int(11) NOT NULL,
  `mporder_merchantpack_max_pimages` int(11) NOT NULL,
  `mporder_merchantsubpack_id` int(11) NOT NULL COMMENT 'merchantsubpack_id from "tbl_merchant_sub_packages"',
  `mporder_merchantsubpack_name` varchar(200) NOT NULL,
  `mporder_merchantsubpack_subs_days` int(11) NOT NULL,
  `mporder_merchantsubpack_subs_amount` decimal(10,4) NOT NULL,
  `mporder_discount_coupon` varchar(55) NOT NULL,
  `mporder_discount_total` decimal(10,4) NOT NULL,
  `mporder_reward_points` int(11) NOT NULL,
  `mporder_sub_total` decimal(10,4) NOT NULL,
  `mporder_net_charged` decimal(10,4) NOT NULL,
  `mporder_actual_paid` decimal(10,4) NOT NULL,
  `mporder_credits_charged` decimal(10,4) NOT NULL,
  `mporder_amount_adjustable` decimal(10,4) NOT NULL,
  `mporder_recurring_amount` decimal(10,4) NOT NULL,
  `mporder_recurring_discount_coupon` varchar(50) NOT NULL,
  `mporder_recurring_discount_total` decimal(10,4) NOT NULL,
  `mporder_recurring_chargeble_amount` decimal(10,4) NOT NULL,
  `mporder_recurring_billing_cycle` int(11) NOT NULL,
  `mporder_recurring_billing_cycle_frequency` int(11) NOT NULL,
  `mporder_recurring_billing_cycle_period` char(1) NOT NULL,
  `mporder_date_added` datetime NOT NULL,
  `mporder_date_updated` datetime NOT NULL,
  `mporder_gateway_subscription_id` varchar(100) NOT NULL COMMENT 'To keep reference of gateway subs',
  `mporder_gateway_subscription_status` int(11) NOT NULL COMMENT 'global array in application-top',
  `mporder_ip_address` varchar(25) NOT NULL,
  `mporder_user_agent` varchar(255) NOT NULL,
  `mporder_accept_language` varchar(255) NOT NULL,
  `mporder_language` varchar(50) NOT NULL,
  `mporder_currency_code` varchar(50) NOT NULL,
  `mporder_currency_value` decimal(30,10) NOT NULL,
  `mporder_subscription_start_date` datetime NOT NULL,
  `mporder_subscription_end_date` date NOT NULL,
  `mporder_wallet_selected` tinyint(4) NOT NULL COMMENT '// is payment to be made from user balance',
  `mporder_is_free_trial` tinyint(1) NOT NULL,
  `mporder_subscription_expiry_email` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_merchant_package_order_status_history`
--

CREATE TABLE `tbl_subscription_merchant_package_order_status_history` (
  `mpos_history_id` bigint(20) NOT NULL,
  `mpos_history_mporder_id` bigint(20) NOT NULL COMMENT '"mporder_id" from "tbl_merchant_package_orders"',
  `mpos_history_mpo_status_id` int(11) NOT NULL COMMENT '"mpo_status_id" from "tbl_merchant_package_orders_status"',
  `mpos_history_date_added` datetime NOT NULL,
  `mpos_history_customer_notified` tinyint(1) NOT NULL,
  `mpos_history_comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_merchant_package_transactions`
--

CREATE TABLE `tbl_subscription_merchant_package_transactions` (
  `mptran_id` int(11) NOT NULL,
  `mptran_mporder_id` int(11) NOT NULL,
  `mptran_mode` varchar(100) NOT NULL COMMENT '1 - Paypal',
  `mptran_date` datetime NOT NULL,
  `mptran_gateway_transaction_id` varchar(50) NOT NULL,
  `mptran_gateway_parent_transaction_id` varchar(50) NOT NULL,
  `mptran_gateway_response` text NOT NULL,
  `mptran_amount` decimal(10,2) NOT NULL,
  `mptran_gateway_charges` decimal(10,2) NOT NULL,
  `mptran_payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `mptran_payment_status` varchar(255) NOT NULL,
  `mptran_pending_reason` char(50) NOT NULL,
  `mptran_active_from` datetime NOT NULL,
  `mptran_active_till` date NOT NULL,
  `mptran_recurring_type` int(11) NOT NULL DEFAULT '-1' COMMENT 'data from recurring ipn, -1 => NA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_merchant_sub_packages`
--

CREATE TABLE `tbl_subscription_merchant_sub_packages` (
  `merchantsubpack_id` int(11) NOT NULL,
  `merchantsubpack_merchantpack_id` int(11) NOT NULL COMMENT 'from tbl_merchnat_packages',
  `merchantsubpack_subs_frequency` int(11) NOT NULL,
  `merchantsubpack_subs_period` char(1) NOT NULL,
  `merchantsubpack_actual_price` decimal(10,2) NOT NULL,
  `merchantsubpack_recurring_price` decimal(10,2) NOT NULL,
  `merchantsubpack_total_occurrance` int(11) NOT NULL,
  `merchantsubpack_display_order` int(11) NOT NULL,
  `merchantsubpack_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subscription_merchant_sub_packages`
--

INSERT INTO `tbl_subscription_merchant_sub_packages` (`merchantsubpack_id`, `merchantsubpack_merchantpack_id`, `merchantsubpack_subs_frequency`, `merchantsubpack_subs_period`, `merchantsubpack_actual_price`, `merchantsubpack_recurring_price`, `merchantsubpack_total_occurrance`, `merchantsubpack_display_order`, `merchantsubpack_active`) VALUES
(1, 1, 30, 'D', '10.00', '10.00', 9999, 1, 1),
(2, 1, 7, 'D', '0.00', '0.00', 0, 0, 1),
(4, 1, 60, 'D', '20.00', '20.00', 9999, 0, 1),
(5, 2, 7, 'D', '0.00', '0.00', 0, 0, 1),
(6, 2, 30, 'D', '25.00', '25.00', 9999, 0, 1),
(7, 2, 60, 'D', '50.00', '50.00', 9999, 0, 1),
(8, 3, 7, 'D', '0.00', '0.00', 0, 0, 1),
(9, 3, 30, 'D', '100.00', '100.00', 9999, 0, 1),
(10, 3, 60, 'D', '200.00', '200.00', 9999, 0, 1),
(11, 1, 90, 'D', '30.00', '30.00', 9999, 0, 1),
(12, 2, 90, 'D', '75.00', '75.00', 9999, 0, 1),
(13, 3, 90, 'D', '250.00', '250.00', 9999, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_order_status`
--

CREATE TABLE `tbl_subscription_order_status` (
  `sorder_status_id` int(11) NOT NULL,
  `sorder_status_name` varchar(32) NOT NULL,
  `sorder_status_priority` int(11) NOT NULL,
  `sorder_status_subscriber_flag` int(11) DEFAULT '0',
  `sorder_status_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subscription_order_status`
--

INSERT INTO `tbl_subscription_order_status` (`sorder_status_id`, `sorder_status_name`, `sorder_status_priority`, `sorder_status_subscriber_flag`, `sorder_status_is_deleted`) VALUES
(1, 'Pending', 1, 1, 0),
(2, 'Active/Confirmed', 3, 1, 0),
(3, 'Failed', 4, 1, 0),
(5, 'Cancelled', 5, 1, 0),
(6, 'Completed', 6, 1, 0),
(7, 'Others', 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_payment_gateway_responses`
--

CREATE TABLE `tbl_subscription_payment_gateway_responses` (
  `subgatewaytxn_id` int(11) NOT NULL,
  `subgatewaytxn_mporder_id` int(11) NOT NULL,
  `subgatewaytxn_mode` varchar(100) NOT NULL COMMENT '1 - Paypal',
  `subgatewaytxn_date` datetime NOT NULL,
  `subgatewaytxn_transaction_id` varchar(50) NOT NULL,
  `subgatewaytxn_response` text NOT NULL,
  `subgatewaytxn_amount` decimal(10,2) NOT NULL,
  `subgatewaytxn_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_payment_methods`
--

CREATE TABLE `tbl_subscription_payment_methods` (
  `subscriptionpmethod_id` int(11) NOT NULL,
  `subscriptionpmethod_name` varchar(50) NOT NULL DEFAULT '',
  `subscriptionpmethod_details` varchar(255) NOT NULL DEFAULT '',
  `subscriptionpmethod_status` tinyint(4) NOT NULL DEFAULT '0',
  `subscriptionpmethod_icon` varchar(255) NOT NULL,
  `subscriptionpmethod_code` varchar(50) NOT NULL DEFAULT '',
  `subscriptionpmethod_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subscription_payment_methods`
--

INSERT INTO `tbl_subscription_payment_methods` (`subscriptionpmethod_id`, `subscriptionpmethod_name`, `subscriptionpmethod_details`, `subscriptionpmethod_status`, `subscriptionpmethod_icon`, `subscriptionpmethod_code`, `subscriptionpmethod_display_order`) VALUES
(2, 'PayPal Standard', 'PayPal Standard - Description will go here', 1, 'paypal.png', 'PaypalStandard', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscription_payment_method_fields`
--

CREATE TABLE `tbl_subscription_payment_method_fields` (
  `subpmf_id` int(11) NOT NULL,
  `subpmf_pmethod_id` int(11) NOT NULL,
  `subpmf_key` varchar(255) NOT NULL,
  `subpmf_value` varchar(255) NOT NULL,
  `subpmf_serialized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonials`
--

CREATE TABLE `tbl_testimonials` (
  `testimonial_id` int(11) NOT NULL,
  `testimonial_image` varchar(255) NOT NULL,
  `testimonial_name` varchar(255) NOT NULL,
  `testimonial_address` varchar(255) NOT NULL,
  `testimonial_text` text NOT NULL,
  `testimonial_status` tinyint(1) NOT NULL,
  `testimonial_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_testimonials`
--

INSERT INTO `tbl_testimonials` (`testimonial_id`, `testimonial_image`, `testimonial_name`, `testimonial_address`, `testimonial_text`, `testimonial_status`, `testimonial_is_deleted`) VALUES
(1, 'emp_5.jpg', 'Mr.albanja', 'Los Angeles, CA', 'The Best Shopping Experience. Very informative and buy what you see is best facility!!!', 0, 0),
(2, 'emp_4.jpg', 'Levi Straus', 'Asia Pacific Division', 'Our project implementation and transition was quite smooth. Quatrro always responded well whenever there was an issue to be sorted out.Our project implementation and transition was quite smooth. Quatrro always responded well whenever there was an issue to be sorted out.\r\n\r\nOur project implementation and transition was quite smooth. Quatrro always responded well whenever there was an issue to be sorted out.', 0, 0),
(3, 'emp_3.jpg', 'Nathan Astle', 'Los Angeles, CA', 'Aenean sagittis lorem ut laoreet ullamcorper. Nunc tincidunt, erat vitae dapibus hendrerit, diam arcu lacinia neque, eget blandit mi odio vitae tellus.', 0, 0),
(4, 'emp_2.jpg', 'James Anderson', 'Los Angeles, CA', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget arcu pulvinar Lorem ipsum dolor sit amet', 0, 0),
(5, 'emp_1.jpg', 'Shane Marsh', 'New Delhi, IND', 'Fusce nec posuere felis. Nam vitae rutrum justo. Sed fringilla magna metus, nec lacinia nisi porttitor sed. Nullam ut fermentum nibh, et condimentum magna. Quisque porttitor ut sem id posuere. Aliquam sollicitudin ultrices augue quis imperdiet. Aliquam erat volutpat. Praesent eu quam ut eros tincidunt auctor.', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_themes`
--

CREATE TABLE `tbl_themes` (
  `theme_id` int(11) NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_primary_color` varchar(50) NOT NULL,
  `theme_secondary_color` varchar(50) NOT NULL,
  `theme_product_box_icon_price_color` varchar(50) NOT NULL,
  `theme_top_nav_text_color` varchar(50) NOT NULL,
  `theme_top_nav_hover_color` varchar(50) NOT NULL,
  `theme_secondary_button_text_color` varchar(50) NOT NULL,
  `theme_top_bar_color` varchar(50) NOT NULL,
  `theme_left_box_color` varchar(50) NOT NULL,
  `theme_display_order` int(11) NOT NULL,
  `theme_added_by` tinyint(1) NOT NULL,
  `theme_top_bar_text_color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_themes`
--

INSERT INTO `tbl_themes` (`theme_id`, `theme_name`, `theme_primary_color`, `theme_secondary_color`, `theme_product_box_icon_price_color`, `theme_top_nav_text_color`, `theme_top_nav_hover_color`, `theme_secondary_button_text_color`, `theme_top_bar_color`, `theme_left_box_color`, `theme_display_order`, `theme_added_by`, `theme_top_bar_text_color`) VALUES
(1, 'Red - First [PINK]', 'FF3A59', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 1, 0, 'FFFFFF'),
(2, 'Red - Second', 'F44336', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 2, 0, 'FFFFFF'),
(3, 'Red - Third', 'DC0028', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 3, 0, 'FFFFFF'),
(4, 'Blue - First', '1A8FE3', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 4, 0, 'FFFFFF'),
(5, 'Blue - Second', '007DC6', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 5, 0, 'FFFFFF'),
(6, 'Blue - Third', '003B64', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 6, 0, 'FFFFFF'),
(7, 'Green - First', '6BC452', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 7, 0, 'FFFFFF'),
(8, 'Green - Second', '00C853', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 8, 0, 'FFFFFF'),
(9, 'Green - Third', '14C06E', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 9, 0, 'FFFFFF'),
(10, 'Yellow - First', 'FFEB3B', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 10, 0, 'FFFFFF'),
(11, 'Yellow - Second', 'FFEA00', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 11, 0, 'FFFFFF'),
(12, 'Yellow - Third', 'FFD600', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 12, 0, 'FFFFFF'),
(13, 'Gray - First', '757575', 'FF3A59', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 13, 0, 'FFFFFF'),
(14, 'Gray - Second', '616161', 'FF3A59', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 14, 0, 'FFFFFF'),
(15, 'Gray - Third', '424242', 'FF3A59', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 15, 0, 'FFFFFF'),
(16, 'Purple - First', 'AB47BC', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 16, 0, 'FFFFFF'),
(17, 'Purple - Second', '9C27B0', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 17, 0, 'FFFFFF'),
(18, 'Purple - Third', '4A148C', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 18, 0, 'FFFFFF'),
(19, 'Brown - First', '8D6E63', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 19, 0, 'FFFFFF'),
(20, 'Brown - Second', '795548', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 20, 0, 'FFFFFF'),
(21, 'Brown - Third', '3E2723', '757575', 'FF3A59', 'FFFFFF', 'FFFFFF', 'FFFFFF', '000000', 'F5F5F5', 21, 0, 'FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_threads`
--

CREATE TABLE `tbl_threads` (
  `thread_id` bigint(20) NOT NULL,
  `thread_subject` varchar(255) NOT NULL,
  `thread_started_by` int(11) NOT NULL,
  `thread_start_date` date NOT NULL,
  `thread_type` char(1) NOT NULL,
  `thread_record` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_thread_messages`
--

CREATE TABLE `tbl_thread_messages` (
  `message_id` bigint(20) NOT NULL,
  `message_thread` int(11) NOT NULL,
  `message_from` int(11) NOT NULL,
  `message_to` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `message_date` datetime NOT NULL,
  `message_is_unread` tinyint(1) NOT NULL DEFAULT '1',
  `message_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_url_alias`
--

CREATE TABLE `tbl_url_alias` (
  `url_alias_id` bigint(20) NOT NULL,
  `url_alias_query` varchar(255) NOT NULL,
  `url_alias_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_url_alias`
--

INSERT INTO `tbl_url_alias` (`url_alias_id`, `url_alias_query`, `url_alias_keyword`) VALUES
(1, 'category_id=26', 'Electronics'),
(2, 'category_id=37', 'Entertainment'),
(3, 'shops_id=1', 'twostringjane'),
(4, 'shops_id=4', 'bestmenstore'),
(5, 'shops_id=3', 'newshop');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` bigint(20) NOT NULL,
  `user_username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user_email` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `user_password` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `user_name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `user_profile_image` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user_added_on` datetime NOT NULL,
  `user_phone` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user_city_town` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user_state_county` int(11) NOT NULL,
  `user_country` int(11) NOT NULL,
  `user_company` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user_profile` text COLLATE latin1_general_ci NOT NULL,
  `user_products_services` text COLLATE latin1_general_ci NOT NULL,
  `user_customer_group` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `user_markup` decimal(10,2) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_email_verified` tinyint(1) NOT NULL,
  `user_is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `user_permission_group` bigint(20) NOT NULL,
  `user_facebook_id` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `user_googleplus_id` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `user_affiliate_id` int(11) NOT NULL,
  `user_app_token` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `user_referral_code` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `user_referrer_id` int(11) NOT NULL,
  `user_buyer_supp_pref` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'B'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_activities`
--

CREATE TABLE `tbl_user_activities` (
  `uact_id` bigint(20) NOT NULL,
  `uact_to_user` int(11) NOT NULL,
  `uact_from_user` int(11) NOT NULL,
  `uact_prod_shop_record` bigint(1) NOT NULL,
  `uact_prod_shop_type` tinyint(1) NOT NULL,
  `uact_action_performed` char(2) NOT NULL,
  `uact_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_address`
--

CREATE TABLE `tbl_user_address` (
  `ua_id` int(11) NOT NULL,
  `ua_user_id` int(11) NOT NULL,
  `ua_profile_name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ua_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ua_address1` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ua_address2` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ua_address3` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ua_city` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ua_state` int(11) NOT NULL,
  `ua_state_name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ua_phone` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `ua_zip` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `ua_country` int(11) NOT NULL,
  `ua_address_type` tinyint(255) NOT NULL,
  `ua_is_default` tinyint(4) NOT NULL,
  `ua_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_bank_details`
--

CREATE TABLE `tbl_user_bank_details` (
  `ub_user_id` int(11) NOT NULL,
  `ub_bank_name` varchar(255) NOT NULL,
  `ub_account_holder_name` varchar(255) NOT NULL,
  `ub_account_number` varchar(100) NOT NULL,
  `ub_ifsc_swift_code` varchar(100) NOT NULL,
  `ub_bank_address` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_cart`
--

CREATE TABLE `tbl_user_cart` (
  `cart_user_id` varchar(100) NOT NULL,
  `cart_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_email_verification_codes`
--

CREATE TABLE `tbl_user_email_verification_codes` (
  `uevc_user_id` int(11) NOT NULL,
  `uevc_code` varchar(50) NOT NULL,
  `uevc_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_favourite_products`
--

CREATE TABLE `tbl_user_favourite_products` (
  `ufp_id` int(11) NOT NULL,
  `ufp_user_id` int(11) NOT NULL,
  `ufp_prod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_favourite_shops`
--

CREATE TABLE `tbl_user_favourite_shops` (
  `ufs_id` int(11) NOT NULL,
  `ufs_user_id` int(11) NOT NULL,
  `ufs_shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_lists`
--

CREATE TABLE `tbl_user_lists` (
  `ulist_id` int(11) NOT NULL,
  `ulist_user_id` int(11) NOT NULL,
  `ulist_title` varchar(255) NOT NULL,
  `ulist_added_on` datetime NOT NULL,
  `ulist_is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_list_products`
--

CREATE TABLE `tbl_user_list_products` (
  `ulp_id` bigint(20) NOT NULL,
  `ulp_list_id` int(11) NOT NULL,
  `ulp_prod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_login`
--

CREATE TABLE `tbl_user_login` (
  `ulogin_id` bigint(20) NOT NULL,
  `ulogin_username_email` varchar(255) NOT NULL,
  `ulogin_ip` varchar(40) NOT NULL,
  `ulogin_total` int(11) NOT NULL,
  `ulogin_date_added` datetime NOT NULL,
  `ulogin_date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_password_reset_requests`
--

CREATE TABLE `tbl_user_password_reset_requests` (
  `uprr_user_id` int(11) NOT NULL,
  `uprr_token` varchar(255) NOT NULL,
  `uprr_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_refund_address`
--

CREATE TABLE `tbl_user_refund_address` (
  `ura_user_id` int(11) NOT NULL,
  `ura_name` varchar(255) NOT NULL,
  `ura_address_line_1` varchar(255) NOT NULL,
  `ura_address_line_2` varchar(255) NOT NULL,
  `ura_city` varchar(255) NOT NULL,
  `ura_state` int(1) NOT NULL,
  `ura_country` int(11) NOT NULL,
  `ura_zip` varchar(50) NOT NULL,
  `ura_phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_remember_me_tokens`
--

CREATE TABLE `tbl_user_remember_me_tokens` (
  `urt_user_id` int(11) NOT NULL,
  `urt_browser` text NOT NULL,
  `urt_token` varchar(255) NOT NULL,
  `urt_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_requests`
--

CREATE TABLE `tbl_user_requests` (
  `urequest_id` bigint(20) NOT NULL,
  `urequest_user_id` int(11) NOT NULL,
  `urequest_type` char(1) NOT NULL,
  `urequest_text` text NOT NULL,
  `urequest_date` date NOT NULL,
  `urequest_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_reward_points`
--

CREATE TABLE `tbl_user_reward_points` (
  `urp_reward_id` bigint(20) NOT NULL,
  `urp_user_id` int(11) NOT NULL,
  `urp_referrer_id` int(11) NOT NULL,
  `urp_points` int(11) NOT NULL,
  `urp_description` text NOT NULL,
  `urp_date_added` date NOT NULL,
  `urp_date_expiry` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_reward_point_breakup`
--

CREATE TABLE `tbl_user_reward_point_breakup` (
  `urpdetail_id` int(11) NOT NULL,
  `urpdetail_urp_reward_id` int(11) NOT NULL,
  `urpdetail_points` int(11) NOT NULL,
  `urpdetail_expiry` date NOT NULL,
  `urpdetail_used` tinyint(4) NOT NULL COMMENT '1=>used',
  `urpdetail_used_ref_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_supplier_form_fields`
--

CREATE TABLE `tbl_user_supplier_form_fields` (
  `sformfield_id` int(11) NOT NULL,
  `sformfield_type` varchar(255) NOT NULL,
  `sformfield_caption` varchar(255) NOT NULL,
  `sformfield_extra` text NOT NULL,
  `sformfield_required` tinyint(1) NOT NULL,
  `sformfield_order` int(11) NOT NULL,
  `sformfield_mandatory` tinyint(1) NOT NULL,
  `sformfield_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_supplier_form_fields`
--

INSERT INTO `tbl_user_supplier_form_fields` (`sformfield_id`, `sformfield_type`, `sformfield_caption`, `sformfield_extra`, `sformfield_required`, `sformfield_order`, `sformfield_mandatory`, `sformfield_is_active`) VALUES
(1, 'text', 'Business Name', '', 1, 1, 1, 1),
(2, 'text', 'Contact Person', '', 1, 2, 1, 1),
(3, 'text', 'Contact Number', '', 1, 3, 1, 1),
(4, 'textarea', 'Business Address', '', 1, 5, 0, 1),
(5, 'text', 'Business Type', 'Eg. Fashion, Computers & Automotive etc.', 1, 4, 0, 1),
(6, 'file', 'Business Proof', '', 1, 7, 0, 1),
(7, 'text', 'Service Tax Number', '', 0, 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_supplier_requests`
--

CREATE TABLE `tbl_user_supplier_requests` (
  `usuprequest_id` bigint(20) NOT NULL,
  `usuprequest_reference` varchar(50) NOT NULL,
  `usuprequest_user_id` bigint(20) NOT NULL,
  `usuprequest_date` datetime NOT NULL,
  `usuprequest_status` tinyint(1) NOT NULL,
  `usuprequest_comments` text NOT NULL,
  `usuprequest_attempts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_supplier_request_values`
--

CREATE TABLE `tbl_user_supplier_request_values` (
  `sfreqvalue_id` bigint(20) NOT NULL,
  `sfreqvalue_request_id` int(11) NOT NULL,
  `sfreqvalue_formfield_id` int(11) NOT NULL,
  `sfreqvalue_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_temp_token_requests`
--

CREATE TABLE `tbl_user_temp_token_requests` (
  `uttr_user_id` int(11) NOT NULL,
  `uttr_token` varchar(255) NOT NULL,
  `uttr_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_transactions`
--

CREATE TABLE `tbl_user_transactions` (
  `utxn_id` bigint(20) NOT NULL,
  `utxn_user_id` int(11) NOT NULL,
  `utxn_date` datetime NOT NULL,
  `utxn_credit` decimal(10,4) NOT NULL,
  `utxn_debit` decimal(10,4) NOT NULL,
  `utxn_comments` text NOT NULL,
  `utxn_status` tinyint(1) NOT NULL,
  `utxn_order_id` int(11) NOT NULL,
  `utxn_withdrawal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_withdrawal_requests`
--

CREATE TABLE `tbl_user_withdrawal_requests` (
  `withdrawal_id` bigint(20) NOT NULL,
  `withdrawal_user_id` int(11) NOT NULL,
  `withdrawal_amount` decimal(10,4) NOT NULL,
  `withdrawal_bank` varchar(255) NOT NULL,
  `withdrawal_account_holder_name` varchar(255) NOT NULL,
  `withdrawal_account_number` varchar(100) NOT NULL,
  `withdrawal_ifc_swift_code` varchar(100) NOT NULL,
  `withdrawal_bank_address` tinytext NOT NULL,
  `withdrawal_comments` text NOT NULL,
  `withdrawal_request_date` datetime NOT NULL,
  `withdrawal_status` tinyint(1) NOT NULL,
  `withdrawal_cancel_comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_zones`
--

CREATE TABLE `tbl_zones` (
  `zone_id` int(11) NOT NULL,
  `zone_name` varchar(100) NOT NULL DEFAULT '',
  `zone_description` text NOT NULL,
  `zone_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_zones`
--

INSERT INTO `tbl_zones` (`zone_id`, `zone_name`, `zone_description`, `zone_delete`) VALUES
(1, 'Zone - A', 'Zone - A', 0),
(2, 'Zone - B', 'Zone - B', 0),
(3, 'Zone - C', '', 0),
(4, 'Zone - D', '', 0),
(5, 't', 'tttttttttttttt', 1),
(6, 'test', 'test', 1),
(7, 'trest', 'test', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`);

--
-- Indexes for table `tbl_admin_permission_names`
--
ALTER TABLE `tbl_admin_permission_names`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `tbl_admin_remember_me_tokens`
--
ALTER TABLE `tbl_admin_remember_me_tokens`
  ADD PRIMARY KEY (`art_admin_id`);

--
-- Indexes for table `tbl_affiliates`
--
ALTER TABLE `tbl_affiliates`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `tbl_affiliates_remember_me_tokens`
--
ALTER TABLE `tbl_affiliates_remember_me_tokens`
  ADD PRIMARY KEY (`art_affiliate_id`);

--
-- Indexes for table `tbl_affiliate_commission_settings`
--
ALTER TABLE `tbl_affiliate_commission_settings`
  ADD UNIQUE KEY `commsetting_id` (`afcommsetting_id`);

--
-- Indexes for table `tbl_affiliate_login`
--
ALTER TABLE `tbl_affiliate_login`
  ADD PRIMARY KEY (`alogin_id`);

--
-- Indexes for table `tbl_affiliate_password_reset_requests`
--
ALTER TABLE `tbl_affiliate_password_reset_requests`
  ADD PRIMARY KEY (`aprr_affiliate_id`);

--
-- Indexes for table `tbl_affiliate_transactions`
--
ALTER TABLE `tbl_affiliate_transactions`
  ADD PRIMARY KEY (`atxn_id`);

--
-- Indexes for table `tbl_affiliate_withdrawal_requests`
--
ALTER TABLE `tbl_affiliate_withdrawal_requests`
  ADD PRIMARY KEY (`afwithdrawal_id`);

--
-- Indexes for table `tbl_attributes`
--
ALTER TABLE `tbl_attributes`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `tbl_attribute_groups`
--
ALTER TABLE `tbl_attribute_groups`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `tbl_banks`
--
ALTER TABLE `tbl_banks`
  ADD PRIMARY KEY (`bank_id`),
  ADD UNIQUE KEY `reportreason_id` (`bank_id`);

--
-- Indexes for table `tbl_banners`
--
ALTER TABLE `tbl_banners`
  ADD PRIMARY KEY (`banner_id`),
  ADD KEY `banner_position_id` (`banner_position`);

--
-- Indexes for table `tbl_blog_attached_files`
--
ALTER TABLE `tbl_blog_attached_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_blog_contributions`
--
ALTER TABLE `tbl_blog_contributions`
  ADD PRIMARY KEY (`contribution_id`);

--
-- Indexes for table `tbl_blog_meta_data`
--
ALTER TABLE `tbl_blog_meta_data`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `tbl_blog_post`
--
ALTER TABLE `tbl_blog_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_blog_post_categories`
--
ALTER TABLE `tbl_blog_post_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_blog_post_category_relation`
--
ALTER TABLE `tbl_blog_post_category_relation`
  ADD UNIQUE KEY `relation_post_id` (`relation_post_id`,`relation_category_id`);

--
-- Indexes for table `tbl_blog_post_comments`
--
ALTER TABLE `tbl_blog_post_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_post_id` (`comment_post_id`);

--
-- Indexes for table `tbl_blog_post_images`
--
ALTER TABLE `tbl_blog_post_images`
  ADD PRIMARY KEY (`post_image_id`);

--
-- Indexes for table `tbl_cancel_reasons`
--
ALTER TABLE `tbl_cancel_reasons`
  ADD PRIMARY KEY (`cancelreason_id`),
  ADD UNIQUE KEY `reportreason_id` (`cancelreason_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_category_filter`
--
ALTER TABLE `tbl_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `tbl_collections`
--
ALTER TABLE `tbl_collections`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indexes for table `tbl_commission_settings`
--
ALTER TABLE `tbl_commission_settings`
  ADD UNIQUE KEY `commsetting_id` (`commsetting_id`);

--
-- Indexes for table `tbl_configurations`
--
ALTER TABLE `tbl_configurations`
  ADD PRIMARY KEY (`conf_var`);

--
-- Indexes for table `tbl_content_pages`
--
ALTER TABLE `tbl_content_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `tbl_coupons`
--
ALTER TABLE `tbl_coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `tbl_coupons_history`
--
ALTER TABLE `tbl_coupons_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `tbl_cron_log`
--
ALTER TABLE `tbl_cron_log`
  ADD PRIMARY KEY (`cronlog_id`),
  ADD KEY `cronlog_cron_id` (`cronlog_cron_id`);

--
-- Indexes for table `tbl_cron_schedules`
--
ALTER TABLE `tbl_cron_schedules`
  ADD PRIMARY KEY (`cron_id`);

--
-- Indexes for table `tbl_currencies`
--
ALTER TABLE `tbl_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `tbl_customer_groups`
--
ALTER TABLE `tbl_customer_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `tbl_email_archives`
--
ALTER TABLE `tbl_email_archives`
  ADD PRIMARY KEY (`mailarchive_id`);

--
-- Indexes for table `tbl_email_templates`
--
ALTER TABLE `tbl_email_templates`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indexes for table `tbl_empty_cart_items`
--
ALTER TABLE `tbl_empty_cart_items`
  ADD PRIMARY KEY (`emptycartitem_id`);

--
-- Indexes for table `tbl_extra_pages`
--
ALTER TABLE `tbl_extra_pages`
  ADD UNIQUE KEY `epage_id` (`epage_id`);

--
-- Indexes for table `tbl_faqs`
--
ALTER TABLE `tbl_faqs`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `tbl_filters`
--
ALTER TABLE `tbl_filters`
  ADD PRIMARY KEY (`filter_id`),
  ADD UNIQUE KEY `filter_id` (`filter_id`);

--
-- Indexes for table `tbl_filter_groups`
--
ALTER TABLE `tbl_filter_groups`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `tbl_import_export_settings`
--
ALTER TABLE `tbl_import_export_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tbl_language_labels`
--
ALTER TABLE `tbl_language_labels`
  ADD PRIMARY KEY (`label_id`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_navigations`
--
ALTER TABLE `tbl_navigations`
  ADD PRIMARY KEY (`nav_id`);

--
-- Indexes for table `tbl_nav_links`
--
ALTER TABLE `tbl_nav_links`
  ADD PRIMARY KEY (`nl_id`);

--
-- Indexes for table `tbl_options`
--
ALTER TABLE `tbl_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `tbl_option_values`
--
ALTER TABLE `tbl_option_values`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_orders_status`
--
ALTER TABLE `tbl_orders_status`
  ADD UNIQUE KEY `orders_status_id` (`orders_status_id`);

--
-- Indexes for table `tbl_orders_status_history`
--
ALTER TABLE `tbl_orders_status_history`
  ADD PRIMARY KEY (`orders_status_history_id`);

--
-- Indexes for table `tbl_order_cancel_requests`
--
ALTER TABLE `tbl_order_cancel_requests`
  ADD PRIMARY KEY (`cancellation_request_id`),
  ADD KEY `return_user_id` (`cancellation_request_user_id`),
  ADD KEY `return_order` (`cancellation_request_order`);

--
-- Indexes for table `tbl_order_payments`
--
ALTER TABLE `tbl_order_payments`
  ADD PRIMARY KEY (`op_payment_id`),
  ADD KEY `op_order_id` (`op_order_id`),
  ADD KEY `op_gateway_txn_id` (`op_gateway_txn_id`);

--
-- Indexes for table `tbl_order_pp_adaptive_payments`
--
ALTER TABLE `tbl_order_pp_adaptive_payments`
  ADD PRIMARY KEY (`ppadappay_id`);

--
-- Indexes for table `tbl_order_pp_adaptive_payment_transactions`
--
ALTER TABLE `tbl_order_pp_adaptive_payment_transactions`
  ADD PRIMARY KEY (`ppaptrans_id`),
  ADD KEY `ppaptrans_order_id` (`ppaptrans_order_id`),
  ADD KEY `ppaptrans_ppadappay_id` (`ppaptrans_ppadappay_id`);

--
-- Indexes for table `tbl_order_products`
--
ALTER TABLE `tbl_order_products`
  ADD PRIMARY KEY (`opr_id`),
  ADD KEY `opr_order_id` (`opr_order_id`),
  ADD KEY `opr_order_id_2` (`opr_order_id`),
  ADD KEY `opr_product_id` (`opr_product_id`);

--
-- Indexes for table `tbl_order_product_files`
--
ALTER TABLE `tbl_order_product_files`
  ADD PRIMARY KEY (`opf_id`),
  ADD KEY `opf_opr_id` (`opf_opr_id`);

--
-- Indexes for table `tbl_order_product_options`
--
ALTER TABLE `tbl_order_product_options`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  ADD PRIMARY KEY (`pmethod_code`),
  ADD UNIQUE KEY `pmethod_id` (`pmethod_id`);

--
-- Indexes for table `tbl_payment_method_fields`
--
ALTER TABLE `tbl_payment_method_fields`
  ADD PRIMARY KEY (`pmf_id`),
  ADD UNIQUE KEY `pmf_id` (`pmf_id`);

--
-- Indexes for table `tbl_ppc_payment_methods`
--
ALTER TABLE `tbl_ppc_payment_methods`
  ADD PRIMARY KEY (`ppcpmethod_code`),
  ADD UNIQUE KEY `ppcpmethod_id` (`ppcpmethod_id`);

--
-- Indexes for table `tbl_ppc_payment_method_fields`
--
ALTER TABLE `tbl_ppc_payment_method_fields`
  ADD PRIMARY KEY (`ppcpmf_id`),
  ADD UNIQUE KEY `pmf_id` (`ppcpmf_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_category` (`prod_category`),
  ADD KEY `prod_brand` (`prod_brand`),
  ADD KEY `prod_shop` (`prod_shop`),
  ADD KEY `prod_added_by` (`prod_added_by`);

--
-- Indexes for table `tbl_products_browsing_history`
--
ALTER TABLE `tbl_products_browsing_history`
  ADD PRIMARY KEY (`pbhistory_sessionid`,`pbhistory_prod_id`),
  ADD UNIQUE KEY `pbhistory_id` (`pbhistory_id`),
  ADD KEY `pbhistory_prod_id` (`pbhistory_prod_id`);

--
-- Indexes for table `tbl_product_addons`
--
ALTER TABLE `tbl_product_addons`
  ADD PRIMARY KEY (`addon_source_id`,`addon_to_id`);

--
-- Indexes for table `tbl_product_attributes`
--
ALTER TABLE `tbl_product_attributes`
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product_brands`
--
ALTER TABLE `tbl_product_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_product_discounts`
--
ALTER TABLE `tbl_product_discounts`
  ADD PRIMARY KEY (`pdiscount_id`),
  ADD KEY `pdiscount_product_id` (`pdiscount_product_id`);

--
-- Indexes for table `tbl_product_files`
--
ALTER TABLE `tbl_product_files`
  ADD PRIMARY KEY (`pfile_id`),
  ADD KEY `file_product_id` (`pfile_product_id`);

--
-- Indexes for table `tbl_product_filter`
--
ALTER TABLE `tbl_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `tbl_product_groups`
--
ALTER TABLE `tbl_product_groups`
  ADD PRIMARY KEY (`pgroup_id`);

--
-- Indexes for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `image_prod_id` (`image_prod_id`);

--
-- Indexes for table `tbl_product_option`
--
ALTER TABLE `tbl_product_option`
  ADD PRIMARY KEY (`product_option_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product_option_value`
--
ALTER TABLE `tbl_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`),
  ADD KEY `product_option_id` (`product_option_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product_properties`
--
ALTER TABLE `tbl_product_properties`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `tbl_product_property_options`
--
ALTER TABLE `tbl_product_property_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `tbl_product_relations`
--
ALTER TABLE `tbl_product_relations`
  ADD UNIQUE KEY `relation_source_id_2` (`relation_source_id`,`relation_to_id`),
  ADD KEY `relation_source_id` (`relation_source_id`);

--
-- Indexes for table `tbl_product_shipping_rates`
--
ALTER TABLE `tbl_product_shipping_rates`
  ADD PRIMARY KEY (`pship_prod_id`,`pship_country`,`pship_company`,`pship_duration`),
  ADD UNIQUE KEY `pship_id` (`pship_id`),
  ADD KEY `pship_prod_id` (`pship_prod_id`);

--
-- Indexes for table `tbl_product_specials`
--
ALTER TABLE `tbl_product_specials`
  ADD PRIMARY KEY (`pspecial_id`),
  ADD KEY `pspecial_product_id` (`pspecial_product_id`);

--
-- Indexes for table `tbl_product_tags`
--
ALTER TABLE `tbl_product_tags`
  ADD PRIMARY KEY (`ptag_id`);

--
-- Indexes for table `tbl_product_temp_images`
--
ALTER TABLE `tbl_product_temp_images`
  ADD PRIMARY KEY (`image_id`),
  ADD UNIQUE KEY `image_prod_id_2` (`image_prod_id`,`image_file`),
  ADD KEY `image_prod_id` (`image_prod_id`);

--
-- Indexes for table `tbl_product_to_tags`
--
ALTER TABLE `tbl_product_to_tags`
  ADD PRIMARY KEY (`pt_product_id`,`pt_tag_id`);

--
-- Indexes for table `tbl_prod_details`
--
ALTER TABLE `tbl_prod_details`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `tbl_prod_refund_requests`
--
ALTER TABLE `tbl_prod_refund_requests`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `return_user_id` (`refund_user_id`),
  ADD KEY `return_prod_id` (`refund_prod_id`),
  ADD KEY `return_order` (`refund_order`);

--
-- Indexes for table `tbl_prod_refund_request_messages`
--
ALTER TABLE `tbl_prod_refund_request_messages`
  ADD PRIMARY KEY (`refmsg_id`);

--
-- Indexes for table `tbl_prod_reviews`
--
ALTER TABLE `tbl_prod_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_prod_id` (`review_prod_id`),
  ADD KEY `review_user_id` (`review_user_id`),
  ADD KEY `review_prod_id_2` (`review_prod_id`),
  ADD KEY `review_order` (`review_order`);

--
-- Indexes for table `tbl_promotions`
--
ALTER TABLE `tbl_promotions`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `tbl_promotions_charges`
--
ALTER TABLE `tbl_promotions_charges`
  ADD PRIMARY KEY (`pcharge_id`);

--
-- Indexes for table `tbl_promotions_clicks`
--
ALTER TABLE `tbl_promotions_clicks`
  ADD UNIQUE KEY `pbhistory_id` (`pclick_id`),
  ADD UNIQUE KEY `pclick_promotion_id` (`pclick_promotion_id`,`pclick_ip`,`pclick_session_id`);

--
-- Indexes for table `tbl_promotions_logs`
--
ALTER TABLE `tbl_promotions_logs`
  ADD UNIQUE KEY `lprom_id` (`lprom_id`,`lprom_date`);

--
-- Indexes for table `tbl_recharge_wallet_requests`
--
ALTER TABLE `tbl_recharge_wallet_requests`
  ADD PRIMARY KEY (`rwr_id`);

--
-- Indexes for table `tbl_report_reasons`
--
ALTER TABLE `tbl_report_reasons`
  ADD PRIMARY KEY (`reportreason_id`),
  ADD UNIQUE KEY `reportreason_id` (`reportreason_id`);

--
-- Indexes for table `tbl_return_reasons`
--
ALTER TABLE `tbl_return_reasons`
  ADD PRIMARY KEY (`returnreason_id`),
  ADD UNIQUE KEY `reportreason_id` (`returnreason_id`);

--
-- Indexes for table `tbl_search_items`
--
ALTER TABLE `tbl_search_items`
  ADD PRIMARY KEY (`searchitem_id`),
  ADD UNIQUE KEY `searchitem_keyword` (`searchitem_keyword`,`searchitem_date`);

--
-- Indexes for table `tbl_shipping_companies`
--
ALTER TABLE `tbl_shipping_companies`
  ADD PRIMARY KEY (`scompany_id`);

--
-- Indexes for table `tbl_shipping_durations`
--
ALTER TABLE `tbl_shipping_durations`
  ADD PRIMARY KEY (`sduration_id`);

--
-- Indexes for table `tbl_shops`
--
ALTER TABLE `tbl_shops`
  ADD PRIMARY KEY (`shop_user_id`),
  ADD UNIQUE KEY `shop_id` (`shop_id`);

--
-- Indexes for table `tbl_shop_reports`
--
ALTER TABLE `tbl_shop_reports`
  ADD PRIMARY KEY (`sreport_id`);

--
-- Indexes for table `tbl_slides`
--
ALTER TABLE `tbl_slides`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `tbl_smart_log_actions`
--
ALTER TABLE `tbl_smart_log_actions`
  ADD PRIMARY KEY (`slog_id`),
  ADD KEY `slog_record_id` (`slog_record_id`);

--
-- Indexes for table `tbl_smart_products_weightage`
--
ALTER TABLE `tbl_smart_products_weightage`
  ADD PRIMARY KEY (`spw_product_id`);

--
-- Indexes for table `tbl_smart_related_products`
--
ALTER TABLE `tbl_smart_related_products`
  ADD PRIMARY KEY (`tsrp_source_product_id`,`tsrp_related_product_id`),
  ADD KEY `tsrp_source_product_id` (`tsrp_source_product_id`),
  ADD KEY `tsrp_related_product_id` (`tsrp_related_product_id`);

--
-- Indexes for table `tbl_smart_user_activity_browsing`
--
ALTER TABLE `tbl_smart_user_activity_browsing`
  ADD PRIMARY KEY (`uab_user_id`,`uab_record_id`,`uab_record_type`),
  ADD UNIQUE KEY `uspw_id` (`uab_id`);

--
-- Indexes for table `tbl_social_platforms`
--
ALTER TABLE `tbl_social_platforms`
  ADD PRIMARY KEY (`splatform_id`);

--
-- Indexes for table `tbl_states`
--
ALTER TABLE `tbl_states`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `FK_state_1` (`country_id`);

--
-- Indexes for table `tbl_subscription_cart`
--
ALTER TABLE `tbl_subscription_cart`
  ADD PRIMARY KEY (`scart_user_id`);

--
-- Indexes for table `tbl_subscription_coupons`
--
ALTER TABLE `tbl_subscription_coupons`
  ADD PRIMARY KEY (`subscoupon_id`);

--
-- Indexes for table `tbl_subscription_coupons_history`
--
ALTER TABLE `tbl_subscription_coupons_history`
  ADD PRIMARY KEY (`subscouponhistory_id`);

--
-- Indexes for table `tbl_subscription_merchant_packages`
--
ALTER TABLE `tbl_subscription_merchant_packages`
  ADD PRIMARY KEY (`merchantpack_id`);

--
-- Indexes for table `tbl_subscription_merchant_package_orders`
--
ALTER TABLE `tbl_subscription_merchant_package_orders`
  ADD PRIMARY KEY (`mporder_id`),
  ADD KEY `mporder_id` (`mporder_id`,`mporder_user_id`);

--
-- Indexes for table `tbl_subscription_merchant_package_order_status_history`
--
ALTER TABLE `tbl_subscription_merchant_package_order_status_history`
  ADD PRIMARY KEY (`mpos_history_id`);

--
-- Indexes for table `tbl_subscription_merchant_package_transactions`
--
ALTER TABLE `tbl_subscription_merchant_package_transactions`
  ADD PRIMARY KEY (`mptran_id`);

--
-- Indexes for table `tbl_subscription_merchant_sub_packages`
--
ALTER TABLE `tbl_subscription_merchant_sub_packages`
  ADD PRIMARY KEY (`merchantsubpack_id`);

--
-- Indexes for table `tbl_subscription_order_status`
--
ALTER TABLE `tbl_subscription_order_status`
  ADD PRIMARY KEY (`sorder_status_id`);

--
-- Indexes for table `tbl_subscription_payment_gateway_responses`
--
ALTER TABLE `tbl_subscription_payment_gateway_responses`
  ADD PRIMARY KEY (`subgatewaytxn_id`);

--
-- Indexes for table `tbl_subscription_payment_methods`
--
ALTER TABLE `tbl_subscription_payment_methods`
  ADD PRIMARY KEY (`subscriptionpmethod_code`),
  ADD UNIQUE KEY `ppcpmethod_id` (`subscriptionpmethod_id`);

--
-- Indexes for table `tbl_subscription_payment_method_fields`
--
ALTER TABLE `tbl_subscription_payment_method_fields`
  ADD PRIMARY KEY (`subpmf_id`),
  ADD UNIQUE KEY `pmf_id` (`subpmf_id`);

--
-- Indexes for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `tbl_themes`
--
ALTER TABLE `tbl_themes`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `tbl_threads`
--
ALTER TABLE `tbl_threads`
  ADD PRIMARY KEY (`thread_id`);

--
-- Indexes for table `tbl_thread_messages`
--
ALTER TABLE `tbl_thread_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `tbl_url_alias`
--
ALTER TABLE `tbl_url_alias`
  ADD PRIMARY KEY (`url_alias_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_user_activities`
--
ALTER TABLE `tbl_user_activities`
  ADD PRIMARY KEY (`uact_to_user`,`uact_from_user`,`uact_prod_shop_record`,`uact_prod_shop_type`,`uact_action_performed`),
  ADD UNIQUE KEY `uact_id` (`uact_id`);

--
-- Indexes for table `tbl_user_address`
--
ALTER TABLE `tbl_user_address`
  ADD PRIMARY KEY (`ua_id`),
  ADD KEY `ua_user_id` (`ua_user_id`);

--
-- Indexes for table `tbl_user_bank_details`
--
ALTER TABLE `tbl_user_bank_details`
  ADD PRIMARY KEY (`ub_user_id`);

--
-- Indexes for table `tbl_user_cart`
--
ALTER TABLE `tbl_user_cart`
  ADD PRIMARY KEY (`cart_user_id`);

--
-- Indexes for table `tbl_user_email_verification_codes`
--
ALTER TABLE `tbl_user_email_verification_codes`
  ADD PRIMARY KEY (`uevc_user_id`);

--
-- Indexes for table `tbl_user_favourite_products`
--
ALTER TABLE `tbl_user_favourite_products`
  ADD PRIMARY KEY (`ufp_id`),
  ADD KEY `ufp_user_id` (`ufp_user_id`),
  ADD KEY `ufp_prod_id` (`ufp_prod_id`);

--
-- Indexes for table `tbl_user_favourite_shops`
--
ALTER TABLE `tbl_user_favourite_shops`
  ADD PRIMARY KEY (`ufs_id`),
  ADD KEY `ufs_user_id` (`ufs_user_id`),
  ADD KEY `ufs_shop_id` (`ufs_shop_id`);

--
-- Indexes for table `tbl_user_lists`
--
ALTER TABLE `tbl_user_lists`
  ADD PRIMARY KEY (`ulist_id`);

--
-- Indexes for table `tbl_user_list_products`
--
ALTER TABLE `tbl_user_list_products`
  ADD PRIMARY KEY (`ulp_id`);

--
-- Indexes for table `tbl_user_login`
--
ALTER TABLE `tbl_user_login`
  ADD PRIMARY KEY (`ulogin_id`);

--
-- Indexes for table `tbl_user_password_reset_requests`
--
ALTER TABLE `tbl_user_password_reset_requests`
  ADD PRIMARY KEY (`uprr_user_id`);

--
-- Indexes for table `tbl_user_refund_address`
--
ALTER TABLE `tbl_user_refund_address`
  ADD PRIMARY KEY (`ura_user_id`);

--
-- Indexes for table `tbl_user_remember_me_tokens`
--
ALTER TABLE `tbl_user_remember_me_tokens`
  ADD PRIMARY KEY (`urt_user_id`);

--
-- Indexes for table `tbl_user_requests`
--
ALTER TABLE `tbl_user_requests`
  ADD PRIMARY KEY (`urequest_id`);

--
-- Indexes for table `tbl_user_reward_points`
--
ALTER TABLE `tbl_user_reward_points`
  ADD PRIMARY KEY (`urp_reward_id`);

--
-- Indexes for table `tbl_user_reward_point_breakup`
--
ALTER TABLE `tbl_user_reward_point_breakup`
  ADD PRIMARY KEY (`urpdetail_id`),
  ADD KEY `urpdetail_urp_reward_id` (`urpdetail_urp_reward_id`);

--
-- Indexes for table `tbl_user_supplier_form_fields`
--
ALTER TABLE `tbl_user_supplier_form_fields`
  ADD PRIMARY KEY (`sformfield_id`);

--
-- Indexes for table `tbl_user_supplier_requests`
--
ALTER TABLE `tbl_user_supplier_requests`
  ADD PRIMARY KEY (`usuprequest_user_id`),
  ADD UNIQUE KEY `usuprequest_id` (`usuprequest_id`);

--
-- Indexes for table `tbl_user_supplier_request_values`
--
ALTER TABLE `tbl_user_supplier_request_values`
  ADD PRIMARY KEY (`sfreqvalue_id`);

--
-- Indexes for table `tbl_user_temp_token_requests`
--
ALTER TABLE `tbl_user_temp_token_requests`
  ADD PRIMARY KEY (`uttr_user_id`);

--
-- Indexes for table `tbl_user_transactions`
--
ALTER TABLE `tbl_user_transactions`
  ADD PRIMARY KEY (`utxn_id`);

--
-- Indexes for table `tbl_user_withdrawal_requests`
--
ALTER TABLE `tbl_user_withdrawal_requests`
  ADD PRIMARY KEY (`withdrawal_id`);

--
-- Indexes for table `tbl_zones`
--
ALTER TABLE `tbl_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_admin_permission_names`
--
ALTER TABLE `tbl_admin_permission_names`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `tbl_admin_remember_me_tokens`
--
ALTER TABLE `tbl_admin_remember_me_tokens`
  MODIFY `art_admin_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_affiliates`
--
ALTER TABLE `tbl_affiliates`
  MODIFY `affiliate_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_affiliates_remember_me_tokens`
--
ALTER TABLE `tbl_affiliates_remember_me_tokens`
  MODIFY `art_affiliate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_affiliate_commission_settings`
--
ALTER TABLE `tbl_affiliate_commission_settings`
  MODIFY `afcommsetting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_affiliate_login`
--
ALTER TABLE `tbl_affiliate_login`
  MODIFY `alogin_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_affiliate_password_reset_requests`
--
ALTER TABLE `tbl_affiliate_password_reset_requests`
  MODIFY `aprr_affiliate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_affiliate_transactions`
--
ALTER TABLE `tbl_affiliate_transactions`
  MODIFY `atxn_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_affiliate_withdrawal_requests`
--
ALTER TABLE `tbl_affiliate_withdrawal_requests`
  MODIFY `afwithdrawal_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_attributes`
--
ALTER TABLE `tbl_attributes`
  MODIFY `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_attribute_groups`
--
ALTER TABLE `tbl_attribute_groups`
  MODIFY `attribute_group_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_banks`
--
ALTER TABLE `tbl_banks`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_banners`
--
ALTER TABLE `tbl_banners`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tbl_blog_attached_files`
--
ALTER TABLE `tbl_blog_attached_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_blog_contributions`
--
ALTER TABLE `tbl_blog_contributions`
  MODIFY `contribution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_blog_meta_data`
--
ALTER TABLE `tbl_blog_meta_data`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_blog_post`
--
ALTER TABLE `tbl_blog_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_blog_post_categories`
--
ALTER TABLE `tbl_blog_post_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_blog_post_comments`
--
ALTER TABLE `tbl_blog_post_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_blog_post_images`
--
ALTER TABLE `tbl_blog_post_images`
  MODIFY `post_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_cancel_reasons`
--
ALTER TABLE `tbl_cancel_reasons`
  MODIFY `cancelreason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT for table `tbl_collections`
--
ALTER TABLE `tbl_collections`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_commission_settings`
--
ALTER TABLE `tbl_commission_settings`
  MODIFY `commsetting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_content_pages`
--
ALTER TABLE `tbl_content_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  MODIFY `country_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;
--
-- AUTO_INCREMENT for table `tbl_coupons`
--
ALTER TABLE `tbl_coupons`
  MODIFY `coupon_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_coupons_history`
--
ALTER TABLE `tbl_coupons_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_cron_log`
--
ALTER TABLE `tbl_cron_log`
  MODIFY `cronlog_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_cron_schedules`
--
ALTER TABLE `tbl_cron_schedules`
  MODIFY `cron_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_currencies`
--
ALTER TABLE `tbl_currencies`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_customer_groups`
--
ALTER TABLE `tbl_customer_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_email_archives`
--
ALTER TABLE `tbl_email_archives`
  MODIFY `mailarchive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_email_templates`
--
ALTER TABLE `tbl_email_templates`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `tbl_empty_cart_items`
--
ALTER TABLE `tbl_empty_cart_items`
  MODIFY `emptycartitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_extra_pages`
--
ALTER TABLE `tbl_extra_pages`
  MODIFY `epage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_faqs`
--
ALTER TABLE `tbl_faqs`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_filters`
--
ALTER TABLE `tbl_filters`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_filter_groups`
--
ALTER TABLE `tbl_filter_groups`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_import_export_settings`
--
ALTER TABLE `tbl_import_export_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_language_labels`
--
ALTER TABLE `tbl_language_labels`
  MODIFY `label_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2069;
--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_navigations`
--
ALTER TABLE `tbl_navigations`
  MODIFY `nav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_nav_links`
--
ALTER TABLE `tbl_nav_links`
  MODIFY `nl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tbl_options`
--
ALTER TABLE `tbl_options`
  MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_option_values`
--
ALTER TABLE `tbl_option_values`
  MODIFY `option_value_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_orders_status`
--
ALTER TABLE `tbl_orders_status`
  MODIFY `orders_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_orders_status_history`
--
ALTER TABLE `tbl_orders_status_history`
  MODIFY `orders_status_history_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_cancel_requests`
--
ALTER TABLE `tbl_order_cancel_requests`
  MODIFY `cancellation_request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_payments`
--
ALTER TABLE `tbl_order_payments`
  MODIFY `op_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_pp_adaptive_payments`
--
ALTER TABLE `tbl_order_pp_adaptive_payments`
  MODIFY `ppadappay_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_pp_adaptive_payment_transactions`
--
ALTER TABLE `tbl_order_pp_adaptive_payment_transactions`
  MODIFY `ppaptrans_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_products`
--
ALTER TABLE `tbl_order_products`
  MODIFY `opr_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_product_files`
--
ALTER TABLE `tbl_order_product_files`
  MODIFY `opf_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_order_product_options`
--
ALTER TABLE `tbl_order_product_options`
  MODIFY `order_option_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  MODIFY `pmethod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_payment_method_fields`
--
ALTER TABLE `tbl_payment_method_fields`
  MODIFY `pmf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_ppc_payment_methods`
--
ALTER TABLE `tbl_ppc_payment_methods`
  MODIFY `ppcpmethod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_ppc_payment_method_fields`
--
ALTER TABLE `tbl_ppc_payment_method_fields`
  MODIFY `ppcpmf_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `prod_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_products_browsing_history`
--
ALTER TABLE `tbl_products_browsing_history`
  MODIFY `pbhistory_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_brands`
--
ALTER TABLE `tbl_product_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_product_discounts`
--
ALTER TABLE `tbl_product_discounts`
  MODIFY `pdiscount_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_files`
--
ALTER TABLE `tbl_product_files`
  MODIFY `pfile_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_groups`
--
ALTER TABLE `tbl_product_groups`
  MODIFY `pgroup_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  MODIFY `image_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_option`
--
ALTER TABLE `tbl_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_option_value`
--
ALTER TABLE `tbl_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_properties`
--
ALTER TABLE `tbl_product_properties`
  MODIFY `property_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_property_options`
--
ALTER TABLE `tbl_product_property_options`
  MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_shipping_rates`
--
ALTER TABLE `tbl_product_shipping_rates`
  MODIFY `pship_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_specials`
--
ALTER TABLE `tbl_product_specials`
  MODIFY `pspecial_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_tags`
--
ALTER TABLE `tbl_product_tags`
  MODIFY `ptag_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_product_temp_images`
--
ALTER TABLE `tbl_product_temp_images`
  MODIFY `image_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_prod_refund_requests`
--
ALTER TABLE `tbl_prod_refund_requests`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_prod_refund_request_messages`
--
ALTER TABLE `tbl_prod_refund_request_messages`
  MODIFY `refmsg_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_prod_reviews`
--
ALTER TABLE `tbl_prod_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_promotions`
--
ALTER TABLE `tbl_promotions`
  MODIFY `promotion_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_promotions_charges`
--
ALTER TABLE `tbl_promotions_charges`
  MODIFY `pcharge_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_promotions_clicks`
--
ALTER TABLE `tbl_promotions_clicks`
  MODIFY `pclick_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_promotions_logs`
--
ALTER TABLE `tbl_promotions_logs`
  MODIFY `lprom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_recharge_wallet_requests`
--
ALTER TABLE `tbl_recharge_wallet_requests`
  MODIFY `rwr_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_report_reasons`
--
ALTER TABLE `tbl_report_reasons`
  MODIFY `reportreason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_return_reasons`
--
ALTER TABLE `tbl_return_reasons`
  MODIFY `returnreason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_search_items`
--
ALTER TABLE `tbl_search_items`
  MODIFY `searchitem_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_shipping_companies`
--
ALTER TABLE `tbl_shipping_companies`
  MODIFY `scompany_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_shipping_durations`
--
ALTER TABLE `tbl_shipping_durations`
  MODIFY `sduration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_shops`
--
ALTER TABLE `tbl_shops`
  MODIFY `shop_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_shop_reports`
--
ALTER TABLE `tbl_shop_reports`
  MODIFY `sreport_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_slides`
--
ALTER TABLE `tbl_slides`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_smart_log_actions`
--
ALTER TABLE `tbl_smart_log_actions`
  MODIFY `slog_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_smart_user_activity_browsing`
--
ALTER TABLE `tbl_smart_user_activity_browsing`
  MODIFY `uab_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_social_platforms`
--
ALTER TABLE `tbl_social_platforms`
  MODIFY `splatform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_states`
--
ALTER TABLE `tbl_states`
  MODIFY `state_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3212;
--
-- AUTO_INCREMENT for table `tbl_subscription_coupons`
--
ALTER TABLE `tbl_subscription_coupons`
  MODIFY `subscoupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_subscription_coupons_history`
--
ALTER TABLE `tbl_subscription_coupons_history`
  MODIFY `subscouponhistory_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_subscription_merchant_packages`
--
ALTER TABLE `tbl_subscription_merchant_packages`
  MODIFY `merchantpack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_subscription_merchant_package_orders`
--
ALTER TABLE `tbl_subscription_merchant_package_orders`
  MODIFY `mporder_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_subscription_merchant_package_order_status_history`
--
ALTER TABLE `tbl_subscription_merchant_package_order_status_history`
  MODIFY `mpos_history_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_subscription_merchant_package_transactions`
--
ALTER TABLE `tbl_subscription_merchant_package_transactions`
  MODIFY `mptran_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_subscription_merchant_sub_packages`
--
ALTER TABLE `tbl_subscription_merchant_sub_packages`
  MODIFY `merchantsubpack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_subscription_order_status`
--
ALTER TABLE `tbl_subscription_order_status`
  MODIFY `sorder_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_subscription_payment_gateway_responses`
--
ALTER TABLE `tbl_subscription_payment_gateway_responses`
  MODIFY `subgatewaytxn_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_subscription_payment_methods`
--
ALTER TABLE `tbl_subscription_payment_methods`
  MODIFY `subscriptionpmethod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_subscription_payment_method_fields`
--
ALTER TABLE `tbl_subscription_payment_method_fields`
  MODIFY `subpmf_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_themes`
--
ALTER TABLE `tbl_themes`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_threads`
--
ALTER TABLE `tbl_threads`
  MODIFY `thread_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_thread_messages`
--
ALTER TABLE `tbl_thread_messages`
  MODIFY `message_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_url_alias`
--
ALTER TABLE `tbl_url_alias`
  MODIFY `url_alias_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_activities`
--
ALTER TABLE `tbl_user_activities`
  MODIFY `uact_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_address`
--
ALTER TABLE `tbl_user_address`
  MODIFY `ua_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_favourite_products`
--
ALTER TABLE `tbl_user_favourite_products`
  MODIFY `ufp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_favourite_shops`
--
ALTER TABLE `tbl_user_favourite_shops`
  MODIFY `ufs_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_lists`
--
ALTER TABLE `tbl_user_lists`
  MODIFY `ulist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_list_products`
--
ALTER TABLE `tbl_user_list_products`
  MODIFY `ulp_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_login`
--
ALTER TABLE `tbl_user_login`
  MODIFY `ulogin_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_password_reset_requests`
--
ALTER TABLE `tbl_user_password_reset_requests`
  MODIFY `uprr_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_remember_me_tokens`
--
ALTER TABLE `tbl_user_remember_me_tokens`
  MODIFY `urt_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_requests`
--
ALTER TABLE `tbl_user_requests`
  MODIFY `urequest_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_reward_points`
--
ALTER TABLE `tbl_user_reward_points`
  MODIFY `urp_reward_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_reward_point_breakup`
--
ALTER TABLE `tbl_user_reward_point_breakup`
  MODIFY `urpdetail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_supplier_form_fields`
--
ALTER TABLE `tbl_user_supplier_form_fields`
  MODIFY `sformfield_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_user_supplier_requests`
--
ALTER TABLE `tbl_user_supplier_requests`
  MODIFY `usuprequest_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_supplier_request_values`
--
ALTER TABLE `tbl_user_supplier_request_values`
  MODIFY `sfreqvalue_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_temp_token_requests`
--
ALTER TABLE `tbl_user_temp_token_requests`
  MODIFY `uttr_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_transactions`
--
ALTER TABLE `tbl_user_transactions`
  MODIFY `utxn_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_withdrawal_requests`
--
ALTER TABLE `tbl_user_withdrawal_requests`
  MODIFY `withdrawal_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_zones`
--
ALTER TABLE `tbl_zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
