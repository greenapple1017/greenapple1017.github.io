# 리뷰 페이지 자동 생성
$booksPath = "$PSScriptRoot\books.json"
$booksJson = Get-Content -Path $booksPath -Encoding UTF8 | ConvertFrom-Json

$reviewsDir = "$PSScriptRoot\reviews"
if (!(Test-Path $reviewsDir)) {
    New-Item -ItemType Directory -Path $reviewsDir | Out-Null
}

foreach ($book in $booksJson.books) {
    $htmlContent = @"
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($book.title)</title>
    <link rel="stylesheet" href="../style.css">
</head>

<body>
    <main>
        <a href="../index.html" class="back-link">&larr; 목록으로 돌아가기</a>

        <article class="review-content">
            <h1>$($book.title)</h1>
            <div class="text-content">
                
            </div>
        </article>
    </main>
</body>

</html>
"@

    $filePath = Join-Path -Path $reviewsDir -ChildPath $book.review
    
    if (!(Test-Path $filePath)) {
        [System.IO.File]::WriteAllText($filePath, $htmlContent, [System.Text.Encoding]::UTF8)
    }
}

# 자동 커밋 & 푸시 스크립트
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$message = "Update: $timestamp"

git add .
git commit -m $message
git push


