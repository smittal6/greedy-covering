#finds the tuple, and if it is marked or not.
#marked: means it is covered.
#Lets have it in a mode form(Yet to be implemented) 
# 0: check if marked or not
# 1: mark it as covered

function f=marked(a,b,c,mode)
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
		if (mode==0)	
      if (allt(mid,4)==1)
				f=1;
      endif
			f=0;
      return;
    endif
    if (mode==1)
      allt(mid,4)=1;
      mcount++;
      return;
    endif  
	else
			if (a>allt(mid,1))||((a==allt(mid,1))&&(b>allt(mid,2)))||((a==allt(mid,1))&&(b==allt(mid,2))&&(c>allt(mid,3)))
				initial=mid+1;
			else
				final=mid-1;
      end
  endif
endwhile
f=0;
endfunction