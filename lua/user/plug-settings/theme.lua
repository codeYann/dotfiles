-- local status_ok, github_theme = pcall(require, "github-theme")
local status_ok, vscode_theme = pcall(require, "vscode")
-- local status_ok, dracula = pcall(require, "dracula")

if not status_ok then
  return
end

-- github_theme.setup({
--   theme_style = "light_default",
--   dark_sidebar = "true",
--   function_style = "italic"
-- })

vscode_theme.change_style("dark")
-- dracula.colors()
