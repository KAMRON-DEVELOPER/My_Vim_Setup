return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}


-- Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls

-- surround one word is = ysiw + character( (, {, ', ", or any )
-- surround whole line is = yss/ys$ + character( (, {, ', ", or any )
-- delete surrounding is = ds + character( (, {, ', ", or any )
-- change surrounding is = cs + character( (, {, ', ", or any )
-- change surrounding with new text is = cs + character + new text