pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
local sats
local game_start
local game_time
local sats_added_time

function _init()

	sats={
	make_sat("init"),
	make_sat("init"),
	make_sat("init"),
	make_sat("init"),
	make_sat("init"),
	make_sat("init"),
	make_sat("init"),
	make_sat("init"),
	make_sat("init")
	
	}

	add_sats(20)
end

function _update()
	local sat
	for sat in all(sats) do
		sat:update()
	end
	if btnp(4) then
		bump_state()
	end
	if (time() - sats_added_time > 10) then
		add_sats(20)
	end
end

function _draw()
	cls()
	rectfill(0,118,128,128,4)
	rectfill(0,114,128,118,12)
	rectfill(0,111,128,114,1)
	
	for sat in all(sats) do
		sat:draw()
	end
	rect(0,0,127,127,7)
	print(sats_added_time)
end

function make_sat(sat_type)
	local offset
	if (sat_type == "init") then
		offset = 128+rnd(100)
	else
		offset = 128+rnd(1000);
	end
	local sat={
		x=offset,
		y=rnd(50),
		state=0,
		speed=rnd(8)/4,
		update=function(self)
			self.x-=self.speed
			if (self.x < 1) then
				self.x = rnd(1000)+128
			end
		end,
		draw=function(self)
			if (self.x > 30) and (self.x < 64) then
				--shine_offset=16
				self:open()
			end
			spr(37+self.state,self.x,self.y)
		end,
		open=function(self)
			if (self.state < 4) then
				self.state+=1
				sfx(0)
			end
		end
	}
 return sat
end

function bump_state(sat)
		sat:open()
end

function add_sats(sat_count)
	sfx(1)
	for i=1,sat_count do
		add(sats,make_sat())
	end
	sats_added_time = flr(time())
end
__gfx__
00000000000c04990c4c000000cccc00000000008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000cccc49904c1cc001ccc7cc0000000008886600000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700c7cc70409917c7c01cddc7c0000000005688670000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000ccddd04099cdddc0cccddc00000000005588884000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000ccccc0c001ccccc01ccccc00000000000000888400000000000000000000000000000000000000000000000000000000000000000000000000000000
007007001ccccc40001cccc00c11c499000000000000568800000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000011ccc1000001cccc00000c44000000000000558000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c00c100000c000c00000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008800000000000000000000000000677000500000000000000000000000000000000000066000000000000000000000000000000000000000000000000000
00088800000000000006666000065550067705550000000000000000000000000000000000066000000000000000000000000000000000000000000000000000
0078850000000000000666600006555000665c500000000000000000000000000000066000066000000000000000000000000000000000000000000000000000
00888000000000000666c660065555500005550000000000000000000000000000000cc000066000000000000000000000000000000000000000000000000000
08880000000000000666666006555660005556700000000000000000000066000000660000066000000000000000000000000000000000000000000000000000
08500000000000000666600006c550000555006700000000000000000000cc000000cc0000066000000000000000000000000000000000000000000000000000
00000000000000000666600006666000050000060000000000066000000660000006600000066000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000066600000666000006660000066600000787000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000077000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000077000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000077000077000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000c000000010000077000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000077000000770000077000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000c0000000100000077000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000077000000770000007700000077000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000686000006960000069600000696000006b6000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000001740007300202003010010200602003020030200302003020010200101004010030200101002200002000020000000000000000000000000000000000000
001400001a6001f6000c610106201362016620196201c6201e630206302263025630256302563024630246302363021620216202262022620226202262022620226102361023610236102361022610206101e610
