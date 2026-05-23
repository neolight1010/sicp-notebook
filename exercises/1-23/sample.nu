#!/usr/bin/env nu
1..500 | each { || csi -s ./timed-prime-test.scm | lines } | flatten | each { |s| $s | str replace -r r#'([0-9]*.*\*\s)|(DONE)'# "" } | where { |r| not ($r | is-empty) } | into float | math avg

