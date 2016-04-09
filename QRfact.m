function [U,R] = QRfact(A)
    [r,c] = size(A);
    if r~=c
        error('Not a square matrix');
    end
    
    U = zeros(size(A));
    R = zeros(c,c);
    
    %Gram-schmidt QR factorization method
    
    u1 = A(:,1);
    U(:,1) = u1/norm(u1);
    
    for i=2:c
       u2 = A(:,i);
       for k=1:i-1
            u2 = u2 -((A(:,i)'*U(:,k)))*U(:,k);
       end
       U(:,i) = u2/norm(u2);
    end
    R = U'*A;
end
