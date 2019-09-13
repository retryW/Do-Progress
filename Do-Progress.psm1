function Do-Progress([int]$count,[int]$total, [int]$started) {
    # Calculate percentage
    [int]$percentComplete = 100 / $total * $count
    # Keep the actual percentage for displaying number on screen
    $displayPercent = $percentComplete
    # Make 100% equal to 50, as it will fit a default PowerShell window. 100 characters would be excessive.
    [int]$percentComplete = $percentComplete / 2

    # Empty variables from previous run
    # Used to create 'chunks' to display in console with the least number of Write-Hosts. Significantly increases performance.
    $completeBarPre = ""
    $completeBarPost = ""
    $completeString = ""
    $startedBarPre = ""
    $startedBarPost = ""
    $startedString = ""
    $incompleteBarPre = ""
    $incompleteBarPost = ""
    $incompleteString = ""

    # Calculate what character should be used in each position
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

    # Return carriage. Allows us to overwrite the current line within the console.
    Write-Host "`r"

    # Draw the loading bar. Unsure if it would be more efficient to check if Post vars are empty and exclude if so. Will have to test.
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

    # Append the stats to the end of the loading bar
    if ($started) {
        Write-Host " Completed: $count, Started: $started, Total: $total" -NoNewline #"`r"
    } else {
        Write-Host " Completed: $count, Total: $total" -NoNewline #"`r"
    }
    if($count -eq $total){
        # Go to new line, so external script doesn't write over the bar or on same line
        # Write another line so there's an empty line after the loading bar. Looks far cleaner.
        Write-Host ""
        Write-Host ""
    }
}

# Export the function
Export-ModuleMember -Function *
