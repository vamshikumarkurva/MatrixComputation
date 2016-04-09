function [X, num] = Jacobi_lin(A,b,tol,iter)
    [r,c] = size(A);
    if r~=c 
        error('Not a square matrix')
    end
    
    if any(diag(A)==0)
        error('Diagonal elements should not be zero');
    end
    
    D = diag(diag(A));
    invD = diag(1./diag(A));
    
    X_0 = zeros(r,1);
    ND = A-D;
    T = -invD*ND;
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