function Get-KvInfo {
    [CmdletBinding()]
    param (
        [parameter(mandatory=$true,
                    valuefrompipeline=$true,
                    valuefrompipelinebypropertyname=$true,
                    helpmessage= 'One or More KV names')]
        [validatePattern("(?=\S*['-])([a-zA-Z'-]+)")]
        [Alias('Key')]            
        [string[]]$kv,
        #switch to turnon error logging
        [switch]$ErrorLog,
        [string]$LogFile = '/Users/path/PS-Learn/log.txt'
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
            $kk=Get-AzKeyVault -VaultName $c

            $Prop=[ordered]@{
                'Name'=$c
                'Location'=$kk.Location
                'SKU'=$kk.SKU
                'Resource-ID'=$kk.ResourceId
                'Soft Delete Enabled?'=$kk.EnableSoftDelete
            }
            $object=New-Object -TypeName PSObject -Property $Prop
            write-output $object
        }
    }
    
    end {
        
    }
}