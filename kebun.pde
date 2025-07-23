PImage karakterSheet;
int karakterFrameCount = 3;
int karakterFrameWidth;
int karakterFrameHeight;
int karakterCurrentFrame = 0;
int karakterAnimDelay = 1000;
int karakterLastFrameTime = 0;
float karakterX;
float karakterSpeed = 0.5;
int jalanCount = 0;
boolean jalanSelesai = false;
boolean showRumahOnly = false;
int waktuMulaiKebun;
boolean sudahOtomatisPindah = false;
PImage ambilSayurSheet;
int ambilSayurFrameCount = 4; // jumlah frame ambil sayur
int ambilSayurFrameWidth;
int ambilSayurFrameHeight;
int ambilSayurCurrentFrame = 0;
int ambilSayurAnimDelay = 500;
int ambilSayurLastFrameTime = 0;
boolean sedangAmbilSayur = true;
int waktuMulaiAmbilSayur;
int durasiAmbilSayur = 1600; // 4 frame x 400ms = 1600ms

// Tambahkan variabel global untuk timer animasi berjalan
int waktuMulaiBerjalan = 0;

PImage[] syukurlahSheets = new PImage[13];
int currentSheet = 0;
int[] syukurlahFrameCounts = {3, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2};
int syukurlahFrameIndex = 0;
int syukurlahFrameWidth;
int syukurlahFrameHeight;
int syukurlahDelay = 700; // ms per frame
int syukurlahLastTime = 0;
boolean syukurlahSelesai = false;

boolean showSceneRumah = false;
int waktuMulaiSceneRumah = 0;
int durasiSceneRumah = 15000; // 15 detik

boolean showSceneHutan = false;
int waktuMulaiSceneHutan = 0;
int durasiSceneHutan = 10000; // 10 detik

boolean showSceneJendela = false;
int waktuMulaiSceneJendela = 0;
int durasiSceneJendela = 10000; // 10 detik

boolean showSceneTembok = false;
int waktuMulaiSceneTembok = 0;
int durasiSceneTembok = 10000; // 10 detik

boolean showSceneKebunBaru = false;
int waktuMulaiSceneKebunBaru = 0;
int durasiSceneKebunBaru = 10000; // 10 detik

boolean showSceneLapakPerhiasan = false;
int waktuMulaiSceneLapakPerhiasan = 0;
int durasiSceneLapakPerhiasan = 10000; // 10 detik

boolean showSceneBukanIbuku = false;
int waktuMulaiSceneBukanIbuku = 0;
int durasiSceneBukanIbuku = 10000; // 10 detik

int anak1FrameIndex = 0;
int anak1LastTime = 0;
int anak1Delay = 700;

PImage anak1Sheet;
int anak1FrameCount = 2;
int anak1FrameWidth;
int anak1FrameHeight;

PImage panggilSheet;
int panggilFrameCount = 3;
int panggilFrameWidth;
int panggilFrameHeight;
int panggilCurrentFrame = 0;
int panggilAnimDelay = 700;
int panggilLastFrameTime = 0;
int panggilFrameIndex = 0;
int panggilLoopCount = 0;
int panggilMaxLoop = 3;

int adaapaFrameIndex = 0;
int adaapaLastTime = 0;
int adaapaDelay = 700;
int adaapaLoopCount = 0;
int adaapaMaxLoop = 3;
boolean showAdaapa = false;

int sisirFrameIndex = 0;
int sisirLastTime = 0;
int sisirDelay = 700;
int sisirLoopCount = 0;
int sisirMaxLoop = 3;
boolean showSisir = false;

int pokoknysFrameIndex = 0;
int pokoknysLastTime = 0;
int pokoknysDelay = 700;
int pokoknysLoopCount = 0;
int pokoknysMaxLoop = 3;
boolean showPokoknys = false;

int mikirFrameIndex = 0;
int mikirLastTime = 0;
int mikirDelay = 700;
int mikirLoopCount = 0;
int mikirMaxLoop = 1;

