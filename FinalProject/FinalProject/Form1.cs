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
            ComputerBrains = new AI(2);
            HandleComputer();
            UpdateGui();

            winpercentagebot.Text = string.Empty;
            winpercentagerandom.Text = string.Empty;
            botwinslabel.Text = string.Empty;
            randomwinslabel.Text = string.Empty;

            histlabel.Text = "Games   P1 Type   P2 Type   P1 Wins   P2 Wins   P1%   P2%   Ties   Tie%";

            gamesbar.Value = 10;
            bottomCombo.SelectedIndex = 0;
            topCombo.SelectedIndex = 0;

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
                        UpdateGui();
                        HandleComputer();
                        winner = ourBoard.IsWinner();
                        UpdateGui();
                        if (winner != -1)
                        {
                            LightUpWinningSpots(winner);
                            ToggleButtons(false);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Please select one that hasn't been filled");
            }
            

        }

        public void HandleComputer()
        {
            PlayerTurn = 2;
            TurnLabel = "Player Two";
            ToggleButtons(false);
            ourBoard.HandleButtonPush(ComputerBrains.DetermineNextMove(ourBoard), PlayerTurn);
            ToggleButtons(true);
            PlayerTurn = 1;
            TurnLabel = "Player One";
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
                int col = this.ourBoard.WinningSpots[i].Item1;
                int row = this.ourBoard.WinningSpots[i].Item2;

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
                    else
                    {
                        if (ourBoard.Board[i, j] == 1)
                        {
                            this.guiBoard[(i * ourBoard.columns) + j].FillColor = Color.Green;
                        }
                        else
                        {
                            this.guiBoard[(i * ourBoard.columns) + j].FillColor = Color.White;
                        }
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

        private void gamesbar_Scroll(object sender, EventArgs e)
        {
            this.gamesLabel.Text = "Games: " + gamesbar.Value.ToString();
        }

        private void gobutton_Click(object sender, EventArgs e)
        {
            Brain Player1;
            Brain Player2;

            switch (topCombo.SelectedIndex)
            {
                case 0:
                    Player1 = new RandomAI(1);
                    break;

                case 1:
                    Player1 = new LesserAI(1);
                    break;

                case 2:
                    Player1 = new AI(1);
                    break;

                default:
                    Player1 = new AI(1);
                    break;
            } 
            
            switch (bottomCombo.SelectedIndex)
            {
                case 0:
                    Player2 = new RandomAI(2);
                    break;

                case 1:
                    Player2 = new LesserAI(2);
                    break;

                case 2:
                    Player2 = new AI(2);
                    break;

                default:
                    Player2 = new AI(2);
                    break;
            }

            GameBoard quickGame = new GameBoard(6, 7);
            Random rand = new Random();
            int botwins = 0;
            int randowins = 0;
            int winner = -1;
            int ties = 0;

            double update = this.gamesbar.Value / 100;
            int updateCount = 1;

            for (int i = 0; i < this.gamesbar.Value; i++)
            {
                    while (winner == -1)
                    {
                        if (!quickGame.HandleButtonPush(Player1.DetermineNextMove(quickGame), 1))
                        {
                            //MessageBox.Show(quickGame.ToString());
                            break;
                        }
                        if (!quickGame.HandleButtonPush(Player2.DetermineNextMove(quickGame), 2))
                        {
                            //MessageBox.Show(quickGame.ToString());
                            break;
                        }
                        winner = quickGame.IsWinner();
                    }


                    if (winner == 1)
                    {
                        botwins++;
                    }
                    if (winner == 2)
                    {
                        randowins++;
                    }
                    if (winner == -1)
                    {
                        ties++;
                    }

                quickGame.Initialize(6, 7);
                winner = -1;

                if (i > (int)(update + 1) * updateCount)
                {
                    updateCount++;
                    gamesprogressbar.Value++;
                }

                Player1.ResetComputerBrain();
                Player2.ResetComputerBrain();
            }

            

            botwinslabel.Text = botwins.ToString();
            randomwinslabel.Text = randowins.ToString();
            winpercentagebot.Text = "%" + 100 * ((double)botwins / (double)gamesbar.Value);
            winpercentagerandom.Text = "%" + 100 * ((double)randowins / (double)gamesbar.Value);
            gamesprogressbar.Value = 0;


            float tieCount = gamesbar.Value - (float.Parse(randomwinslabel.Text) + float.Parse(botwinslabel.Text));

            histlabel.Text += Environment.NewLine + String.Format("{0,-8}{1,-10}{2,-10}{3,-10:N}{4,-8:N}{5,-8:P1}{6,-6:P1}{7,-7:N0}{8,-10:P1}",
                gamesbar.Value.ToString(), topCombo.Text, bottomCombo.Text, botwinslabel.Text, randomwinslabel.Text,
                float.Parse(winpercentagebot.Text.Substring(1)) / 100, float.Parse(winpercentagerandom.Text.Substring(1)) / 100,
                tieCount, ((float)tieCount) / ((float)gamesbar.Value));

            
        }

        private void clearButton_Click(object sender, EventArgs e)
        {
            botwinslabel.Text = "";
            randomwinslabel.Text = "";
            winpercentagebot.Text = "";
            winpercentagerandom.Text = "";
        }

        private void restartButton_Click(object sender, EventArgs e)
        {
            ourBoard.Initialize(6, 7);
            UpdateGui();
            ToggleButtons(true);
        }
    }
}
