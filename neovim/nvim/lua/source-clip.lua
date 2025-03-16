local M = {}

function M.source_clip(opts)
    local target_dir = opts.args

    if target_dir == nil or target_dir == "" then
        print("ディレクトリを指定してください。例）:SrcClip ~/projects/projectXXX")
        return
    end

    -- "~" を展開して絶対パスに変換
    target_dir = vim.fn.expand(target_dir)

    -- .source-clip のパスも "~" を展開して正しいパスにする
    local exclude_file = vim.fn.expand("~/.config/nvim/lua/.source-clip")
    local exclude_patterns = {}

    -- .source-clip を読み込む
    if vim.fn.filereadable(exclude_file) == 1 then
        for _, line in ipairs(vim.fn.readfile(exclude_file)) do
            if line ~= "" then
                table.insert(exclude_patterns, line)
            end
        end
    end

    -- 指定ディレクトリ配下のすべてのファイルを取得
    local handle = io.popen('find "' .. target_dir .. '" -type f 2>/dev/null')
    if not handle then
        print("ファイルの検索に失敗しました。");
        return
    end

    local result = handle:read("*a")
    handle:close()

    local files_content = {}

    for file in string.gmatch(result, '([^\n]+)') do
        local exclude = false
        for _, pattern in ipairs(exclude_patterns) do
            local lua_pattern = "^" .. pattern
                :gsub("([%.%-%+%[%]%(%)%$%^%%])", "%%%1") -- 特殊文字をすべてエスケープ
                :gsub("%*", ".*") .. "$"                  -- '*' を Luaパターンに変換
            if file:match(lua_pattern) then
                exclude = true
                break
            end
        end

        if not exclude then
            local f = io.open(file, "r")
            if f then
                local content = f:read("*a")
                f:close()
                table.insert(files_content, "-- FILE: " .. file .. "\n" .. content)
            else
                print("Error opening file: " .. file)
            end
        end
    end

    if #files_content > 0 then
        local clipboard_content = table.concat(files_content, "\n\n")
        vim.fn.setreg('+', clipboard_content)
        print("ファイルの内容とパスをクリップボードにコピーしました。")
    else
        print("コピーするファイルがありませんでした。")
    end
end

return M