int celenganFrameIndex = 0;
int celenganLastTime = 0;
int celenganDelay = 700;
int celenganLoopCount = 0;
int celenganMaxLoop = 1;
boolean showCelengan = false;
PImage celenganSheet;
int celenganFrameCount = 3;
int celenganFrameWidth;
int celenganFrameHeight;

void setup() {
  size(1151, 647);
  imageMode(CENTER);
  karakterSheet = loadImage("berjalan.PNG");
  ambilSayurSheet = loadImage("ambilsayur.png");
  if (karakterSheet != null) {
    karakterFrameWidth = karakterSheet.width / karakterFrameCount;
    karakterFrameHeight = karakterSheet.height;
    println("Sheet width: " + karakterSheet.width);
    println("Frame count: " + karakterFrameCount);
    println("Frame width: " + karakterFrameWidth);
  }
  if (ambilSayurSheet != null) {
    ambilSayurFrameWidth = ambilSayurSheet.width / ambilSayurFrameCount;
    ambilSayurFrameHeight = ambilSayurSheet.height;
  }
  syukurlahSheets[0] = loadImage("berjalan.PNG");
  syukurlahSheets[1] = loadImage("syukurlah1.png");
  syukurlahSheets[2] = loadImage("syukurlah2.png");
  syukurlahSheets[3] = loadImage("syukurlah3.PNG");
  syukurlahSheets[4] = loadImage("syukurlah2.png"); // ulangi syukurlah2.png
  syukurlahSheets[5] = loadImage("berjalan.PNG");
  syukurlahSheets[6] = loadImage("panas1.PNG");
  syukurlahSheets[7] = loadImage("panas2.PNG");
  syukurlahSheets[8] = loadImage("panas3.PNG");
  syukurlahSheets[9] = loadImage("tolong1.PNG");
  syukurlahSheets[10] = loadImage("tolong2.PNG");
  syukurlahSheets[11] = loadImage("tolong1.PNG");
  syukurlahSheets[12] = loadImage("tolong2.PNG");
  syukurlahFrameIndex = 0;
  currentSheet = 0;
  syukurlahFrameWidth = syukurlahSheets[0].width / syukurlahFrameCounts[0];
  syukurlahFrameHeight = syukurlahSheets[0].height;
  syukurlahLastTime = 0;
  syukurlahSelesai = false;
  // Posisi awal karakter di depan pintu rumah
  float rumahW = width * 0.38;
  float rumahX = width - rumahW + 20;
  float rumahY = 0;
  float pintuW = 300;
  float pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
  karakterX = pintuX + pintuW/2; // mulai dari tengah pintu rumah
  waktuMulaiKebun = millis();
  sudahOtomatisPindah = false;
  sedangAmbilSayur = true;
  waktuMulaiAmbilSayur = millis();
  ambilSayurCurrentFrame = 0;
  ambilSayurLastFrameTime = millis();
  setupAnak1();
  setupMarah1();
  setupMendengar();
  anak1FrameIndex = 0;
  anak1LastTime = 0;
  panggilSheet = loadImage("panggil.png");
  if (panggilSheet != null) {
    panggilFrameWidth = panggilSheet.width / panggilFrameCount;
    panggilFrameHeight = panggilSheet.height;
  }
  setupAdaapa();
  setupSisir();
  setupPokoknys();
  setupMikir();
  celenganSheet = loadImage("celengan.png");
  if (celenganSheet != null) {
    celenganFrameWidth = celenganSheet.width / celenganFrameCount;
    celenganFrameHeight = celenganSheet.height;
  }
  loadKepasarSprite(); // load sprite kepasar
}

