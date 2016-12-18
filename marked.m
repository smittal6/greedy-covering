#finds the tuple, and if it is marked or not.
#marked: means it is covered.
function f=marked(a,b,c,allt)
allt;
sz=size(allt);
initial=0;
final=sz(1,1)-1;
while(initial<=final)
  mid=floor((initial+final)/2);
	if (allt(mid,1)==a)&&(allt(mid,2)==b)&&(allt(mid,3)==c)
			if (allt(mid,4)==1)
				f=1;
      endif
			f=0;
      return;
		
	else
			if (a>allt(mid,1))||((a==allt(mid,1))&&(b>allt(mid,2)))||((a==allt(mid,1))&&(b==allt(mid,2))&&(c>allt(mid,3)))
				initial=mid+1;
			else
				final=mid-1;
      end
  endif
endwhile
f=0;
end