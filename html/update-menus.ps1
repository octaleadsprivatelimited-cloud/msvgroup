$desktopNav = @'
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li>
						<a href="javascript:;">Products</a>
						<ul class="sub-menu">
							<li><a href="s-oilgas.html">Steel Doors</a></li>
							<li><a href="s-mechanical.html">Steel Windows</a></li>
							<li><a href="s-automotive.html">School Furniture</a></li>
						</ul>
					</li>
					<li><a href="projects.html">Projects</a></li>
					<li><a href="contact-1.html">Contact</a></li>
				</ul>
'@

$mobileNav = @'
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li class="has-submenu">
						<a href="javascript:;">Products</a>
						<ul class="sub-menu">
							<li><a href="s-oilgas.html">Steel Doors</a></li>
							<li><a href="s-mechanical.html">Steel Windows</a></li>
							<li><a href="s-automotive.html">School Furniture</a></li>
						</ul>
					</li>
					<li><a href="projects.html">Projects</a></li>
					<li><a href="contact-1.html">Contact</a></li>
				</ul>
'@

$files = Get-ChildItem *.html | Where-Object { $_.Name -ne 'flaticon.html' -and $_.Name -ne 'index.html' -and $_.Name -ne 'about.html' -and $_.Name -ne 'projects.html' }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Update desktop nav
    $content = $content -replace '(?s)(<nav class="desktop-nav">\s*<ul>).*?(</ul>\s*</nav>)', "`$1`n$desktopNav`n			</nav>"
    
    # Update mobile nav
    $content = $content -replace '(?s)(<nav class="mobile-nav">.*?<ul>).*?(</ul>\s*</nav>)', "`$1`n$mobileNav`n			</nav>"
    
    Set-Content -Path $file.FullName -Value $content -NoNewline
    Write-Host "Updated: $($file.Name)"
}

Write-Host "`nAll menus updated!"