void draw() {
  if (!showRumahOnly && !sudahOtomatisPindah && millis() - waktuMulaiKebun >= 28000) {
    showRumahOnly = true;
    sudahOtomatisPindah = true;
    showSceneRumah = true;
    waktuMulaiSceneRumah = millis();
    showSceneHutan = false;
    showSceneJendela = false;
    showSceneTembok = false;
  }
  background(180, 220, 140); // hijau muda
  if (showRumahOnly) {
    if (showSceneRumah) {
      gambarRumah(0, 0, width, height);
      // Animasi anak1.png di depan rumah
      if (anak1LastTime == 0) anak1LastTime = millis();
      if (millis() - anak1LastTime > anak1Delay) {
        anak1FrameIndex = (anak1FrameIndex + 1) % 2;
        anak1LastTime = millis();
      }
      float xAnak = width * 0.18;
      float yAnak = height - 180;
      gambarAnak1(xAnak, yAnak, 1.0, anak1FrameIndex);
      if (millis() - waktuMulaiSceneRumah > durasiSceneRumah) {
        showSceneRumah = false;
        showSceneHutan = true;
        waktuMulaiSceneHutan = millis();
        showSceneJendela = false;
        showSceneTembok = false;
      }
      return;
    } else if (showSceneHutan) {
      gambarHutanBackground(width, height);
      if (millis() - waktuMulaiSceneHutan > durasiSceneHutan) {
        showSceneHutan = false;
        showSceneJendela = true;
        waktuMulaiSceneJendela = millis();
        showSceneTembok = false;
      }
      return;
    } else if (showSceneJendela) {
      // Tampilkan jendela di tengah canvas
      float jw = width * 0.7;
      float jh = height * 0.7;
      float jx = width/2 - jw/2;
      float jy = height/2 - jh/2;
      gambarBackgroundJendela(jx, jy, jw, jh);
      gambarJendela(jx, jy, jw, jh, true);
      // Animasi panggil.png di dalam jendela, diulang 3 kali lalu lanjut sisir.png, pokoknys.png, lalu adaapa.PNG
      if (!showSisir && !showPokoknys && !showAdaapa) {
        if (panggilLastTime == 0) panggilLastTime = millis();
        if (panggilLoopCount < panggilMaxLoop) {
          if (millis() - panggilLastTime > panggilDelay) {
            panggilFrameIndex++;
            panggilLastTime = millis();
            if (panggilFrameIndex >= panggilFrameCount) {
              panggilFrameIndex = 0;
              panggilLoopCount++;
            }
          }
        } else {
          showSisir = true;
          sisirFrameIndex = 0;
          sisirLastTime = millis();
          sisirLoopCount = 0;
        }
      }
      int frameToShowPanggil = (panggilLoopCount >= panggilMaxLoop) ? panggilFrameCount - 1 : panggilFrameIndex;
      float xPanggil = jx + jw * 0.55;
      float yPanggil = jy + jh * 0.75;
      float xAdaapa = jx + jw * 0.25;
      float yAdaapa = yPanggil;
      if (!showSisir && !showPokoknys && !showAdaapa) {
        gambarPanggil(xPanggil, yPanggil, 1.0, frameToShowPanggil);
        if (panggilLoopCount == 1) {
          int frameToShowAdaapa = adaapaFrameIndex;
          gambarAdaapa(xAdaapa, yAdaapa, 1.0, frameToShowAdaapa);
          if (adaapaLoopCount < 1) {
            if (adaapaLastTime == 0) adaapaLastTime = millis();
            if (millis() - adaapaLastTime > adaapaDelay) {
              adaapaFrameIndex = (adaapaFrameIndex + 1) % 3;
              adaapaLastTime = millis();
            }
          }
        }
      }
      // Animasi sisir.png setelah panggil.png selesai
      if (showSisir && !showPokoknys && !showAdaapa) {
        if (sisirLoopCount < sisirMaxLoop) {
          if (millis() - sisirLastTime > sisirDelay) {
            sisirFrameIndex++;
            sisirLastTime = millis();
            if (sisirFrameIndex >= 3) {
              sisirFrameIndex = 0;
              sisirLoopCount++;
            }
          }
        } else {
          showPokoknys = true;
          pokoknysFrameIndex = 0;
          pokoknysLastTime = millis();
          pokoknysLoopCount = 0;
        }
        int frameToShowSisir = (sisirLoopCount >= sisirMaxLoop) ? 2 : sisirFrameIndex;
        gambarSisir(xPanggil, yPanggil, 1.0, frameToShowSisir);
      }
      // Animasi pokoknys.png setelah sisir.png selesai
      if (showPokoknys && !showAdaapa) {
        if (pokoknysLoopCount < pokoknysMaxLoop) {
          if (millis() - pokoknysLastTime > pokoknysDelay) {
            pokoknysFrameIndex++;
            pokoknysLastTime = millis();
            if (pokoknysFrameIndex >= 3) {
              pokoknysFrameIndex = 0;
              pokoknysLoopCount++;
            }
          }
        } else {
          showAdaapa = true;
          adaapaFrameIndex = 0;
          adaapaLastTime = millis();
          adaapaLoopCount = 0;
        }
        int frameToShowPokoknys = (pokoknysLoopCount >= pokoknysMaxLoop) ? 2 : pokoknysFrameIndex;
        gambarPokoknys(xPanggil, yPanggil, 1.0, frameToShowPokoknys);
      }
      // Animasi adaapa.PNG setelah pokoknys.png selesai
      if (showAdaapa) {
        if (adaapaLoopCount < adaapaMaxLoop) {
          if (millis() - adaapaLastTime > adaapaDelay) {
            adaapaFrameIndex++;
            adaapaLastTime = millis();
            if (adaapaFrameIndex >= 3) {
              adaapaFrameIndex = 0;
              adaapaLoopCount++;
            }
          }
        }
        int frameToShowAdaapa = (adaapaLoopCount >= adaapaMaxLoop) ? 2 : adaapaFrameIndex;
        gambarAdaapa(xPanggil, yPanggil, 1.0, frameToShowAdaapa);
      }
      if (millis() - waktuMulaiSceneJendela > durasiSceneJendela) {
        showSceneJendela = false;
        showSceneTembok = true;
        waktuMulaiSceneTembok = millis();
      }
      return;
    } else if (showSceneTembok) {
      // Tampilkan tembok kayu di tengah canvas
      float tw = width * 0.7;
      float th = height * 0.7;
      float tx = width/2 - tw/2;
      float ty = height/2 - th/2;
      gambarTembokKayu(tx, ty, tw, th);
      // Animasi mikir.png di tengah tembok, lalu celengan.png
      if (!showCelengan) {
        if (mikirLastTime == 0) mikirLastTime = millis();
        if (mikirLoopCount < mikirMaxLoop) {
          if (millis() - mikirLastTime > mikirDelay) {
            mikirFrameIndex++;
            mikirLastTime = millis();
            if (mikirFrameIndex >= 3) {
              mikirFrameIndex = 0;
              mikirLoopCount++;
            }
          }
        } else {
          showCelengan = true;
          celenganFrameIndex = 0;
          celenganLastTime = millis();
          celenganLoopCount = 0;
        }
      }
      int frameToShowMikir = (mikirLoopCount >= mikirMaxLoop) ? 2 : mikirFrameIndex;
      float xMikir = tx + tw/2;
      float yMikir = ty + th*0.7;
      if (!showCelengan) {
        gambarMikir(xMikir, yMikir, 1.0, frameToShowMikir);
      }
      // Animasi celengan.png setelah mikir.png selesai
      if (showCelengan) {
        if (celenganLastTime == 0) celenganLastTime = millis();
        if (celenganLoopCount < celenganMaxLoop) {
          if (millis() - celenganLastTime > celenganDelay) {
            celenganFrameIndex++;
            celenganLastTime = millis();
            if (celenganFrameIndex >= 3) {
              celenganFrameIndex = 0;
              celenganLoopCount++;
            }
          }
        }
        int frameToShowCelengan = (celenganLoopCount >= celenganMaxLoop) ? 2 : celenganFrameIndex;
        if (celenganSheet != null) {
          int sx = frameToShowCelengan * celenganFrameWidth;
          PImage frame = celenganSheet.get(sx, 0, celenganFrameWidth, celenganFrameHeight);
          pushMatrix();
          translate(xMikir, yMikir);
          scale(1.0);
          imageMode(CENTER);
          image(frame, 0, 0);
          popMatrix();
        }
      }
      if (millis() - waktuMulaiSceneTembok > durasiSceneTembok) {
        showSceneTembok = false;
        showSceneKebunBaru = true;
        waktuMulaiSceneKebunBaru = millis();
      }
      return;
    } else if (showSceneKebunBaru) {
      gambarKebunBaru(width, height);
      // Animasi berjalan ke pasar
      float durasi = durasiSceneKebunBaru;
      float t = constrain((millis() - waktuMulaiSceneKebunBaru) / durasi, 0, 1);
      float xAwal = -kepasarFrameWidth * 1.2;
      float xAkhir = width + kepasarFrameWidth * 1.2;
      float x = lerp(xAwal, xAkhir, t);
      float y = height * 0.82;
      animasiBerjalanKepasar(x, y, 1.1);
      if (millis() - waktuMulaiSceneKebunBaru > durasiSceneKebunBaru) {
        showSceneKebunBaru = false;
        showSceneLapakPerhiasan = true;
        waktuMulaiSceneLapakPerhiasan = millis();
      }
      return;
    } else if (showSceneLapakPerhiasan) {
      // Gambar scene lapak perhiasan
      drawWall();
      drawFloor();
      drawShowcase();
      drawBracelets();
      drawLamp();
      // Animasi pedagang
      if (pedagangGerak1 == null) pedagangGerak1 = loadImage("pedagang_gerak1.PNG");
      if (pedagangGerak2 == null) pedagangGerak2 = loadImage("pedagang_gerak2.PNG");
      if (newPedagangWidth == 0 && pedagangGerak1 != null) newPedagangWidth = newPedagangHeight * ((float)pedagangGerak1.width / pedagangGerak1.height);
      if (millis() - lastFrameChangeTime > animationSpeed) {
        currentFrame = 1 - currentFrame;
        lastFrameChangeTime = millis();
      }
      if (currentFrame == 0 && pedagangGerak1 != null) {
        drawPemudaZamanDulu(width/2, 310, pedagangGerak1, newPedagangWidth, newPedagangHeight);
      } else if (pedagangGerak2 != null) {
        drawPemudaZamanDulu(width/2, 310, pedagangGerak2, newPedagangWidth, newPedagangHeight);
      }
      if (millis() - waktuMulaiSceneLapakPerhiasan > durasiSceneLapakPerhiasan) {
        showSceneLapakPerhiasan = false;
        showSceneBukanIbuku = true;
        waktuMulaiSceneBukanIbuku = millis();
      }
      return;
    } else if (showSceneBukanIbuku) {
      gambarBukanIbukuScene(width, height);
      if (millis() - waktuMulaiSceneBukanIbuku > durasiSceneBukanIbuku) {
        showSceneBukanIbuku = false;
        // lanjut ke scene berikutnya jika ada
      }
      return;
    } else {
      // Kosongkan atau lanjut ke scene berikutnya
      background(180, 220, 140);
      return;
    }
  }
  // Langit/hutan belakang
  noStroke();

  // Pohon besar di kiri
  fill(90, 60, 30);
  rect(0, 0, 60, height);

  // Kanopi daun pohon kiri atas
  fill(60, 120, 40);
  ellipse(120, 40, 250, 80);
  ellipse(60, 100, 180, 80);

  // Semak-semak hijau belakang
  fill(60, 160, 60);
  for (int i = 0; i < width; i += 60) {
    ellipse(i + 30, height - 240, 100, 80);
    ellipse(i + 60, height - 220, 80, 50);
  }

    // Rumah panggung di kanan
    float rumahW = width * 0.38; // sekitar 38% lebar canvas
    float rumahH = height - 40;
    float rumahX = width - rumahW + 20;
    float rumahY = 0;

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

  // Pintu
  fill(120, 80, 40);
  float pintuW = 300;
  float pintuH = 550;
  float pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
  float pintuY = rumahY + rumahH - pintuH - 20;
  rect(pintuX, pintuY, pintuW, pintuH, 16);


  // Tanah/lantai terang
  fill(180, 220, 80);
  rect(0, height - 210, width, 120);

  // Karakter di depan rumah: animasi ambil sayur dulu, lalu berjalan
  if (sedangAmbilSayur && ambilSayurSheet != null) {
    // Animasi ambil sayur
    if (millis() - ambilSayurLastFrameTime > ambilSayurAnimDelay) {
      ambilSayurCurrentFrame = (ambilSayurCurrentFrame + 1) % ambilSayurFrameCount;
      ambilSayurLastFrameTime = millis();
    }
    // Posisi karakter di depan pintu rumah (animasi ambil sayur)
    rumahW = width * 0.38;
    rumahX = width - rumahW + 20;
    rumahY = 0;
    rumahH = height - 40;
    pintuW = 300;
    pintuH = 550;
    pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
    pintuY = rumahY + rumahH - pintuH - 20;
    float xKarakter = pintuX + pintuW/2 - 300;
    float scaleVal = 1.2; // diperbesar dari 0.7 menjadi 0.9
    float yKarakter = height - 140 - (ambilSayurFrameHeight * scaleVal / 2) + 295;

    float frameW = ambilSayurSheet.width / float(ambilSayurFrameCount);
    int sx = int(round(ambilSayurCurrentFrame * frameW));
    int sw = (ambilSayurCurrentFrame == ambilSayurFrameCount - 1) ? ambilSayurSheet.width - sx : int(round((ambilSayurCurrentFrame + 1) * frameW)) - sx;
    int sy = 0;
    imageMode(CORNER);
    PImage frame = ambilSayurSheet.get(sx, sy, sw, ambilSayurFrameHeight);
    imageMode(CENTER);
    pushMatrix();
    translate(xKarakter, yKarakter);
    scale(scaleVal);
    image(frame, 0, 0);
    popMatrix();

    // Setelah durasi animasi ambil sayur selesai, mulai berjalan
    if (millis() - waktuMulaiAmbilSayur > durasiAmbilSayur) {
      sedangAmbilSayur = false;
      // Reset posisi karakter ke depan pintu rumah (setelah animasi ambil sayur)
      rumahW = width * 0.38;
      rumahX = width - rumahW + 20;
      rumahY = 0;
      rumahH = height - 40;
      pintuW = 300;
      pintuH = 550;
      pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
      pintuY = rumahY + rumahH - pintuH - 20;
      karakterX = pintuX + pintuW/2;
      waktuMulaiBerjalan = millis(); // set timer mulai berjalan
    }
  } else if (karakterSheet != null && !jalanSelesai) {
    if (millis() - karakterLastFrameTime > karakterAnimDelay) {
      karakterCurrentFrame = (karakterCurrentFrame + 1) % karakterFrameCount;
      karakterLastFrameTime = millis();
    }
    karakterX -= karakterSpeed;
    if (karakterX < -karakterFrameWidth * 0.7) {
      // Reset ke depan pintu rumah (setelah berjalan)
      rumahW = width * 0.38;
      rumahX = width - rumahW + 20;
      rumahY = 0;
      rumahH = height - 40;
      pintuW = 300;
      pintuH = 550;
      pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
      pintuY = rumahY + rumahH - pintuH - 20;
      karakterX = pintuX + pintuW/2;
      jalanCount++;
      if (jalanCount >= 1) {
        jalanSelesai = true;
      }
    }
    float frameW = karakterSheet.width / float(karakterFrameCount);
    int sx = int(round(karakterCurrentFrame * frameW));
    int sw;
    if (karakterCurrentFrame == karakterFrameCount - 1) {
      sw = karakterSheet.width - sx;
    } else {
      sw = int(round((karakterCurrentFrame + 1) * frameW)) - sx;
    }
    int sy = 0;
    imageMode(CORNER);
    PImage frame = karakterSheet.get(sx, sy, sw, karakterFrameHeight);
    imageMode(CENTER);
    pushMatrix();
    // Untuk posisi yKarakter saat berjalan
    float scaleVal = 0.9;
    rumahW = width * 0.38;
    rumahX = width - rumahW + 20;
    rumahY = 0;
    rumahH = height - 40;
    pintuW = 300;
    pintuH = 550;
    pintuX = rumahX + rumahW/2 - pintuW/2 + 170;
    pintuY = rumahY + rumahH - pintuH - 20;
    float yKarakter = height - 140 - (karakterFrameHeight * scaleVal / 2) + 150;
    translate(karakterX - 300, yKarakter);
    scale(scaleVal);
    image(frame, 0, 0);
    popMatrix();
    // Setelah animasi berjalan selesai
    if (millis() - waktuMulaiBerjalan > 7000) {
        jalanSelesai = true;
    }
  }

  // Setelah animasi berjalan selesai, tampilkan frame spritesheet syukurlah satu per satu
  if (jalanSelesai) {
    imageMode(CENTER);
    if (!syukurlahSelesai) {
      if (syukurlahLastTime == 0) syukurlahLastTime = millis();
      if (millis() - syukurlahLastTime > syukurlahDelay) {
        syukurlahFrameIndex++;
        syukurlahLastTime = millis();
        if (syukurlahFrameIndex >= syukurlahFrameCounts[currentSheet]) {
          if (currentSheet < 12) {
            // lanjut ke sheet berikutnya
            currentSheet++;
            syukurlahFrameIndex = 0;
            syukurlahFrameWidth = syukurlahSheets[currentSheet].width / syukurlahFrameCounts[currentSheet];
            syukurlahFrameHeight = syukurlahSheets[currentSheet].height;
          } else {
            syukurlahFrameIndex = syukurlahFrameCounts[12] - 1;
            syukurlahSelesai = true;
          }
        }
      }
    }
    int sx = syukurlahFrameIndex * syukurlahFrameWidth;
    PImage frame = syukurlahSheets[currentSheet].get(sx, 0, syukurlahFrameWidth, syukurlahFrameHeight);
    float scaleVal = 0.9;
    float xKarakter = karakterX - 300;
    float yKarakter = height - 140 - (syukurlahFrameHeight * scaleVal / 2) + 150;
    pushMatrix();
    translate(xKarakter, yKarakter);
    scale(scaleVal);
    image(frame, 0, 0);
    popMatrix();
    // Tetap gambar semak depan dan semak merah agar konsisten
    fill(40, 120, 40);
    for (int i = 0; i < width; i += 50) {
      ellipse(i + 25, height, 120, 260);
    }
    fill(180, 40, 60);
    for (int i = 0; i < 4; i++) {
      ellipse(40 + i * 30, height - 5, 50, 30);
    }
    return;
  }

  // Semak depan (lebih gelap)
  fill(40, 120, 40);
  for (int i = 0; i < width; i += 50) {
    ellipse(i + 25, height, 120, 260);
  }

  // Semak merah di kiri bawah
  fill(180, 40, 60);
  for (int i = 0; i < 4; i++) {
    ellipse(40 + i * 30, height - 5, 50, 30);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (showSceneRumah) {
      showSceneRumah = false;
      showSceneHutan = true;
      waktuMulaiSceneHutan = millis();
    } else if (showSceneHutan) {
      showSceneHutan = false;
      showSceneJendela = true;
      waktuMulaiSceneJendela = millis();
    } else if (showSceneJendela) {
      showSceneJendela = false;
      showSceneTembok = true;
      waktuMulaiSceneTembok = millis();
    } else if (showSceneTembok) {
      showSceneTembok = false;
      showSceneKebunBaru = true;
      waktuMulaiSceneKebunBaru = millis();
    } else if (showSceneKebunBaru) {
      showSceneKebunBaru = false;
      showSceneLapakPerhiasan = true;
      waktuMulaiSceneLapakPerhiasan = millis();
    } else if (showSceneLapakPerhiasan) {
      showSceneLapakPerhiasan = false;
      showSceneBukanIbuku = true;
      waktuMulaiSceneBukanIbuku = millis();
    }
  } else if (showRumahOnly && (key == 'b' || key == 'B')) {
    showRumahOnly = false;
  }
}
