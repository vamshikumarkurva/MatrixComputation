function [X,num] = Gauss_scidal(A,b,tol,iter)
    [r,c] = size(A);
    if r~=c 
        error('Not a square matrix')
    end
    
    D = tril(A);
    invD = inv(D);
    U = triu(A,1);
    
    X_0 = zeros(r,1);
    T = -invD*U;
    C = invD*b;
    
    for i=1:iter
       X_1 = T*X_0+C;
       err = norm(X_1-X_0);
       X_0 = X_1;
       if err<tol
           break;
       end
    end  
    X=X_1;
    num = i;
end