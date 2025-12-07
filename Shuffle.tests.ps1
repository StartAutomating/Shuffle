<#
.SYNOPSIS
    Shuffle Tests
.DESCRIPTION
    Tests for the shuffle module.
.NOTES
    These tests have a 1/1024 chance of being a false positive.

    I am ok with those odds.
#>
describe Shuffle {
    it 'Shuffles all input' {
        $shuffled = 1..1kb | shuffle
        $shuffled.Length | Should -be 1kb
        $shuffled[0] | Should -BeGreaterThan 1
    }

    it 'Shuffles all arguments' {
        $shuffled =  shuffle (1..1kb)
        $shuffled.Length | Should -be 1kb
        $shuffled[0] | Should -BeGreaterThan 1
    }

}
