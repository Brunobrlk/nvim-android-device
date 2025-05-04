local M = {}

local function is_android_or_flutter_project()
    local cwd = vim.fn.getcwd()

    local flutter_exists = vim.fn.filereadable(cwd .. "/pubspec.yaml") == 1
    local gradle_files = vim.fn.glob(cwd .. "/build.gradle*", false, true)
    local is_android_gradle = false

    for _, file in ipairs(gradle_files) do
        local lines = vim.fn.readfile(file)
        for _, line in ipairs(lines) do
            if line:lower():find("android") then
                is_android_gradle = true
                break
            end
        end
        if is_android_gradle then break end
    end

    return flutter_exists or is_android_gradle
end

function M.get_attached_device()
	if not is_android_or_flutter_project() then
		return ""
	end

	local handle = io.popen("adb devices -l")
	if handle == nil then
		return ""
	end

	local result = handle:read("*a")
	handle:close()

	if result and result ~= "" then
		for line in result:gmatch("[^\r\n]+") do
			local model = line:match("model:([%w%s_%-]+) device")
			if model then
				model = model:gsub("_", " ")
				return "📱 " .. model
			end
		end
	end

	return "No device connected"
end

function M.android_model()
	return M.get_attached_device()
end

return M
