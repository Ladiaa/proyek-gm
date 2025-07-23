// Variabel global untuk animasi berjalan ke pasar
PImage spriteKepasar;
int kepasarFrame = 0;
int kepasarFrameCount = 3;
int kepasarFrameWidth;
int kepasarFrameHeight;
int kepasarLastFrameTime = 0;
int kepasarFrameDuration = 180; // ms per frame
float kepasarX = 0;
float kepasarY = 0;

void loadKepasarSprite() {
  spriteKepasar = loadImage("data/kepasar.png");
  kepasarFrameWidth = spriteKepasar.width / kepasarFrameCount;
  kepasarFrameHeight = spriteKepasar.height;
}

void animasiBerjalanKepasar(float x, float y, float scaleF) {
  if (millis() - kepasarLastFrameTime > kepasarFrameDuration) {
    kepasarFrame = (kepasarFrame + 1) % kepasarFrameCount;
    kepasarLastFrameTime = millis();
  }
  int sx = kepasarFrame * kepasarFrameWidth;
  int sy = 0;
  pushMatrix();
  translate(x, y);
  scale(scaleF);
  image(spriteKepasar.get(sx, sy, kepasarFrameWidth, kepasarFrameHeight), 0, 0);
  popMatrix();
}

void gambarKebunBaru(float w, float h) {
  // Langit biru
  noStroke();
  fill(180, 230, 240);
  rect(0, 0, w, h);
  // Tanaman jagung (belakang)
  for (int i = 0; i < w; i += 40) {
    fill(90, 180, 80);
    rect(i + 10, h*0.18, 16, h*0.45);
    fill(60, 140, 60);
    ellipse(i + 18, h*0.18, 40, 60);
    // Jagung kuning
    if (i % 80 == 0) {
      fill(240, 210, 60);
      ellipse(i + 18, h*0.22, 18, 38);
    }
  }
  // Pagar kayu
  for (int i = 0; i < w; i += 38) {
    fill(170, 90, 40);
    rect(i + 8, h*0.55, 8, h*0.22, 4);
    stroke(120, 60, 20);
    strokeWeight(3);
    line(i + 12, h*0.55, i + 12, h*0.77);
    noStroke();
  }
  for (int j = 0; j < 2; j++) {
    fill(170, 90, 40);
    rect(0, h*0.6 + j*20, w, 8, 4);
  }
  // Tanah kuning
  fill(210, 220, 80);
  beginShape();
  vertex(0, h*0.77);
  bezierVertex(w*0.2, h*0.75, w*0.4, h*0.8, w*0.6, h*0.77);
  bezierVertex(w*0.8, h*0.75, w, h*0.8, w, h*0.85);
  vertex(w, h*0.85);
  vertex(0, h*0.85);
  endShape(CLOSE);
  // Tanah coklat
  fill(140, 100, 60);
  rect(0, h*0.85, w, h*0.08);
  // Air
  fill(100, 180, 220);
  rect(0, h*0.93, w, h*0.07);
  // Rumput/ilalang pinggir
  fill(60, 160, 60);
  for (int i = 0; i < w; i += 60) {
    ellipse(i + 30, h*0.85, 60, 30);
    ellipse(i + 50, h*0.93, 40, 20);
  }
} 