-- set lualine 
local function exec_shell(cmd, raw)
    local handle = assert(io.popen(cmd, 'r'))
    local output = assert(handle:read('*a'))

    handle:close()

    if raw then 
        return output 
    end

    output = string.gsub(
    string.gsub(
    string.gsub(output, '^%s+', ''), '%s+$', ''), 
    '[\n\r]+', ' '
    )

    return output
end


local function getMode()
    return string.upper(tostring(vim.api.nvim_get_mode()["mode"]))
end

local function getTimeAndBattery()
    local percentage = exec_shell('upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep "percentage" | grep -o "[0-9]*"')
    local time = os.date("*t")
    return ("%02d:%02d"):format(time.hour, time.min) .. "|" .. percentage .. "󱊣"
end


local function getProgress()
  local cur = vim.fn.line(".")
  local total = vim.fn.line("$")

  if cur == 1 then
    return "Top | " .. tostring(vim.fn.wordcount().words) .. "w | " .. total .. "l"
  elseif cur == total then
    return "Bot | " .. tostring(vim.fn.wordcount().words) .. "w | " .. total .. "l"
  else
    return math.floor(cur / total * 100) .. "%% | " .. tostring(vim.fn.wordcount().words) .. "w | " .. total .. "l"
  end

end


local function getSpotifyMetadata()    
    local status = exec_shell("playerctl --player=spotify status")

    if (status == "Playing") 
    then
        return exec_shell("playerctl --player=spotify metadata --format 'playing: {{ title }} | by {{ artist }}'")
    else
        return ""
    end

end


require("lualine").setup({
  options = {
    theme = "ayu_dark",
  },
  disabled_filetypes = {
      statusline = {"alpha", "startify"},
      winbar = {"alpha", "startify", "startup"},
    },
  sections = {
    lualine_a = { getMode },
    lualine_c = { "filename", getSpotifyMetadata },
    lualine_x = { "filetype" },
    lualine_y = { getProgress },
    lualine_z = { getTimeAndBattery }
  }
})
