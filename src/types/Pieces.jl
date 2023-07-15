abstract type ChessPiece end

#=
    Pawns hold a flag indicating if they double moved on their last move,
    in which case they can be captured by en passant
=#
struct Pawn <: ChessPiece
    double_moved::Bool
    position::Position
end

get_position(p::Pawn) = p.position
get_special_flag(p::Pawn) = p.double_moved
get_character(::Pawn) = 'p'

#=
    Rooks have a flag indicating whether they have moved this game or not.
    This is used to determine eligibility for castling
=#
struct Rook <: ChessPiece
    moved::Bool
    position::Position
end

get_position(p::Rook) = p.position
get_special_flag(p::Rook) = p.moved
get_character(::Rook) = 'r'

#=
    Kings have a flag indicating whether they have moved this game or not. 
    This is used to determine eligibility for castling
=#
struct King <: ChessPiece
    moved::Bool
    position::Position
end

get_position(p::King) = p.position
get_special_flag(p::King) = p.moved
get_character(::King) = 'k'

#=
    Knights just need their position
=#
struct Knight <: ChessPiece
    position::Position
end

get_position(p::Knight) = p.position
get_special_flag(::Knight) = false
get_character(::Knight) = 'n'

#=
    Bishops just need their position
=#
struct Bishop <: ChessPiece
    position::Position
end

get_position(p::Bishop) = p.position
get_special_flag(::Bishop) = false
get_character(::Bishop) = 'b'

#=
    Queens just need their position
=#
struct Queen <: ChessPiece
    position::Position
end

get_position(p::Queen) = p.position
get_special_flag(::Queen) = false
get_character(::Queen) = 'q'

#= 
    Null pieces are captured
=#
struct NullPiece <: ChessPiece end

get_position(::NullPiece) = nothing
get_special_flag(::NullPiece) = nothing
get_character(::NullPiece) = ' '
