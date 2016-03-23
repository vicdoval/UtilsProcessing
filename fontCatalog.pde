/*
Font Catalog Generator by Victor Doval
This sketch generates a serie of images with all the fonts avalaible in the computer to facilitate the selection.
to call back to the same font  you should use 

font=createFont(PFont.list()[FontNumber], 120);
Note that every time you install a font "FontNumber" could change.
Another way is just coping the name.
font=createFont("Arial", 120);

 Created: 2016 Mar.
Pusblished at https://github.com/vicdoval/UtilsProcessing
 This work is licensed under the MIT License 
 (It lets people do anything they want with your code as long as they provide attribution
 back to you and don't hold you liable)  
 */
 
String[] a=PFont.list();
println(a.length);
size(1280, 720);
background(0);
int fc=0;
int off=0;

float x=25;
float y=25;
PFont base= createFont("Lucida Sans", 8);
for (int i=0; i<a.length; i++) {
  PFont f= createFont(a[i], 20);
  textFont(f);
  float d=textWidth(a[i]);
 
  text(a[i], x, y);
  float alt=textAscent();
  textFont(base);
  text(i+" "+a[i], x, y+alt);
  x+=d+20;
  if (x>width-50) {

    x=25;
    y+=40;
   
    off+=width;
  }
  if (y>height-50) {
    saveFrame(fc+".jpg");
    fc++;
    background(0);
    x=25;
    y=25;
  }
  println(i, fc, x, y);
}
saveFrame(fc+".jpg");
