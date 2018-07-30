function Write-Log{
    <#
        .SYNOPSIS
            Performs loggind based on configuration
        .DESCRIPTION
            Performs logging. If set LogToFile will log info to file. Or will just output the 
            message. Also supports VerboseOutput
        .PARAMETER LogToFIle
            Switch. specifies if message should be logged to file.
        .PARAMETER LogFileName
            Filename to log to. Default is posh-log.log
        .PARAMETER LogFileDir 
            Directory for log file. Defaults is 
            
        .EXAMPLE
     
    #>
    [CmdletBinding(DefaultParametersetName='None')] 
    param(
        [Parameter(ParameterSetName='LogToFile',Mandatory=$true)]
        [switch]$LogToFile=$false,
        [Parameter(ParameterSetName='LogToFile',Mandatory=$false)]
        [string]$LogFileName="posh-log.log",
        [Parameter(ParameterSetName='LogToFile',Mandatory=$false)]
        [string]$LogFileDir="C:\temp"
        #$env:TEMP

    )
    BEGIN {
        write-verbose "Starting Write-Log"
    }
	PROCESS {
        "testas" | Out-File -FilePath "$LogFileDir\$LogFileName" -Append
    }
	END {}    
}
Export-ModuleMember -Function 'Write-Log'