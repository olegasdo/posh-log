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
        [Parameter(Mandatory=$false)]
        [string]$LogMessage="LOG",
        [Parameter(Mandatory=$false)]
        [string]$LogMessageSeparator=" --- ",
        [Parameter(Mandatory=$false)]
        [string]$DateTimeFormat="yyyy-MM-dd HH:mm:ss.fff",
        [Parameter(ParameterSetName='LogToFile',Mandatory=$false)]
        [switch]$LogToFile=$false,
        [Parameter(ParameterSetName='LogToFile',Mandatory=$false)]
        [string]$LogFileName="posh-log.log",
        [Parameter(ParameterSetName='LogToFile',Mandatory=$false)]
        [string]$LogFileDir="C:\temp"
        #$env:TEMP

    )
    BEGIN {
        Write-Verbose "$((get-date).ToString($DateTimeFormat)) [BEGIN  ] Starting: $($MyInvocation.Mycommand)"  
    }
	PROCESS {
        "$((get-date).ToString($DateTimeFormat)) $LogMessageSeparator$LogMessage$LogMessageSeparator" | Out-File -FilePath "$LogFileDir\$LogFileName" -Append
    }
	END {
        Write-Verbose "$((get-date).ToString($DateTimeFormat)) [END    ] Ending: $($MyInvocation.Mycommand)"
    }    
}
Export-ModuleMember -Function 'Write-Log'