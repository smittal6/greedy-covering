#markall script which uses marked function

function markall(row,t)
global allt;
temp=nchoosek(row,t);
for i=1:size(temp)(1,1)
  if (!marked(temp(i,1),temp(i,2),temp(i,3),0))
  marked(temp(i,1),temp(i,2),temp(i,3),1);
  endif
endfor
endfunction