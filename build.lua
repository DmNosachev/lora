module = "lora"

typesetexe = "lualatex"
packtdszip = true

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
  "lora-fonts/fonts/variable/*.ttf"
}

installfiles = {
  "*.sty",
  "lora-fonts/fonts/variable/*.ttf"
}

tdslocations = {
  ["fonts/truetype/public/lora/*.ttf"] = "*.ttf",
}