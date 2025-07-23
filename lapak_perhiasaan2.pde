PImage pedagangGerak1;
PImage pedagangGerak2;
int currentFrame = 0; // 0 for gerak1, 1 for gerak2

// Definisikan ukuran baru untuk karakter pedagang
float newPedagangHeight = 128; // Tinggi baru yang diinginkan
float newPedagangWidth;        // Lebar baru, akan dihitung secara proporsional

// Variabel untuk animasi otomatis
long lastFrameChangeTime = 0; // Waktu terakhir frame diubah (dalam milidetik)
float animationSpeed = 725;  // Kecepatan animasi dalam milidetik (misal: 500ms = 0.5 detik per frame)

// (hapus seluruh isi fungsi setup dan draw di file ini)

// Fungsi mousePressed() dihapus karena animasi sudah otomatis

// ---------- DINDING ----------
void drawWall() {
  for (int i = 0; i < width; i += 50) {
    fill(139, 69, 19);
    rect(i, 0, 50, 400);
    stroke(101, 67, 33);
    line(i + 10, 0, i + 10, 400);
    line(i + 40, 0, i + 40, 400);
    noStroke();
  }
}

// ---------- LANTAI ----------
void drawFloor() {
  for (int i = 0; i < height - 400; i += 30) {
    fill(160, 82, 45);
    rect(0, 400 + i, width, 30);
    stroke(110, 60, 30);
    line(0, 400 + i, width, 400 + i);
    noStroke();
  }
}

// ---------- KARAKTER PEDAGANG (menggunakan gambar dengan ukuran kustom) ----------
// x adalah posisi horizontal tengah karakter
// yBottom adalah posisi y untuk bagian paling bawah dari gambar karakter
// imgWidth dan imgHeight adalah lebar dan tinggi gambar yang diinginkan
void drawPemudaZamanDulu(float x, float yBottom, PImage characterImage, float imgWidth, float imgHeight) {
  // Menggambar gambar karakter dengan lebar dan tinggi yang ditentukan
  // x - imgWidth / 2: Menempatkan gambar agar terpusat secara horizontal di x.
  // yBottom - imgHeight: Menempatkan gambar agar bagian bawahnya berada di yBottom.
  image(characterImage, x - imgWidth / 2, yBottom - imgHeight, imgWidth, imgHeight);
}


// ---------- ETALASE ----------
void drawShowcase() {
  fill(200, 200, 255, 255); // kaca tidak transparan (biru muda)
  stroke(150, 150, 255);
  rect(150, 300, 500, 150); // etalase kaca
  line(150, 375, 650, 375); // garis tengah kaca

  // Bingkai kayu
  fill(139, 69, 19);
  noStroke();
  rect(150, 450, 500, 20);  // dasar etalase
  rect(150, 300, 500, 10);  // atas etalase
  rect(150, 300, 10, 150);  // sisi kiri
  rect(640, 300, 10, 150);  // sisi kanan
}

// ---------- GELANG ----------
void drawBracelets() {
  float startX = 180;
  float spacing = 90;
  float y1 = 340;
  float y2 = 400;

  for (int i = 0; i < 5; i++) {
    float x = startX + i * spacing;
    drawBracelet(x, y1, i);
    drawBracelet(x, y2, i + 1);
  }
}

void drawBracelet(float x, float y, int style) {
  noFill();
  strokeWeight(4);

  switch(style % 3) {
    case 0:
      stroke(255, 215, 0); // emas
      break;
    case 1:
      stroke(192, 192, 192); // perak
      break;
    case 2:
      stroke(205, 127, 50); // rose gold
      break;
  }

  ellipse(x, y, 40, 20);
  strokeWeight(1);
  noStroke();
}

// ---------- LAMPU ----------
void drawLamp() {
  stroke(50);
  line(width/2, 0, width/2, 100);
  noStroke();
  fill(255, 255, 150);
  ellipse(width/2, 100, 60, 40);
  fill(255, 255, 200, 50);
  triangle(width/2 - 60, 100, width/2 + 60, 100, width/2, 300);
}
