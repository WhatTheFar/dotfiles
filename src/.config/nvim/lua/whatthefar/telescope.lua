local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").git_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/Projects/what_the_far/dotfiles/",
    })
end

return M
