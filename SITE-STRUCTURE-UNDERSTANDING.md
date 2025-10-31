# MSV Group India - Complete Site Structure Understanding

## 📋 Architecture Overview

### Site Type: **Static HTML Website**
- **Technology Stack**: Bootstrap 4, jQuery, CSS3, HTML5
- **Server**: Static file serving (currently running on port 3000)
- **Build**: No build process required - pure HTML/CSS/JS
- **Deployment**: Vercel-ready with `vercel.json` configuration

---

## 📁 File Structure

### Root Directory Structure:
```
msvgroup/
├── html/                    # Main website directory (all assets here)
│   ├── index.html          # Homepage
│   ├── about.html          # About page
│   ├── contact-1.html      # Contact page
│   ├── projects.html       # Projects gallery
│   ├── blog-grid.html      # Blog listing
│   ├── team.html           # Team overview
│   ├── team-single.html    # Individual team member
│   ├── Faq.html            # FAQ page
│   ├── s-oilgas.html       # Steel Doors product page
│   ├── s-mechanical.html   # Steel Windows product page
│   ├── s-automotive.html   # School Furniture product page
│   ├── s-chemical.html     # Cleanroom Equipment product page
│   ├── s-agricultural.html # Water Purification Systems page
│   ├── s-civil.html        # Custom Solutions page
│   ├── s-power-energy.html # Additional product page
│   ├── error-403.html     # Error page
│   ├── error-404.html     # Error page
│   ├── error-405.html     # Error page
│   ├── icon-font.html     # Icon reference
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   ├── images/            # All images
│   ├── fonts/             # Font files
│   ├── plugins/           # Third-party plugins
│   └── form-handler2.php  # Form handler (if needed)
├── vercel.json            # Vercel deployment config
└── Documentation files (*.md)
```

---

## 🎯 Navigation Structure

### Main Navigation Menu (Present on ALL pages):
```
Home
About
Products ▼
  ├── Steel Doors (s-oilgas.html)
  ├── Steel Windows (s-mechanical.html)
  ├── School Furniture (s-automotive.html)
  ├── Cleanroom Equipment (s-chemical.html)
  ├── Water Purification Systems (s-agricultural.html)
  └── Custom Solutions (s-civil.html)
Projects (projects.html)
Blog (blog-grid.html)
Team (team.html)
FAQ (Faq.html)
Contact us (contact-1.html)
```

### Header Components (Standard across all pages):
1. **Top Bar**: 
   - Business hours (Monday-Saturday, 8AM-6PM)
   - Phone: +91 88850 90666
   - Email: Info@msvgroupindia.com
   - Search icon

2. **Logo Section**: 
   - MSV Group logo (images/msv group/msv_logo.png)
   - Links to index.html
   - Size: 50% reduction (custom CSS)

3. **Info Icons**:
   - Trophy icon: "The Best Industrial Solution Provider"
   - Stamp icon: "Certified Company ISO 9001:2015"

4. **Main Navigation**: Sticky header with dropdown menus

---

## 🎨 Styling Architecture

### CSS Files (in order of loading):
1. `css/bootstrap.min.css` - Bootstrap framework
2. `css/fontawesome/css/font-awesome.min.css` - Icons
3. `css/owl.carousel.min.css` - Carousel plugin
4. `css/bootstrap-select.min.css` - Select boxes
5. `css/magnific-popup.min.css` - Image popups
6. `css/loader.min.css` - Page loader
7. `css/style.css` - Main theme styles
8. `css/custom.css` - **Custom overrides** (key customizations here)
9. `css/flaticon.min.css` - Custom icons
10. `css/lc_lightbox.css` - Lightbox gallery
11. `css/skin/skin-1.css` - Theme color skin
12. `css/switcher.css` - Theme switcher

### Key Custom CSS Features:
- Logo size reduction (50%)
- Video hero section styles
- Responsive breakpoints
- Custom color scheme

---

## 📜 JavaScript Architecture

