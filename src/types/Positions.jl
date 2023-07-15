abstract type ChessPosition end

struct Rank <: ChessPosition 
    rank::Int
end

struct File <: ChessPosition
    file::Int
end

struct Position <: ChessPosition
    rank::Rank
    file::File
end
