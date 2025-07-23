int panggilLastTime = 0;
int panggilDelay = 700;

void setupPanggil() {
  // panggilSheet = loadImage("panggil.png"); // Removed as per edit hint
  // panggilFrameWidth = panggilSheet.width / panggilFrameCount; // Removed as per edit hint
  // panggilFrameHeight = panggilSheet.height; // Removed as per edit hint
  // panggilFrameIndex = 0; // Removed as per edit hint
  panggilLastTime = 0;
}

void gambarPanggil(float x, float y, float scaleVal, int frameIndex) {
  // if (panggilSheet == null) return; // Removed as per edit hint
  int sx = frameIndex * panggilFrameWidth; // Removed as per edit hint
  PImage frame = panggilSheet.get(sx, 0, panggilFrameWidth, panggilFrameHeight); // Removed as per edit hint
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

PImage adaapaSheet;
int adaapaFrameCount = 3;
int adaapaFrameWidth;
int adaapaFrameHeight;

void setupAdaapa() {
  adaapaSheet = loadImage("adaapa.PNG");
  adaapaFrameWidth = adaapaSheet.width / adaapaFrameCount;
  adaapaFrameHeight = adaapaSheet.height;
}

void gambarAdaapa(float x, float y, float scaleVal, int frameIndex) {
  if (adaapaSheet == null) return;
  int sx = frameIndex * adaapaFrameWidth;
  PImage frame = adaapaSheet.get(sx, 0, adaapaFrameWidth, adaapaFrameHeight);
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

PImage sisirSheet;
int sisirFrameCount = 3;
int sisirFrameWidth;
int sisirFrameHeight;

void setupSisir() {
  sisirSheet = loadImage("sisir.png");
  sisirFrameWidth = sisirSheet.width / sisirFrameCount;
  sisirFrameHeight = sisirSheet.height;
}

void gambarSisir(float x, float y, float scaleVal, int frameIndex) {
  if (sisirSheet == null) return;
  int sx = frameIndex * sisirFrameWidth;
  PImage frame = sisirSheet.get(sx, 0, sisirFrameWidth, sisirFrameHeight);
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

PImage pokoknysSheet;
int pokoknysFrameCount = 3;
int pokoknysFrameWidth;
int pokoknysFrameHeight;

void setupPokoknys() {
  pokoknysSheet = loadImage("pokoknys.png");
  pokoknysFrameWidth = pokoknysSheet.width / pokoknysFrameCount;
  pokoknysFrameHeight = pokoknysSheet.height;
}

void gambarPokoknys(float x, float y, float scaleVal, int frameIndex) {
  if (pokoknysSheet == null) return;
  int sx = frameIndex * pokoknysFrameWidth;
  PImage frame = pokoknysSheet.get(sx, 0, pokoknysFrameWidth, pokoknysFrameHeight);
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

void gambarJendela(float x, float y, float w, float h, boolean terbuka) {
  // Bingkai luar tebal
  stroke(180, 80, 40);
  strokeWeight(16);
  fill(230, 140, 80);
  rect(x, y, w, h, 18);
  // Daun jendela (kayu horizontal)
  int baris = int(h / 32.0);
  float daunW = (w - 32) / 2;
  float daunH = h - 20;
  float daunY = y + 10;
  // Daun kiri
  pushMatrix();
  if (terbuka) {
    translate(x + 16, daunY + daunH/2);
    rotate(radians(-60));
    translate(-daunW/2, -daunH/2);
  } else {
    translate(x + 16, daunY);
  }
  for (int i = 0; i < baris; i++) {
    fill(230, 140, 80);
    rect(0, i * 32, daunW, 28, 8);
    stroke(200, 100, 60);
    strokeWeight(2);
    line(0, i * 32, daunW, i * 32);
    noStroke();
  }
  popMatrix();
  // Daun kanan
  pushMatrix();
  if (terbuka) {
    translate(x + w - 16, daunY + daunH/2);
    rotate(radians(60));
    translate(-daunW/2, -daunH/2);
  } else {
    translate(x + w/2 + 4, daunY);
  }
  for (int i = 0; i < baris; i++) {
    fill(230, 140, 80);
    rect(0, i * 32, daunW, 28, 8);
    stroke(200, 100, 60);
    strokeWeight(2);
    line(0, i * 32, daunW, i * 32);
    noStroke();
  }
  popMatrix();
  // Garis tengah vertikal (pembatas dua daun, hanya jika tertutup)
  if (!terbuka) {
    stroke(180, 80, 40);
    strokeWeight(8);
    line(x + w/2, y + 10, x + w/2, y + h - 10);
    noStroke();
  }
  // Bayangan tipis di sisi kiri dan bawah
  fill(120, 70, 30, 60);
  rect(x, y + h - 12, w, 12, 0, 0, 10, 10);
  rect(x, y, 12, h, 10, 0, 0, 10);
}

void gambarBackgroundJendela(float x, float y, float w, float h) {
  // Langit biru muda
  noStroke();
  fill(180, 230, 240);
  rect(x, y, w, h);
  // Awan
  fill(255, 255, 255, 180);
  ellipse(x + w*0.25, y + h*0.18, w*0.22, h*0.13);
  ellipse(x + w*0.35, y + h*0.13, w*0.18, h*0.10);
  ellipse(x + w*0.7, y + h*0.22, w*0.18, h*0.10);
  ellipse(x + w*0.6, y + h*0.16, w*0.22, h*0.13);
  // Gunung bertingkat
  fill(120, 180, 120);
  beginShape();
  vertex(x, y + h*0.55);
  bezierVertex(x + w*0.18, y + h*0.45, x + w*0.32, y + h*0.65, x + w*0.5, y + h*0.55);
  bezierVertex(x + w*0.68, y + h*0.45, x + w*0.82, y + h*0.65, x + w, y + h*0.55);
  vertex(x + w, y + h);
  vertex(x, y + h);
  endShape(CLOSE);
  fill(80, 140, 80);
  beginShape();
  vertex(x, y + h*0.7);
  bezierVertex(x + w*0.2, y + h*0.6, x + w*0.3, y + h*0.8, x + w*0.5, y + h*0.7);
  bezierVertex(x + w*0.7, y + h*0.6, x + w*0.8, y + h*0.8, x + w, y + h*0.7);
  vertex(x + w, y + h);
  vertex(x, y + h);
  endShape(CLOSE);
  // Semak-semak depan
  fill(40, 120, 40);
  for (float i = x; i < x + w; i += w/8) {
    ellipse(i + w/16, y + h*0.93, w/7, h/8);
  }
} 