### JS Files (in order of loading):
1. `js/jquery-2.2.0.min.js` - jQuery library
2. `js/popper.min.js` - Bootstrap dependency
3. `js/bootstrap.min.js` - Bootstrap components
4. `js/bootstrap-select.min.js` - Select boxes
5. `js/owl.carousel.min.js` - Carousel/slider
6. `js/magnific-popup.min.js` - Image popups
7. `js/isotope.pkgd.min.js` - Masonry layouts
8. `js/counterup.min.js` - Animated counters
9. `js/waypoints.min.js` - Scroll triggers
10. `js/lc_lightbox.lite.js` - Gallery lightbox
11. `js/custom.js` - **Main custom functionality**

### Custom.js Key Functions:
- Video responsive wrapping
- Cart dropdown toggle
- Gallery popups
- Carousel initializations
- Counter animations
- Form submissions
- Mobile menu handling
- Scroll effects

---

## 🏠 Homepage Structure (index.html)

### Sections (in order):
1. **Header** - Navigation, logo, contact info
2. **Video Hero Section** - Full-screen video background
   - Video: `images/msv group/msv00037.mp4`
   - Auto-play, loop, muted
   - Dark overlay (40% opacity)
   - CTA button
3. **About Section** - Company introduction
   - Manufacturing facility details
   - Production capacity
   - ISO certification
4. **Services/Products Section** - 6 product cards
   - Grid layout with images
   - Product descriptions
   - Links to product pages
5. **Projects Section** - Portfolio showcase
   - Carousel/grid layout
   - Project images
   - MSV Group projects
6. **Team Section** - Team members
   - 3 members with photos
   - Names and titles
   - Social links
7. **Blog Section** - Recent blog posts
   - 3 featured posts
   - Blog preview cards
8. **Client Logos** - Partner showcase
   - Carousel of logos
9. **Footer** - Site-wide footer
   - Company info
   - Links
   - Copyright

---

## 🖼️ Image Organization

### Key Image Directories:
- `images/msv group/` - **Company photos** (primary source)
  - msv_logo.png (logo)
  - msv00037.mp4 (hero video)
  - Various .jpeg images
- `images/products/` - Product images
- `images/services/` - Service images
- `images/team_2/` - Team photos
- `images/client-logo/` - Partner logos
- `images/background/` - Background images
- `images/banner/` - Banner images
- `images/gallery/` - Gallery images

---

## 🔗 Link Structure

### All Links Use Relative Paths:
- ✅ `href="index.html"` (not `/index.html`)
- ✅ `href="about.html"`
- ✅ `href="s-oilgas.html"`
- ✅ `src="images/logo.png"` (not `/images/logo.png`)

### Dropdown Menus:
- Products dropdown uses `href="javascript:;"` for parent
- Sub-items link to actual product pages

---

## 📱 Responsive Design

### Breakpoints:
- **Desktop**: Full navigation, multi-column layouts
- **Tablet** (≤991px): Collapsible menu, adjusted columns
- **Mobile** (≤767px): Hamburger menu, single column

### Mobile Features:
- Hamburger menu toggle
- Touch-friendly buttons
- Responsive video
- Vertical scrolling

---

## 🎥 Video Implementation

### Hero Video:
- **File**: `images/msv group/msv00037.mp4`
- **Format**: MP4 (H.264 codec)
- **Size**: ~43MB
- **Properties**: Auto-play, loop, muted
- **Position**: Absolute, centered, full-screen
- **Overlay**: Dark gradient (rgba(0,0,0,0.4))

### CSS Classes:
- `.video-hero-section` - Container
- `.hero-overlay` - Dark overlay
- `.hero-content-wrapper` - Content container
- `.hero-content` - Text content

---

## 📋 Form Handling

### Contact Forms:
- Form action: `form-handler2.php` (or `#` for client-side)
- AJAX submission via jQuery
- Validation included
- Success/error messages

### Form Components:
- Name, email, phone fields
- Message textarea
- Submit button
- Loading indicator

---

## 🎨 Theme System

### Skin Files (12 available):
- `css/skin/skin-1.css` - Active theme
- `css/skin/skin-2.css` through `skin-12.css` - Alternative themes

### Theme Switcher:
- Located in side drawer
- Allows switching between 12 color schemes
- Persists user preference

---

## 🔧 Plugin Integration

