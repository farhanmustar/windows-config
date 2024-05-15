$zon = 'SGR01'
$response = Invoke-WebRequest -UseBasicParsing -Uri "https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&period=today&zone=$zon" -Method Get

if (!$response) {
    return
}

$data = $response.content | ConvertFrom-Json

$subuh = ([datetime]::ParseExact($data.prayerTime[0].fajr, "HH:mm:ss", $null))
$zohor = ([datetime]::ParseExact($data.prayerTime[0].dhuhr, "HH:mm:ss", $null))
$asar = ([datetime]::ParseExact($data.prayerTime[0].asr, "HH:mm:ss", $null))
$maghrib = ([datetime]::ParseExact($data.prayerTime[0].maghrib, "HH:mm:ss", $null))
$isyak = ([datetime]::ParseExact($data.prayerTime[0].isha, "HH:mm:ss", $null))

if (!$subuh) {
    return
}

$currentDate = Get-Date

if ($subuh -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Force -Value "    🕌 $($subuh.ToString('hh:mm tt')) (Subuh)"
} elseif ($zohor -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Force -Value "    🕌 $($zohor.ToString('hh:mm tt')) (Zohor)"
} elseif ($asar -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Force -Value "    🕌 Asar  :  $($asar.ToString('hh:mm tt'))"
} elseif ($maghrib -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Force -Value "    🕌 Maghrib  :  $($maghrib.ToString('hh:mm tt'))"
} elseif ($isyak -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Force -Value "    🕌 Isyak  :  $($isyak.ToString('hh:mm tt'))"
} elseif ($currentDate -gt $isyak) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Force -Value "    🕌 $($subuh.ToString('hh:mm tt')) (Subuh)"
}
