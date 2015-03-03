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

        public void ResetComputerBrain()
        {

        }

        public int DetermineNextMove(GameBoard CurrentBoard)
        {
            this.CurBoard = CurrentBoard;
            int spot = -1;
            int bestScore = int.MinValue;
            int row = 0;
            int score = 0;

            for (int i = 0; i < this.CurBoard.columns; i++)
            {
                score = 0;
                row = this.CurBoard.NextAvail(i);
                if (row != -1)
                {
                    score = DetermineMoveScore(i, row, 2);
                }
                else
                {
                    score = int.MinValue;
                }
                if (score == int.MaxValue)
                {
                    return i;
                }
                if (score > bestScore)
                {
                    bestScore = score;
                    spot = i;
                }
            }

            if (CurBoard.Board[0,3] == 0)
            {
                return 3;
            }

            return spot;
        }



        public int DetermineMoveScore(int col, int row, int player)
        {
            int score = -1;

            GameBoard nextState = new GameBoard(CurBoard);
            GameBoard opponent = new GameBoard(CurBoard);

            nextState.HandleButtonPush(col, player);
            opponent.HandleButtonPush(col, OtherPlayer(player));

            if (nextState.IsWinner() == 2)
            {
                return int.MaxValue;
            }
            if (opponent.IsWinner() == 1)
            {
                return int.MaxValue;
            }
            else
            {
                score = SurroundingScores(col, row, player, nextState);
            }

            return score;
        }

        public int SurroundingScores(int col, int row, int player, GameBoard state)
        {
            int scoreOfMove = 0;

            scoreOfMove += CompareForScore(player, state.South(row, col));
            scoreOfMove += CompareForScore(player, state.SouthEast(row, col));
            scoreOfMove += CompareForScore(player, state.SouthWest(row, col));
            scoreOfMove += CompareForScore(player, state.West(row, col));
            scoreOfMove += CompareForScore(player, state.East(row, col));
            scoreOfMove += CompareForScore(player, state.NorthEast(row, col));
            scoreOfMove += CompareForScore(player, state.NorthWest(row, col));

            return scoreOfMove;

        }

        public int CompareForScore(int player, int nearbySpot)
        {
            if (player == nearbySpot)
            {
                return 3;
            }
            if (0 == nearbySpot)
            {
                return 1;
            }
            if (OtherPlayer(player) == nearbySpot)
            {
                return 2;
            }
            return 0;
        }

        public int OtherPlayer(int player)
        {
            if (player == 1)
            {
                return 2;
            }
            else
            {
                return 1;
            }
        }
    }
}
