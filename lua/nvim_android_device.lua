local M = {}

local function is_flutter_project()
	local cwd = vim.fn.getcwd()
	return vim.fn.filereadable(cwd .. "/pubspec.yaml") == 1
end

function M.get_attached_device()
	if not is_flutter_project() then
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
