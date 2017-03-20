private int buttonSize = 40;
private int numBombs = 80;
private int num_rows = 20;
private int num_cols = 20;
private Button[][] buttons;
private boolean lost = false;
private int levels = 0;
private boolean j = false;
private ArrayList <StartButton> totalButtons;
public void setup()
{
  size(800, 800);
  setItUp();
}
public void setItUp()
{
  //totalButtons.add(new StartButton(360, 370, 80, 60, "Start"));
  buttons = new Button[num_rows][num_cols];
  for (int i = 0; i < num_rows; i++)
  {
    for (int j = 0; j < num_cols; j++)
    {    
      buttons[i][j] = new Button(i, j);
    }
  }
  setBombs();
}
public void draw()
{
  if (levels == 0)
  {
    levels = 1;
  }
  else if (levels == 1)
  {
    background(255);
    for (int i = 0; i < num_rows; i++)
    {
      for (int j = 0; j <num_cols; j++)
      {
        buttons[i][j].show();
      }
    }
  }
  if (testWin() == 0)
  {
    gameWin();
  }
}
public int testWin()
{
  for (int i = 0; i < num_rows; i++)
  {
    for (int j = 0; j <num_cols; j++)
    {
      if (buttons[i][j].getBomb() == true || buttons[i][j].getPressed() == true)
      {
      }
      else
      {
        return -1;
      }
    }
  }
  return 0;
}
public void gameLose()
{
  lost = true;
  textSize(20);
  textAlign(CENTER);
  fill(0);
  text("You Lost", 400, 400);
  fill(255, 0, 0);
  for (int i = 0; i < num_rows; i++)
    {
      for (int j = 0; j < num_cols; j++)
      {
        if (buttons[i][j].bomb() == true)
        {
          buttons[i][j].setPressed(true);
        }
      }
    }
}
public void gameWin()
{
  lost = true;
  textSize(20);
  textAlign(CENTER);
  fill(0);
  text("You Won", 400, 400);
  fill(255, 0, 0);
}
public void setBombs()
{
  for (int i = 0; i < numBombs; i++)
  {
    int z = (int) (Math.random()*20);
    int x = (int) (Math.random()*20);
    if (buttons[z][x].bomb() == true)
    {
      i--;
    } else
    {
      buttons[z][x].setBomb(true);
    }
  }
}
public class Button
{
  private int myX, myY, around, myCol, myRow;
  private boolean isPressed, isMarked, isBomb;
  public Button(int x, int y)
  {
    myCol = y;
    myRow = x;
    myX = buttonSize*x;
    myY = buttonSize*y;
    around = 0;
    isPressed = false;
    isMarked = false;
    isBomb = false;
  }
  public int numBombs()
  {
    int i = 0;
    if (isBomb == false)
    {
      if (myRow > 0)
      {
        if (buttons[myRow - 1][myCol].getBomb() == true)
        {
          i++;
        }
      }
      if (myRow > 0 && myCol > 0)
      {
        if (buttons[myRow - 1][myCol - 1].getBomb() == true)
        {
          i++;
        }
      }
      if (myRow > 0 && myCol < num_cols - 1)
      {
        if (buttons[myRow - 1][myCol + 1].getBomb() == true)
        {
          i++;
        }
      }
      if (myCol > 0)
      {
        if (buttons[myRow][myCol - 1].getBomb() == true)
        {
          i++;
        }
      }
      if (myCol < num_cols - 1)
      {
        if (buttons[myRow][myCol + 1].getBomb() == true)
        {
          i++;
        }
      }
      if (myRow < num_rows - 1)
      {
        if (buttons[myRow + 1][myCol].getBomb() == true)
        {
          i++;
        }
      }
      if (myRow < num_rows - 1 && myCol > 0)
      {
        if (buttons[myRow + 1][myCol - 1].getBomb() == true)
        {
          i++;
        }
      }
      if (myRow < num_rows - 1 && myCol < num_cols - 1)
      {
        if (buttons[myRow + 1][myCol + 1].getBomb() == true)
        {
          i++;
        }
      }
    }
    return i;
  }
  public boolean getBomb() {return isBomb;}
  public void show()
  {
    if (isPressed == true)
    {
      if (isBomb == true)
      {
        fill(255, 0, 0);
        gameLose();
      } else
      {
        fill(200);
      }
    } else if (isMarked == true)
    {
      fill(0);
    } else
    {
      fill(60);
    }
    rect(myX, myY, buttonSize, buttonSize);
    if (isPressed == true && isBomb == false)
    {
      fill(0);
      textSize(10);
      textAlign(CENTER);
      if (numBombs() != 0)
      {
        text(numBombs(), myX + (800/buttonSize), myY + (800/buttonSize));
      }
    }
  }
  public void updateButton()
  {
    isPressed = true;
    if (numBombs() == 0 && isMarked == false && isBomb == false)
    {
      if (myRow > 0)
      {
        if (buttons[myRow - 1][myCol].getPressed() == false)
        {
          buttons[myRow - 1][myCol].updateButton();
        }
      }
      if (myRow > 0 && myCol > 0)
      {
        if (buttons[myRow - 1][myCol - 1].getPressed() == false)
        {
          buttons[myRow - 1][myCol - 1].updateButton();
        }
      }
      if (myRow > 0 && myCol < num_cols - 1)
      {
        if (buttons[myRow - 1][myCol + 1].getPressed() == false)
        {
          buttons[myRow - 1][myCol + 1].updateButton();
        }
      }
      if (myCol > 0)
      {
        if (buttons[myRow][myCol - 1].getPressed() == false)
        {
          buttons[myRow][myCol - 1].updateButton();
        }
      }
      if (myCol < num_cols - 1)
      {
        if (buttons[myRow][myCol + 1].getPressed() == false)
        {
          buttons[myRow][myCol + 1].updateButton();
        }
      }
      if (myRow < num_rows - 1)
      {
        if (buttons[myRow + 1][myCol].getPressed() == false)
        {
          buttons[myRow + 1][myCol].updateButton();
        }
      }
      if (myRow < num_rows - 1 && myCol > 0)
      {
        if (buttons[myRow + 1][myCol - 1].getPressed() == false)
        {
          buttons[myRow + 1][myCol - 1].updateButton();
        }
      }
      if (myRow < num_rows - 1 && myCol < num_cols - 1)
      {
        if (buttons[myRow + 1][myCol + 1].getPressed() == false)
        {
          buttons[myRow + 1][myCol + 1].updateButton();
        }
      }
    }
  }
  public boolean getPressed(){return isPressed;}
  public void markButton()
  {
    isMarked = true;
  }
  public boolean bomb() {
    return isBomb;
  }
  public void setBomb(boolean wow)
  {
    isBomb = wow;
  }
  public void setPressed(boolean incredible)
  {
    isPressed = incredible;
  }
}
public class StartButton
{
  int myX, myY, myXSize, myYSize;
  String message;
  public StartButton(int x, int y, int theX, int theY, String theThought)
  {
    myX = x;
    myY = y;
    myXSize = theX;
    myYSize = theY;
    message = theThought;
  }
  public void show()
  {
    fill(155, 155, 155);
    rect(myX, myY, myXSize, myYSize);
    textAlign(CENTER);
    fill(0);
    text(message, myX + (myXSize / 2), myY + (myYSize / 2));
  }
  public boolean clicked()
  {
    if (mouseX > myX && mouseX < myX + myXSize && mouseY > myY && mouseY < myY + myYSize)
    {
      return true;
    }
    return false;
  }
}
public void mousePressed(MouseEvent i)
{
  if (i.getButton() == LEFT)
  {
    j = true;
  }
  if (levels == 1)
  {
    if (lost == false)
    {
      if (i.getButton() == RIGHT)
      {
        buttons[mouseX/buttonSize][mouseY/buttonSize].markButton();
      } else
      {
        buttons[mouseX/buttonSize][mouseY/buttonSize].updateButton();
      }
    }
  }
}
public void mouseReleased(MouseEvent i)
{
  if (i.getButton() == LEFT)
  {
    j = false;
  }
}
