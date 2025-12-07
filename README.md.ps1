@'

# Shuffle

## Simple Shuffle with PowerShell

Everyday I'm shuffling, so I decided to make a quick function to simplify shuffle.

You can use this function, or you can do what this function does:

Provide an `-InputObject` to `Get-Random` and a `-Count` equal to the number of inputs.


'@

@'

## Installing and Importing

You can install this module from the PowerShell gallery

~~~PowerShell
Install-Mdoule Shuffle -Scope CurrentUser -Force
~~~

You can import the module with:

~~~PowerShell
Import-Module Shuffle -PassThru
~~~

'@

@"

You can also just include the command inline


~~~PowerShell
$(
    $command = (Get-Command Get-Shuffle)
"function $($command.Name) {
$($command.Definition)
}"        
)
~~~

"@
