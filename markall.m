#markall script which uses marked and mark functions

function markall(row,t)
global allt;
temp=nchoosek(row,t);
for i=1:size(temp)(1,1)
  if (!marked(temp(i,1),temp(i,2),temp(i,3))) #Mark only if not marked, else mcount would be increased unnecessarily
    mark(temp(i,1),temp(i,2),temp(i,3));
  endif
endfor
endfunction