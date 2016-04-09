function X = conjucate(A,b)
    [r,c]=size(A);
    if r~=c
        error('Not a square matrix');
    end
    L = tril(A,-1);
    U = triu(A,1);
    x = all(all(L==U'));
    if x==0
        error('Not a symmetric matrix');
    end
    
    X_0 = ones(c,1);
    R_0 = b-A*X_0;
    D_0 = b-A*X_0;
    for i=1:c
        L = A*D_0;
        A_0 = (R_0'*R_0)/(D_0'*L);
        X_1 = X_0 + A_0*D_0;
        R_1 = R_0 - A_0*L;
        Beta = (R_1'*R_1)/(R_0'*R_0);
        D_1 = R_1 + Beta*D_0;
        D_0 = D_1;
        R_0 = R_1;
        X_0 = X_1;
    end
    X = X_1;
end