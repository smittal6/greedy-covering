# This script generates all possible 3 tuples.

global table=[0,2,4,6,8;1,3,5,7,9;];

global k=5; 
global v=2;
global t=3;
global mcount=0; #keeps track of marked tuples.
global allt;

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



#f=marked(0,2,9,allt)
fcount=0; #keeps track of fixed factors

#k,v,t,i,y



#cover is the covering array, with first test case as defined in the paper.
cover(1,:)=[0 2 4 6 8];
markall(cover(1,:),t);
 
i=2;
while (mcount<80)
  random=randperm(k,t-1);
  clear free;
  clear fixed;
  for j=1:size(random)(1,2);
    cover(i,random(1,j))=table(randi(2),random(1,j));
    fixed(1,j)=random(1,j);
  endfor
  
  fcount=t-1; #Updating the fcount, keeps tracked of fixed factors.(As of now random only)
  
  for y=1:k
    if(!ismember(y,fixed))
      free(1,end+1)=y;
    endif
  endfor
  #Above, free set was generated.  
  
  while (fcount<k)
    #for all free calculate factor density and the value which gives max coverage
    
    dmax=0; tempfactor=1;
    for z=1:size(free)(1,2)
      [t1 t2]=density(cover,free,fixed,free(1,z),i);
      if(t1 >= dmax)
        tempfactor = free(1,z);
        value=t2;
        dmax=t1;
      endif
    endfor  
    
    cover(i,tempfactor)=value; #using all the stuff done above
    
    fcount++; #one more factor fixed. 
    
    #update free and fixed vectors
    fixed(1,end+1)=tempfactor; #no issues with this as fixed is reinitialized everytime for each test case.
    free=free(free~=tempfactor);
  endwhile #inner while ends  

#mark all the possible 3 tuples, if not marked all ready!
markall(cover(i,:),t);
i++;
endwhile  