// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package proverb should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package proverb

import "fmt"

// Proverb should have a comment documenting it.
func Proverb(rhyme []string) []string {
	end := "And all for the want of a %s."
	switch len(rhyme) {
	case 0:
		return []string{}
	case 1:
		return []string{fmt.Sprintf(end, rhyme[0])}
	default:
		out := make([]string, 0, len(rhyme))
		for i := 0; i < len(rhyme) - 1; i++ {
			out = out[:len(out)+1]
			out[i] = fmt.Sprintf("For want of a %s the %s was lost.", rhyme[i], rhyme[i+1])
		}
		out = out[:len(out) + 1]
		out[len(rhyme) - 1] = fmt.Sprintf(end, rhyme[0])
		return out
	}
	return []string{}
}
