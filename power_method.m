function [lambda,v,num] = power_method(A,iter,N)
    [r,c] = size(A);
    if r~=c
       error('Not a square matrix') 
    end
    X_0 = ones(r,1);
    X_1 = ones(r,1);
    
    if N==0
        for i=1:iter
            X_1 = A*X_0;
            [lambda1,idx] = max((X_1));
            if X_1(idx) < 0
                lambda1 = -lambda1;
            end
            X_1 = X_1/lambda1;
            X_0 = X_1;
        end
        lambda = lambda1;
        v = X_1/norm(X_1);
        num = i;
    end
    
    if N==1
        for i=1:iter
            X_1 = A*X_0;
            lambda1 = (X_1'*X_0)/(X_0'*X_0);
            X_1 = X_1/lambda1;
            X_0 = X_1;
        end
        lambda = lambda1;
        v = X_1/norm(X_1);
        num = i;
    end
    
    % For symmetric matrices (for faster convergence)
    if N==2
        X_0 = X_0/norm(X_0);
        for i=1:iter
            X_1 = A*X_0;
            lambda1 = X_0'*X_1;
            X_0 = X_1/sqrt(X_1'*X_1);
        end
        lambda = lambda1;
        v = X_0;
        num = i;
    end
end
