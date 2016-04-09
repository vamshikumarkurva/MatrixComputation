function [T,num] = schur_decomp(A,tol,iter)
    [r,c] = size(A);
    if r~=c
        error('Not a square matrix')
    end
    
    T=A;
    for i=1:iter
        [Q,R] = house_holder(T);
         T = R*Q;
         if sum(abs(tril(T,-1))) < tol
             break;
         end
    end
    num = i;
    
    % tril(X) ----> returns lower diagonal part of the matrix
    % triu(X) ----> returns upper diagonal part of the matrix
    % tril(X,-1) ----> returns lower diagonal part of the matrix 
    %                  without diagonal elements 
    
end