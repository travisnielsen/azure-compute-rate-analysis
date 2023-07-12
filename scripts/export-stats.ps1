$contextInfo = Get-Content config.json | ConvertFrom-Json
Connect-AzAccount -Subscription $contextInfo.subscriptionName -Tenant $contextInfo.tenantId

$sasUri = $contextInfo.sasUri
$fromTime = (Get-Date).AddDays(-3)
$toTime = Get-Date

# For now, run each command individually and download the file once its writtn to the storage account. This command does not support changing the blob name when it write the file.
Export-AzLogAnalyticRequestRateByInterval -Location "East US" -FromTime $fromTime -ToTime $toTime -IntervalLength ThirtyMins -BlobContainerSasUri $sasUri -GroupByApplicationId
Export-AzLogAnalyticRequestRateByInterval -Location "East US" -FromTime $fromTime -ToTime $toTime -IntervalLength ThirtyMins -BlobContainerSasUri $sasUri -GroupByOperationName
Export-AzLogAnalyticRequestRateByInterval -Location "East US" -FromTime $fromTime -ToTime $toTime -IntervalLength ThirtyMins -BlobContainerSasUri $sasUri -GroupByResourceName
Export-AzLogAnalyticRequestRateByInterval -Location "East US" -FromTime $fromTime -ToTime $toTime -IntervalLength ThirtyMins -BlobContainerSasUri $sasUri -GroupByThrottlePolicy

Export-AzLogAnalyticThrottledRequest -Location "East US" -FromTime $fromTime -ToTime $toTime -BlobContainerSasUri $sasUri -GroupByApplicationId
Export-AzLogAnalyticThrottledRequest -Location "East US" -FromTime $fromTime -ToTime $toTime -BlobContainerSasUri $sasUri -GroupByOperationName
Export-AzLogAnalyticThrottledRequest -Location "East US" -FromTime $fromTime -ToTime $toTime -BlobContainerSasUri $sasUri -GroupByResourceName
Export-AzLogAnalyticThrottledRequest -Location "East US" -FromTime $fromTime -ToTime $toTime -BlobContainerSasUri $sasUri -GroupByThrottlePolicy
Export-AzLogAnalyticThrottledRequest -Location "East US" -FromTime $fromTime -ToTime $toTime -BlobContainerSasUri $sasUri -GroupByApplicationId
