using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;

namespace FinalProject
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            TurnLabel = "Player One";
            PlayerTurn = 1;
            ourBoard = new GameBoard(6, 7);
            ourBoard.initializeBoard();
            CreateGuiBoard();
            ComputerBrains = new AI();
        }

        #region properties
        public AI ComputerBrains
        {
            get;
            set;
        }
        public int PlayerTurn
        {
            get;
            set;
        }

        public List<Microsoft.VisualBasic.PowerPacks.RectangleShape> guiBoard
        {
            get;
            set;
        }

        public GameBoard ourBoard
        {
            get;
            set;
        }

        public string TurnLabel
        {
            get
            {
                return this.turnLabel.Text;
            }
            set
            {
                this.turnLabel.Text = "Current Turn: " + value;
            }
        }
        #endregion

        public void ButtonClicked(object sender, EventArgs e)
        {
            int buttonNumber = int.Parse(sender.ToString().Substring(sender.ToString().Length -1)) - 1;
            int winner;

            if (ourBoard.HandleButtonPush(buttonNumber, this.PlayerTurn))
            {
                winner = ourBoard.IsWinner();
                if (winner != -1)
                {
                    UpdateGui();
                    LightUpWinningSpots(winner);
                    ToggleButtons(false);
                }
                else
                {
                    if (PlayerTurn == 1)
                    {
                        PlayerTurn = 2;
                        TurnLabel = "Player Two";
                        ToggleButtons(false);
                        ourBoard.HandleButtonPush(ComputerBrains.DetermineNextMove(ourBoard), PlayerTurn);
                        ToggleButtons(true);
                        PlayerTurn = 1;
                        TurnLabel = "Player One";
                        UpdateGui();
                    }
                }
            }
            else
            {
                MessageBox.Show("Please select one that hasn't been filled");
            }
            

        }

        public void LightUpWinningSpots(int player)
        {
            Color winner = new Color();

            if (player == 1)
            {
                winner = Color.LightGreen;
            }
            else
            {
                winner = Color.Pink;
            }

            for(int i = 0; i < 4; i++)
            {
                int row = this.ourBoard.WinningRowSpots[i];
                int col = this.ourBoard.WinningColSpots[i];

                this.guiBoard[(row * ourBoard.columns + col)].FillColor = winner;
            }
        }

        public void ToggleButtons(bool toggle)
        {
            this.column1.Enabled = toggle;
            this.column2.Enabled = toggle;
            this.column3.Enabled = toggle;
            this.column4.Enabled = toggle;
            this.column5.Enabled = toggle;
            this.column6.Enabled = toggle;
            this.column7.Enabled = toggle;
        }


        public void UpdateGui()
        {
            for (int i = 0; i < ourBoard.rows; i++)
            {
                for (int j = 0; j < ourBoard.columns; j++)
                {
                    if (ourBoard.Board[i, j] == 2)
                    {
                        this.guiBoard[(i * ourBoard.columns) + j].FillColor = Color.Red;
                    }
                    if (ourBoard.Board[i, j] == 1)
                    {
                        this.guiBoard[(i * ourBoard.columns) + j].FillColor = Color.Green;
                    }
                }
            }
        }

        public void CreateGuiBoard()
        {
            this.guiBoard = new List<Microsoft.VisualBasic.PowerPacks.RectangleShape>();

            //First row
            this.guiBoard.Insert(0, fivesix);
            this.guiBoard.Insert(0, fivefive);
            this.guiBoard.Insert(0, fivefour);
            this.guiBoard.Insert(0, fivethree);
            this.guiBoard.Insert(0, fivetwo);
            this.guiBoard.Insert(0, fiveone);
            this.guiBoard.Insert(0, fivezero);

            //Second Row
            this.guiBoard.Insert(0, foursix);
            this.guiBoard.Insert(0, fourfive);
            this.guiBoard.Insert(0, fourfour);
            this.guiBoard.Insert(0, fourthree);
            this.guiBoard.Insert(0, fourtwo);
            this.guiBoard.Insert(0, fourone);
            this.guiBoard.Insert(0, fourzero);

            //Third Row
            this.guiBoard.Insert(0, threesix);
            this.guiBoard.Insert(0, threefive);
            this.guiBoard.Insert(0, threefour);
            this.guiBoard.Insert(0, threethree);
            this.guiBoard.Insert(0, threetwo);
            this.guiBoard.Insert(0, threeone);
            this.guiBoard.Insert(0, threezero);

            //Fourth Row
            this.guiBoard.Insert(0, twosix);
            this.guiBoard.Insert(0, twofive);
            this.guiBoard.Insert(0, twofour);
            this.guiBoard.Insert(0, twothree);
            this.guiBoard.Insert(0, twotwo);
            this.guiBoard.Insert(0, twoone);
            this.guiBoard.Insert(0, twozero);

            //Fifth Row
            this.guiBoard.Insert(0, onesix);
            this.guiBoard.Insert(0, onefive);
            this.guiBoard.Insert(0, onefour);
            this.guiBoard.Insert(0, onethree);
            this.guiBoard.Insert(0, onetwo);
            this.guiBoard.Insert(0, oneone);
            this.guiBoard.Insert(0, onezero);

            //Sixth Row
            this.guiBoard.Insert(0, zerosix);
            this.guiBoard.Insert(0, zerofive);
            this.guiBoard.Insert(0, zerofour);
            this.guiBoard.Insert(0, zerothree);
            this.guiBoard.Insert(0, zerotwo);
            this.guiBoard.Insert(0, zeroone);
            this.guiBoard.Insert(0, zerozero);

        }
    }
}
