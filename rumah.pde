void setupAnak1() {
  anak1Sheet = loadImage("anak1.png");
  anak1FrameWidth = anak1Sheet.width / anak1FrameCount;
  anak1FrameHeight = anak1Sheet.height;
}

void gambarAnak1(float x, float y, float scaleVal, int frameIndex) {
  if (anak1Sheet == null) return;
  int sx = frameIndex * anak1FrameWidth;
  PImage frame = anak1Sheet.get(sx, 0, anak1FrameWidth, anak1FrameHeight);
  pushMatrix();
  translate(x, y);
  scale(scaleVal);
  imageMode(CENTER);
  image(frame, 0, 0);
  popMatrix();
}

void gambarRumah(float rumahX, float rumahY, float rumahW, float rumahH) {
  // Dinding kayu horizontal
  int barisDinding = int(rumahH / 30.0);
  for (int i = 0; i < barisDinding; i++) {
    fill(230, 140, 80);
    rect(rumahX, rumahY + i * 30, rumahW, 30, 10);
    stroke(200, 100, 60);
    strokeWeight(2);
    line(rumahX, rumahY + i * 30, rumahX + rumahW, rumahY + i * 30);
    noStroke();
  }   

  // Garis tepi rumah
  stroke(180, 80, 40);
  strokeWeight(8);
  noFill();
  rect(rumahX, rumahY, rumahW, rumahH, 18);
  noStroke();

  // Atap rumah
  fill(180, 60, 30);
  triangle(rumahX - 10, rumahY, rumahX + rumahW/2, rumahY - 60, rumahX + rumahW + 10, rumahY);

  // Pintu di tengah
  fill(120, 80, 40);
  float pintuW = 300;
  float pintuH = 550;
  float pintuX = rumahX + rumahW/2 - pintuW/2;
  float pintuY = rumahY + rumahH - pintuH - 20;
  rect(pintuX, pintuY, pintuW, pintuH, 16);
}
