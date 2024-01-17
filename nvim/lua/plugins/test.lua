return {
	"klen/nvim-test",
	event = "VeryLazy",
	config = function()
		require("nvim-test").setup()
	end,
}
