{
  vim = {
    keymaps = [
      # Next buffer.
      {
        key = "<Tab>";
        mode = "n";
        silent = true;
        action = "<cmd>bnext<CR>";
      }
      # Previous buffer.
      {
        key = "<S-Tab>";
        mode = "n";
        silent = true;
        action = "<cmd>bprevious<CR>";
      }
      # Resize splits.
      {
        key = "<S-Left>";
        mode = "n";
        silent = true;
        action = "<cmd>vertical resize -2<CR>";
      }
      {
        key = "<S-Right>";
        mode = "n";
        silent = true;
        action = "<cmd>vertical resize +2<CR>";
      }
      # Remove search highlight.
      {
        key = "<leader>nh";
        mode = "n";
        silent = true;
        action = "<cmd>nohlsearch<CR>";
      }
      # Move in splits with hjkl.
      {
        key = "<leader>h";
        mode = "n";
        silent = true;
        action = "<cmd>wincmd h<CR>";
      }
      {
        key = "<leader>j";
        mode = "n";
        silent = true;
        action = "<cmd>wincmd j<CR>";
      }
      {
        key = "<leader>k";
        mode = "n";
        silent = true;
        action = "<cmd>wincmd k<CR>";
      }
      {
        key = "<leader>l";
        mode = "n";
        silent = true;
        action = "<cmd>wincmd l<CR>";
      }
      # Move to first character in line.
      {
        key = "<Home>";
        mode = "n";
        silent = true;
        action = "^";
      }
      # Current line diagnostics.
      {
        key = "<leader>k";
        mode = "n";
        silent = true;
        action = "<cmd> lua vim.diagnostic.open_float()<CR>";
      }
      # Cycle diagnostics.
      {
        key = "k";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      }
      # Replace all in file.
      {
        key = "<leader>ra";
        mode = "n";
        silent = false;
        action = ":%s//g<Left><Left>";
      }
      # Oil
      {
        key = "<C-o>";
        mode = "n";
        silent = true;
        action = "<cmd>Oil --float<CR>";
      }
    ];
  };
}
