-- .//F_找方块小游戏.xlsx block_score_config
-- id:类型  score:分数区间  star:评分  Grade:评分 
local block_score_config = {
	[1] = {
		id = 1,
		score = {1,30},
		star = 1,
		Grade = normal,
	},
	[2] = {
		id = 2,
		score = {31,60},
		star = 2,
		Grade = good,
	},
	[3] = {
		id = 3,
		score = {61,90},
		star = 3,
		Grade = great,
	},
	[4] = {
		id = 4,
		score = {91,120},
		star = 4,
		Grade = excellent,
	},
	[5] = {
		id = 5,
		score = {121,150},
		star = 5,
		Grade = perfect,
	},
}

return block_score_config