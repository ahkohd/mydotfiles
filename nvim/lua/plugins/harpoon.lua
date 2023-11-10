return {
	"ThePrimeagen/harpoon",
	name = "harpoon",
	keys = {
		"<Tab>",
	},
	dependencies = { "anuvyklack/hydra.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local Hydra = require("hydra")

		harpoon.setup()

		Hydra({
			name = "Harpoon",
			mode = "n",
			body = "<Tab>",
			heads = {
				{ "<tab>", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add mark" } },
				{ "<Enter>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Quick menu" } },
				{ "<Left>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Prev mark" } },
				{ "<Right>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Next mark" } },
				{ "1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Goto 1" } },
				{ "2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Goto 2" } },
				{ "3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Goto 3" } },
				{ "4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Goto 4" } },
				{ "5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Goto 5" } },
				{ "6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Goto 6" } },
			},
		})
	end,
}
