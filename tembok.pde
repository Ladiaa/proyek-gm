PImage mikirSheet;
int mikirFrameCount = 3;
int mikirFrameWidth;
int mikirFrameHeight;

void setupMikir() {
  mikirSheet = loadImage("mikir.png");
  mikirFrameWidth = mikirSheet.width / mikirFrameCount;
  mikirFrameHeight = mikirSheet.height;
}

void gambarMikir(float x, float y, float scaleVal, int frameIndex) {
  if (mikirSheet == null) return;
  int sx = frameIndex * mikirFrameWidth;
  PImage frame = mikirSheet.get(sx, 0, mikirFrameWidth, mikirFrameHeight);
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

void gambarTembokKayu(float x, float y, float w, float h) {
  // Tembok kayu utama
  fill(230, 140, 80);
  stroke(180, 80, 40);
  strokeWeight(8);
  rect(x, y, w, h, 18);
  // Garis horizontal kayu
  int baris = int(h / 60.0);
  for (int i = 1; i < baris; i++) {
    stroke(200, 100, 60);
    strokeWeight(3);
    line(x + 8, y + i * (h / baris), x + w - 8, y + i * (h / baris));
  }
  // Motif serat kayu (sedikit random)
  stroke(210, 120, 70, 90);
  strokeWeight(2);
  for (int i = 0; i < 4; i++) {
    float px = x + w * (0.15 + 0.2 * i);
    bezier(px, y + h*0.1, px + 30, y + h*0.3, px - 20, y + h*0.7, px + 10, y + h*0.9);
  }
  // Bingkai gelap
  noFill();
  stroke(120, 70, 30);
  strokeWeight(16);
  rect(x + 2, y + 2, w - 4, h - 4, 18);
} 