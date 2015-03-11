using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject
{
    public class RandomAI : Brain
    {
        public RandomAI(int player)
        {
            ourNumber = player;
            this.rand = new Random();
        }

        public int ourNumber
        {
            get;
            set;
        }

        public Random rand
        {
            get;
            set;
        }

        public GameBoard ourBoard
        {
            get;
            set;
        }

        public override void ResetComputerBrain()
        {
            //not needed but required
        }

        public override int DetermineNextMove(GameBoard current)
        {
            ourBoard = new GameBoard(current);
            int next = rand.Next(0, 7);

            if (ourBoard.HandleButtonPush(next, ourNumber))
            {
                return next;
            }
            else
            {
                List<int> temp = new List<int>();
                temp.Add(next);
                return DetermineNextMove(ourBoard, temp);
            }
        }

        public int DetermineNextMove(GameBoard current, List<int> badspots)
        {
            int next = rand.Next(0, 7);

            while (badspots.Contains(next))
            {
                next = rand.Next(0, 7);
            }

            return next;
        }

        /// <summary>
        /// used for adding randomness into our bot battles
        /// </summary>
        /// <returns></returns>
        public int Random()
        {
            return rand.Next(0, 100);
        }
    }
}
