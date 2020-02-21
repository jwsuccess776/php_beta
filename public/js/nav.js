$(document).ready(function() {
    $(".navchild > a").hover(function() {
        var s = $("body");
        return $(window).width() > 1025 && ($(this).parents().addClass("active"), s.addClass("nav_show")), !1
    }, function() {
       
    }), $(".navchild").hover(function() {
        
    }, function() {
        var s = $("body");
        return $(window).width() > 1025 && ($(this).removeClass("active"), s.removeClass("nav_show")), !1
    }), $(".link__mobilenav").click(function() {
        if ($(this).hasClass("active")) return $(this).removeClass("active"), $(this).siblings(".navigations > li .subnav").slideUp(), !1;
        $(".link__mobilenav").removeClass("active"), $(this).addClass("active"), $(window).width() < 1025 && ($(".navigations > li .subnav").slideUp(), $(this).siblings(".navigations > li .subnav").slideDown())
    }), $(".navs_toggle").click(function() {
        $(this).toggleClass("active");
        var s = $("body");
        return s.hasClass("toggled_left") ? s.removeClass("toggled_left") : s.addClass("toggled_left"), !1
    }), $("body").click(function() {
        $("body").hasClass("toggled_left") && ($(".navs_toggle").removeClass("active"), $("body").removeClass("toggled_left"))
    }), $(".mobile__overlay").click(function() {
        $("body").hasClass("toggled_left") && ($(".navs_toggle").removeClass("active"), $("body").removeClass("toggled_left"))
    }), $(".navpanel,.section_primary").click(function(s) {
        s.stopPropagation()
    }), $(window).width() < 1025 && $(".gridspanel_title").click(function() {
        if ($(this).hasClass("active")) return $(this).removeClass("active"), $(this).siblings(".gridspanel_content").slideUp(), !1;
        $(".gridspanel_title").removeClass("active"), $(this).addClass("active"), $(".gridspanel_content").slideUp(), $(this).siblings(".gridspanel_content").slideDown()
    })
});