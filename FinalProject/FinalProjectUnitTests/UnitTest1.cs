using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using FinalProject;

namespace FinalProjectUnitTests
{
    [TestClass]
    public class UnitTest1
    {

        #region DirectionUnitTests

        #region TestSouth
        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestSouth()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            int player = temp.South(1, 0);

            Assert.AreEqual(player, 1, "South is malfunctioning");
        }

        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestSouthEdgeCase()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            //should return -1 because it would be out of bounds
            int player = temp.South(0, 0);

            Assert.AreEqual(player, -1, "South is malfunctioning edge case");
        }
        #endregion

        #region TestWest
        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestWest()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            int player = temp.West(0, 1);

            Assert.AreEqual(player, 1, "West is malfunctioning");
        }

        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestWestEdgeCase()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            //should return -1 because it would be out of bounds
            int player = temp.West(0, 0);

            Assert.AreEqual(player, -1, "West is malfunctioning edge case");
        }
        #endregion

        #region TestEast
        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestEast()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            int player = temp.East(0, 0);

            Assert.AreEqual(player, 2, "East is malfunctioning");
        }

        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestEastEdgeCase()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            //should return -1 because it would be out of bounds
            int player = temp.East(0, 6);

            Assert.AreEqual(player, -1, "East is malfunctioning edge case");
        }
        #endregion

        #region TestNorth
        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestNorth()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            int player = temp.North(0, 0);

            Assert.AreEqual(player, 1, "North is malfunctioning");
        }

        //Board photo
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121
        // 1212121

        [TestMethod]
        public void TestNorthEdgeCase()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 }, { 1, 2, 1, 2, 1, 2, 1 } };

            //should return -1 because it would be out of bounds
            int player = temp.North(5, 0);

            Assert.AreEqual(player, -1, "North is malfunctioning edge case");
        }
#endregion

        #region TestNorthEast
        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthEast()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }};

            int player = temp.NorthEast(0, 0);

            Assert.AreEqual(player, 2, "North West is malfunctioning");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthEastEdgeCaseUp()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.NorthEast(5, 0);

            Assert.AreEqual(player, -1, "North East is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthEastEdgeCaseLeft()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.NorthEast(0, 6);

            Assert.AreEqual(player, -1, "North East is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthEastEdgeCaseBoth()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.NorthEast(5, 6);

            Assert.AreEqual(player, -1, "North East is malfunctioning edge case");
        }
        #endregion

        #region TestNorthWest
        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthWest()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            int player = temp.NorthWest(3, 3);

            Assert.AreEqual(player, 3, "North West is malfunctioning");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthWestEdgeCaseUp()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.NorthWest(5, 3);

            Assert.AreEqual(player, -1, "North West is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthWestEdgeCaseLeft()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.NorthWest(0, 0);

            Assert.AreEqual(player, -1, "North West is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestNorthWestEdgeCaseBoth()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.NorthWest(5, 0);

            Assert.AreEqual(player, -1, "North West is malfunctioning edge case");
        }
        #endregion

        #region TestSouthEast
        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthEast()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            int player = temp.SouthEast(3, 3);

            Assert.AreEqual(player,5, "South East is malfunctioning");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthEastEdgeCaseDown()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.SouthEast(0, 3);

            Assert.AreEqual(player, -1, "South East is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthEastEdgeCaseLeft()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.SouthEast(0, 0);

            Assert.AreEqual(player, -1, "South East is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthEastEdgeCaseBoth()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.SouthEast(5, 6);

            Assert.AreEqual(player, -1, "South East is malfunctioning edge case");
        }
        #endregion

        #region TestSouthWest
        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthWest()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            int player = temp.SouthWest(3, 3);

            Assert.AreEqual(player, 3, "South West is malfunctioning");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthWestEdgeCaseDown()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.SouthWest(0, 3);

            Assert.AreEqual(player, -1, "South West is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthWestEdgeCaseLeft()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.SouthWest(0, 0);

            Assert.AreEqual(player, -1, "South West is malfunctioning edge case");
        }

        //Board photo
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567
        // 1234567

        [TestMethod]
        public void TestSouthWestEdgeCaseBoth()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 } };

            //should return -1 because it would be out of bounds
            int player = temp.SouthWest(5, 0);

            Assert.AreEqual(player, -1, "South West is malfunctioning edge case");
        }
        #endregion

        #endregion

        //Board photo
        // 0000000
        // 0000000
        // 0000000
        // 0000000
        // 0000000
        // 1111222

        [TestMethod]
        public void TestWinnerHorizontal()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 1, 1, 1, 2, 2, 2 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 } };

            int isWinner =  temp.IsWinner();

            Assert.AreEqual(isWinner, 1, "Horizontal Winner Failed");
        }


        //Board photo
        // 0000000
        // 0000000
        // 1000000
        // 1000000
        // 1000000
        // 1000222

        [TestMethod]
        public void TestWinnerVertical()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 0, 0, 0, 2, 2, 2 }, { 1, 0, 0, 0, 0, 0, 0 }, { 1, 0, 0, 0, 0, 0, 0 }, { 1, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 } };

            int isWinner = temp.IsWinner();

            Assert.AreEqual(isWinner, 1, "Vertical Winner Failed");
        }


        //Board photo
        // 0000000
        // 0000000
        // 1000000
        // 0100000
        // 0010000
        // 0001222

        [TestMethod]
        public void TestWinnerLeftDiag()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 0, 0, 0, 1, 2, 2, 2 }, { 0, 0, 1, 0, 0, 0, 0 }, { 0, 1, 0, 0, 0, 0, 0 }, { 1, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 } };

            int isWinner = temp.IsWinner();

            Assert.AreEqual(isWinner, 1, "Left Diagonal Winner Failed");
        }



        //Board photo
        // 0000000
        // 0000000
        // 0001000
        // 0010000
        // 0100000
        // 1000222

        [TestMethod]
        public void TestWinnerRightDiag()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 1, 0, 0, 0, 2, 2, 2 }, { 0, 1, 0, 0, 0, 0, 0 }, { 0, 0, 1, 0, 0, 0, 0 }, { 0, 0, 0, 1, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 } };

            int isWinner = temp.IsWinner();

            Assert.AreEqual(isWinner, 1, "Left Diagonal Winner Failed");
        }



        //Board photo
        // 0000000
        // 0000000
        // 0000000
        // 0000000
        // 0000000
        // 0000000

        [TestMethod]
        public void TestWinnerNoWinner()
        {
            GameBoard temp = new GameBoard(6, 7);
            temp.Board = new int[6, 7] { { 0, 0, 0, 0, 0, 0, 0}, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0 } };

            int isWinner = temp.IsWinner();

            Assert.AreEqual(isWinner, -1, "Blank board Winner Failed");
        }
    }
}
