$zon = 'SGR01'
$response = Invoke-WebRequest -UseBasicParsing -Uri "https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&period=today&zone=$zon" -Method Get

if (!$response) {
    return
}

$data = $response.content | ConvertFrom-Json

$fajr = ([datetime]::ParseExact($data.prayerTime[0].fajr, "HH:mm:ss", $null))
$dhuhr = ([datetime]::ParseExact($data.prayerTime[0].dhuhr, "HH:mm:ss", $null))
$asr = ([datetime]::ParseExact($data.prayerTime[0].asr, "HH:mm:ss", $null))
$maghrib = ([datetime]::ParseExact($data.prayerTime[0].maghrib, "HH:mm:ss", $null))
$isha = ([datetime]::ParseExact($data.prayerTime[0].isha, "HH:mm:ss", $null))

$currentDate = Get-Date

if ($fajr -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    🕌 $($fajr.ToString('hh:mm tt')) (Subuh)"
} elseif ($dhuhr -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    🕌 $($dhuhr.ToString('hh:mm tt')) (Zohor)"
} elseif ($asr -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    🕌 Asar  :  $($asr.ToString('hh:mm tt'))"
} elseif ($maghrib -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    🕌 Maghrib  :  $($maghrib.ToString('hh:mm tt'))"
} elseif ($isha -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    🕌 Isyak  :  $($isha.ToString('hh:mm tt'))"
} else {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Value ''
}
