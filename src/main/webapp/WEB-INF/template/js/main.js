function loadScript(src, callback) {
    'use strict';
    var s,
        r,
        t;
    r = false;
    s = document.createElement('script');
    s.type = 'text/javascript';
    s.src = src;
    s.onload = s.onreadystatechange = function() {
        ////console.log( this.readyState ); //uncomment this line to see which ready states are called.
        if (!r && (!this.readyState || this.readyState == 'complete')) {
            r = true;
            callback();
        }
    };
    t = document.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s, t);
}

function initialize_map() {
    'use strict';

    loadScript('js/infobox.js', after_load);
}

function after_load() {
    'use strict';
    initialize_new();
}

//**************************************** Parallax script ****************************************** //



function parallax() {
    'use strict';
    var $window = $(window);
    $('.b-parallax[data-type="background"]').each(function() {
        var $bgobj = $(this);
        $(window).scroll(function() {
            var yPos = -($window.scrollTop() / $bgobj.data('speed'));
            var coords = '50% ' + yPos + 'px';
            $bgobj.css({
                backgroundPosition: coords
            });
        });
    });
}

//**************************************** lazyLoadImages ****************************************** //

function lazyLoadImages() {
    'use strict';
    var images = document.querySelectorAll(".lazy[data-src]"),
        item;
    // load images that have entered the viewport

    [].forEach.call(images, function(item) {
            if (item.getBoundingClientRect().top > 0) { //alert(1);

                //$(this).
                var image = item.getAttribute("data-src"),
                    img = jQuery('<img />');
                img.bind('load', function() {
                    jQuery(item).find(".b-placeholder").addClass('b-placeholder--fadeout');
                });
                img.attr('src', image);
                jQuery(item).css("background-image", "url(" + image + ")")

                item.removeAttribute("data-src");
            }
        })
        // if all the images are loaded, stop calling the handler
    if (images.length == 0) {
        window.removeEventListener("DOMContentLoaded", lazyLoadImages);
        window.removeEventListener("load", lazyLoadImages);
        window.removeEventListener("resize", lazyLoadImages);
        window.removeEventListener("scroll", lazyLoadImages);
    }
}


//****************************** Tooltip plugin activate ******************************//
function tooltip() {
    'use strict';
    jQuery('[data-toggle="tooltip"]').tooltip()
}

//****************************** Button up ******************************//
function buttonUp() {
    'use strict';
    var inputVal = $('.searchbox-input').val();
    inputVal = jQuery.trim(inputVal).length;
    if (inputVal !== 0) {
        jQuery('.searchbox-icon').css('display', 'none');
    } else {
        jQuery('.searchbox-input').val('');
        jQuery('.searchbox-icon').css('display', 'block');
    }
}

//****************************** Lazy load ******************************//
window.addEventListener("DOMContentLoaded", lazyLoadImages);
window.addEventListener("load", lazyLoadImages);
window.addEventListener("resize", lazyLoadImages);
window.addEventListener("scroll", lazyLoadImages);


