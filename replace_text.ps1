$contentDir = "c:\UnityGame\Project_CloudGameCMS - Copy\TrongNamAWS\content"

$files = Get-ChildItem -Path $contentDir -Filter *.md -Recurse
$count = 0

foreach ($file in $files) {
    # Read raw bytes to ensure we don't mess up encodings, 
    # but actually we can just read text with utf8.
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $newContent = $content.Replace("Cloud Game CMS", "Adaptive Boss AI").Replace("CloudGameCMS", "AdaptiveBossAI")
    
    if ($newContent -cne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $newContent, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host "Updated $($file.FullName)"
    }
}
Write-Host "Total files updated: $count"
