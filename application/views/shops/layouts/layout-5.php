<style>


    .card {
        padding-top: 20px;
        margin: 10px 0 20px 0;
        background-color: rgba(214, 224, 226, 0.2);
        border-top-width: 0;
        border-bottom-width: 2px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card .card-heading {
        padding: 0 20px;
        margin: 0;
    }

    .card .card-heading.simple {
        font-size: 20px;
        font-weight: 300;
        color: #777;
        border-bottom: 1px solid #e5e5e5;
    }

    .card .card-heading.image img {
        display: inline-block;
        width: 46px;
        height: 46px;
        margin-right: 15px;
        vertical-align: top;
        border: 0;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
    }

    .card .card-heading.image .card-heading-header {
        display: inline-block;
        vertical-align: top;
    }

    .card .card-heading.image .card-heading-header h3 {
        margin: 0;
        font-size: 14px;
        line-height: 16px;
        color: #262626;
    }

    .card .card-heading.image .card-heading-header span {
        font-size: 12px;
        color: #999999;
    }

    .card .card-body {
        padding: 0 20px;
        margin-top: 20px;
    }

    .card .card-media {
        padding: 0 20px;
        margin: 0 -14px;
    }

    .card .card-media img {
        max-width: 100%;
        max-height: 100%;
    }

    .card .card-actions {
        min-height: 30px;
        padding: 0 20px 20px 20px;
        margin: 20px 0 0 0;
    }

    .card .card-comments {
        padding: 20px;
        margin: 0;
        background-color: #f8f8f8;
    }

    .card .card-comments .comments-collapse-toggle {
        padding: 0;
        margin: 0 20px 12px 20px;
    }

    .card .card-comments .comments-collapse-toggle a,
    .card .card-comments .comments-collapse-toggle span {
        padding-right: 5px;
        overflow: hidden;
        font-size: 12px;
        color: #999;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .card-comments .media-heading {
        font-size: 13px;
        font-weight: bold;
    }

    .card.people {
        position: relative;
        display: inline-block;
        width: 170px;
        height: 300px;
        padding-top: 0;
        margin-left: 20px;
        overflow: hidden;
        vertical-align: top;
    }

    .card.people:first-child {
        margin-left: 0;
    }

    .card.people .card-top {
        position: absolute;
        top: 0;
        left: 0;
        display: inline-block;
        width: 170px;
        height: 150px;
        background-color: #ffffff;
    }

    .card.people .card-top.green {
        background-color: #53a93f;
    }

    .card.people .card-top.blue {
        background-color: #427fed;
    }

    .card.people .card-info {
        position: absolute;
        top: 150px;
        display: inline-block;
        width: 100%;
        height: 101px;
        overflow: hidden;
        background: #ffffff;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card.people .card-info .title {
        display: block;
        margin: 8px 14px 0 14px;
        overflow: hidden;
        font-size: 16px;
        font-weight: bold;
        line-height: 18px;
        color: #404040;
    }

    .card.people .card-info .desc {
        display: block;
        margin: 8px 14px 0 14px;
        overflow: hidden;
        font-size: 12px;
        line-height: 16px;
        color: #737373;
        text-overflow: ellipsis;
    }

    .card.people .card-bottom {
        position: absolute;
        bottom: 0;
        left: 0;
        display: inline-block;
        width: 100%;
        padding: 10px 20px;
        line-height: 29px;
        text-align: center;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .card.hovercard {
        position: relative;
        padding-top: 0;
        overflow: hidden;
        text-align: center;
        background-color: rgba(214, 224, 226, 0.2);
    }

    .card.hovercard .avatar {
        position: relative;
        top: -50px;
        margin-bottom: -50px;
    }

    .card.hovercard .avatar img {
        width: 100px;
        height: 100px;
        max-width: 100px;
        max-height: 100px;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        border: 5px solid rgba(255,255,255,0.5);
    }

    .card.hovercard .info {
        padding: 4px 8px 10px;
    }

    .card.hovercard .info .title {
        margin-bottom: 4px;
        font-size: 24px;
        line-height: 1;
        color: #262626;
        vertical-align: middle;
    }

    .card.hovercard .info .desc {
        overflow: hidden;
        font-size: 12px;
        line-height: 20px;
        color: #737373;
        text-overflow: ellipsis;
    }

    .card.hovercard .bottom {
        padding: 0 20px;
        margin-bottom: 17px;
    }

</style>

<div class="container">
    <div class="row">
        <div class="">

            <div class="card hovercard">
                <div class="cardheader">
                    <img alt="<?php echo $shop["shop_name"]?>" src="<?php echo Utilities::generateUrl('image','shop_banner',array($shop["shop_banner"],'LARGE'))?>">
                </div>
                <div class="avatar" style="float:none; margin: 0 auto; width: 150px; height: 150px; background-color: rgba(255, 255, 255, 0.4); top: -75px">
                    <img style="max-height: 100%; max-width: 100%; height: 100%; width: 100%" alt="<?php echo $shop["shop_name"]?>" src="<?php echo Utilities::generateUrl('image','shop_logo',array($shop["shop_logo"],'THUMB'))?>">
                </div>
                <?php if (Settings::getSetting("CONF_ALLOW_REVIEWS")): ?>
                    <div class="rating" style="margin-top: 10px; color: black">
                        <ul class="rating">
                            <?php for($j=1;$j<=5;$j++){ ?>
                                <li class="<?php echo $j<=round($shop["shop_rating"])?"active":"in-active" ?>">
                                    <svg xml:space="preserve" enable-background="new 0 0 70 70" viewBox="0 0 70 70" height="18px" width="18px" y="0px" x="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" id="Layer_1" version="1.1">
                                <g>
                                    <path d="M51,42l5.6,24.6L35,53.6l-21.6,13L19,42L0,25.4l25.1-2.2L35,0l9.9,23.2L70,25.4L51,42z M51,42"
                                          fill="<?php echo $j<=round($shop["shop_rating"])?"#ff3a59":"#474747" ?>" />
                                </g>
                            </svg>
                                </li>
                            <?php } ?>
                        </ul>
                        <p><?php echo $shop["shop_rating"] ?> <?php echo Utilities::getLabel('M_out_of')?> 5</p>
                    </div>
                <?php endif; ?>
                <div class="info" style="top: -90px; position: relative">
                    <div class="title">
                        <a target="_blank" href="#"><?php echo $shop["shop_name"]?></a>
                    </div>
                    <div class="brand-name">
                        <span>(<?php echo Utilities::getLabel('M_Opened_on')?> <?php echo Utilities::formatDate($shop["shop_date"])?>)</span>
                    </div>
                </div>
                <div class="shop-right" style="top: -50px; position: relative">
                    <div class="links-row">
                        <a id="shop_<?php echo $shop["shop_id"]?>" class="btn primary-btn favShop <? if ($shop["favorite"]): echo 'active'; endif;?>"><i><img src="<?php echo CONF_WEBROOT_URL?>images/heart-white.png"  alt="<?php echo Utilities::getLabel('M_Favorite_Shop')?>"/></i><?php echo Utilities::getLabel('M_Favorite_Shop')?></a> <a href="<?php echo Utilities::generateUrl('shops','send_message',array($shop["shop_id"]))?>" class="btn secondary-btn"><i><img src="<?php echo CONF_WEBROOT_URL?>images/email-white.png"   alt="<?php echo Utilities::getLabel('M_Send_Message')?>"/></i><?php echo Utilities::getLabel('M_Send_Message')?></a> </div>
                </div>
                <div style="margin: 10px; position: relative; top: -40px">
                    <ul>
                        <span title="ShareThis" class='st_sharethis_large' displayText='ShareThis'></span>
                        <span title="Facebook" class='st_facebook_large' displayText='Facebook'></span>
                        <span title="Tweet" class='st_twitter_large' displayText='Tweet'></span>
                        <span title="Pinterest" class='st_pinterest_large' displayText='Pinterest'></span>
                        <span title="WhatsApp" class='st_whatsapp_large' displayText='WhatsApp'></span>
                        <span title="Email" class='st_email_large' displayText='Email'></span>
                    </ul>
                    <div class="short-links" style="color: black; float:none; margin-top: 10px">
                        <ul>
                            <li> <a style="color: black" href="<?php echo Utilities::generateUrl('shops', 'report',array($shop["shop_id"]))?>"> Report this shop to Sell-SA</a> </li>
                            <li> <a style="color: black;" href="<?php echo Utilities::generateUrl('shops','policies',array($shop["shop_id"]))?>"> <?php echo Utilities::getLabel('M_Policies')?> </a> </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>