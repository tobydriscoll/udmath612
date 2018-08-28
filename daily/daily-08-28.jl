A = rand(-4:4,5,3)
B = rand(-4:4,3,4)

C = A*B

C[2,3]

m = 5; n = 3; p = 4;
C = zeros(m,p);
for i = 1:m
    for j = 1:p
        for k = 1:n
            C[i,j] += A[i,k]*B[k,j]
        end
    end
end

C

m = 5; n = 3; p = 4;
C = zeros(m,p);
for i = 1:m
    for j = 1:p
        C[i,j] = sum( A[i,k]*B[k,j] for k = 1:n );
    end
end
C

m = 5; n = 3; p = 4;
C = [ sum( A[i,k]*B[k,j] for k = 1:n ) for i=1:m, j=1:p ]


# C is a matrix of inner products
i=2; j=3;
using LinearAlgebra
dot(A[i,:],B[:,j])
C = [ dot(A[i,:],B[:,j]) for i=1:m, j=1:p ]

# C columnwise is a linear combination of columns
C[:,j]
sum( B[k,j]*A[:,k] for k=1:n  )
hcat( [ sum( B[k,j]*A[:,k] for k=1:n  ) for j=1:p ]... )
q = [ sum( B[k,j]*A[:,k] for k=1:n  ) for j=1:p ];
hcat(q[1],q[2],q[3],q[4])

length(C)

length(q)

# C is a sum of outer products
sum( A[:,k]*B[k,:]' for k=1:n)

B[1,:]'

(B[1,:]')'
