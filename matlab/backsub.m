function x = backsub(R,v)
    x = zeros(size(v));
    n = length(x);
    for i = n:-1:1
        x(i) = (v(i) - R(i,i+1:n)*x(i+1:n))/R(i,i);
    end
end