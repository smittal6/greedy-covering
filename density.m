#density function

function [fdensity,valuemax] = density (cover,free,fixed,testfactor,i)
  global table=[0,2,4,6,8;1,3,5,7,9;];
  global allt;
  global k=5; 
  global v=2;
  global t=3;
  sigmadensity=0;
  mdensity=0;
  #Section1: taking fixed factors.
  #To chose t-1 fixed factors. obviously 2 possible tuples, corresponding to 2 values of the test factor
  tempcomb=nchoosek(fixed,t-1);

  for i=1:v
    tempdensity=0;    
    for j=1:size(tempcomb)(1,1) 
      sortresult=sort([cover(i,tempcomb(j,1)) cover(i,tempcomb(j,2)) table(i,testfactor)]);
      tempdensity+=!marked(sortresult(1,1),sortresult(1,2),sortresult(1,3),0);
    endfor
    
    #Section2: Taking one free(1-restricted) and others fixed.
    
    freeset=nchoosek(free,1); #1-restricted case, so this becomes specific here.
    #A variable for controlling which free variable and a variable for which value of the factor 
    fixedset=nchoosek(fixed,t-2);
    #A variable for controlling the rows of fixed set.
    
    for j=1:size(freeset)(1,1)
      for z=1:v
        for rfixed=1:size(fixedset)(1,1)
          sortresult=sort([cover(i,fixedset(rfixed,1)) table(z,freeset(j,1)) table(i,testfactor)]);
          tempdensity+=(!marked(sortresult(1,1),sortresult(1,2),sortresult(1,3),0))/v;
        endfor
      endfor
    endfor
    sigmadensity+=tempdensity;
    if(tempdensity>=mdensity)
      mdensity=tempdensity;
      valuemax=table(i,testfactor); #Look into this later...
    endif
  endfor #ending for outer 'for'  
  fdensity=sigmadensity/v;
end