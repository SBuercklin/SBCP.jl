function board_string(b)
    piece_locations = fill(' ', (8, 8))
    for p in (b.white.pieces..., b.black.pieces...)
        pos = get_position(p)
        piece_locations[pos.rank.rank, pos.file.file] = get_character(p)
    end

    s = [_top_edge()]
    for row in reverse(eachrow(piece_locations))
        push!(s, _board_line(row))
    end
    push!(s, _bottom_edge())

    s[1] = lpad(s[1], length(s[1]) + 2)
    s[end] = lpad(s[end], length(s[end]) + 2)

    for (i, textrow) in enumerate(s[2:(end - 1)])
        s[i + 1] = "$(9 - i) " * textrow
    end

    for i in 7:-1:1
        insert!(s, i + 2, "  " * _divider_line(17))
    end

    push!(s, _file_line())

    return mapreduce(_nl, *, s)
end

_nl(s) = s * '\n'

_top_edge() = '┌' * _horizontal_line(15) * '┐'
_horizontal_line(n::Int) = '-'^n
_divider_line(n::Int) = '|' * _horizontal_line(n - 2) * '|'

function _board_line(rank_row)
    s = mapreduce(*, rank_row) do c
        c * '|'
    end

    return '|' * s
end
_bottom_edge() = '└' * _horizontal_line(15) * '┘'
_file_line() = "  " * mapreduce(i -> " $i", *, FILE_CHARS)

const FILE_CHARS = 'a':'h'
