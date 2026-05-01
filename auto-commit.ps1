# 자동 커밋 & 푸시 스크립트
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$message = "Update: $timestamp"

git add .
git commit -m $message
git push

Write-Host "✅ 커밋 완료: $message"
Write-Host "✅ 푸시 완료!"
