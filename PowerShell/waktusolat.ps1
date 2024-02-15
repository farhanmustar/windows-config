$zon = 'SGR01'
$response = Invoke-WebRequest -UseBasicParsing -Uri "https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&period=today&zone=$zon" -Method Get

if (!$response) {
    return
}

$data = $response.content | ConvertFrom-Json

$imsak = ([datetime]::ParseExact($data.prayerTime[0].imsak, "HH:mm:ss", $null))
$fajr = ([datetime]::ParseExact($data.prayerTime[0].fajr, "HH:mm:ss", $null))
$syuruk = ([datetime]::ParseExact($data.prayerTime[0].syuruk, "HH:mm:ss", $null))
$dhuhr = ([datetime]::ParseExact($data.prayerTime[0].dhuhr, "HH:mm:ss", $null))
$asr = ([datetime]::ParseExact($data.prayerTime[0].asr, "HH:mm:ss", $null))
$maghrib = ([datetime]::ParseExact($data.prayerTime[0].maghrib, "HH:mm:ss", $null))
$isha = ([datetime]::ParseExact($data.prayerTime[0].isha, "HH:mm:ss", $null))

$currentDate = Get-Date

if ($imsak -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Imsak  :  $($imsak.ToString('hh:mm tt'))"
} elseif ($fajr -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Subuh  :  $($fajr.ToString('hh:mm tt'))"
} elseif ($syuruk -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Syuruk  :  $($syuruk.ToString('hh:mm tt'))"
} elseif ($dhuhr -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Zohor  :  $($dhuhr.ToString('hh:mm tt'))"
} elseif ($asr -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Asar  :  $($asr.ToString('hh:mm tt'))"
} elseif ($maghrib -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Maghrib  :  $($maghrib.ToString('hh:mm tt'))"
} elseif ($isha -gt $currentDate) {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -value "    Isyak  :  $($isha.ToString('hh:mm tt'))"
} else {
  Set-Content -Path 'C:\waktusolat.txt' -NoNewline -Value ''
}
