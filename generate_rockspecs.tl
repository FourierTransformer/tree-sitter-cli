local versions = require("versions")
local luarocks_revisions: {string:{string}} = require("luarocks_revisions")

local template_file = io.open("rockspec_template.txt", "r")
local template = template_file:read("*all")
template_file:close()

local function export_rockspec(tag_version: string, revision: string, filename?: string)
   filename = filename or "rockspecs/tree-sitter-cli-%s-".. revision ..".rockspec"

   local version: string
   if tag_version:find("^v") then version = tag_version:sub(2) else version = tag_version end
   
   local final_file_contents = string.format(template, version, tag_version)
   local final_file = io.open(string.format(filename, version), "w")
   final_file:write(final_file_contents)
   final_file:close()
end

local function main()
   for i, tag_version in ipairs(versions) do
      export_rockspec(tag_version, "1")

      if i == 1 then
         export_rockspec("scm", "1", "tree-sitter-cli-%s-1.rockspec")
      end
   end

   for revision, tag_versions in pairs(luarocks_revisions) do
      for _, tag_version in ipairs(tag_versions) do
         export_rockspec(tag_version, revision)
      end
   end
end

main()

