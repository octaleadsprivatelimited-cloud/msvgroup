/*===================================== 
APPLE.COM HEADER FUNCTIONALITY
======================================*/

(function() {
    'use strict';
    
    // Initialize on DOM ready
    jQuery(document).ready(function() {
        initAppleHeader();
    });
    
    function initAppleHeader() {
        // Scroll effect
        handleScroll();
        jQuery(window).off('scroll.appleHeader').on('scroll.appleHeader', handleScroll);
        
        // Mobile menu initialization
        if (jQuery(window).width() <= 991) {
            initMobileMenu();
        }
        
        // Handle window resize - use namespace to prevent duplicates
        jQuery(window).off('resize.appleHeader').on('resize.appleHeader', function() {
            if (jQuery(window).width() <= 991) {
                // Only initialize if not already initialized
                if (!mobileMenuInitialized) {
                    initMobileMenu();
                }
            } else {
                // Reset flag when switching to desktop
                mobileMenuInitialized = false;
                closeMobileMenu();
            }
        });
    }
    
    // Scroll effect for header background
    function handleScroll() {
        var scrollTop = jQuery(window).scrollTop();
        var header = jQuery('.apple-header');
        
        if (scrollTop > 50) {
            header.addClass('is-scrolled');
        } else {
            header.removeClass('is-scrolled');
        }
    }
    
    // Mobile menu functionality
    var mobileMenuInitialized = false;
    var isMenuOpen = false;
    
    function initMobileMenu() {
        // Prevent multiple initializations
        if (mobileMenuInitialized) {
            return;
        }
        mobileMenuInitialized = true;
        
        var header = jQuery('.apple-header').first(); // Get only first header
        if (header.length === 0) return;
        
        // CRITICAL: Remove ALL duplicate menus and overlays FIRST
        var allMenus = jQuery('.mobile-nav');
        if (allMenus.length > 1) {
            allMenus.not(':first').remove();
        }
        
        var allOverlays = jQuery('.mobile-overlay');
        if (allOverlays.length > 1) {
            allOverlays.not(':first').remove();
        }
        
        var allCloseButtons = jQuery('.mobile-close');
        if (allCloseButtons.length > 1) {
            allCloseButtons.not(':first').remove();
        }
        
        var toggle = header.find('.mobile-toggle').first();
        var mobileNav = header.find('.mobile-nav').first();
        var overlay = header.find('.mobile-overlay').first();
        var closeBtn = header.find('.mobile-close').first();
        var body = jQuery('body');
        
        // Reset menu state
        isMenuOpen = false;
        
        // Ensure close button exists
        if (closeBtn.length === 0 && mobileNav.length > 0) {
            mobileNav.prepend('<button class="mobile-close" type="button"></button>');
            closeBtn = mobileNav.find('.mobile-close').first();
        }
        
        // Only proceed if elements exist
        if (toggle.length === 0 || mobileNav.length === 0 || overlay.length === 0) {
            mobileMenuInitialized = false;
            return;
        }
        
        // Mark items with submenus
        mobileNav.find('li').each(function() {
            if (jQuery(this).find('.sub-menu').length > 0) {
                jQuery(this).addClass('has-submenu');
            }
        });
        
        // Toggle menu - use namespace to prevent duplicates
        toggle.off('click.mobileToggle').on('click.mobileToggle', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            if (isMenuOpen) {
                closeMenu();
            } else {
                openMenu();
            }
        });
        
        // Close on overlay click - use namespace
        overlay.off('click.mobileOverlay').on('click.mobileOverlay', function(e) {
            e.preventDefault();
            closeMenu();
        });
        
        // Close button - use unique namespace
        closeBtn.off('click.mobileClose').on('click.mobileClose', function(e) {
            e.preventDefault();
            e.stopPropagation();
            closeMenu();
        });
        
        // Handle submenu toggles
        mobileNav.off('click', 'li.has-submenu > a').on('click', 'li.has-submenu > a', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            var $li = jQuery(this).closest('li');
            var isActive = $li.hasClass('active');
            
            // Close other dropdowns
            mobileNav.find('li').not($li).removeClass('active');
            
            // Toggle current dropdown
            if (isActive) {
                $li.removeClass('active');
            } else {
                $li.addClass('active');
            }
            
            return false;
        });
        
        // Close on escape key
        jQuery(document).off('keydown.mobileMenu').on('keydown.mobileMenu', function(e) {
            if (e.key === 'Escape' && isMenuOpen) {
                closeMenu();
            }
        });
        
        // Prevent submenu link clicks from closing menu
        mobileNav.find('.sub-menu li a').on('click', function(e) {
            e.stopPropagation();
        });
        
        function openMenu() {
            // Prevent opening if already open
            if (isMenuOpen) {
                return;
            }
            
            isMenuOpen = true;
            toggle.addClass('active');
            mobileNav.addClass('show');
            overlay.addClass('show');
            body.addClass('menu-open');
            
            // Prevent iOS bounce scroll
            var scrollTop = jQuery(window).scrollTop();
            body.css('top', -scrollTop + 'px');
        }
        
        function closeMenu() {
            // Prevent closing if already closed
            if (!isMenuOpen) {
                return;
            }
            
            isMenuOpen = false;
            toggle.removeClass('active');
            mobileNav.removeClass('show');
            overlay.removeClass('show');
            
            // Restore scroll position
            var scrollTop = parseInt(body.css('top')) || 0;
            body.removeClass('menu-open').css('top', '');
            jQuery(window).scrollTop(-scrollTop);
            
            // Close all dropdowns
            mobileNav.find('li').removeClass('active');
        }
    }
    
    // Close mobile menu (public function)
    function closeMobileMenu() {
        var header = jQuery('.apple-header');
        var toggle = header.find('.mobile-toggle');
        var mobileNav = header.find('.mobile-nav');
        var overlay = header.find('.mobile-overlay');
        var body = jQuery('body');
        
        toggle.removeClass('active');
        mobileNav.removeClass('show');
        overlay.removeClass('show');
        body.removeClass('menu-open').css('top', '');
        mobileNav.find('li').removeClass('active');
    }
})();

