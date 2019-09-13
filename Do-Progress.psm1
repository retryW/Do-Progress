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
            $completeString += $displayPercent.ToString()[0]
        } elseif ($i -eq 25){
            $completeString += $displayPercent.ToString()[1]
        } elseif ($i -eq 26){
            if($displayPercent -lt 100) {
                $completeString += "%"
            } else {
                $completeString += $displayPercent.ToString()[2]
            }
        } elseif ($i -eq 27){
            if($displayPercent -eq 100) {
                $completeString += "%"
            } else {
                $completeBarPost += "-"
            }
        } else {
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
                $startedString += $displayPercent.ToString()[0]
            } elseif ($i -eq 25){
                $startedString += $displayPercent.ToString()[1]
            } elseif ($i -eq 26){
                if($displayPercent -lt 100) {
                    $startedString += "%"
                } else {
                    $startedString += $displayPercent.ToString()[2]
                }
            } elseif ($i -eq 27){
                if($displayPercent -eq 100) {
                    $startedString += "%"
                } else {
                    $startedBarPost += "-"
                }
            } else {
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
            $incompleteString += $displayPercent.ToString()[0]
        } elseif ($i -eq 25){
            $incompleteString += $displayPercent.ToString()[1]
        } elseif ($i -eq 26){
            $incompleteString += "%"
        } else {
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
