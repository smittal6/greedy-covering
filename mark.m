#mark function: Marks and increases the mcount value.

function mark(a,b,c)
global allt;
global mcount;
global k=5; 
global v=2;
global t=3;
sz=size(allt);
initial=1;
final=sz(1,1);
while(initial<=final)
  mid=floor((initial+final)/2);
	if (allt(mid,1)==a)&&(allt(mid,2)==b)&&(allt(mid,3)==c)	
    allt(mid,4)=1;
    mcount++;
    return;
  else
			if (a>allt(mid,1))||((a==allt(mid,1))&&(b>allt(mid,2)))||((a==allt(mid,1))&&(b==allt(mid,2))&&(c>allt(mid,3)))
				initial=mid+1;
			else
				final=mid-1;
      end
  endif
endwhile
endfunction