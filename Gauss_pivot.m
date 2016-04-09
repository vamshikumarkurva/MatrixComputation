function [aug,x] = Gauss_pivot(A,B)
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
    
    % Gaussian Elimination method
    % Reducing to Upper triangular matrix
    for n=1:N-1
      [~,idx] = max(AUG(n:N,n));
      y1 = AUG(idx+n-1,:);
      AUG(idx+n-1,:) = AUG(n,:);
      AUG(n,:) = y1;

      % pivoting ends here
      for i=n+1:N
          m = AUG(i,n) / AUG(n,n);
          for j=n+1:N+1
            AUG(i,j) = AUG(i,j) - m*AUG(n,j);
          end
          AUG(i,n) = m;
          %AUG(i,n) = 0;
      end
    end
    
    % Displaying the Upper triangular matrix
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
end
