# SBCP.jl

_Sam Buercklin's Chess Program dot Jay Ell_

A chess simulator and terminal renderer for chess

## Plans

* [ ] Absolute MVP:
    * [x] Basic types for tracking the state (pieces, colors, board)
    * [x] Rendering game using ASCII to terminal
    * [ ] Logic for managing simulation (legal rules, terminal conditions)
    * [ ] Command line interface for playing a game
    * [ ] Parse PGN to play a game
* [ ] v0.2:
    * [ ] `Crayons.jl` for pretty rendering of the game
    * [ ] Efficient representations of pieces (`FieldFlags.jl`, `SumTypes.jl`)
    * [ ] Formalize interface for tracking state of game (including move history)
