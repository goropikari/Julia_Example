
# How to use

```julia
# install denpendency packages
julia --project -e 'using Pkg; Pkg.instantiate()'
```

```
julia --project bin/format.jl --path FILE [--indent INDENT] [--always_for_in] [--whitespace_typedefs] [--whitespace_ops_in_indices] [--remove_extra_newlines]
```

Test
```
julia --project bin/format.jl --path test/ex.jl
```

# Docker
```bash
docker build -t jlformat .
docker run --rm -it -v (pwd):/home/jl jlformat
julia --project bin/format.jl --path FILE [--indent INDENT] [--always_for_in] [--whitespace_typedefs] [--whitespace_ops_in_indices] [--remove_extra_newlines]
```

Test
```
julia --project bin/format.jl --path test/ex.jl
```
