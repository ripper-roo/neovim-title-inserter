local TI_LinesAfter = 2
local TI_Uppercase = true

-- Check if file exists to avoid content rewriting
local function TI_FileExists(file)
	local f = io.open(file, "r")
	if f == nil then
		return false
	else
		io.close(f)
		return true
	end
end

local TI_Counter = 0
while TI_Counter < vim.fn.argc() do
	local TI_Title = vim.fn.argv(TI_Counter)

	if not TI_FileExists(TI_Title) then
		local TI_List

		-- Uppercase treatment
		if TI_Uppercase then
			TI_List = {string.upper(TI_Title)}	-- Depends on system locale
		else
			TI_List = {TI_Title}
		end

		-- Put line breaks
		for i = 1, TI_LinesAfter, 1 do
			TI_List[i+1] = ""
		end
		
		-- Write to the file
		vim.fn.writefile(TI_List, TI_Title, "a")
	end

	TI_Counter = TI_Counter + 1
end
