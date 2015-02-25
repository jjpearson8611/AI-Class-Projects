using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject
{
    public class AI
    {
        public AI()
        {

        }

        public GameBoard CurBoard
        {
            get;
            set;
        }


        public int DetermineNextMove(GameBoard CurrentBoard)
        {
            this.CurBoard = CurrentBoard;
            return 0;
        }



        public int DetermineMoveScore(int col, int row, int player)
        {
            int score = -1;

            return score;
        }
    }
}
