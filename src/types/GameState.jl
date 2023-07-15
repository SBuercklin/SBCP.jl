abstract type ChessSide end

struct WhitePiece{T<:ChessPiece} <: ChessSide
    piece::T
end

struct BlackPiece{T<:ChessPiece} <: ChessSide
    piece::T
end

iswhite(p::ChessSide) = p isa WhitePiece
isblack(p::ChessSide) = p isa BlackPiece
get_position(p::ChessSide) = get_position(p.piece)
get_special_flag(p::ChessSide) = get_special_flag(p.piece)
get_character(p::WhitePiece) = uppercase(get_character(p.piece))
get_character(p::BlackPiece) = lowercase(get_character(p.piece))

struct ChessSideCollection{T}
    pieces::T
end
function ChessSideCollection(t::T) where {T <: Tuple}
    @assert length(t) == 16 "Chess Side must have exactly 16 pieces"
    @assert (all(iswhite, t) || all(isblack, t)) "Chess Side must be of a single color"

    return ChessSideCollection{T}(t)
end

abstract type ChessBoard end

struct Board{TW, TB} <: ChessBoard 
    white::ChessSideCollection{TW}
    black::ChessSideCollection{TB}
end
