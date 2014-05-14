import java.nio.ByteBuffer;
import java.lang.Float;

void setup()
{
  size(1000,1000,P2D);
  PGraphics p = createGraphics(4096,4096,P2D);
 noiseDetail(3,0.5); 
  p.beginDraw();
  p.loadPixels();
  for(int i =0; i < p.pixels.length; i++)
  {
    int xCoord = i%p.width;
    int yCoord = i/p.width;
    float myVal = Float.MAX_VALUE *noise(xCoord/2500.f,yCoord/2500.f);
    int e = ByteBuffer.allocate(4).putFloat(myVal).getInt(0);
    p.pixels[i] = 0xFF000000 | (e);
  }
  p.updatePixels();
  p.endDraw();
  image(p,0,0,width,height);
  save("myImage.png");
  println("done");
}
