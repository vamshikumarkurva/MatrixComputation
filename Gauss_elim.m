function [aug,x,L,U] = Gauss_elim(A,B)
    [r,c] = size(A);
    if r~=c
        error('Not a square matrix');
    end
    
    AUG = [A B];
    disp('Augmented matrix');
    disp(AUG);
    X = zeros(r,1);
    r = size(AUG,1);
    N = r;
    L = eye(r);
    
    % Gaussian Elimination method
    % Reducing to Upper triangular matrix
    for n=1:N-1
      for i=n+1:N
          m = AUG(i,n) / AUG(n,n);
          for j=n+1:N+1   
            AUG(i,j) = AUG(i,j) - m*AUG(n,j);
          end
          AUG(i,n) = m;
          L(i,n) = m;
          %AUG(i,n) = 0;
      end
    end
    %Displaying the Upper triangular matrix
    %fprintf('Upper triangular matrix: \n');
    %disp(AUG);

    
   % Solving for X
   for i=N:-1:1
      sum1 = 0;
      for j=N:-1:i+1
        if j > i
          sum1 = sum1 + AUG(i,j)*X(j);
        end
      end
      X(i) = (AUG(i,N+1)-sum1)/AUG(i,i);
   end
   
   %return values
   aug = AUG;
   x = X;
   U = triu(AUG(1:r,1:r)); 
end
