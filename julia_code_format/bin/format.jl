using ArgParse
using JuliaFormatter

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "--overwrite"
            action = :store_true
        "--indent"
            arg_type = Int
            default = 4
        "--margin"
            arg_type = Int
            default = 92
        "--for_in"
            action = :store_true
        "--whitespace_typedefs"
            action = :store_true
        "--whitespace_ops_in_indices"
            action = :store_true
        "--remove_extra_newlines"
            action = :store_true
        "--path"
            required = true
    end

    return parse_args(s)
end


function main()
    parsed_args = parse_commandline()
    # println("Parsed args:")
    # for (arg,val) in parsed_args
    #     println("  $arg  =>  $val\t", typeof(val))
    # end

    for (arg, val) in parsed_args
        a = Symbol(arg)
        @eval $a = $val
    end

    format(
        path,
        overwrite                   = overwrite,
        verbose                     = false,
        indent                      = indent,
        margin                      = margin,
        always_for_in               = for_in,
        whitespace_typedefs         = whitespace_typedefs,
        whitespace_ops_in_indices   = whitespace_ops_in_indices,
        remove_extra_newlines       = remove_extra_newlines,
        style                       = DefaultStyle()
    )
end

main()
