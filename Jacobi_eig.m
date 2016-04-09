function [Q,D] = Jacobi_eig(A,tol)
    [r,c] = size(A);
    if r~=c
        error('Not a square matrix');
    end
    
    L = tril(A,-1);
    U = triu(A,1);
    x = all(all(L==U'));
    if x==0
        error('Not a symmetric matrix');
    end
    
    %sumof non-diagonal elements
    err = sum(sum(abs(A)))-sum(diag(abs(A)));
    D = A;
    Q = eye(r);
    
    while(err > tol)
        ND = abs(D) - diag(diag(abs(D)));
        [y,idr] = max((ND));
        [~,idc] = max(y);
        i = idr(idc);
        j = idc;
        
        if i>j
            a=i;
            i=j;
            j=a;
        end
        
        if D(i,i)==D(j,j)
            if D(i,j)<0
                alpha = -pi/4;
            else
                alpha = pi/4;
            end
        else
            alpha = 0.5*atan(2*D(i,j)/(D(i,i)-D(j,j)));
        end
        
        G = eye(r);
        G(i,i) = cos(alpha);
        G(j,j) = cos(alpha);
        G(i,j) = -sin(alpha);
        G(j,i) = sin(alpha);
        Q = Q*G;
        D = G'*D*G;
        err = sum(sum(abs(D)))-sum(diag(abs(D)));
    end
       
end