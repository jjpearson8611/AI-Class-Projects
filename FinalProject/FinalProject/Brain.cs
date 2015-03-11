using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject
{
    public abstract class Brain
    {
        public abstract void ResetComputerBrain();
        public abstract int DetermineNextMove(GameBoard board);
    }
}
