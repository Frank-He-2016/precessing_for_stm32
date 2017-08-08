import processing.serial.*;
Serial myport;
int text;
int tx;
int e;


void setup()
{
  size(400,340);
  smooth();
  PFont font=loadFont("FZSTK--GBK1-0-48.vlw");
  textFont(font);
  myport=new Serial(this,"COM5",9600);
}

int value=0;
int x0=30;

void draw()
{
  
  background(#1E285F);
  
  fill(255);
  textSize(50);
  text("Remoter",100,55);
  
  //azimuth
  fill(255);
  textSize(18);
  text("Azimuth",168,130);
  
  fill(#FFFFFF);
  noStroke();
  rect(20,90,360,20);
  
  fill(#FFFFFF);
  noStroke();
  ellipse(20,100,20,20);
  
  fill(#FFFFFF);
  noStroke();
  ellipse(380,100,20,20);
  
  if(mouseX>30&&mouseX<370&&mouseY>90&&mouseY<110)
  {
    if(mouseButton==LEFT)
    {
      fill(#C5CDFA);
      noStroke();
      rect(pmouseX-10,90,20,20);

      fill(#C5CDFA);
      noStroke();
      ellipse(pmouseX-10,100,20,20);
  
      fill(#C5CDFA);
      noStroke();
      ellipse(pmouseX+10,100,20,20);
      
      int a;
      a=pmouseX/4+2;
      myport.write(a);
    }
    else
    {
      fill(#C5CDFA);
      noStroke();
      rect(190,90,20,20);

      fill(#C5CDFA);
      noStroke();
      ellipse(190,100,20,20);
  
      fill(#C5CDFA);
      noStroke();
      ellipse(210,100,20,20);
    }
  }
  else
  {
    fill(#C5CDFA);
    noStroke();
    rect(190,90,20,20);

    fill(#C5CDFA);
    noStroke();
    ellipse(190,100,20,20);
  
    fill(#C5CDFA);
    noStroke();
    ellipse(210,100,20,20);
  }
  
    //Speed
  fill(#FFFFFF);
  noStroke();
  rect(20,210,360,20);
  
  fill(#FFFFFF);
  noStroke();
  ellipse(20,220,20,20);
  
  fill(#FFFFFF);
  noStroke();
  ellipse(380,220,20,20);
  
  fill(255);
  textSize(20);
  e=x0/4;
  String speed;
  speed="Speed:"+e;
  text(speed,166,250);
  
  if(!mousePressed)
  {
    fill(#C5CDFA);
    noStroke();
    rect(x0-10,210,20,20);

    fill(#C5CDFA);
    noStroke();
    ellipse(x0-10,220,20,20);
  
    fill(#C5CDFA);
    noStroke();
    ellipse(x0+10,220,20,20);
  }
  //ON-OFF
  fill(#FFFFFF);
  noStroke();
  rect(190,150,20,20);
  
  fill(#FFFFFF);
  noStroke();
  ellipse(190,160,20,20);
  
  fill(#FFFFFF);
  noStroke();
  ellipse(210,160,20,20);
  
  fill(255);
  textSize(17);
  text("ON-OFF",168,190);
  
  if(value==0)
  {
    if(mouseX>190&&mouseX<210&&mouseY>150&&mouseY<170)
    {
      if(mousePressed)
      {
        if(mouseButton==LEFT)
        {
          value=1;
          myport.write(value);
          delay(80);
        }
      }
    }
  }
  else
  {
    if(mouseX>190&&mouseX<210&&mouseY>150&&mouseY<170)
    {
      if(mousePressed)
      {
        if(mouseButton==LEFT)
        {
          value=0;
          myport.write(value);
          delay(80);
        }
      }
    }
  }
  
  if(value==0)
  {
    fill(#FFB803);
    noStroke();
    ellipse(210,160,20,20);
  }
  else
  {
    fill(#73FF03);
    noStroke();
    ellipse(190,160,20,20);
  }
  
  text=myport.read();
  if(text!=-1)
  {
    tx=text;
    println(text);
  }
  
  if(tx==0)
  {
    fill(#FFB803);
    textSize(15);
    text("The switch is closed!",133,300);
  }
  
  if(tx==1)
  {
    fill(#73FF03);
    textSize(15);
    text("The switch is open!",142,300);
  }
  
  if(tx<=101&&tx>=2)
  {
    fill(255);
    textSize(15);
    String fangxiang;
    int c;
    c=tx-52;
    fangxiang="The direction has been changed to "+c+"!";
    text(fangxiang,100,300);
  }
  
  if(tx<=202&&tx>=102)
  {
    fill(255);
    textSize(15);
    String fangxiang;
    int d;
    d=tx-102;
    fangxiang="The speed has been changed to "+d+"!";
    text(fangxiang,100,300);
  }
  
}

void mouseDragged()
{
  if(mouseX>30&&mouseX<370&&mouseY>210&&mouseY<230)
  {
      fill(#C5CDFA);
      noStroke();
      rect(pmouseX-10,210,20,20);

      fill(#C5CDFA);
      noStroke();
      ellipse(pmouseX-10,220,20,20);
  
      fill(#C5CDFA);
      noStroke();
      ellipse(pmouseX+10,220,20,20);
      
      x0=pmouseX;
      int b;
      b=x0/4+102;
      myport.write(b);
  }
  else
  {
    fill(#C5CDFA);
    noStroke();
    rect(x0-10,210,20,20);

    fill(#C5CDFA);
    noStroke();
    ellipse(x0-10,220,20,20);
  
    fill(#C5CDFA);
    noStroke();
    ellipse(x0+10,220,20,20);
    
  }
}
