# This script generates all possible 3 tuples.

table=[0,2,4,6,8;1,3,5,7,9;];

for c1=1:3
  for r1=1:2
    for c2=c1+1:4
      for r2=1:2
        for c3=c2+1:5
          for r3=1:2
            allt(end+1,:)=[table(r1,c1) table(r2,c2) table(r3,c3) 0];
          end
        end
       end
     end
  end
end
#all(:,end+1)=0;
persistent allt;
allt;
#f=marked(0,2,9,allt)
fcount=0; #keeps track of fixed factors
mcount=0; #keeps track of marked tuples.

#k,v,t,i,y

global k=5; 
global v=2;
global t=3;
#cover is the covering array, with first test case as defined in the paper.
cover(1,:)=[0 2 4 6 8]; 
i=2;
while (mcount<80)
  random=randperm(k,t-1);
  for j=1:size(random)(1,2);
    cover(i,random(1,j))=table(randi(2),random(1,j));
    fixed(1,j)=random(1,j);
  endfor
  fcount=t-1;
  for y=1:k
    if(!ismember(y,fixed))
      free(1,end+1)=y;
    endif  
  while (fcount<k)
    #for all free calculate factor density
    dmax=0; tempfactor=1;
    for z=1:size(free)(1,2)
      if(density(free,fixed,free(1,z) >= dmax)
        tempfactor=free(1,z);
    vdensity=0; #value density
    value=0; #value which gives max density
    #havnig chosen the factor with highest density, we find which value gives us greater coverage.
    fcount++;
    #update free and fixed vectors
  endwhile #inner while ends
#as all factors, with their values are fixed, now we can mark all the possible 3 tuples, if not marked all ready!
markall(allt,cover(i,:));
i++;
endwhile  