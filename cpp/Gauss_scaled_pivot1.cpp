#include<stdio.h>
#include<iostream>
using namespace std;
int main()
{
   int N,n;
   cout<<" Enter the no'of variables: ";
   cin >> N;

   // Creating the dynamic memory
   float **A = new(nothrow) float* [N];
   for ( int i = 0; i < N ; i++)
   {
      A[i] = new(nothrow) float[N+1];
   }

   // Reading the matrix
   cout<< endl << " Enter the augmented matrix [A | B]: " <<endl;
   for( int i = 0; i < N; i++)
   {
      for( int j = 0; j < N+1; j++)
      {
          cin >> A[i][j];
      }
   }  

   // Creating solution vector X
   float *X = new(nothrow) float[N];
   float m;

   // Gaussian Elimination method
   // Reducing to Upper triangular matrix
   for( int n=0; n < N-1; n++)
   {

#if 1
     // ****Scaling Part***
     float *MAXIM = new(nothrow) float[N];
     float max,scale,max2;
     int max_ind = n;
     for( int i = n; i <= N-1; i++)
     {
         max = A[i][n];
         for( int j = n ; j <= N-1; j++)
         {
            if( A[i][j] > max )
	    {
                max = A[i][j];
		max_ind = j;
	    }
         } 
         MAXIM[i] = A[i][n] / A[i][max_ind]; 

     }
     // ****Scaling ends Here***
#endif

#if 1
      // ***Pivoting part***
      max = MAXIM[n];
      max_ind = n; 
      for( int i=n; i <= N-1; i++)
      {
         if( MAXIM[i] > max )
	 {
	    max = MAXIM[i];
	    max_ind = i;
         }
      }
      // Interchanging the rows
      for( int i=0; i <= N; i++)
      {
         max = A[max_ind][i];
 	 A[max_ind][i] = A[n][i];
	 A[n][i] = max;
      }
     // ***Pivoting Ends Here*****
#endif

      for( int i=n+1; i <= N-1; i++)
      {
          m = A[i][n] / A[n][n];
	  for( int j=n; j <= N; j++)
          {
	     A[i][j] = A[i][j] - m*A[n][j];
          }
          A[i][n] = m;
      } 
   }

   // Displaying the Upper triangular matrix
   cout<< endl << " temporary matrix: "<<endl;
   for( int i=0; i< N; i++)
   {
      for( int j=0; j < N+1 ; j++)
      {
           cout<<A[i][j]<<" \t ";
      }
      cout<<endl;
   }

   // Solving for X
   float sum =0;
   for( int i=N-1; i >= 0; i--)
   {
      sum = 0;
      for( int j=N-1; j > i; j--)
      {
	sum += A[i][j]*X[j];
      }
      X[i] = ( A[i][N]-sum )/A[i][i];
   }

   // Displaying the result
   cout<<endl<<" Solution X: " <<endl;
   for( int i=0; i < N; i++)
   {
      cout<< X[i] << endl;
   }

   // Deleting the Dynamic memory
   for( int i = 0; i < N; i++)
   {
      delete[] A[i];
   }
   delete[] A;
   delete[] X;
   delete[] MAXIM;
}
