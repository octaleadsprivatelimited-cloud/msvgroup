$headerBlock = @'
	<!-- APPLE.COM STYLE HEADER -->
	<header class="apple-header">
		<div class="header-container">
			<!-- Mobile Toggle Button -->
			<button class="mobile-toggle" type="button">
				<span class="icon-bar icon-bar-first"></span>
				<span class="icon-bar icon-bar-two"></span>
				<span class="icon-bar icon-bar-three"></span>
			</button>
			
			<!-- Logo -->
			<div class="logo">
				<a href="index.html">
					<img src="images/msv group/msv_logo.png" alt="MSV Group India" />
				</a>
			</div>
			
			<!-- Desktop Navigation -->
			<nav class="desktop-nav">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li>
						<a href="javascript:;">Products</a>
						<ul class="sub-menu">
							<li><a href="s-oilgas.html">Steel Doors</a></li>
							<li><a href="s-mechanical.html">Steel Windows</a></li>
							<li><a href="s-automotive.html">School Furniture</a></li>
							<li><a href="s-chemical.html">Cleanroom Equipment</a></li>
							<li><a href="s-agricultural.html">Water Purification Systems</a></li>
							<li><a href="s-civil.html">Custom Solutions</a></li>
						</ul>
					</li>
					<li><a href="projects.html">Projects</a></li>
					<li><a href="blog-grid.html">Blog</a></li>
					<li><a href="team.html">Team</a></li>
					<li><a href="Faq.html">FAQ</a></li>
					<li><a href="contact-1.html">Contact</a></li>
				</ul>
			</nav>
			
			<!-- Mobile Overlay -->
			<div class="mobile-overlay"></div>
			
			<!-- Mobile Navigation -->
			<nav class="mobile-nav">
				<button class="mobile-close" type="button"></button>
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li class="has-submenu">
						<a href="javascript:;">Products</a>
						<ul class="sub-menu">
							<li><a href="s-oilgas.html">Steel Doors</a></li>
							<li><a href="s-mechanical.html">Steel Windows</a></li>
							<li><a href="s-automotive.html">School Furniture</a></li>
							<li><a href="s-chemical.html">Cleanroom Equipment</a></li>
							<li><a href="s-agricultural.html">Water Purification Systems</a></li>
							<li><a href="s-civil.html">Custom Solutions</a></li>
						</ul>
					</li>
					<li><a href="projects.html">Projects</a></li>
					<li><a href="blog-grid.html">Blog</a></li>
					<li><a href="team.html">Team</a></li>
					<li><a href="Faq.html">FAQ</a></li>
					<li><a href="contact-1.html">Contact</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- HEADER END -->
'@

$files = Get-ChildItem *.html | Where-Object { $_.Name -ne 'flaticon.html' -and $_.Name -ne 'index.html' -and $_.Name -ne 'about.html' }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Add CSS link
    if ($content -notmatch 'apple-header\.css') {
        $content = $content -replace '(<!-- CUSTOM STYLE SHEET -->.*?href="css/custom\.css">)', '$1' + "`n    <!-- APPLE HEADER STYLE SHEET -->`n    <link rel=`"stylesheet`" type=`"text/css`" href=`"css/apple-header.css`">"
    }
    
    # Add header HTML
    if ($content -notmatch 'apple-header') {
        $content = $content -replace '(<body>\s*)', '$1' + $headerBlock + "`n`n	"
    }
    
    # Add JS link
    if ($content -notmatch 'apple-header\.js') {
        $content = $content -replace '(<!-- CUSTOM FUCTIONS  -->)', '$1' + "`n<script  src=`"js/apple-header.js`"></script><!-- APPLE HEADER FUNCTIONS  -->"
    }
    
    Set-Content -Path $file.FullName -Value $content -NoNewline
    Write-Host "Updated: $($file.Name)"
}

Write-Host "`nDone!"

