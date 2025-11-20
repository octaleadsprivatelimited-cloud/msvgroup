# Script to add loading screen fix to all HTML pages
$htmlFiles = Get-ChildItem -Path "html" -Filter "*.html" | Where-Object { $_.Name -ne "index.html" -and $_.Name -ne "gallery.html" }

$scriptToAdd = @"

<!-- INLINE SCRIPT TO ENSURE LOADING SCREEN HIDES -->
<script>
	// Immediate fallback to hide loading screen
	(function() {
		if (document.readyState === 'loading') {
			document.addEventListener('DOMContentLoaded', hideLoader);
		} else {
			hideLoader();
		}
		
		window.addEventListener('load', hideLoader);
		
		// Force hide after 3 seconds
		setTimeout(hideLoader, 3000);
		
		function hideLoader() {
			var loader = document.querySelector('.loading-area');
			if (loader) {
				loader.style.display = 'none';
			}
		}
	})();
</script>

"@

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Check if already has the script
    if ($content -notmatch "INLINE SCRIPT TO ENSURE LOADING") {
        # Replace the pattern after LOADING AREA END
        $pattern = "<!-- LOADING AREA\s+END\s*=+ -->\s*\r?\n\s*\r?\n<!-- JAVASCRIPT"
        $replacement = "<!-- LOADING AREA  END ====== -->`r`n`r`n$scriptToAdd`r`n<!-- JAVASCRIPT"
        
        if ($content -match $pattern) {
            $newContent = $content -replace $pattern, $replacement
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
            Write-Host "Added loading fix to: $($file.Name)"
        } else {
            # Try alternative pattern
            $pattern2 = "<!-- LOADING AREA.*?END.*?-->\s*\r?\n\s*\r?\n<!-- JAVASCRIPT"
            if ($content -match $pattern2) {
                $newContent = $content -replace $pattern2, $replacement
                Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
                Write-Host "Added loading fix to: $($file.Name) (pattern 2)"
            } else {
                Write-Host "Could not find pattern in: $($file.Name)"
            }
        }
    } else {
        Write-Host "Skipped (already has script): $($file.Name)"
    }
}

Write-Host "`nDone!"

