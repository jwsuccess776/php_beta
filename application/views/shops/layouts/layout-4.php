<style>
    .shop-header .img:after {
        background-color: transparent !important;
    }
</style>

<div class="shop-header" style="margin-top: 10px">
    <div class="profile-head clearfix">
<!--        <div class="fixed-container">-->
<!--            <div class="fl" style="margin: 8px 15px;">-->
<!--                <div class="about-me">-->
                    <div class="col-md-12" style="text-align: center">

<!--                        <div class="">-->
                            <div class="avatar" style="width: 100px; height: 100px; margin: 0 auto; float: none">
                                <img src="<?php echo Utilities::generateUrl('image', 'shop_logo', array($shop["shop_logo"], 'THUMB')) ?>"
                                     alt="<?php echo $shop["shop_name"] ?>"/>
                            </div>
<!--                        </div>-->
<!--                        <div>-->
                            <div class="name" style="text-transform: capitalize;display: grid; font-size: 20px">
                                <?php echo $shop["shop_name"]; ?>
                                <span>
                            <?php if (Settings::getSetting("CONF_ALLOW_REVIEWS")): ?>
                                <div class="rating">
                        <ul class="rating">
                            <?php for ($j = 1; $j <= 5; $j++) { ?>
                                <li class="<?php echo $j <= round($shop["shop_rating"]) ? "active" : "in-active" ?>">
                                <svg xml:space="preserve" enable-background="new 0 0 70 70" viewBox="0 0 70 70"
                                     height="18px" width="18px" y="0px" x="0px"
                                     xmlns:xlink="http://www.w3.org/1999/xlink"
                                     xmlns="http://www.w3.org/2000/svg" id="Layer_1" version="1.1">
                                    <g>
                                        <path d="M51,42l5.6,24.6L35,53.6l-21.6,13L19,42L0,25.4l25.1-2.2L35,0l9.9,23.2L70,25.4L51,42z M51,42"
                                              fill="<?php echo $j <= round($shop["shop_rating"]) ? "#ff3a59" : "#474747" ?>"/>
                                    </g>
                                </svg>
                            </li>
                            <?php } ?>
                        </ul>
                    <p style="color: black"><?php echo $shop["shop_rating"] ?> <?php echo Utilities::getLabel('M_out_of') ?> 5</p>
                </div>
                            <?php endif; ?>


                        </span>
                                <span style="font-size: 13px">(<?php echo Utilities::getLabel('M_Opened_on') ?> <?php echo Utilities::formatDate($shop["shop_date"]) ?>)</span>
                            </div>
<!--                        </div>-->
                        <div class="fr" style="float:none;">
                            <div class="items-list" style="margin: 10px">
                                <ul>
                                    <li>
                                        <a id="shop_<?php echo $shop["shop_id"] ?>"
                                           class="btn primary-btn favShop <? if ($shop["favorite"]): echo 'active'; endif; ?>"><i><img
                                                        src="<?php echo CONF_WEBROOT_URL ?>images/heart-white.png"
                                                        alt="<?php echo Utilities::getLabel('M_Favorite_Shop') ?>"/></i><?php echo Utilities::getLabel('M_Favorite_Shop') ?>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<?php echo Utilities::generateUrl('shops', 'send_message', array($shop["shop_id"])) ?>"
                                           class="btn secondary-btn"><i><img
                                                        src="<?php echo CONF_WEBROOT_URL ?>images/email-white.png"
                                                        alt="<?php echo Utilities::getLabel('M_Send_Message') ?>"/></i><?php echo Utilities::getLabel('M_Send_Message') ?>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
<!--                </div>-->
<!--            </div>-->
        </div>
<!--    </div>-->

    <div style="text-align: center">
        <div class="social-list" style="float: none; text-align: center">
            <ul>
                <span title="ShareThis" class='st_sharethis_large' displayText='ShareThis'></span>
                <span title="Facebook" class='st_facebook_large' displayText='Facebook'></span>
                <span title="Tweet" class='st_twitter_large' displayText='Tweet'></span>
                <span title="Pinterest" class='st_pinterest_large' displayText='Pinterest'></span>
                <span title="WhatsApp" class='st_whatsapp_large' displayText='WhatsApp'></span>
                <span title="Email" class='st_email_large' displayText='Email'></span>
            </ul>
        </div>

        <div class="short-links" style="float:none;">
            <ul>
                <li><a href="<?php echo Utilities::generateUrl('shops', 'report', array($shop["shop_id"])) ?>"> Report this
                        shop to Sell-SA</a></li>
                <li>
                    <a href="<?php echo Utilities::generateUrl('shops', 'policies', array($shop["shop_id"])) ?>"> <?php echo Utilities::getLabel('M_Policies') ?> </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="img">
        <img style="background-color: transparent !important;"
             src="<?php echo Utilities::generateUrl('image', 'shop_banner', array($shop["shop_banner"], 'LARGE')) ?>"
             alt="<?php echo $shop["shop_name"] ?>"/>
    </div>
</div>