rockspec_format = "3.0"

package = "tree-sitter-cli"
version = "0.23.1-1"

source = {
   url = "git+https://github.com/FourierTransformer/tree-sitter-cli"
}

description = {
   license = "MIT"
}

supported_platforms = {"linux", "macosx", "windows"}

dependencies = {
   "luarocks-build-tree-sitter-cli==0.0.2",
}

build = {
   type = "tree-sitter-cli",
   tree_sitter_version = "v0.23.1",
   platforms = {
      windows = {
         install = {
            bin = {
               ['tree-sitter.exe'] = 'tree-sitter.exe'
            }
         }
      },
      linux = {
         install = {
            bin = {
               ['tree-sitter'] = 'tree-sitter'
            }
         }
      },
      macosx = {
         install = {
            bin = {
               ['tree-sitter'] = 'tree-sitter'
            }
         }
      }
   }
}
