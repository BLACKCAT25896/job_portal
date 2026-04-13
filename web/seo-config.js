// SEO Configuration for FueQuiz - AI-Powered Quiz Platform
// This file contains SEO-related configurations and utilities

// Set up global analytics IDs - all disabled for now
window.GA4_ID = null;
window.GTM_ID = null;
window.FB_PIXEL_ID = null;
window.HOTJAR_ID = null;

window.SEOConfig = {
  // Site Information
  siteName: "Mighty ecommerce",
  siteUrl: "https://ecommerce.mightyapp.com",
  siteDescription:
    "Streamline your ecommerce operations with Mighty ecommerce - the ultimate ecommerce management system. Manage orders, inventory, staff, and analytics all in one powerful platform.",

  // Social Media
  social: {
    twitter: "@mightyecommerce",
    facebook: "mightyecommerce",
    linkedin: "company/mightyecommerce",
    instagram: "mighty_ecommerce",
  },

  // Analytics IDs - all disabled
  analytics: {
    googleAnalytics: null,
    googleTagManager: null,
    facebookPixel: null,
    hotjar: null,
  },

  // SEO Keywords
  keywords: [
    "ecommerce management system",
    "POS system",
    "inventory management",
    "ecommerce software",
    "order management",
    "food service management",
    "ecommerce analytics",
    "staff management",
    "menu management",
    "ecommerce technology",
    "kitchen management",
    "table management",
    "ecommerce billing",
    "food ordering system",
    "ecommerce operations",
    "hospitality management",
    "ecommerce automation",
    "food business software",
    "ecommerce dashboard",
    "catering management",
  ],

  // Page-specific SEO data
  pages: {
    home: {
      title:
        "Mighty ecommerce - Complete ecommerce Management System | POS & Inventory",
      description:
        "Streamline your ecommerce operations with Mighty ecommerce - the ultimate ecommerce management system. Manage orders, inventory, staff, and analytics all in one powerful platform.",
      keywords:
        "ecommerce management system, POS system, inventory management, ecommerce software, order management",
    },
    dashboard: {
      title: "Dashboard - Mighty ecommerce | ecommerce Analytics & Reports",
      description:
        "Monitor your ecommerce performance, view sales analytics, track inventory, and access detailed reports on your Mighty ecommerce dashboard.",
      keywords:
        "ecommerce dashboard, sales analytics, performance tracking, ecommerce reports",
    },
    inventory: {
      title:
        "Inventory Management - Mighty ecommerce | Stock Control & Tracking",
      description:
        "Manage your ecommerce inventory efficiently with real-time stock tracking, automated alerts, and comprehensive reporting.",
      keywords:
        "inventory management, stock control, ecommerce supplies, inventory tracking",
    },
    orders: {
      title: "Order Management - Mighty ecommerce | POS & Order Processing",
      description:
        "Streamline your order processing with our advanced POS system. Handle dine-in, takeout, and delivery orders seamlessly.",
      keywords:
        "order management, POS system, ecommerce orders, order processing",
    },
    analytics: {
      title:
        "ecommerce Analytics - Mighty ecommerce | Sales & Performance Reports",
      description:
        "Get detailed insights into your ecommerce performance with comprehensive analytics, sales reports, and business intelligence.",
      keywords:
        "ecommerce analytics, sales reports, performance tracking, business intelligence",
    },
  },
};

// Dynamic SEO Functions
window.SEOUtils = {
  // Update page title dynamically
  updateTitle: function (title) {
    document.title = title;

    // Update Open Graph title
    let ogTitle = document.querySelector('meta[property="og:title"]');
    if (ogTitle) {
      ogTitle.setAttribute("content", title);
    }

    // Update Twitter title
    let twitterTitle = document.querySelector('meta[property="twitter:title"]');
    if (twitterTitle) {
      twitterTitle.setAttribute("content", title);
    }
  },

  // Update page description dynamically
  updateDescription: function (description) {
    let metaDesc = document.querySelector('meta[name="description"]');
    if (metaDesc) {
      metaDesc.setAttribute("content", description);
    }

    // Update Open Graph description
    let ogDesc = document.querySelector('meta[property="og:description"]');
    if (ogDesc) {
      ogDesc.setAttribute("content", description);
    }

    // Update Twitter description
    let twitterDesc = document.querySelector(
      'meta[property="twitter:description"]',
    );
    if (twitterDesc) {
      twitterDesc.setAttribute("content", description);
    }
  },

  // Update canonical URL
  updateCanonical: function (url) {
    let canonical = document.querySelector('link[rel="canonical"]');
    if (canonical) {
      canonical.setAttribute("href", url);
    }

    // Update Open Graph URL
    let ogUrl = document.querySelector('meta[property="og:url"]');
    if (ogUrl) {
      ogUrl.setAttribute("content", url);
    }

    // Update Twitter URL
    let twitterUrl = document.querySelector('meta[property="twitter:url"]');
    if (twitterUrl) {
      twitterUrl.setAttribute("content", url);
    }
  },

  // Add structured data dynamically
  addStructuredData: function (data) {
    let script = document.createElement("script");
    script.type = "application/ld+json";
    script.textContent = JSON.stringify(data);
    document.head.appendChild(script);
  },

  // Track page view for analytics
  trackPageView: function (page) {
    // Google Analytics 4
    if (typeof gtag !== "undefined") {
      gtag("config", window.SEOConfig.analytics.googleAnalytics, {
        page_title: document.title,
        page_location: window.location.href,
      });
    }

    // Facebook Pixel
    if (typeof fbq !== "undefined") {
      fbq("track", "PageView");
    }
  },

  // Generate breadcrumb structured data
  generateBreadcrumbs: function (breadcrumbs) {
    const breadcrumbData = {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      itemListElement: breadcrumbs.map((item, index) => ({
        "@type": "ListItem",
        position: index + 1,
        name: item.name,
        item: item.url,
      })),
    };

    this.addStructuredData(breadcrumbData);
  },
};

// Initialize SEO on page load
document.addEventListener("DOMContentLoaded", function () {
  // Track initial page view
  window.SEOUtils.trackPageView(window.location.pathname);

  // Add performance monitoring
  if ("performance" in window) {
    window.addEventListener("load", function () {
      setTimeout(function () {
        const perfData = performance.getEntriesByType("navigation")[0];
        if (perfData && typeof gtag !== "undefined") {
          gtag("event", "page_load_time", {
            value: Math.round(perfData.loadEventEnd - perfData.loadEventStart),
          });
        }
      }, 0);
    });
  }
});

// Export for use in Flutter web
if (typeof module !== "undefined" && module.exports) {
  module.exports = { SEOConfig: window.SEOConfig, SEOUtils: window.SEOUtils };
}
