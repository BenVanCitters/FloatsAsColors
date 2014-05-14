import java.nio.ByteBuffer;

void setup()
{
  size(1000,1000,P2D);
  PGraphics p = createGraphics(4096,4096,P2D);
  
  p.beginDraw();
  p.loadPixels();
  for(int i =0; i < p.pixels.length; i++)
  {
    int xCoord = i%p.width;
    int yCoord = i/p.width;
    int e = ByteBuffer.allocate(4).putFloat(32000*sin(xCoord/1000.f)).getInt(0);
    p.pixels[i] = 0xFF000000 | (e);
  }
  p.updatePixels();
  p.endDraw();
  image(p,0,0,width,height);
  save("myImage.png");
  println("done");
}
