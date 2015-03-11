using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject
{
    public class AI : Brain
    {
        public AI(int us)
        {
            OurPlayer = us;
            CurPlayer = us;
            rand = new RandomAI(us);
        }

        public GameBoard CurBoard
        {
            get;
            set;
        }

        public int OurPlayer
        {
            get;
            set;
        }

        public int CurPlayer
        {
            get;
            set;
        }

        public RandomAI rand
        {
            get;
            set;
        }

        public override void ResetComputerBrain()
        {

        }

        public override int DetermineNextMove(GameBoard CurrentBoard)
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
                        score = DetermineMoveScore(i, row);
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

                if (CurBoard.Board[0, 3] == 0)
                {
                    spot = 3;
                }

                if (bestScore > 100 || bestScore < -100)
                {
                    return spot;
                }

                if (rand.Random() > 19)
                {
                    return spot;
                }
                else
                {
                    return rand.DetermineNextMove(CurrentBoard);
                }
        }



        public int DetermineMoveScore(int col, int row)
        {
            int score = -1;

            GameBoard nextState = new GameBoard(CurBoard);
            GameBoard opponent = new GameBoard(CurBoard);

            nextState.HandleButtonPush(col, CurPlayer);
            opponent.HandleButtonPush(col, OtherPlayer(CurPlayer));

            if (nextState.IsWinner() == CurPlayer)
            {
                return int.MaxValue;
            }
            if (opponent.IsWinner() == OtherPlayer(CurPlayer))
            {
                return int.MaxValue;
            }
            else
            {
                score = SurroundingScores(col, row, nextState);
            }

            if (OurPlayer == CurPlayer)
            {
                CurPlayer = OtherPlayer(CurPlayer);
                score = score - DetermineNextMove(nextState);
                CurPlayer = OurPlayer;
            }

            return score;

        }

        public int SurroundingScores(int col, int row, GameBoard state)
        {
            int scoreOfMove = 0;

            scoreOfMove += CompareForScore(state.South(row, col));
            scoreOfMove += CompareForScore(state.SouthEast(row, col));
            scoreOfMove += CompareForScore(state.SouthWest(row, col));
            scoreOfMove += CompareForScore(state.West(row, col));
            scoreOfMove += CompareForScore(state.East(row, col));
            scoreOfMove += CompareForScore(state.NorthEast(row, col));
            scoreOfMove += CompareForScore(state.NorthWest(row, col));

            return scoreOfMove;

        }

        public int CompareForScore(int nearbySpot)
        {
            if (OurPlayer == nearbySpot)
            {
                return 3;
            }
            if (0 == nearbySpot)
            {
                return 1;
            }
            if (OtherPlayer(OurPlayer) == nearbySpot)
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
