function Rf = cholesky(A)
    [r,c]=size(A);
    if r~=c
        error('Not a square matrix');
    end
    R = zeros(size(A));
    %cholesky decomposition
    for i=1:r
        for j=i:r
            if i==j
                sum1 = 0;
                for k=1:i-1
                   sum1 = sum1+R(k,j)*R(k,j);
                end
                sum1 = A(i,j)-sum1;
                if sum1 < 0
                    error('A is not symmetric positive definite');
                else
                    R(i,i) = sqrt(sum1);
                end
            else
                sum1=0;
                for k=1:i-1
                    sum1 = sum1+R(k,i)*R(k,j);
                end
                R(i,j) = (A(i,j)-sum1)/R(i,i);
            end
        end
    end
    Rf=R;
end

%{
     0     1     0     0     0     1     1
     1     0     1     0     0     0     0
     0     1     0     0     1     1     0
     0     0     0     0     1     0     0
     0     0     1     1     0     1     0
     1     0     1     0     1     0     1
     1     0     0     0     0     1     0
%}