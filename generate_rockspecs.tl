local versions = require("versions")

local template_file = io.open("rockspec_template.txt", "r")
local template = template_file:read("*all")
template_file:close()

local final_file: FILE
local final_file_contents: string
local version: string

for i, tag_version in ipairs(versions) do
   if tag_version:find("^v") then version = tag_version:sub(2) else version = tag_version end
   final_file_contents = string.format(template, version, tag_version)
   final_file = io.open(string.format("rockspecs/tree-sitter-cli-%s-1.rockspec", version), "w")
   final_file:write(final_file_contents)
   final_file:close()

   if i == 1 then
      version = "scm"
      final_file_contents = string.format(template, version, tag_version)
      final_file = io.open(string.format("tree-sitter-cli-%s-1.rockspec", version), "w")
      final_file:write(final_file_contents)
      final_file:close()
   end
end
