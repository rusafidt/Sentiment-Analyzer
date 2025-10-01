# Fix all @/lib/utils imports in frontend components
$files = Get-ChildItem -Path "frontend\components\ui" -Filter "*.tsx" -Recurse
foreach ($file in $files) {
    $content = Get-Content $file.FullName
    $content = $content -replace "from '@/lib/utils'", "from '../../lib/utils'"
    Set-Content -Path $file.FullName -Value $content
    Write-Host "Fixed: $($file.Name)"
}

# Also fix any other files that might have the import
$otherFiles = Get-ChildItem -Path "frontend" -Filter "*.tsx" -Recurse | Where-Object { $_.FullName -notlike "*\components\ui\*" }
foreach ($file in $otherFiles) {
    $content = Get-Content $file.FullName
    if ($content -match "@/lib/utils") {
        $content = $content -replace "from '@/lib/utils'", "from '../lib/utils'"
        Set-Content -Path $file.FullName -Value $content
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "All imports fixed!"
