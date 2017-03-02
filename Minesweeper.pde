private int buttonSize = 40;
private int numBombs = 50;
private int num_rows = 20;
private int num_cols = 20;
private Button[][] buttons;
public void setup()
{
  size(800, 800);
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
  background(255);
  for (int i = 0; i < num_rows; i++)
  {
    for (int j = 0; j <num_cols; j++)
    {
      buttons[i][j].show();
    }
  }
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
        fill(0);
        text(numBombs(), myX + 10, myY + 10);
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

  {    /*else if (around == 0)
    {
      if (myX/10 > 1)
      {
        if (myY/10 > 1)
        {
          buttons[myX/10 - 1][myY/10 - 1].updateButton();
        }
        if (myY/10 < num_rows)
        {
          buttons[myX/10 - 1][myY/10 + 1].updateButton();
        }
        buttons[myX/10 - 1][myY/10].updateButton();
      }
      if (myX/10 < num_cols)
      {
        if (myY/10 > 1)
        {
          buttons[myX/10 + 1][myY/10 - 1].updateButton();
        }
        if (myY/10 < num_rows)
        {
          buttons[myX/10 + 1][myY/10 + 1].updateButton();
        }
        buttons[myX/10 + 1][myY/10].updateButton();
      }
      if (myY/10 > 1)
      {
        buttons[myX/10][myY/10 - 1].updateButton();
      }
      if (myY/10 < num_rows)
      {
        buttons[myX/10][myY/10 + 1].updateButton();
      }*/
      /*if (buttons[myX/10 - 1][myY/10 - 1].bomb() == false)
       {
       buttons[myX/10 - 1][myY/10 - 1].updateButton();
       }
       if (buttons[myX/10 - 1][myY/10].bomb() == false)
       {
       buttons[myX/10 - 1][myY/10].updateButton();
       }
       if (buttons[myX/10 - 1][myY/10 + 1].bomb() == false)
       {
       buttons[myX/10 - 1][myY/10 + 1].updateButton();
       }
       if (buttons[myX/10][myY/10 - 1].bomb() == false)
       {
       buttons[myX/10][myY/10 - 1].updateButton();
       }
       if (buttons[myX/10][myY/10 + 1].bomb() == false)
       {
       buttons[myX/10][myY/10 + 1].updateButton();
       }
       if (buttons[myX/10 + 1][myY/10 + 1].bomb() == false)
       {
       buttons[myX/10 + 1][myY/10 + 1].updateButton();
       }
       if (buttons[myX/10 + 1][myY/10].bomb() == false)
       {
       buttons[myX/10 + 1][myY/10].updateButton();
       }
       if (buttons[myX/10 + 1][myY/10 - 1].bomb() == false)
       {
       buttons[myX/10 + 1][myY/10 - 1].updateButton();
       }*/}
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
public void mousePressed(MouseEvent i)
{
  if (i.getButton() == RIGHT)
  {
    System.out.println("right");
    buttons[mouseX/buttonSize][mouseY/buttonSize].markButton();
  } else
  {
    System.out.println("left");
    buttons[mouseX/buttonSize][mouseY/buttonSize].updateButton();
  }
}
/*import de.bezier.guido.*;
 //Declare and initialize NUM_ROWS and NUM_COLS = 20
 private int num_rows = 20;
 private int num_cols = 20;
 private int numBombs = 32;
 private MSButton[][] buttons; //2d array of minesweeper buttons
 private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined
 
 void setup ()
 {
 size(1000, 1000);
 textAlign(CENTER,CENTER);
 
 // make the manager
 Interactive.make( this );
 buttons = new MSButton[num_rows][num_cols];
 //your code to declare and initialize buttons goes here
 for (int i = 0; i < num_rows; i++)
 {
 for (int j = 0; j < num_cols; j++)
 {
 buttons[i][j] = new MSButton(i, j);
 }
 }
 
 
 setBombs();
 }
 public void setBombs()
 {
 //your code
 for (int i = 0; i < numBombs; i ++)
 {
 
 }
 }
 
 public void draw ()
 {
 background(255);
 for (int i = 0; i < num_rows; i++)
 {
 for (int j = 0; j < num_cols; j++)
 {
 buttons[i][j].draw();
 System.out.println(i + "," + j);
 }
 }
 if(isWon())
 displayWinningMessage();
 }
 public boolean isWon()
 {
 //your code here
 return false;
 }
 public void displayLosingMessage()
 {
 //your code here
 }
 public void displayWinningMessage()
 {
 //your code here
 }
 
 public class MSButton
 {
 private int r, c;
 private float x,y, width, height;
 private boolean clicked, marked;
 private String label;
 
 public MSButton ( int rr, int cc )
 {
 width = 750/num_cols;
 height = 750/num_rows;
 r = rr;
 c = cc; 
 x = c*width + 125;
 y = r*height;
 label = "";
 marked = clicked = false;
 Interactive.add( this ); // register it with the manager
 }
 public boolean isMarked()
 {
 return marked;
 }
 public boolean isClicked()
 {
 if (keyPressed == true; &&)
 return clicked;
 }
 // called by manager
 
 public void mousePressed () 
 {
 clicked = true;
 //your code here
 }
 public void draw () 
 {
 if (marked)
 fill(0);
 // else if( clicked && bombs.contains(this) ) 
 //     fill(255,0,0);
 else if(clicked)
 fill( 200 );
 else 
 fill( 100 );
 
 rect(x, y, width, height);
 fill(0);
 text(label,x+width/2,y+height/2);
 }
 public void setLabel(String newLabel)
 {
 label = newLabel;
 }
 public boolean isValid(int r, int c)
 {
 //your code here
 return false;
 }
 public int countBombs(int row, int col)
 {
 int numBombs = 0;
 //your code here
 return numBombs;
 }
 }*/