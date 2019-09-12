function Do-Progress([int]$count,[int]$total, [int]$started) {
    [int]$percentComplete = 100 / $total * $count
    $displayPercent = $percentComplete
    [int]$percentComplete = $percentComplete / 2
    $completeBarPre = ""
    $completeBarPost = ""
    $completeString = ""
    $startedBarPre = ""
    $startedBarPost = ""
    $startedString = ""
    $incompleteBarPre = ""
    $incompleteBarPost = ""
    $incompleteString = ""

    for($i = 0; $i -le $percentComplete; $i++) {
        if ($i -eq 24) {
            #Write-Host $displayPercent.ToString()[0] -NoNewline -BackgroundColor Green -ForegroundColor Black
            $completeString += $displayPercent.ToString()[0]
        } elseif ($i -eq 25){
            #Write-Host $displayPercent.ToString()[1] -NoNewline -BackgroundColor Green -ForegroundColor Black
            $completeString += $displayPercent.ToString()[1]
        } elseif ($i -eq 26){
            if($displayPercent -lt 100) {
                #Write-Host "%" -NoNewline -BackgroundColor Green -ForegroundColor Black
                $completeString += "%"
            } else {
                #Write-Host $displayPercent.ToString()[2] -NoNewline -BackgroundColor Green -ForegroundColor Black
                $completeString += $displayPercent.ToString()[2]
            }
        } elseif ($i -eq 27){
            if($displayPercent -eq 100) {
                #Write-Host "%" -NoNewline -BackgroundColor Green -ForegroundColor Black
                $completeString += "%"
            } else {
                #Write-Host "-" -NoNewline -BackgroundColor Green -ForegroundColor Green
                $completeBarPost += "-"
            }
        } else {
            #Write-Host "-" -NoNewline -BackgroundColor Green -ForegroundColor Green
            if ($i -lt 24) {
                $completeBarPre += "-"
            } else {
                $completeBarPost += "-"
            }
        }
    }
    if($started) {
        [int]$percentStarted = 100 / $total * $started
        [int]$percentStarted = $percentStarted / 2
        for(; $i -le $percentStarted; $i++) {
            if ($i -eq 24) {
                #Write-Host $displayPercent.ToString()[0] -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                $startedString += $displayPercent.ToString()[0]
            } elseif ($i -eq 25){
                #Write-Host $displayPercent.ToString()[1] -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                $startedString += $displayPercent.ToString()[1]
            } elseif ($i -eq 26){
                if($displayPercent -lt 100) {
                    #Write-Host "%" -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                    $startedString += "%"
                } else {
                    #Write-Host $displayPercent.ToString()[2] -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                    $startedString += $displayPercent.ToString()[2]
                }
            } elseif ($i -eq 27){
                if($displayPercent -eq 100) {
                    #Write-Host "%" -NoNewline -BackgroundColor Yellow -ForegroundColor Black
                    $startedString += "%"
                } else {
                    #Write-Host "-" -NoNewline -BackgroundColor Yellow -ForegroundColor Yellow
                    $startedBarPost += "-"
                }
            } else {
                #Write-Host "-" -NoNewline -BackgroundColor Yellow -ForegroundColor Yellow
                if ($i -lt 24) {
                    $startedBarPre += "-"
                } else {
                    $startedBarPost += "-"
                }
            }
        }
    }
    for(;$i -le 50; $i++) {
        if ($i -eq 24) {
            #Write-Host $displayPercent.ToString()[0] -NoNewline -BackgroundColor Red -ForegroundColor White
            $incompleteString += $displayPercent.ToString()[0]
        } elseif ($i -eq 25){
            #Write-Host $displayPercent.ToString()[1] -NoNewline -BackgroundColor Red -ForegroundColor White
            $incompleteString += $displayPercent.ToString()[1]
        } elseif ($i -eq 26){
            #Write-Host "%" -NoNewline -BackgroundColor Red -ForegroundColor White
            $incompleteString += "%"
        } else {
            #Write-Host "_" -NoNewline -BackgroundColor Red -ForegroundColor Red
            if ($i -lt 24) {
                $incompleteBarPre += "-"
            } else {
                $incompleteBarPost += "-"
            }
        }
    }
    Write-Host "`r"
    Write-Host "[" -NoNewline -BackgroundColor Black

    Write-Host $completeBarPre -BackgroundColor Green -ForegroundColor Green -NoNewline
    Write-Host $completeString -BackgroundColor Green -ForegroundColor Black -NoNewline
    Write-Host $completeBarPost -BackgroundColor Green -ForegroundColor Green -NoNewline
    Write-Host $startedBarPre -BackgroundColor Yellow -ForegroundColor Yellow -NoNewline
    Write-Host $startedString -BackgroundColor Yellow -ForegroundColor Black -NoNewline
    Write-Host $startedBarPost -BackgroundColor Yellow -ForegroundColor Yellow -NoNewline
    Write-Host $incompleteBarPre -BackgroundColor Red -ForegroundColor Red -NoNewline
    Write-Host $incompleteString -BackgroundColor Red -ForegroundColor White -NoNewline
    Write-Host $incompleteBarPost -BackgroundColor Red -ForegroundColor Red -NoNewline

    Write-Host "]" -NoNewline -BackgroundColor Black
    if ($started) {
        Write-Host " Started: $started, Completed: $count, Total: $total" -NoNewline #"`r"
    } else {
        Write-Host " Completed: $count, Total: $total" -NoNewline #"`r"
    }
    if($count -eq $total){
    Write-Host ""
    Write-Host ""
    }
}

Export-ModuleMember -Function *
