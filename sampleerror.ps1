function set-something {
    [CmdletBinding(SupportsShouldProcess=$true,
                    confirmimpact='Medium')]
    param (
        [Parameter(mandatory=$true)]
        [string]$something
    )
    
    
    process {
        if ($PSCmdlet.ShouldProcess("$something", "Do you Really want to do this?")) {
            write-output 'Okay Task Completed'
        }
        else {
            write-output "You didn't not do it"
            }
    }
 
}