using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace FinalProject
{
    public class GameBoard
    {
        //default constructor
        public GameBoard(int rowsParm, int columnsParm)
        {
            this.rows = rowsParm;
            this.columns = columnsParm;
            this.Board = new int[this.rows, this.columns];
        }

        #region Properties
        public int[,] Board
        {
            get;
            set;
        }

        public int rows
        {
            get;
            set;
        }

        public int columns
        {
            get;
            set;
        }
        #endregion

        //Set all the board values to zero
        public void initializeBoard()
        {
            for (int i = 0; i < this.rows; i++)
            {
                for (int j = 0; j < this.columns; j++)
                {
                    Board[i, j] = 0;
                }
            }
        }

        public bool HandleButtonPush(int column, int player)
        {
            int spot = NextAvail(column);
            if (spot != -1)
            {
                this.Board[spot, column] = player;
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsWinner()
        {
            return false;
        }

        public int NextAvail(int column)
        {
            for (int j = 0; j < this.rows; j++)
            {
                if(this.Board[j,column] == 0)
                {
                    return j;
                }
            }

            return -1;
        }
    }
}
