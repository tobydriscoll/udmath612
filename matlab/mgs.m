function [Q,R] = mgs(A)
    [m,n] = size(A);
    Q = zeros(m,n);
    R = zeros(n,n);
    for k = 1:n
        R(k,k) = norm(A(:,k));
        Q(:,k) = A(:,k)/R(k,k);
        for j = k+1:n
            R(k,j) = Q(:,k)'*A(:,j);
        end
        A = A - Q(:,k)*R(k,:);
    end
end