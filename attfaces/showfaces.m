function showfaces(X)

n = size(X,2);
if n > 16, error('A maximum of 16 faces please!'), end
rows = ceil(n/4);

for j = 1:n
  subplot(rows,ceil(n/rows),j)
  imshow(reshape(X(:,j),[112 92]),[0 255])
end
