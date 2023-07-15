module SBCP

include("types/Positions.jl")
include("types/Pieces.jl")
include("types/GameState.jl")

include("drawing.jl")

function starting_board()
    white_pieces = ChessSideCollection((
        pawn_rank(2, WhitePiece)..., back_rank(WhitePiece)...
    ))
    black_pieces = ChessSideCollection((
        pawn_rank(7, BlackPiece)..., back_rank(BlackPiece)...
    ))

    return Board(white_pieces, black_pieces)
end

function pawn_rank(r, ::Type{T}) where {T<:ChessSide}
    return ntuple(8) do f
        T(Pawn(false, Position(Rank(r), File(f))))
    end
end

function back_rank(::Type{T}) where {T<:ChessSide}
    # Assumes only WhitePiece, BlackPiece are passed in
    king_file = 4
    queen_file = 5
    rank = T <: WhitePiece ? 1 : 8
    return ntuple(8) do f
        position = Position(Rank(rank), File(f))
        if f in (1, 8)
            T(Rook(false, position))
        elseif f in (2, 7)
            T(Knight(position))
        elseif f in (3, 6)
            T(Bishop(position))
        elseif f == king_file
            T(King(false, position))
        elseif f == queen_file
            T(Queen(position))
        else
            error("Invalid file $f")
        end
    end
end

end # module SBCP
