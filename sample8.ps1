function Get-ADmoj {
    [CmdletBinding()]
    param (
        [parameter(mandatory=$true,
                    valuefrompipeline=$true,
                    valuefrompipelinebypropertyname=$true,
                    helpmessage= 'One or More KV names')]
        #[validatePattern("(?=\S*['-])([a-zA-Z'-]+)")]
        [Alias('Key')]            
        [string[]]$kv,
        #switch to turnon error logging
        [switch]$ErrorLog,
        #This is log file blabla
        [string]$LogFile = '/Users/stefan/PowerShell/PS-Learn/log.txt'
    )
    
    begin {
        if ($ErrorLog) { write-verbose 'Error Logging turned on'
        } else {
            write-verbose 'Error Logging turned off'
        }
        foreach ($c in $kv) {
            write-verbose "Computer: $c"
        }
    }
    
    process {
        foreach($c in $kv) {
            try{
            $kk=Get-AzADUser -DisplayName $c #-ErrorAction Stop -ErrorAction CurrentError

            $Prop=[ordered]@{
                'Name'=$c
                'ID'=$kk.ID
                'Mail'=$kk.Mail
            }
            $object=New-Object -TypeName PSObject -Property $Prop
            write-output $object
            }
    
        catch{
            write-warning 'Oh no this is a test warrning'
            If ($ErrorLog){
                get-date | out-file $LogFile -force
                $kv | out-file $LogFile -append
                #$currenterror | out-file $LogFile -append
            }
        
             }
        }
    }
}