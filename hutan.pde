PImage marah1Sheet;
int marah1FrameCount = 3;
int marah1FrameWidth;
int marah1FrameHeight;
int marah1FrameIndex = 0;
int marah1LastTime = 0;
int marah1Delay = 900;

PImage mendengarImg;

void setupMarah1() {
  marah1Sheet = loadImage("marah1.png");
  marah1FrameWidth = marah1Sheet.width / marah1FrameCount;
  marah1FrameHeight = marah1Sheet.height;
  marah1FrameIndex = 0;
  marah1LastTime = 0;
}

void setupMendengar() {
  mendengarImg = loadImage("mendengar.PNG");
}

void gambarMarah1(float x, float y, float scaleVal, int frameIndex) {
  if (marah1Sheet == null) return;
  int sx = frameIndex * marah1FrameWidth;
  PImage frame = marah1Sheet.get(sx, 0, marah1FrameWidth, marah1FrameHeight);
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

void gambarHutanBackground(float w, float h) {
  // Background hijau muda
  background(180, 220, 140);
  noStroke();
  // Batang pohon vertikal (kiri)
  for (int i = 0; i < 4; i++) {
    fill(170, 180, 140, 180); // abu-abu kehijauan, transparan
    rect(40 + i*30, 0, 18, h, 10);
  }
  for (int i = 0; i < 2; i++) {
    fill(120, 140, 100, 180);
    rect(100 + i*40, 0, 16, h, 10);
  }
  // Gradient/daun atas
  for (int i = 0; i < 3; i++) {
    fill(120, 180, 100, 90 - i*20);
    ellipse(180 + i*80, 40 + i*10, 220 - i*30, 60 + i*10);
  }
  // Semak-semak hijau bawah
  fill(60, 160, 60);
  for (int i = 0; i < w; i += 60) {
    ellipse(i + 30, h - 60, 100, 80);
    ellipse(i + 60, h - 40, 80, 50);
  }
  fill(40, 120, 40);
  for (int i = 0; i < w; i += 50) {
    ellipse(i + 25, h, 120, 120);
  }

  // Rumah panggung di kanan
  float rumahW = w * 0.38;
  float rumahH = h - 40;
  float rumahX = w - rumahW + 20;
  float rumahY = 0;
  gambarRumah(rumahX, rumahY, rumahW, rumahH);

  // Tangga rumah (di bawah pintu)
  float pintuW = 300;
  float pintuH = 550;
  float pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
  float pintuY = rumahY + rumahH - pintuH - 20;
  float tanggaX = pintuX + pintuW/2 - 60;
  float tanggaY = pintuY + pintuH;
  float tanggaW = 120;
  float tanggaH = 30;
  int jumlahAnakTangga = 4;
  for (int i = 0; i < jumlahAnakTangga; i++) {
    fill(180, 140, 80);
    rect(tanggaX, tanggaY + i*tanggaH, tanggaW, tanggaH, 8);
    stroke(140, 100, 60);
    strokeWeight(2);
    line(tanggaX, tanggaY + i*tanggaH, tanggaX + tanggaW, tanggaY + i*tanggaH);
    noStroke();
  }

  // Animasi marah1 di pintu rumah
  if (marah1LastTime == 0) marah1LastTime = millis();
  if (millis() - marah1LastTime > marah1Delay) {
    marah1FrameIndex = (marah1FrameIndex + 1) % marah1FrameCount;
    marah1LastTime = millis();
  }
  float xMarah = pintuX + pintuW/2 - 100;
  float yMarah = pintuY + pintuH * 0.55;
  gambarMarah1(xMarah, yMarah, 1.0, marah1FrameIndex);

  // Tampilkan gambar mendengar.PNG di kiri
  if (mendengarImg != null) {
    float xMendengar = 120;
    float yMendengar = h - 260;
    pushMatrix();
    imageMode(CENTER);
    scale(1.0);
    image(mendengarImg, xMendengar, yMendengar);
    popMatrix();
  }
} 