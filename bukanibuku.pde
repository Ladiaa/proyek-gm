PImage bukanIbukuImg;
boolean bukanIbukuLoaded = false;
PImage ibukagetImg;
boolean ibukagetLoaded = false;
PImage memohonImg;
boolean memohonLoaded = false;
PImage batuImg;
boolean batuLoaded = false;

int waktuMulaiTransisiIbuku = 0;
int durasiTampilBukanIbuku = 2000; // 2 detik
int durasiTampilIbukaget = 2000;   // 2 detik
int durasiTampilMemohon = 2000;    // 2 detik

void gambarBukanIbukuScene(float w, float h) {
  if (waktuMulaiTransisiIbuku == 0) waktuMulaiTransisiIbuku = millis();
  int elapsed = millis() - waktuMulaiTransisiIbuku;

  // === Jika sedang di durasi ibukaget, tampilkan ibukaget.jpg dan hentikan lainnya ===
  if (elapsed > durasiTampilBukanIbuku && elapsed <= durasiTampilBukanIbuku + durasiTampilIbukaget) {
    if (!ibukagetLoaded) {
      ibukagetImg = loadImage("data/ibukaget.jpg");
      ibukagetLoaded = true;
    }
    if (ibukagetImg != null) {
      imageMode(CORNER);
      image(ibukagetImg, 0, 0, w, h); // Full canvas
      return; // Hentikan semua render lainnya
    }
  }

  // === Latar belakang ===
  noStroke();
  fill(180, 230, 255); rect(0, 0, w, h); // langit
  fill(180, 240, 120); rect(0, h * 0.7, w, h * 0.3); // rumput
  fill(180, 120, 60);  rect(0, h * 0.8, w, h * 0.2); // tanah

  // Pohon kiri
  fill(180, 150, 80); rect(w * 0.08, h * 0.25, w * 0.07, h * 0.45, 30);
  fill(60, 120, 40);
  ellipse(w * 0.13, h * 0.18, w * 0.22, h * 0.18);
  ellipse(w * 0.09, h * 0.32, w * 0.18, h * 0.12);

  // Rumah kanan
  fill(200, 180, 120); rect(w * 0.8, h * 0.55, w * 0.15, h * 0.13, 10);
  fill(160, 100, 60); rect(w * 0.8, h * 0.68, w * 0.15, h * 0.05, 8);
  fill(180, 60, 30);
  triangle(w * 0.78, h * 0.55, w * 0.88, h * 0.45, w * 0.95, h * 0.55);

  // Semak merah
  fill(180, 40, 80);
  for (int i = 0; i < 4; i++) ellipse(w * 0.07 + i * 30, h * 0.93, 50, 30);
  for (int i = 0; i < 3; i++) ellipse(w * 0.85 + i * 30, h * 0.93, 50, 30);

  // === Tampilkan karakter ===
  boolean tampilMemohonDanBatu = (elapsed > durasiTampilBukanIbuku + durasiTampilIbukaget);

  // 1. Tampilkan bukanibuku.png (hanya jika belum masuk ke tahap memohon & batu)
  if (elapsed <= durasiTampilBukanIbuku) {
    if (!bukanIbukuLoaded) {
      bukanIbukuImg = loadImage("data/bukanibuku.png");
      bukanIbukuLoaded = true;
    }
    if (bukanIbukuImg != null) {
      float scaleF = 0.5;
      float cx = w / 2;
      float cy = h * 0.68;
      imageMode(CENTER);
      pushMatrix();
      translate(cx, cy);
      scale(scaleF);
      image(bukanIbukuImg, 0, 0);
      popMatrix();
    }
  }

  // 2. Tampilkan memohon.png dan batu.png bersamaan
  if (tampilMemohonDanBatu) {
    // Memohon
    if (!memohonLoaded) {
      memohonImg = loadImage("data/memohon.png");
      memohonLoaded = true;
    }
    if (memohonImg != null) {
      float scaleF = 0.5;
      float xMemohon = w * 0.90;
      float yMemohon = h * 0.72;
      imageMode(CENTER);
      pushMatrix();
      translate(xMemohon, yMemohon);
      scale(scaleF);
      image(memohonImg, 0, 0);
      popMatrix();
    }

    // Batu
    if (!batuLoaded) {
      batuImg = loadImage("data/batu.png");
      batuLoaded = true;
    }
    if (batuImg != null) {
      float scaleF = 0.5;
      float xBatu = w * 0.22;
      float yBatu = h * 0.72;
      imageMode(CENTER);
      pushMatrix();
      translate(xBatu, yBatu);
      scale(scaleF);
      image(batuImg, 0, 0);
      popMatrix();
    }
  }
}
