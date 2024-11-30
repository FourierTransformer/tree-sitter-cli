# tree-sitter-cli
This repo contains all the rockspecs that can be used to install the tree-sitter CLI via LuaRocks. It can be installed via:

```bash
luarocks install tree-sitter-cli
```

or included as a dependency in a rockspec file:

```lua
-- and should specify the specific version, ex: 0.24.4
dependencies = { "tree-sitter-cli==0.24.4" }
```

## Updating

### New tree-sitter
When a new release of tree-sitter is out, adding the tag to `versions.tl` and running `tl run generate_rockspecs.tl` should be all that is required to generate the new rockspecs.

### New luarocks-build-tree-sitter-cli
The actual download/install logic is in [luarocks-build-tree-sitter-cli](https://github.com/FourierTransformer/luarocks-build-tree-sitter-cli). If that gets updated (ex: a new CPU arch mapping), updating the version of it `rockspec_template.txt` and re-running `tl run generate_rockspecs.tl`.

## Why?
This is useful for applications that are in the Lua space where they don't want the user to have to install the `tree-sitter` command via external means (`npm` or `cargo`) to be used in a Lua package. This also allows targeting a specific version of the tree-sitter CLI to match the ones that is used within their application.
