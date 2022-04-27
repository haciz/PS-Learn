function Verb-Noun {
    [CmdletBinding()]
    param (
        [parameter(valuefrompipeline=$true)]
        [int]$x
        #[parameter()][string]$myInt
    )
    
    begin {$total = 0
        
    }
    
    process {$total += $x
        
    }
    
    end { "total = $total"
        
    }
}