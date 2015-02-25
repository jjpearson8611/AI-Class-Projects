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


        #region Directions
        /// <summary>
        /// Gets the value to the right based on sent in row col
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int West(int row, int col)
        {
            if (col > 0)
            {
                return this.Board[row, col - 1];
            }

            return -1;
        }

        /// <summary>
        /// Gets the up to the left value based on sent in row col
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int NorthWest(int row, int col)
        {
            if(col > 0)
            {
                if(row < 5)
                {
                    return this.Board[row + 1, col - 1];
                }
            }

            return -1;
        }

        /// <summary>
        /// Gets the peice above the current peice
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int North(int row, int col)
        {
            if (row < 5)
            {
                return this.Board[row + 1, col];
            }

            return -1;
        }

        /// <summary>
        /// Gets the up to the right value based on sent in row col
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int NorthEast(int row, int col)
        {
            if (col < 6)
            {
                if (row < 5)
                {
                    return this.Board[row + 1, col + 1];
                }
            }

            return -1;
        }

        /// <summary>
        /// Gets the value to the right based on sent in row col
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int East(int row, int col)
        {
            if (col < 6)
            {
                return this.Board[row, col + 1];
            }

            return -1;
        }

        /// <summary>
        /// Gets the up to the bottom right value based on sent in row col
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int SouthEast(int row, int col)
        {
            if (col < 6)
            {
                if (row > 0)
                {
                    return this.Board[row - 1, col + 1];
                }
            }

            return -1;
        }

        /// <summary>
        /// gets the spot below the current spot
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int South(int row, int col)
        {
            if (row > 0)
            {
                return this.Board[row - 1, col];
            }

            return -1;
        }

        /// <summary>
        /// Gets the up to the bottom left value based on sent in row col
        /// </summary>
        /// <param name="col"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public int SouthWest(int row, int col)
        {
            if (col > 0)
            {
                if (row > 0)
                {
                    return this.Board[row - 1, col - 1];
                }
            }

            return -1;
        }
        #endregion


    }
}
