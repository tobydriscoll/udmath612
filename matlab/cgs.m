function [Q,R] = cgs(A)
    [m,n] = size(A);
    Q = zeros(m,n);
    R = zeros(n,n);
    for j = 1:n
        v = A(:,j);
        for k = 1:j-1
            R(k,j) = Q(:,k)'*A(:,j);
            v = v - R(k,j)*Q(:,k);
        end
        R(j,j) = norm(v);
        Q(:,j) = v/R(j,j);
    end
end  