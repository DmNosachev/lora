local lfs = require("lfs")

module = "lora"

typesetexe = "lualatex"

typesetfiles = {
  "*.dtx",
  "*.tex"
}

textfiles = {
  "README.md",
  "LICENSE",
  "lora-fonts/OFL.txt"
}

sourcefiles = {
  "*.dtx",
  "*.ins",
  "*.ttf",
  "*.fontspec"
}

installfiles = {
  "*.sty",
  "*.ttf",
  "*.fontspec"
}

cleanfiles = {
  "*.log",
  "*.pdf",
  "*.zip",
  "*.ttf"
}

tdslocations = {
  ["fonts/truetype/public/lora/*.ttf"] = "*.ttf",
}

local function copy_file(source, destination)
    local infile = io.open(source, "rb")
    if not infile then return nil, "Source file not found" end
    
    local content = infile:read("*all")
    infile:close()
    
    local outfile = io.open(destination, "wb")
    if not outfile then return nil, "Could not create destination file" end
    
    outfile:write(content)
    outfile:close()
    
    return true
end

local old_unpack = unpack

function post_unpack_hook()
  copy_file("lora-fonts/fonts/variable/Lora[wght].ttf", "Lora.ttf")
  copy_file("lora-fonts/fonts/variable/Lora-Italic[wght].ttf", "Lora-Italic.ttf")
  return 0
end

function unpack()
  local errorlevel = old_unpack()
  if errorlevel ~= 0 then 
    return errorlevel 
  end
  return post_unpack_hook()
end