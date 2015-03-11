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
            Initialize(rowsParm, columnsParm);
        }

        public GameBoard(GameBoard temp)
        {
            Initialize(temp.rows, temp.columns);
            CopyBoard(temp.Board);
            this.WinningSpots = temp.WinningSpots;
        }

        #region Properties

        /// <summary>
        /// column,row
        /// </summary>
        public List<Tuple<int,int>> WinningSpots
        {
            set;
            get;
        }

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

        public void Initialize(int rowsParm, int columnsParm)
        {
            this.rows = rowsParm;
            this.columns = columnsParm;
            this.Board = new int[this.rows, this.columns];
            this.WinningSpots = new List<Tuple<int,int>>();
            initializeBoard();
        }

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
            
            this.WinningSpots = new List<Tuple<int,int>>();
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

        public int IsWinner()
        {
            this.WinningSpots = new List<Tuple<int,int>>();
            for (int i = 0; i < this.rows; i++)
            {
                for (int j = 0; j < this.columns; j++)
                {
                    if (FindDiagonalLeft(i, j) != -1)
                    {
                        return FindDiagonalLeft(i,j);
                    }
                    if (FindDiagonalRight(i, j) != -1)
                    {
                        return FindDiagonalRight(i,j);
                    }
                    if (FindVertical(i, j) != -1)
                    {
                        return FindVertical(i,j);
                    }
                    if (FindHorizontal(i, j) != -1)
                    {
                        return FindHorizontal(i,j);
                    }
                }
            }
            
            return -1;
        }

        public int NextAvail(int column)
        {
            if (column > -1 && column < 7)
            {
                for (int j = 0; j < this.rows; j++)
                {
                    if (this.Board[j, column] == 0)
                    {
                        return j;
                    }
                }
            }

            return -1;
        }

        public void CopyBoard(int[,] temp)
        {
            for (int i = 0; i < this.rows; i++)
            {
                for (int j = 0; j < this.columns; j++)
                {
                    Board[i, j] = temp[i,j];
                }
            }
        }

        #region WinningDirectionFinders
        public int FindDiagonalRight(int row, int col)
        {
            int ourPlayer = Board[row, col];
            if (ourPlayer != 0)
            {
                if (ourPlayer == NorthEast(row, col))
                {
                    row++;
                    col++;

                    if (ourPlayer == NorthEast(row, col))
                    {
                        row++;
                        col++;
                        if (ourPlayer == NorthEast(row, col))
                        {
                            this.WinningSpots.Add(new Tuple<int,int>(col,row));
                            this.WinningSpots.Add(new Tuple<int,int>(col + 1,row + 1));
                            this.WinningSpots.Add(new Tuple<int,int>(col - 1,row - 1));
                            this.WinningSpots.Add(new Tuple<int,int>(col - 2,row - 2));

                            return ourPlayer;
                        }
                    }
                }
            }
            return -1;
        }

        public int FindDiagonalLeft(int row, int col)
        {
            int ourPlayer = Board[row, col];
            if (ourPlayer != 0)
            {
                if (ourPlayer == NorthWest(row, col))
                {
                    row++;
                    col--;

                    if (ourPlayer == NorthWest(row, col))
                    {
                        row++;
                        col--;
                        if (ourPlayer == NorthWest(row, col))
                        {
                            this.WinningSpots.Add(new Tuple<int,int>(col,row));
                            this.WinningSpots.Add(new Tuple<int,int>(col - 1,row + 1));
                            this.WinningSpots.Add(new Tuple<int,int>(col + 1,row - 1));
                            this.WinningSpots.Add(new Tuple<int,int>(col + 2,row - 2));

                            return ourPlayer;
                        }
                    }
                }
            }
            return -1;
        }

        public int FindHorizontal(int row, int col)
        {
            int ourPlayer = Board[row, col];
            if (ourPlayer != 0)
            {
                if (ourPlayer == East(row, col))
                {
                    col++;
                    if (ourPlayer == East(row, col))
                    {
                        col++;
                        if (ourPlayer == East(row, col))
                        {
                            this.WinningSpots.Add(new Tuple<int,int>(col,row));
                            this.WinningSpots.Add(new Tuple<int,int>(col + 1,row));
                            this.WinningSpots.Add(new Tuple<int,int>(col - 1,row));
                            this.WinningSpots.Add(new Tuple<int,int>(col - 2,row));

                            return ourPlayer;
                        }
                    }
                }
            }
            return -1;
        }

        public int FindVertical(int row, int col)
        {
            int ourPlayer = Board[row, col];
            if (ourPlayer != 0)
            {
                if (ourPlayer == North(row, col))
                {
                    row++;
                    if (ourPlayer == North(row, col))
                    {
                        row++;
                        if (ourPlayer == North(row, col))
                        {
                            this.WinningSpots.Add(new Tuple<int,int>(col,row));
                            this.WinningSpots.Add(new Tuple<int,int>(col,row + 1));
                            this.WinningSpots.Add(new Tuple<int,int>(col,row - 1));
                            this.WinningSpots.Add(new Tuple<int,int>(col,row - 2));

                            return ourPlayer;
                        }
                    }
                }
            }
            return -1;
        }
        #endregion


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

        public override string ToString()
        {
            string builder = string.Empty;

            for (int i = this.rows - 1; i >= 0; i--)
            {
                builder += '\n';
                for (int j = 0; j < this.columns; j++)
                {
                    builder += Board[i, j];
                }
            }

            return builder;
        }

    }
}
