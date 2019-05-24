=begin
algo: computer makes a move:
- instantiate `empty_squares` and set to `[]`
- instantiate `choice` and set to `nil`
- for each `square` in `empty_squares`
  - [subalgo] if `square` can block an immediate threat,
    then set `choice` to `square`
  - else
    - set `choice` to random sample from `empty_squares`
- set `board` (at key of `square`) equal to the computer marker

subalgo: if `square` can block an immediate threat
- given `square` and `board`
- instantiate `can_block` and set to `false`
- for each `line` subarray in `winning_lines`
    if `square` is included in `line` and the other two elements
    represent keys of `board` that are equal to `player_marker`
      set `can_block` to `true`
- return `can_block`

=end
