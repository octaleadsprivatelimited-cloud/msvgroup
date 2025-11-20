# Script to add loading screen fix to remaining HTML pages that have different structure
$filesToFix = @(
    "html\error-404.html",
    "html\product-clean-room-project-design-and-execution.html",
    "html\products-demo.html",
    "html\project-biosafety-containment.html",
    "html\project-isolation-ward.html",
    "html\project-microelectronics-lab.html",
    "html\project-modular-ot.html",
    "html\project-nutraceutical-production.html",
    "html\project-sterile-packaging.html",
    "html\project-vaccine-fill-finish.html"
)

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

foreach ($filePath in $filesToFix) {
    if (Test-Path $filePath) {
        try {
            $content = Get-Content $filePath -Raw -Encoding UTF8
            
            # Check if already has the script
            if ($content -match "INLINE SCRIPT TO ENSURE LOADING") {
                Write-Host "Skipped (already has script): $filePath" -ForegroundColor Yellow
                continue
            }
            
            # Pattern 1: Before SCRIPTS comment
            if ($content -match "(?s)(.*)(<!-- SCRIPTS -->)") {
                $newContent = $matches[1] + $scriptToAdd + "`r`n    " + $matches[2]
                Set-Content -Path $filePath -Value $newContent -Encoding UTF8 -NoNewline
                Write-Host "Added loading fix to: $filePath (pattern 1)" -ForegroundColor Green
            }
            # Pattern 2: Before script tags
            elseif ($content -match "(?s)(.*)(\s+<!-- SCRIPTS -->\s*<script)") {
                $newContent = $matches[1] + $scriptToAdd + "`r`n    " + $matches[2]
                Set-Content -Path $filePath -Value $newContent -Encoding UTF8 -NoNewline
                Write-Host "Added loading fix to: $filePath (pattern 2)" -ForegroundColor Green
            }
            # Pattern 3: Before closing body tag
            elseif ($content -match "(?s)(.*)(\s+</div>\s*</body>)") {
                $newContent = $matches[1] + $scriptToAdd + "`r`n    " + $matches[2]
                Set-Content -Path $filePath -Value $newContent -Encoding UTF8 -NoNewline
                Write-Host "Added loading fix to: $filePath (pattern 3)" -ForegroundColor Green
            }
            # Pattern 4: Before script src
            elseif ($content -match "(?s)(.*)(\s+<script\s+src=`"js/jquery)") {
                $newContent = $matches[1] + $scriptToAdd + "`r`n    " + $matches[2]
                Set-Content -Path $filePath -Value $newContent -Encoding UTF8 -NoNewline
                Write-Host "Added loading fix to: $filePath (pattern 4)" -ForegroundColor Green
            }
            else {
                Write-Host "Could not find insertion point in: $filePath" -ForegroundColor Red
            }
        }
        catch {
            Write-Host "Error processing $filePath : $_" -ForegroundColor Red
        }
    }
    else {
        Write-Host "File not found: $filePath" -ForegroundColor Red
    }
}

Write-Host "`nDone!" -ForegroundColor Cyan

