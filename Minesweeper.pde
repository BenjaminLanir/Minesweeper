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
  private int myX, myY, around;
  private boolean isPressed, isMarked, isBomb;
  public Button(int x, int y)
  {
    myX = buttonSize*x;
    myY = buttonSize*y;
    around = 0;
    isPressed = false;
    isMarked = false;
    isBomb = false;
  }
  public void findBombs()
  {
    int i = 0;
    if (isMarked == true)
    {
    } else
    {
      if (myY/10 > 0)
      {
        i++;
      }
        if (myY/10 < num_rows)
      {
        i++;
      }
      i++;
    }
    if (myX/10 < num_cols)
    {
      if (myY/10 > 0)
      {
        i++;
      }
      if (myY/10 < num_rows)
      {
        i++;
      }
      i++;
    }
    if (myY/10 > 0)
    {
      i++;
    }
    if (myY/10 < num_rows)
    {
      i++;
    }
    /*if (buttons[myX/10 - 1][myY/10 - 1].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10 - 1][myY/10].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10 - 1][myY/10 + 1].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10][myY/10 - 1].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10][myY/10 + 1].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10 + 1][myY/10 + 1].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10 + 1][myY/10].bomb() == true)
     {
     i++;
     }
     if (buttons[myX/10 + 1][myY/10 - 1].bomb() == true)
     {
     i++;
     }*/
  }
  public int numBombs()
  {
    findBombs();
    return around;
  }
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
  }
  public void updateButton()
  {
    findBombs();
    isPressed = true;
    int theY = myY/10;
    int theX = myX/10;
    if (isMarked == true)
    {
    }
    else if (around == 0)
    {
      if (theY > 0)
      {
        buttons[theX][theY - 1].updateButton();
      }
      if (theY > 0 && theX > 0)
      {
        buttons[theX-1][theY-1].updateButton();
      }
      if (theY > 0 && theX < num_cols)
      {
        buttons[theX+1][theY-1].updateButton();
      }
      if (theX > 0)
      {
        buttons[theX-1][theY].updateButton();
      }
      if (theX < num_cols)
      {
        buttons[theX+1][theY].updateButton();
      }
      if (theY < num_rows)
      {
        buttons[theX][theY+1].updateButton();
      }
      if (theY < num_rows && theX > 0)
      {
        buttons[theX-1][theY+1].updateButton();
      }
      if (theY < num_rows && theX < num_cols)
      {
        buttons[theX+1][theY+1].updateButton();
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