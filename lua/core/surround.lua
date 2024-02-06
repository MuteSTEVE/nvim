-- Map Leader key
vim.g.mapleader = ' '

-- Define map as keybind
local map = vim.keymap.set
local nrs = { noremap = true, silent = true }

-- Surround
map('n', 's(', "viwc()<Esc>P", nrs)
map('n', 's[', "viwc[]<Esc>P", nrs)
map('n', 's{', "viwc{}<Esc>P", nrs)
map('n', "s'", "viwc''<Esc>P", nrs)
map('n', 's"', 'viwc""<Esc>P', nrs)
map('n', 's<', "viwc<><Esc>P", nrs)

-- (Change) surrounding
map('n', 's([', "ci([]<Esc>PF(xf)x", nrs)
map('n', 's({', "ci({}<Esc>PF(xf)x", nrs)
map('n', "s('", "ci(''<Esc>PF(xf)x", nrs)
map('n', 's("', 'ci(""<Esc>PF(xf)x', nrs)
map('n', 's(<', 'ci(<><Esc>PF(xf)x', nrs)

-- [Change] surrounding
map('n', 's[(', "ci[()<Esc>PF[xf]x", nrs)
map('n', 's[{', "ci[{}<Esc>PF[xf]x", nrs)
map('n', "s['", "ci[''<Esc>PF[xf]x", nrs)
map('n', 's["', 'ci[""<Esc>PF[xf]x', nrs)
map('n', 's[<', 'ci[<><Esc>PF[xf]x', nrs)

-- {Change} surrounding
map('n', 's{(', "ci{()<Esc>PF{xf}x", nrs)
map('n', 's{[', "ci{[]<Esc>PF{xf}x", nrs)
map('n', "s{'", "ci{''<Esc>PF{xf}x", nrs)
map('n', 's{"', 'ci{""<Esc>PF{xf}x', nrs)
map('n', 's{<', 'ci{<><Esc>PF{xf}x', nrs)

-- 'Change' surrounding
map('n', [[s'(]], [[ci'()<Esc>PF'xf'x]], nrs)
map('n', [[s'[]], [[ci'[]<Esc>PF'xf'x]], nrs)
map('n', [[s'{]], [[ci'{}<Esc>PF'xf'x]], nrs)
map('n', [[s'"]], [[ci'""<Esc>PF'xf'x]], nrs)
map('n', [[s'<]], [[ci'<><Esc>PF'xf'x]], nrs)

-- "Change" surrounding
map("n", [[s"(]], [[ci"()<Esc>PF"xf"x]], nrs)
map("n", [[s"[]], [[ci"[]<Esc>PF"xf"x]], nrs)
map("n", [[s"{]], [[ci"{}<Esc>PF"xf"x]], nrs)
map("n", [[s"']], [[ci"''<Esc>PF"xf"x]], nrs)
map("n", [[s"<]], [[ci"<><Esc>PF"xf"x]], nrs)

-- <Change> surrounding
map('n', 's<(', "ci<()<Esc>PF<xf>x", nrs)
map('n', 's<[', "ci<[]<Esc>PF<xf>x", nrs)
map('n', "s<'", "ci<''<Esc>PF<xf>x", nrs)
map('n', 's<"', 'ci<""<Esc>PF<xf>x', nrs)
map('n', 's<{', 'ci<{}<Esc>PF<xf>x', nrs)

-- Surround with spaces
map('n', 's)', "viwc( )<Esc>Pei <Esc>b", nrs)
map('n', 's]', "viwc[ ]<Esc>Pei <Esc>b", nrs)
map('n', 's}', "viwc{ }<Esc>Pei <Esc>b", nrs)
map('n', 's}', "viwc{ }<Esc>Pei <Esc>b", nrs)
map('n', 's>', "viwc< ><Esc>Pei <Esc>b", nrs)

-- (Change) surrounding with spaces
map('n', 'S(', "ci(( )<Esc>PF(xf)xi <Esc>b", nrs)
map('n', 'S[', "ci[[ ]<Esc>PF[xf]xi <Esc>b", nrs)
map('n', 'S{', "ci{{ }<Esc>PF{xf}xi <Esc>b", nrs)
map('n', "S'", [[ci'' '<Esc>PF'xf'xi <Esc>b]], nrs)
map('n', 'S"', [[ci"" "<Esc>PF"xfxi <Esc>b]], nrs)
map('n', 'S<', "ci<< ><Esc>PF<xf>xi <Esc>b", nrs)

-- ( Delete ) space surrounding
map('n', 'd(', "vi(<Esc>bhxelx")

-- (Delete) <surrounding>
map('n', 'ds', "viwdpb2h2x")
map('n', 'dS', "vf dpb3h3xelxb")
