$contextInfo = Get-Content config.json | ConvertFrom-Json
Connect-AzAccount -Subscription $contextInfo.subscriptionName -Tenant $contextInfo.tenantId

$sasUri = $contextInfo.sasUri
$fromTime = (Get-Date).AddDays(-3)
$toTime = Get-Date

Export-AzLogAnalyticRequestRateByInterval -Location "East US" -FromTime $fromTime -ToTime $toTime -IntervalLength ThirtyMins -BlobContainerSasUri $sasUri -GroupByApplicationId
Export-AzLogAnalyticRequestRateByInterval -Location "East US" -FromTime $fromTime -ToTime $toTime -IntervalLength ThirtyMins -BlobContainerSasUri $sasUri -GroupByApplicationId