(function($) {
    $(document).ready(function() {
        'use strict';

        $('.jquery_popup').popup({
            content: $('.b-jquery-popup')
        });

        $('html').removeClass('no-js');

        /*ajax subscribe*/
        jQuery(document).on("click", '.b-gadget__subscribe__button', function(e) {
            e.preventDefault();
            var email = jQuery(".b-gadget__subscribe__field");
            email.removeClass('error');
            var thisbtn = jQuery(this);


            if (isValidEmailAddress(email.val())) {
                thisbtn.prop('disabled', true);

                jQuery.ajax({
                    url: nightcity_obj.ajaxurl,
                    type: 'POST',
                    data: "action=nightcity_mailchimp_send&email=" + email.val(),
                    success: function(date) {
                        jQuery('#subscribe_mini_form').append("<div class=\"alert alert-success fade in\">" +
                            "<button class=\"close\" data-dismiss=\"alert\" type=\"button\">&times;</button><strong>" +
                            "" + date + "" +
                            "</strong></div>");
                        jQuery('#subscribe_mini_form')[0].reset();
                        thisbtn.prop('disabled', false);
                    }

                });
            } else {
                email.addClass('error');

            }
        });

        //****************************** Ion range slider plugin activate ******************************//
        jQuery('.example_class').ionRangeSlider({
            type: 'double',
            min: 0,
            max: 750,
            from: 150,
            to: 600
        });

        //****************************** Script for animate.css ******************************//
        $.fn.extend({
            animateCss: function(animationName) {
                var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
                $(this).addClass('animated ' + animationName).one(animationEnd, function() {
                    $(this).removeClass('animated ' + animationName);
                });
            }
        });


        //****************************** Simple popup plugin activate ******************************//
        $('.html_popup').popup({
            content: '<div class="b-sm-post__popup"> <div class="b-sm-post__popup__title">Send</div> <div class="b-sm-post__popup__row"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAA10lEQVRIx2OwDp9LU8QwasHQtsA3bWn/vMPbD1w7ce4eEO07dnPdjkvUscAmYm7XrINPn79++eotGqKOBZMXHcM0mmoWxBSvefHyDQ0tWLnlArKJl6492rjr8orN5yGIChZcvfkEbvqB47dsI+dRORU9f4EIn+7Zh6ifTJHDp336gVELgKhl6v59R2/CEbIFF68+QpbafeQGWpwTZcHcVadwpXo0dOHqQ3J8QLwFm/dcoa0FwCKEHAvqJuwBOg2OkE08deE+slR6zcbRfDBqwagFoxYMQgsAyzTUjcGzuMMAAAAASUVORK5CYII=" alt="facebook"> Facebook </div> <div class="b-sm-post__popup__row"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAABcElEQVRIx2PQWfWQpohh1IJRC0YtwG2B7cbHuKTM1z1ecefzx59///77f+Xdz7SDL/VWP8w6/Cpw5zMSLDjw9FvXhXeY4kCzzr3+8R8JAK35/OsvUL3NhsckWPDw82+g5iW3PhmteYQsXnD09X8MALTj6rufFSffkGDBsRffIZqBNpWfeGMAs2bu9Y//sYFKbKbjsyD3yCtk/e9//N368EvPxfd7n3zDaoHF+sekWdB78f3Jl9//Ewd+/v1Hcio68Ozbf6LBjfc/SbYgeu+LX8C4Iw7Mu/GRnIwGTOCPv/wmaDrQFVhzAGELso+8uvORsDeA0U5mUaG/+uH+pwRi4tvvf17bnpJfFgGTf+eFd6de/cBqOtBzhcdeU1TYAQuGHHBAYU2apSdek1nYOW1+Muvax91Pvr798Qer24FZxH/HM4pKU6sNj1vPvQMWGMCCDB4gwGJj3b0vSQdeUrk+MFn7CGgfWqk3WqONWjB8LAAAEp6ym91eJw0AAAAASUVORK5CYII=" alt="twitter"> Twitter</div><div class="b-sm-post__popup__row"><img src="data:image/png;base64,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" alt="google+">Google+</div><div class="b-sm-post__popup__row"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAQAAABKfvVzAAAAoklEQVR4Ad2QMQ6CMBhG/8QVb4CXkHMY8CTi8M4hnkQOopeQxTLK2gT7Lzbkj2lHA29ovuQ9IJW1PBxxzAlGaoQgK2ldcTHQ2TD8VJ/Uei4DoaDDG9lzoUBs0FMiVDwW+p09wo7eBIGJlk2gZUL3mxO6z7pN8H1jhVDSc7NftIHi6fSfA1uuYc2pQBlo7K3ZwLDuYMzSXzGocRn6IQaZ/GnwAWkF9f1nWgYGAAAAAElFTkSuQmCC" alt="e-mail">via E-mail</div><div class="b-sm-post__popup__share-link">Share link</div><div class="b-sm-post__popup__link">https://g.co/kgs/PuDmtc</div></div>',
            type: 'html'
        });

        if ($("div").is(".b-map-menu")) {
            $(".b-footer").hide(0);
        } else {
            $(".b-footer").show(0);
        }




        var submitIcon = $('.searchbox-icon');
        var inputBox = $('.searchbox-input');
        var searchBox = $('.searchbox');
        var isOpen = false;

        jQuery(document).on("click", '.searchbox-icon', function(e) {
            if (isOpen == false) {
                searchBox.addClass('searchbox-open');
                inputBox.focus();
                isOpen = true;
            } else {
                searchBox.removeClass('searchbox-open');
                inputBox.focusout();
                isOpen = false;
            }
        });

        jQuery(document).on("mouseup", submitIcon, function() {
            return false;
        });

        jQuery(document).on("mouseup", searchBox, function() {
            return false;
        });

        jQuery(document).on("mouseup", searchBox, function() {
            return false;
        });

        if ($(window).width() > 992) {
            $('.fadein').delay(2000).queue(function(next) {
                $(this).addClass('active');
                next();
            });
        }

        jQuery(document).on("click", '.b-nav-toggle', function(e) {
            var bNav = $('.b-nav');
            var iconToggle = $(this).find('.fa');
            if ($(this).hasClass('closed')) {
                bNav.slideDown('fast');
                $(this).removeClass('closed').addClass('opened');
                iconToggle.removeClass('fa-chevron-down').addClass('fa-chevron-up');
            } else if ($(this).hasClass('opened')) {
                bNav.slideUp('fast');
                $(this).removeClass('opened').addClass('closed');
                iconToggle.removeClass('fa-chevron-up').addClass('fa-chevron-down');
            }
        })

        $('.b-nav>ul>li.menu-item-has-children>a').append('<i class="fa fa-angle-down"></i>');

        jQuery(document).on('click', '.b-view-btn__grid', function(e) {
            $('.b-place-list--list').removeClass('opened').addClass('closed');
            $('.b-place-list--grid').removeClass('closed').addClass('opened');
            $(window).trigger('resize');
        });

        jQuery(document).on('click', '.b-view-btn__list', function(e) {
            $('.b-place-list--grid').removeClass('opened').addClass('closed');
            $('.b-place-list--list').removeClass('closed').addClass('opened');
            $(window).trigger('resize');
        });

        //------------------------------- index js -----------------------------//

        $('.b-slider').addClass('visible');

        //chosen-select init

        $(".chosen-select").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });


        //********************************************** Stars script **************************************** //
        var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
        var isSafari = /Safari/.test(navigator.userAgent) && /Apple Computer/.test(navigator.vendor);
        if (isChrome || isSafari) {
            for (var e = 0; 400 > e; e++) {
                var f = document.createElement("div");
                f.className = "star";
                $(".stars").append(f);
                var g = (.4 * Math.random() + .1).toFixed(3),
                    h = 500 + 300 * Math.random();
                $(f).css("transform-origin", "0 0 " + h + "px"), $(f).css("transform", " translate3d(0,0,-" + h + "px) rotateY(" + 360 * Math.random() + "deg) rotateX(" + -50 * Math.random() + "deg) scale(" + g + "," + g + ")");
            }
        }
        //****************************** Form styler plugin activate ******************************//
        //$('input, select').styler();
        //****************************** owlCarousel plugin activate ******************************//
        $(".owl-carousel-1").owlCarousel({
            loop: true,
            margin: 30,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1,
                    nav: true
                },
                600: {
                    items: 2,
                    nav: true
                },
                1000: {
                    items: 3,
                    nav: true,
                    loop: false
                }
            }
        });
        $(".owl-carousel-2").owlCarousel({
            loop: true,
            margin: 30,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1,
                    nav: true
                },
                600: {
                    items: 1,
                    nav: true
                },
                1000: {
                    items: 2,
                    nav: true,
                    loop: false
                }
            }
        });
        tooltip();

        $(document).on("click", ".jquery_popup", function() {
            setTimeout(function() {
                $(".popup .chosen-select-2").chosen({
                    disable_search_threshold: 10,
                    no_results_text: "Oops, nothing found!",
                    width: "100%"
                });
            }, 50);
        });

        //------------------------------- blog js -----------------------------//

        //****************************** Masonry plugin activate ******************************//
        $('.b-grid').masonry({
            // options
            // set itemSelector so .grid-sizer is not used in layout
            itemSelector: '.b-grid-item',
            // gutter: 10,
            // use element for option
            percentPosition: true
        });
        $('.html_popup').popup({
            content: '<div class="b-sm-post__popup"> <div class="b-sm-post__popup__title">Send</div> <div class="b-sm-post__popup__row"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAA10lEQVRIx2OwDp9LU8QwasHQtsA3bWn/vMPbD1w7ce4eEO07dnPdjkvUscAmYm7XrINPn79++eotGqKOBZMXHcM0mmoWxBSvefHyDQ0tWLnlArKJl6492rjr8orN5yGIChZcvfkEbvqB47dsI+dRORU9f4EIn+7Zh6ifTJHDp336gVELgKhl6v59R2/CEbIFF68+QpbafeQGWpwTZcHcVadwpXo0dOHqQ3J8QLwFm/dcoa0FwCKEHAvqJuwBOg2OkE08deE+slR6zcbRfDBqwagFoxYMQgsAyzTUjcGzuMMAAAAASUVORK5CYII=" alt="facebook"> Facebook </div> <div class="b-sm-post__popup__row"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAABcElEQVRIx2PQWfWQpohh1IJRC0YtwG2B7cbHuKTM1z1ecefzx59///77f+Xdz7SDL/VWP8w6/Cpw5zMSLDjw9FvXhXeY4kCzzr3+8R8JAK35/OsvUL3NhsckWPDw82+g5iW3PhmteYQsXnD09X8MALTj6rufFSffkGDBsRffIZqBNpWfeGMAs2bu9Y//sYFKbKbjsyD3yCtk/e9//N368EvPxfd7n3zDaoHF+sekWdB78f3Jl9//Ewd+/v1Hcio68Ozbf6LBjfc/SbYgeu+LX8C4Iw7Mu/GRnIwGTOCPv/wmaDrQFVhzAGELso+8uvORsDeA0U5mUaG/+uH+pwRi4tvvf17bnpJfFgGTf+eFd6de/cBqOtBzhcdeU1TYAQuGHHBAYU2apSdek1nYOW1+Muvax91Pvr798Qer24FZxH/HM4pKU6sNj1vPvQMWGMCCDB4gwGJj3b0vSQdeUrk+MFn7CGgfWqk3WqONWjB8LAAAEp6ym91eJw0AAAAASUVORK5CYII=" alt="twitter"> Twitter</div><div class="b-sm-post__popup__row"><img src="data:image/png;base64,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" alt="google+">Google+</div><div class="b-sm-post__popup__row"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAQAAABKfvVzAAAAoklEQVR4Ad2QMQ6CMBhG/8QVb4CXkHMY8CTi8M4hnkQOopeQxTLK2gT7Lzbkj2lHA29ovuQ9IJW1PBxxzAlGaoQgK2ldcTHQ2TD8VJ/Uei4DoaDDG9lzoUBs0FMiVDwW+p09wo7eBIGJlk2gZUL3mxO6z7pN8H1jhVDSc7NftIHi6fSfA1uuYc2pQBlo7K3ZwLDuYMzSXzGocRn6IQaZ/GnwAWkF9f1nWgYGAAAAAElFTkSuQmCC" alt="e-mail">via E-mail</div><div class="b-sm-post__popup__share-link">Share link</div><div class="b-sm-post__popup__link">https://g.co/kgs/PuDmtc</div></div>',
            type: 'html'
        });


        //------------------------------- events, places js -----------------------------//

                setTimeout(function() {
                    $('.b-place-list').addClass('visible');
                }, 500);

                if($('#gmap_canvas').length > 0) {
                    initialize_map();
                }
                
                //b-hide-filters

                jQuery(document).on('click', '.b-hide-filters', function() {
                    var filterBtn = jQuery('.b-hide-filters');
                    var menuForm = jQuery('.b-slide-menu__form');
                    if (menuForm.hasClass('opened')) {
                        menuForm.removeClass('opened').addClass('closed');
                        filterBtn.text('Show filters');
                    } else if (menuForm.hasClass('closed')) {
                        menuForm.removeClass('closed').addClass('opened');
                        filterBtn.text('Hide filters');
                    }
                    jQuery('.b-slide-menu__form').slideToggle('medium');
                });

                //****************************** Ion range slider plugin activate ******************************//

                $('.example_class').ionRangeSlider({
                    type: 'double',
                    min: 0,
                    max: 750,
                    from: 150,
                    to: 590
                });

                // init Masonry
                if($(window).width() > 992) {
                    var $grid = $('.b-place-list').masonry({
                        itemSelector: '.b-grid-item',
                        percentPosition: true,
                        gutter: 20
                    });
                    // layout Isotope after each image loads
                    $grid.imagesLoaded().progress(function() {
                        $grid.masonry();
                        $(window).resize();
                    });
                }

                //custom-scroll init

                $('.custom-scroll').customScrollbar({
                    updateOnWindowResize: true
                });

                //tooltip init

                tooltip();

                jQuery(document).on("click", ".jquery_popup", function() {
                    setTimeout(function() {
                        $(".popup .chosen-select-2").chosen({
                            disable_search_threshold: 10,
                            no_results_text: "Oops, nothing found!",
                            width: "100%"
                        });
                    }, 50);
                });

                //****************************** Slide menu on map pages ******************************//
                jQuery(document).on('click', '.b-slide-menu__toggle', function() {
                    var slideMenu = jQuery('.b-slide-menu');
                    if (slideMenu.hasClass('opened')) {
                        slideMenu.removeClass('opened').addClass('closed');
                        jQuery(this).find(jQuery('.fa-caret-right')).removeClass('hidden');
                        jQuery(this).find(jQuery('.fa-caret-left')).addClass('hidden');
                        slideMenu.removeClass('oopeen').addClass('closseed');
                    } else if (slideMenu.hasClass('closed')) {
                        slideMenu.removeClass('closed').addClass('opened');
                        jQuery(this).find(jQuery('.fa-caret-left')).removeClass('hidden');
                        jQuery(this).find(jQuery('.fa-caret-right')).addClass('hidden');
                        slideMenu.removeClass('closseed').addClass('oopeen');
                    }
                });

                var hellopreloader = document.getElementById("hellopreloader_preload");

                function fadeOutnojquery(el) {
                    el.style.opacity = 1;
                    var interhellopreloader = setInterval(function() {
                        el.style.opacity = el.style.opacity - 0.05;
                        if (el.style.opacity <= 0.05) {
                            clearInterval(interhellopreloader);
                            hellopreloader.style.display = "none";
                        }
                    }, 16);
                }
                setTimeout(function() {
                    if($('#hellopreloader').length > 0) {
                        fadeOutnojquery(hellopreloader);
                    }
                }, 1500);

            //------------------------------- gallery js -----------------------------//

            $(document).on('click', '.btn-show', function (){
                $('.b-gallery-filter').addClass('visible');
            });

            $(document).on('click', '.close-filter', function (){
                $('.b-gallery-filter').removeClass('visible');
            });


            if($('#jssor_1').length > 0) {
                jQuery(function() {
                    var jssor_1_SlideshowTransitions = [{
                        $Duration: 1200,
                        x: 0.3,
                        $During: {
                            $Left: [0.3, 0.7]
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: -0.3,
                        $SlideOut: true,
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: -0.3,
                        $During: {
                            $Left: [0.3, 0.7]
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: 0.3,
                        $SlideOut: true,
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: 0.3,
                        $During: {
                            $Top: [0.3, 0.7]
                        },
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: -0.3,
                        $SlideOut: true,
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: -0.3,
                        $During: {
                            $Top: [0.3, 0.7]
                        },
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: 0.3,
                        $SlideOut: true,
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: 0.3,
                        $Cols: 2,
                        $During: {
                            $Left: [0.3, 0.7]
                        },
                        $ChessMode: {
                            $Column: 3
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: 0.3,
                        $Cols: 2,
                        $SlideOut: true,
                        $ChessMode: {
                            $Column: 3
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: 0.3,
                        $Rows: 2,
                        $During: {
                            $Top: [0.3, 0.7]
                        },
                        $ChessMode: {
                            $Row: 12
                        },
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: 0.3,
                        $Rows: 2,
                        $SlideOut: true,
                        $ChessMode: {
                            $Row: 12
                        },
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: 0.3,
                        $Cols: 2,
                        $During: {
                            $Top: [0.3, 0.7]
                        },
                        $ChessMode: {
                            $Column: 12
                        },
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        y: -0.3,
                        $Cols: 2,
                        $SlideOut: true,
                        $ChessMode: {
                            $Column: 12
                        },
                        $Easing: {
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: 0.3,
                        $Rows: 2,
                        $During: {
                            $Left: [0.3, 0.7]
                        },
                        $ChessMode: {
                            $Row: 3
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: -0.3,
                        $Rows: 2,
                        $SlideOut: true,
                        $ChessMode: {
                            $Row: 3
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: 0.3,
                        y: 0.3,
                        $Cols: 2,
                        $Rows: 2,
                        $During: {
                            $Left: [0.3, 0.7],
                            $Top: [0.3, 0.7]
                        },
                        $ChessMode: {
                            $Column: 3,
                            $Row: 12
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        x: 0.3,
                        y: 0.3,
                        $Cols: 2,
                        $Rows: 2,
                        $During: {
                            $Left: [0.3, 0.7],
                            $Top: [0.3, 0.7]
                        },
                        $SlideOut: true,
                        $ChessMode: {
                            $Column: 3,
                            $Row: 12
                        },
                        $Easing: {
                            $Left: $Jease$.$InCubic,
                            $Top: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        $Delay: 20,
                        $Clip: 3,
                        $Assembly: 260,
                        $Easing: {
                            $Clip: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        $Delay: 20,
                        $Clip: 3,
                        $SlideOut: true,
                        $Assembly: 260,
                        $Easing: {
                            $Clip: $Jease$.$OutCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        $Delay: 20,
                        $Clip: 12,
                        $Assembly: 260,
                        $Easing: {
                            $Clip: $Jease$.$InCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }, {
                        $Duration: 1200,
                        $Delay: 20,
                        $Clip: 12,
                        $SlideOut: true,
                        $Assembly: 260,
                        $Easing: {
                            $Clip: $Jease$.$OutCubic,
                            $Opacity: $Jease$.$Linear
                        },
                        $Opacity: 2
                    }];
                    var jssor_1_options = {
                        $AutoPlay: true,
                        $SlideshowOptions: {
                            $Class: $JssorSlideshowRunner$,
                            $Transitions: jssor_1_SlideshowTransitions,
                            $TransitionsOrder: 1
                        },
                        $ArrowNavigatorOptions: {
                            $Class: $JssorArrowNavigator$
                        },
                        $ThumbnailNavigatorOptions: {
                            $Class: $JssorThumbnailNavigator$,
                            $Cols: 6,
                            $SpacingX: 30,
                            $SpacingY: 30,
                            $Align: 360
                        }
                    };
                    var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
                    //responsive code begin
                    //you can remove responsive code if you don't want the slider scales while window resizing
                    function ScaleSlider() {
                        var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                        if (refSize) {
                            refSize = Math.min(refSize, 800);
                            jssor_1_slider.$ScaleWidth(refSize);
                        } else {
                            window.setTimeout(ScaleSlider, 30);
                        }
                    }
                    ScaleSlider();
                    $(window).bind("load", ScaleSlider);
                    $(window).bind("resize", ScaleSlider);
                    $(window).bind("orientationchange", ScaleSlider);
                    // responsive code end
                });
            }

            //------------------------------- single event js -----------------------------//

                if ($('.b-event-counter__item').hasClass('f-time')) {
                    var TimeObj = document.getElementsByClassName('time');
                    var oneDay = 24 * 60 * 60 * 1000;
                    var firstDate = new Date("Nov 2, 2016 11:14:00");
                    var secondDate = new Date();
                    var days = 135;
                    var hrs = (days - Math.floor(days)) * 24;
                    var min = (hrs - Math.floor(hrs)) * 60;
                    TimeObj[0].innerHTML = Math.floor(days);
                    TimeObj[1].innerHTML = Math.floor(hrs);
                    TimeObj[2].innerHTML = Math.floor(min);
                    TimeObj[3].innerHTML = Math.floor((min - Math.floor(min)) * 60);
                    var i = setInterval(function() {
                        n()
                    }, 1000);

                    function TimeInc(d, x) {
                        TimeObj[d].innerHTML = x;
                        TimeObj[d - 1].innerHTML = Number(TimeObj[d - 1].innerHTML) - 1;
                    }

                    function n() {
                        TimeObj[3].innerHTML = Number(TimeObj[3].innerHTML) - 1;
                        if (TimeObj[3].innerHTML == -1) {
                            TimeInc(3, 59)
                            if (TimeObj[2].innerHTML == -1) {
                                TimeInc(2, 59)
                                if (TimeObj[1].innerHTML == -1) {
                                    TimeInc(1, 23)
                                }
                            }
                        }
                    }
                }

                $(document).on('click', '.b-nav li a', function(e) {
                    clearInterval(i);
                });

                $(document).on('click', '.b-pic--event a', function(e) {
                    clearInterval(i);
                });

                $('.b-slider').addClass('visible');



                //****************************** Stick counter to top on the event page ******************************//

                if ($('.b-event-counter').length > 0) {
                    var counterTop = $(document).find($('.b-event-counter'));
                    var counterOffset = counterTop.offset();
                    $(document).on("scroll", function() {
                        if ($(document).scrollTop() > (counterOffset.top)) {
                            counterTop.addClass("b-event-counter--fixed");
                        } else {
                            counterTop.removeClass("b-event-counter--fixed");
                        }
                    });
                }

                $(".owl-carousel-4").owlCarousel({
                    loop: true,
                    margin: 30,
                    responsiveClass: true,
                    responsive: {
                        0: {
                            items: 1,
                            nav: true
                        },
                        600: {
                            items: 3,
                            nav: true
                        },
                        1000: {
                            items: 4,
                            nav: true
                        }
                    }
                });
                //****************************** Lightcase plugin activate ******************************//
                $('a[data-rel^=lightcase]').lightcase();
                $('a[data-rel="lightcase:myCollection:slideshow"]').lightcase({
                    showSequenceInfo: false,
                    transition: 'scrollHorizontal'
                });
                $('a[data-rel="lightcase:myCollection"]').lightcase({
                    showSequenceInfo: false
                });
                $('#example1').lightcase({
                    transition: 'none'
                });

                //****************************** Tabs script activate ******************************//
                if($('#scheduleTabs').length > 0) {
                    var myTabs = tabs({
                        el: '#scheduleTabs',
                        tabNavigationLinks: '.b-schedule-tabs__list a',
                        tabContentContainers: '.b-schedule-tabs__cont'
                    });

                    myTabs.init();
                }

                //***************************** Google tabs **************************************//

                $(document).on("click", '.google_place ul li a', function(e) {
                    e.preventDefault();
                    var item = $(this).closest('.tabs_controls_item'),
                        contentItem = $('.tabs_item'),
                        itemPosition = item.index();
                    contentItem.eq(itemPosition).addClass('active').siblings().removeClass('active');
                    $(this).addClass('active');
                    $(this).parent().siblings().children('a').removeClass('active');

                });

                jQuery(document).on('click', '.google_view', function() {
                    jQuery('.google_view iframe').css("pointer-events", "auto");
                });

                $(window).scroll(function() {
                    $('.google_view iframe').css("pointer-events", "none");
                });

                jQuery(document).on('click', '.b-map__wrapper', function() {
                    $('#map_place').css("pointer-events", "auto");
                });

                $(window).scroll(function() {
                    $('#map_place').css("pointer-events", "none");
                });

                $(document).on("click", ".jquery_popup", function() {
                    setTimeout(function() {
                        $(".popup .chosen-select-2").chosen({
                            disable_search_threshold: 10,
                            no_results_text: "Oops, nothing found!",
                            width: "100%"
                        });
                    }, 50);
                });

                if($('.b-placeholder').hasClass('place-hold')){
                    setTimeout(function() {
                        var header = $('.place-hold');
                        var range = 400;

                        $(window).on('scroll', function() {
                            $('.place-hold').css("transition", "none");
                            var scrollTop = $(this).scrollTop();
                            var offset = header.offset().top;
                            var height = header.outerHeight();
                            offset = offset + height / 1.5;
                            var calc = (scrollTop - offset + range) / range;

                            header.css({
                                'opacity': calc
                            });

                            if (calc > '1') {
                                header.css({
                                    'opacity': 1
                                });
                            } else if (calc < '0') {
                                header.css({
                                    'opacity': 0
                                });
                            }

                        });
                    }, 1000);
                }

                //------------------------------- single place, single event js -----------------------------//

                $(".owl-carousel-1").owlCarousel({
                    loop: true,
                    margin: 30,
                    responsiveClass: true,
                    responsive: {
                        0: {
                            items: 1,
                            nav: true
                        },
                        600: {
                            items: 2,
                            nav: true
                        },
                        1000: {
                            items: 3,
                            nav: true,
                            loop: false
                        }
                    }
                });

                if($('#map_place').length > 0) {
                    var mapOptions_place = {
                        scrollwheel: true,
                        zoom: 14,
                        center: new google.maps.LatLng(43.118593, 131.88088400000004),
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        mapTypeControl: false,
                        mapTypeControlOptions: {
                            style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                            position: google.maps.ControlPosition.BOTTOM_CENTER
                        },
                        panControl: false,
                        panControlOptions: {
                            position: google.maps.ControlPosition.TOP_RIGHT
                        },
                        zoomControl: false,
                        zoomControlOptions: {
                            style: google.maps.ZoomControlStyle.LARGE,
                            position: google.maps.ControlPosition.TOP_RIGHT
                        },
                        scaleControl: false,
                        scaleControlOptions: {
                            position: google.maps.ControlPosition.TOP_LEFT
                        },
                        streetViewControl: false,
                        streetViewControlOptions: {
                            position: google.maps.ControlPosition.LEFT_TOP
                        },
                        styles: [{
                            "featureType": "poi",
                            "stylers": [{
                                "visibility": "off"
                            }]
                        }, {
                            "stylers": [{
                                "saturation": -70
                            }, {
                                "lightness": 37
                            }, {
                                "gamma": 1.15
                            }]
                        }, {
                            "elementType": "labels",
                            "stylers": [{
                                "gamma": 0.26
                            }, {
                                "visibility": "off"
                            }]
                        }, {
                            "featureType": "road",
                            "stylers": [{
                                "lightness": 0
                            }, {
                                "saturation": 0
                            }, {
                                "hue": "#ffffff"
                            }, {
                                "gamma": 0
                            }]
                        }, {
                            "featureType": "road",
                            "elementType": "labels.text.stroke",
                            "stylers": [{
                                "visibility": "off"
                            }]
                        }, {
                            "featureType": "road.arterial",
                            "elementType": "mycity",
                            "stylers": [{
                                "lightness": 20
                            }]
                        }, {
                            "featureType": "road.highway",
                            "elementType": "mycity",
                            "stylers": [{
                                "lightness": 50
                            }, {
                                "saturation": 0
                            }, {
                                "hue": "#ffffff"
                            }]
                        }, {
                            "featureType": "administrative.province",
                            "stylers": [{
                                "visibility": "on"
                            }, {
                                "lightness": -50
                            }]
                        }, {
                            "featureType": "administrative.province",
                            "elementType": "labels.text.stroke",
                            "stylers": [{
                                "visibility": "off"
                            }]
                        }, {
                            "featureType": "administrative.province",
                            "elementType": "labels.text",
                            "stylers": [{
                                "lightness": 20
                            }]
                        }],
                        styles: MyCity_map_init_obj.global_map_styles
                    };
                    //map
                    var map_place = new google.maps.Map(document.getElementById("map_place"), mapOptions_place);
                    //positions
                    var point_place = new google.maps.LatLng(43.118593, 131.88088400000004);
                    //markers

                    var marker_place = new google.maps.Marker({
                        position: point_place,
                        map: map_place,
                        category: '',
                        icon: 'img/map/marker-1.png',
                        title: "point_place"
                    });
                }

            //------------------------------- single post js -----------------------------//

            $(".owl-carousel-3").owlCarousel({
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 1,
                        nav: true
                    },
                    600: {
                        items: 1,
                        nav: true
                    },
                    1000: {
                        items: 1,
                        nav: true
                    }
                }
            });

    });
})(jQuery);