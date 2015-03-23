using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace TravelingSalesPerson
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] Graph = {{0,2,9,int.MaxValue},
                            {1,0,6,4},
                            {int.MaxValue, 7,0,8},
                            {6,3,int.MaxValue,0}};

        }


        public static void travel(int n, int[,] w, int[,] p)
        {
            int i;
            int j;
            int k;

            HashSet<int> V = new HashSet<int>();

            for (int temp = 1; temp <= n; temp++)
            {
                V.Add(temp);
            }

            int[,] D = new int[n, n];

            for (i = 2; i <= n; i++)
            {
                D[i, 0] = w[i, 1];
            }

            for (k = 1; k <= n - 2; k++)
            {
                int counter = ((factorial(n - 1)) / (factorial(k) * factorial((n - k))));
                
                
            }
        }

        public static int length(List<int> path, int[,] w, int holder = 0)
        {
            if (path.Count == 1)
            {
                return holder;
            }
            else
            {
                int a = path[0];
                int b = path[1];

                holder += w[a, b];
                path.RemoveAt(0);
                return length(path, w, holder);
            } 
        }

        public static int factorial(int a)
        {
            int holder = 1;

            while (a > 1)
            {
                holder = holder * a;
                a = a - 1;
            }

            return holder;
        }

        public static int min(int A, int B)
        {
            if (A > B)
            {
                return B;
            }
            else
            {
                return A;
            }
        }
    }
}
