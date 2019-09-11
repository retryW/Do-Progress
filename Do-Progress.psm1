function Do-Progress([int]$count,[int]$total, [int]$started) {
    [int]$percentComplete = 100 / $total * $count
    $displayPercent = $percentComplete
    [int]$percentComplete = $percentComplete / 2
    Write-Host "[" -NoNewline -BackgroundColor Black

    for($i = 0; $i -le $percentComplete; $i++) {
        if ($i -eq 24) {
            Write-Host $displayPercent.ToString()[0] -NoNewline -BackgroundColor Green -ForegroundColor Black
        } elseif ($i -eq 25){
            Write-Host $displayPercent.ToString()[1] -NoNewline -BackgroundColor Green -ForegroundColor Black
        } elseif ($i -eq 26){
            if($displayPercent -lt 100) {
                Write-Host "%" -NoNewline -BackgroundColor Green -ForegroundColor Black
            } else {
                Write-Host $displayPercent.ToString()[2] -NoNewline -BackgroundColor Green -ForegroundColor Black
            }
        } elseif ($i -eq 27){
            if($displayPercent -eq 100) {
                Write-Host "%" -NoNewline -BackgroundColor Green -ForegroundColor Black
            } else {
                 Write-Host "-" -NoNewline -BackgroundColor Green -ForegroundColor Green
            }
        } else {
            Write-Host "-" -NoNewline -BackgroundColor Green -ForegroundColor Green
        }
    }
    if($started) {
        [int]$percentStarted = 100 / $total * $started
        [int]$percentStarted = $percentStarted / 2
        for(; $i -le $percentStarted; $i++) {
            if ($i -eq 24) {
                Write-Host $displayPercent.ToString()[0] -NoNewline -BackgroundColor Yellow -ForegroundColor Black
            } elseif ($i -eq 25){
                Write-Host $displayPercent.ToString()[1] -NoNewline -BackgroundColor Yellow -ForegroundColor Black
            } elseif ($i -eq 26){
                if($displayPercent -lt 100) {
                    Write-Host "%" -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                } else {
                    Write-Host $displayPercent.ToString()[2] -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                }
            } elseif ($i -eq 27){
                if($displayPercent -eq 100) {
                    Write-Host "%" -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                } else {
                    Write-Host "-" -NoNewline -BackgroundColor Yellow -ForegroundColor Yellow
                }
            } else {
                Write-Host "-" -NoNewline -BackgroundColor Yellow -ForegroundColor Yellow  
            }
        }
    }
    for(;$i -le 50; $i++) {
        if ($i -eq 24) {
            Write-Host $displayPercent.ToString()[0] -NoNewline -BackgroundColor Red -ForegroundColor White
        } elseif ($i -eq 25){
            Write-Host $displayPercent.ToString()[1] -NoNewline -BackgroundColor Red -ForegroundColor White
        } elseif ($i -eq 26){
            Write-Host "%" -NoNewline -BackgroundColor Red -ForegroundColor White
        } else {
            Write-Host "_" -NoNewline -BackgroundColor Red -ForegroundColor Red
        }
    }
    Write-Host "]" -NoNewline -BackgroundColor Black
    if ($started) {
        Write-Host " Started: $started, Completed: $count, Total: $total" -NoNewline "`r"
    } else {
        Write-Host " Completed: $count, Total: $total" -NoNewline "`r"
    }
    if($count -eq $total){
    Write-Host ""
    Write-Host ""
    }
}

Export-ModuleMember -Function *
