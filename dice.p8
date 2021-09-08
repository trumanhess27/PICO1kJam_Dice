pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
p=print
sx=15
sy=14
r=1
function print_roll(t)
	l=0 o=4 i=8 y=15
--	for te in all(t) do
--		for v in all(te) do
--			?v.." out of "..o,70,y,i 
--			l+=v
--			y+=6 
--		end
--		o+=2
--		i+=1
--		if (o>12) o=20 i=14
--	end
--	?"total:"..l,0,110,3
	e={}
	e[4]=8
	e[6]=9
	e[8]=10
	e[10]=11
	e[12]=12
	e[20]=14
	for i=1,#t do
		if(i%2!=0) then
			j=t[i]
			l+=t[i]
		else
			b=e[t[i]]
			print(j.." out of "..t[i],70,y,b)
			y+=6
		end
	end
	?"total: "..l,0,110,3
end

function init_t()
	--t={{}}
	--for x=1,6 do add(t, {}) end
	t={}
end

function _init()
	init_t()
	poke(0x5f2d, 0x1)
	menuitem(1, "reset total", init_t)
end

function _update()
	k=stat(31) n=0 tt=false
	--tc=#t[1]+#t[2]+#t[3]+#t[4]+#t[5]+#t[6]
	tc=#t
--	if(tc<16) then
--		if (btnp(0) and sx>15) sx-=10 r-=1
--		if (btnp(1) and sx<20) sx+=10 r+=1
--		if (btnp(2) and sy>14) sy-=10 r-=2--up
--		if (btnp(3) and sy<30) sy+=10 r+=2--down
--		if (btnp(4)) then
--			if (r==1) n=flr(rnd(4))+1 add(t[1],n)
--			if (r==2) n=flr(rnd(6))+1 add(t[2],n)
--			if (r==3) n=flr(rnd(8))+1 add(t[3],n)
--			if (r==4) n=flr(rnd(10))+1 add(t[4],n)
--			if (r==5) n=flr(rnd(12))+1 add(t[5],n)
--			if (r==6) n=flr(rnd(20))+1 add(t[6],n)
--		end
--	else
--		tt=true
--	end
--end
	q=4
	if(tc<32) then
		if (btnp(0) and sx>15) sx-=10 r-=1
		if (btnp(1) and sx<20) sx+=10 r+=1
		if (btnp(2) and sy>14) sy-=10 r-=2--up
		if (btnp(3) and sy<30) sy+=10 r+=2--down
		if (btnp(4)) then
			for i=1,6do
				if(r==i) n=flr(rnd(q))+1 add(t,n) add(t,q)
				q+=2
				if(q>12) q=20
			end
		end
	else
		tt=true
	end
end

function _draw()
	cls(2)
	rectfill(0,0,127,13,3) --banner
	print("d&d dice roller",16,7,7)
	rectfill(0,110,127,127,1) --total section
	rectfill(0,14,63,109,15) --dice choice area
	rect(64,14,127,110,1) --dice roll area
	rect(sx,sy,sx+10,sy+10,5) --selector
	rectfill(26,15,34,23,6) --d6
	print("d6",27,17,9)
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
