
# Shuffle

## Simple Shuffle with PowerShell

Everyday I'm shuffling, so I decided to make a quick function to simplify shuffle.

You can use this function, or you can do what this function does:

Provide an `-InputObject` to `Get-Random` and a `-Count` equal to the number of inputs.



## Installing and Importing

You can install this module from the PowerShell gallery

~~~PowerShell
Install-Mdoule Shuffle -Scope CurrentUser -Force
~~~

You can import the module with:

~~~PowerShell
Import-Module Shuffle -PassThru
~~~


You can also just include the command inline


~~~PowerShell
function Get-Shuffle {

    <#
    .SYNOPSIS
        Shuffles
    .DESCRIPTION
        Shuffles all inputs and arguments.
    .EXAMPLE
        # Pipe a bunch of numbers to shuffle
        1..10  | shuffle
    .EXAMPLE
        # Pipe a bunch of strings to shuffle
        'up', 'down', 'left', 'right' | shuffle
    .EXAMPLE
        # Shuffle a random range of numbers
        shuffle @(1..10)
    .EXAMPLE
        # Shuffle a pair of random number ranged
        shuffle @(1..10) @(-1..-10)
    .EXAMPLE
        # Make a deck of cards
        @(foreach ($suite in 'clubs', 'diamonds', 'hearts', 'spades') {
            foreach ($card in @(
                'Ace'; 2..10
                'Jack'; 'Queen'; 'King'
            )) {
                [Ordered]@{card=$card;suite=$suite}
            }
        }) | shuffle # and shuffle it.
    #>
    [Alias('shuffle')]
    param()
    # Gather all input and unroll it
    $allIn = @(@($input;$args) | . { process { $_ } })
    # return if there is no input
    if (-not $allIn) { return }
    # Get all input in random order.
    Get-Random -Count $allIn.Count -InputObject $allIn

}
~~~

