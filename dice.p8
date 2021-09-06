pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
p=print
sx=15
sy=14
r=1
function print_roll(t)
	l=0 o=4 i=8 y=15
	for te in all(t) do
		for v in all(te) do
			?v.." out of "..o,70,y,i 
			l+=v
			y+=6 
		end
		o+=2
		i+=1
		if (o>12) o=20 i=14
	end
	?"total:"..l,0,110,3
end

function init_t()
	t={{}}
	for x=1,6 do add(t, {}) end
end

function _init()
	init_t()
	poke(0x5f2d, 0x1)
	menuitem(1, "reset total", init_t)
end

function _update()
	k=stat(31) n=0 tt=false
	tc=#t[1]+#t[2]+#t[3]+#t[4]+#t[5]+#t[6]
	if(tc<16) then
		-- can make this similar to the top loop
		if (k=="1") n=flr(rnd(4))+1 add(t[1],n)
		if (k=="2") n=flr(rnd(6))+1 add(t[2],n)
		if (k=="3") n=flr(rnd(8))+1 add(t[3],n)
		if (k=="4") n=flr(rnd(10))+1 add(t[4],n)
		if (k=="5") n=flr(rnd(12))+1 add(t[5],n)
		if (k=="6") n=flr(rnd(20))+1 add(t[6],n)
	else
		tt=true
	end
	
	if(tc<16) then
		if (btnp(0) and sx>10) sx-=10 r-=1
		if (btnp(1) and sx<20) sx+=10 r+=1
		if (btnp(2) and sy>13) sy-=10 r-=2--up
		if (btnp(3) and sy<30) sy+=10 r+=2--down
		if (btnp(4)) then
			if (r==1) n=flr(rnd(4))+1 add(t[1],n)
			if (r==2) n=flr(rnd(6))+1 add(t[2],n)
			if (r==3) n=flr(rnd(8))+1 add(t[3],n)
			if (r==4) n=flr(rnd(10))+1 add(t[4],n)
			if (r==5) n=flr(rnd(12))+1 add(t[5],n)
			if (r==6) n=flr(rnd(20))+1 add(t[6],n)
		end
	end
end

function _draw()
	cls(2)
	rectfill(0,0,127,13)
	line(0,13,7,0,0)
	line(0,9,4,0,0)
	line(0,4,1,0,0)
	rectfill(0,110,127,127,1)
	rect(64,14,127,110,1)
	rect(sx,sy,sx+10,sy+10,5)
	print_roll(t)
	if (tt==true) p("reset total from pause menu",3)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
