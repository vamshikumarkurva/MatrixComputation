function H = Hessenberg(A)
    [r,c] = size(A);

    for i=1:c-2
       x = A(i+1:r,i);
       y = zeros(length(x),1);
       y(1) = norm(x);
       k = A(i+1,i);
       
       if k>0
           w = x-y;
       else
           w = x+y;
       end
       
       %w = x-y;
       w = w/norm(w);
       h = eye(length(x))-2*w*w';
       H1 = eye(r);
       H1(i+1:r,i+1:r)= h;
       A = H1'*A*H1;
    end
    H = A;
end