### Major Plugins:
1. **Revolution Slider** - Slider plugin (in plugins/revolution/)
2. **Owl Carousel** - Carousel/slider
3. **Magnific Popup** - Image popups
4. **Isotope** - Masonry layouts
5. **Counter Up** - Animated numbers
6. **LC Lightbox** - Gallery lightbox
7. **Bootstrap Select** - Enhanced select boxes

---

## 📞 Contact Information (Standard across site)

### Displayed in Header:
- **Phone**: +91 88850 90666
- **Email**: Info@msvgroupindia.com
- **Hours**: Monday - Saturday, 8AM - 6PM

### Company Details:
- **Location**: Hyderabad, Telangana, India
- **ISO**: 9001:2015 Certified
- **Tagline**: "The Best Industrial Solution Provider"

---

## 🚀 Server Configuration

### Current Setup:
- **Server**: Node.js `serve` package
- **Port**: 3000
- **URL**: http://localhost:3000
- **Directory**: `html/` folder

### Deployment Ready:
- **Platform**: Vercel
- **Config**: `vercel.json` exists
- **Output**: `html/` directory
- **Clean URLs**: Enabled
- **Trailing Slash**: Disabled

---

## ✅ Key Understanding Points

### 1. Static Site:
- No backend database
- No server-side rendering
- Pure HTML/CSS/JS
- Can be hosted anywhere

### 2. Relative Paths:
- All links use relative paths
- No absolute paths (unless external)
- All `.html` extensions included

### 3. Consistent Structure:
- Same header on all pages
- Same footer on all pages
- Same navigation menu
- Same CSS/JS includes

### 4. Custom Features:
- Video hero section (custom CSS)
- Logo size reduction (custom CSS)
- Custom JavaScript functions
- Responsive design

### 5. Content Areas:
- Product pages: Service descriptions
- Blog: Blog post listings
- Projects: Portfolio showcase
- Team: Employee profiles
- Contact: Contact form

---

## 🎯 Complete Site Map

```
Home (index.html)
├── About (about.html)
├── Products (dropdown)
│   ├── Steel Doors (s-oilgas.html)
│   ├── Steel Windows (s-mechanical.html)
│   ├── School Furniture (s-automotive.html)
│   ├── Cleanroom Equipment (s-chemical.html)
│   ├── Water Purification (s-agricultural.html)
│   └── Custom Solutions (s-civil.html)
├── Projects (projects.html)
├── Blog (blog-grid.html)
├── Team (team.html)
│   └── Team Single (team-single.html)
├── FAQ (Faq.html)
└── Contact (contact-1.html)

Hidden/Utility Pages:
├── Error Pages (error-403.html, error-404.html, error-405.html)
└── Icon Font (icon-font.html)
```

---

## 📊 Statistics

- **Total HTML Pages**: 19
- **Product Pages**: 6
- **Main Sections**: 5 (Home, About, Projects, Blog, Contact)
- **CSS Files**: 12+ (including theme skins)
- **JS Files**: 15+
- **Image Folders**: 15+
- **Font Files**: Multiple formats
- **Total Files**: 2000+

---

## 🔍 Key Files to Modify

### For Content Changes:
- `html/index.html` - Homepage content
- `html/about.html` - About page
- `html/contact-1.html` - Contact form
- Product pages (`s-*.html`) - Product details

### For Styling Changes:
- `html/css/custom.css` - **Primary custom styles**
- `html/css/style.css` - Main theme styles
- `html/css/skin/skin-1.css` - Active theme colors

### For Functionality Changes:
- `html/js/custom.js` - **Main custom JavaScript**

### For Images:
- `html/images/msv group/` - Company photos
- `html/images/products/` - Product images
- `html/images/team_2/` - Team photos

---

## ✅ Confirmation

**I understand the complete structure:**
- ✅ File organization and hierarchy
- ✅ Navigation structure and links
- ✅ CSS and JavaScript architecture
- ✅ Homepage sections and layout
- ✅ Responsive design implementation
- ✅ Video hero section setup
- ✅ Form handling approach
- ✅ Image organization
- ✅ Plugin integrations
- ✅ Theme system
- ✅ Server configuration
- ✅ Deployment setup

**Server Status**: ✅ Running on http://localhost:3000

