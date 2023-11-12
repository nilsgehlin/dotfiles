vim.print("MoveToFile loaded...")

local function ParseRoot()
  local parser = require("nvim-treesitter.parsers").get_parser()
  if parser == nil then
    return nil
  end

  return parser:parse()[1]:root()
end

local function GetNameSpaceLine(root)
  for node in root:iter_children() do
    if node:type() == 'file_scoped_namespace_declaration' then
      local startLine = node:range() + 1
      local decl = vim.fn.getline(startLine)
      return decl
    end
  end
end

---@param root TSNode
---@param lineStart integer
local function GetClassName(root, lineStart)
  for root_node in root:iter_children() do
    for node in root_node:iter_children() do
      if node:type() == 'class_declaration' and vim.treesitter.is_in_node_range(node, lineStart, 1) then
        for child_node in node:iter_children() do
          if child_node:type() == 'identifier' then
            return vim.treesitter.get_node_text(child_node, 0)
          end
        end
      end
    end
  end

  return ''
end

vim.api.nvim_create_user_command("NewFile",
  function(args)
    local fileExtension = vim.api.nvim_buf_get_name(0):match("[^.]+$")

    local lines
    local nameSpaceLine
    local className = ""
    if args.range > 0 then
      lines = vim.fn.getline(args.line1, args.line2)
      local rootNode = ParseRoot()
      if rootNode ~= nil then
        nameSpaceLine = GetNameSpaceLine(rootNode)
        className = GetClassName(rootNode, args.line1)
      end
    end

    vim.ui.input({
        prompt = "Filename: ",
        default = className
      },
      function(input)
        if input == nil or input == "" then
          return
        end
        local directory = vim.api.nvim_buf_get_name(0):match("(.*/)")
        vim.fn.deletebufline(vim.fn.bufname(), args.line1, args.line2)
        vim.cmd.w()
        vim.cmd.e(string.format('%s/%s.%s', directory, input, fileExtension))
        if args.range > 0 then
          vim.api.nvim_buf_set_lines(0, 0, 1, false, { nameSpaceLine })
          vim.api.nvim_buf_set_lines(0, 1, 2, false, { '' })
          vim.api.nvim_buf_set_lines(0, 2, 2 + args.range, false, lines)
        end
        vim.cmd.w()
      end)
  end,
  { desc = 'Create new file, containing the selected text', range = true })
