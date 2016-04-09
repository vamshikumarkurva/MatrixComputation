function [Q,R] = house_holder(A)
    [r,c] = size(A);
    H = eye(r);
    R = A;
    
    for i=1:c-1
       x = R(i:r,i);
       y = zeros(length(x),1);
       y(1) = norm(x);
       k = R(i,i);
       if k>0
           if all(x==y)
               continue;
           end
           w = x-y;
       else
           w = x+y;
       end
       w = w/norm(w);
       h = eye(length(x))-2*w*w';
       H1 = eye(r);
       H1(i:r,i:r)= h;
       R = H1*R;
       H = H1*H;
    end
    Q = H';
    
end