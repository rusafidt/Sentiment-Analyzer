# Update all UI components to use local utils
$files = Get-ChildItem -Path "frontend\components\ui" -Filter "*.tsx" | Where-Object { $_.Name -ne "utils.ts" }
foreach ($file in $files) {
    $content = Get-Content $file.FullName
    $content = $content -replace "from '@/lib/utils'", "from './utils'"
    Set-Content -Path $file.FullName -Value $content
    Write-Host "Updated: $($file.Name)"
}
Write-Host "All UI components updated!"
