rockspec_format = "3.0"

package = "tree-sitter-cli"
local v = "0.24.4"
version = "scm-1"

source = {
   url = "git://github.com/FourierTransformer/tree-sitter-cli.git",
   -- tag = v
}

description = {
   license = "MIT"
}

supported_platforms = {"linux", "macosx", "windows"}

dependencies = {
   "luarocks-build-tree-sitter-cli",
}

build = {
   type = "tree-sitter-cli",
   tree_sitter_version = "0.24.4",
   install = {
      bin = {
         ['tree-sitter'] = 'tree-sitter'
      }
   }
}

