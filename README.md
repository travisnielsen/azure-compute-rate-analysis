# Rate Limiting Analysuis

This is a set of scripts to assist with analysis of Azure API call rates and throttling errors. It is based on this document: [Troubleshooting API throttling errors](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/troubleshooting-throttling-errors?source=recommendations#api-call-rate-and-throttling-error-analyzer)

## Prerequisites

* Recent version of [PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3)
* Recent version of the [Azure PowerShell Module](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell?view=azps-10.1.0)
* A blob storage account with a Shared Access Signature for create / write operations (set at the container level)

## Configuration

Create a file name `config.json` in the `/scripts` directory and add the following details:

```json
{
    "subscriptionName": "[your_subscription_name]",
    "tenantId": "[your_tenant_id]",
    "sasUri": "[your_sas_uri]"
}
```

Open a PowerShell terminal, switch to the `scripts` directory, and run `export-stats.ps1`. You may need to run individual commands step-by-step. Output files will be written to the container your specified in the SAS URI. You may use Azure Storage Explorer or the Storage Browser in the Azure Portal to access the files.
