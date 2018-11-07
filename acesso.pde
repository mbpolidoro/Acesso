{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardeftab720\partightenfactor0

\f0\fs22 \cf2 \expnd0\expndtw0\kerning0
/*\
 Elaborado por\
 Marina Polidoro e Augusto Neftali\
 em 2018\
 com base na representa\'e7\'e3o da C\'e2mara de Deputados do Brasil\
 conforme pesquisa aqui publicada: http://dx.doi.org/10.5433/2176-6665.2015v20n2p235  \
 e dados atualizados da elei\'e7\'e3o de 2018\
 Licenciado Creative Commons 4.0 BY-NC-SA\
 */\
\
float ox = random(10000);\
float oy = random(10000);\
float oz = random(10000);\
Cand candidato;\
Obstaculo[] obstaculos = new Obstaculo[2000];\
int dificuldade = 500;\
boolean eleito = false;\
boolean inicial = true;\
int sexo, cor, ocupa, patr, instr;\
\
void setup() \{\
  size(1000, 700);\
  smooth();\
  rectMode(CENTER);\
  ellipseMode(CENTER);\
  for (int i = 0; i < obstaculos.length; i++) \{\
    obstaculos[i] = new Obstaculo (random(41, width-40), random(41, height-40));\
  \}\
\}\
\
void draw() \{\
  if (inicial) \{\
    telainicial();\
    candidato = new Cand();\
  \} else \{\
    noCursor();\
    background(#ab9e96);\
    strokeWeight(10);\
    stroke (100);\
    noFill();\
    rect(width/2, height/2-5, width-50, height-60);\
    fill(100);\
    textSize(12);\
    text("Use as setas para mover-se | ESC para sair | Enter para retornar ao menu  ", 30, 685);\
    for (int i = 0; i < dificuldade; i++) \{\
      obstaculos[i].show();\
    \}\
    if (eleito ==false) \{\
      congressoNacional();\
      candidato.move();\
    \} else \{\
      ganhou();\
    \}\
    candidato.show(); \
    for (int j = 0; j < dificuldade; j++) \{\
      if (candidato.acerta(obstaculos[j])) \{\
        background(#ff3333);\
        candidato.perde();\
      \}\
    \}\
  \}\
\}\
\
void congressoNacional() \{\
  noStroke();\
  fill (#f6e771);\
  oy-=0.02;\
  oz+=0.01;\
  beginShape();\
  for (float angle = 0; angle < 360; angle++) \{\
    float radian = radians(angle);\
    float radius = (20*getNoiseWithTime(radian, 0.24, oz)) + (80);\
    vertex(width+radius * cos(radian)-145, height+radius * sin(radian)-145);\
  \}\
  endShape(CLOSE);\
  noFill();\
  strokeWeight(2);\
  stroke (100);\
  arc(width-190, height-120, 40, 40, PI, TWO_PI, CHORD);\
  arc(width-100, height-140, 40, 40, 0, PI, CHORD);\
  rect(width-155, height-150, 15, 60);\
  rect(width-135, height-150, 15, 60);\
\}\
float getNoiseWithTime(float radian, float dim, float time) \{\
  float r = radian % TWO_PI;\
  if (r < 0.0) \{\
    r += TWO_PI;\
  \}\
  return noise(ox + cos(r) * dim, oy + sin(r) * dim);\
\}\
\
void ganhou() \{\
  noStroke();\
  fill (#bcb829);\
  ellipse (width-145, height-145, 180, 180);\
  noFill();\
  strokeWeight(2);\
  stroke (100);\
  arc(width-190, height-120, 40, 40, PI, TWO_PI, CHORD);\
  arc(width-100, height-140, 40, 40, 0, PI, CHORD);\
  rect(width-155, height-150, 15, 60);\
  rect(width-135, height-150, 15, 60);\
\}\
\
void keyPressed() \{  \
  if (keyCode == RIGHT) \{\
    candidato.setDirX(1);\
  \} else if (keyCode == LEFT) \{\
    candidato.setDirX(-1);\
  \} else if (keyCode == UP) \{\
    candidato.setDirY(-1);\
  \} else if (keyCode == DOWN) \{\
    candidato.setDirY(1);\
  \} else if (keyCode == ENTER) \{\
    inicial=true;\
    dificuldade=500;\
    sexo=0;\
    cor=0;\
    ocupa=0;\
    patr=0;\
    instr=0;\
  \}\
\}\
\
void keyReleased() \{\
  if (key != ' ') \{\
    candidato.setDirX(0);\
    candidato.setDirY(0);\
  \}\
\}\
\
void telainicial() \{\
  background(#db6957);\
  cursor();\
  strokeWeight(3);\
  stroke (100);\
  fill (#e68a2b);\
  rect(width/2, height/3-25, width-120, height/3);\
  fill (#9384b0);\
  rect(width/2, 80, width-120, 50);\
  fill (#ffffff);\
  textSize(23);\
  text("JOGO DO ACESSO", 100, 90);\
  textSize(13);\
  text("Quem vai concorrer \'e0 C\'e2mara dos deputados?", 100, 140);\
  text("Sexo/Identidade de G\'eanero: ( ) Feminino  ( ) Masculino  ( ) LGBTQI+", 100, 160); \
  text("Cor ou ra\'e7a: ( ) Branca  ( ) Negra  ( ) Ind\'edgena", 100, 180);\
  text("Ocupa\'e7\'e3o: ( ) Ger\'eancia do Setor Privado  ( ) Profissional de Ensino Superior  ( ) Trabalhador  ( ) Policial ou Militar  ( ) Outros", 100, 200);\
  text("Patrim\'f4nio: ( ) at\'e9 R$300mil  ( ) at\'e9 R$750mil  ( ) at\'e9 R$1.500mil  ( ) mais", 100, 220);\
  text("Instru\'e7\'e3o: ( ) Ensino fundamental incompleto  ( ) Fundamental completo  ( ) M\'e9dio completo  ( ) Superior completo", 100, 240);\
  text("Concorra!", 100, 280);\
  textSize(11);\
  text("Os graus de dificuldade foram calculados a partir da desigualdade de presen\'e7a na C\'e2mara de Deputados em rela\'e7\'e3o \'e0 sociedade brasileira", 100, 600);\
  text("com dados da elei\'e7\'e3o de 2018.", 100, 615);\
\
  //ASSINALADO  \
  noStroke(); \
  fill (#ADFF2F); \
  switch (sexo) \{\
  case 1:\
    ellipse(287, 156, 7, 7);\
    break;\
  case 2:\
    ellipse(370, 156, 7, 7);\
    break;\
  case 3:\
    ellipse (458, 156, 7, 7);\
    break;\
  \}\
  switch(cor) \{\
  case 1: \
    ellipse(187, 176, 7, 7);\
    break;\
  case 2:\
    ellipse(254, 176, 7, 7);\
    break;\
  case 3:\
    ellipse(316, 176, 7, 7);\
    break;\
  \}\
  switch (ocupa) \{\
  case 1:\
    ellipse(176, 196, 7, 7);\
    break;\
  case 2:\
    ellipse(363, 196, 7, 7);\
    break;\
  case 3:\
    ellipse (583, 196, 7, 7);\
    break;\
  case 4:\
    ellipse (685, 196, 7, 7);\
    break;\
  case 5:\
    ellipse (818, 196, 7, 7);\
    break;\
  \}\
  switch (patr) \{\
  case 1:\
    ellipse(182, 216, 7, 7);\
    break;\
  case 2:\
    ellipse(292, 216, 7, 7);\
    break;\
  case 3:\
    ellipse (401, 216, 7, 7);\
    break;\
  case 4:\
    ellipse (522, 216, 7, 7);\
    break;\
  \}\
  switch (instr) \{\
  case 1:\
    ellipse(173, 236, 7, 7);\
    break;\
  case 2:\
    ellipse(398, 236, 7, 7);\
    break;\
  case 3:\
    ellipse (567, 236, 7, 7);\
    break;\
  case 4:\
    ellipse (694, 236, 7, 7);\
    break;\
  \}\
\}\
\
void mouseMoved() \{\
  if (inicial) \{\
    //SEXO     \
    if (mouseX>277 && mouseX<355 && mouseY>138 && mouseY<167) \{    //FEMININO\
      ellipse(287, 156, 7, 7);\
    \}    \
    if (mouseX>360 && mouseX<445 && mouseY>138 && mouseY<167) \{    //MASCULINO\
      ellipse(370, 156, 7, 7);\
    \}\
    if (mouseX>448 && mouseX<525 && mouseY>138 && mouseY<167) \{     //LGBTQI+\
      ellipse (458, 156, 7, 7);\
    \}\
    //COR\
    if (mouseX>177 && mouseX<240 && mouseY>168 && mouseY<187) \{   //BRANCA\
      ellipse(187, 176, 7, 7);\
    \}\
    if (mouseX>244 && mouseX<301 && mouseY>168 && mouseY<187) \{   //NEGRA\
      ellipse(254, 176, 7, 7);\
    \}\
    if (mouseX>306 && mouseX<383 && mouseY>168 && mouseY<187) \{    //INDIGENA\
      ellipse(316, 176, 7, 7);\
    \}\
    //OCUPA\'c7AO\
    if (mouseX>166 && mouseX<350 && mouseY>188 && mouseY<207) \{    //GERENCIA\
      ellipse(176, 196, 7, 7);\
    \}    \
    if (mouseX>353 && mouseX<570 && mouseY>188 && mouseY<207) \{    //SUPERIOR\
      ellipse(363, 196, 7, 7);\
    \}\
    if (mouseX>573 && mouseX<670 && mouseY>188 && mouseY<207) \{     //TRABALHADOR\
      ellipse (583, 196, 7, 7);\
    \}\
    if (mouseX>675 && mouseX<802 && mouseY>188 && mouseY<207) \{     //MILITAR\
      ellipse (685, 196, 7, 7);\
    \}\
    if (mouseX>808 && mouseX<870 && mouseY>188 && mouseY<207) \{     //OUTROS\
      ellipse (818, 196, 7, 7);\
    \}\
    //PATRIMONIO\
    if (mouseX>173 && mouseX<280 && mouseY>208 && mouseY<227) \{    //300MIL\
      ellipse(182, 216, 7, 7);\
    \}    \
    if (mouseX>283 && mouseX<387 && mouseY>208 && mouseY<227) \{    //700MIL\
      ellipse(292, 216, 7, 7);\
    \}\
    if (mouseX>391 && mouseX<510 && mouseY>208 && mouseY<227) \{     //1500MIL\
      ellipse (401, 216, 7, 7);\
    \}\
    if (mouseX>512 && mouseX<565 && mouseY>208 && mouseY<227) \{     //MAIS\
      ellipse (522, 216, 7, 7);\
    \}\
    //INSTRUCAO\
    if (mouseX>163 && mouseX<385 && mouseY>228 && mouseY<247) \{    //FUND INCOMP\
      ellipse(173, 236, 7, 7);\
    \}    \
    if (mouseX>388 && mouseX<550 && mouseY>228 && mouseY<247) \{    //FUND\
      ellipse(398, 236, 7, 7);\
    \}\
    if (mouseX>557 && mouseX<670 && mouseY>228 && mouseY<247) \{     //MEDIO \
      ellipse (567, 236, 7, 7);\
    \}\
    if (mouseX>683 && mouseX<820 && mouseY>228 && mouseY<247) \{     //SUPERIOR\
      ellipse (694, 236, 7, 7);\
    \}\
    //JOGAR\
    if (mouseX>100 && mouseX<160 && mouseY>260 && mouseY<290) \{\
      stroke(#ADFF2F); \
      strokeWeight(2);\
      line(100, 282, 157, 282);\
    \}\
  \}\
\}\
\
void mouseClicked() \{\
  if (inicial) \{\
    if (mouseX>277 && mouseX<355 && mouseY>138 && mouseY<167) \{    //FEMININO\
      sexo=1;\
    \}\
    if (mouseX>360 && mouseX<445 && mouseY>138 && mouseY<167) \{    //MASCULINO\
      sexo=2;\
    \}\
    if (mouseX>448 && mouseX<525 && mouseY>138 && mouseY<167) \{     //LGBTQI+\
      sexo= 3;\
    \}\
    if (mouseX>177 && mouseX<240 && mouseY>168 && mouseY<187) \{   //BRANCA\
      cor=1;\
    \}\
    if (mouseX>244 && mouseX<301 && mouseY>168 && mouseY<187) \{   //NEGRA\
      cor=2;\
    \}\
    if (mouseX>306 && mouseX<383 && mouseY>168 && mouseY<187) \{    //INDIGENA\
      cor=3;\
    \}\
    if (mouseX>166 && mouseX<350 && mouseY>188 && mouseY<207) \{    //GERENCIA\
      ocupa=1;\
    \}    \
    if (mouseX>353 && mouseX<570 && mouseY>188 && mouseY<207) \{    //SUPERIOR\
      ocupa=2;\
    \}\
    if (mouseX>573 && mouseX<670 && mouseY>188 && mouseY<207) \{     //TRABALHADOR\
      ocupa=3;\
    \}\
    if (mouseX>675 && mouseX<802 && mouseY>188 && mouseY<207) \{     //MILITAR\
      ocupa=4;\
    \}\
    if (mouseX>808 && mouseX<870 && mouseY>188 && mouseY<207) \{     //OUTROS\
      ocupa=5;\
    \}\
    if (mouseX>173 && mouseX<270 && mouseY>208 && mouseY<227) \{    //300MIL\
      patr=1;\
    \}    \
    if (mouseX>283 && mouseX<387 && mouseY>208 && mouseY<227) \{    //700MIL\
      patr=2;\
    \}\
    if (mouseX>391 && mouseX<510 && mouseY>208 && mouseY<227) \{     //1500MIL\
      patr=3;\
    \}\
    if (mouseX>512 && mouseX<565 && mouseY>208 && mouseY<227) \{     //MAIS\
      patr=4;\
    \}\
    if (mouseX>163 && mouseX<385 && mouseY>228 && mouseY<247) \{    //FUND INCOMP\
      instr=1;\
    \}    \
    if (mouseX>388 && mouseX<550 && mouseY>228 && mouseY<247) \{    //FUND\
      instr=2;\
    \}\
    if (mouseX>557 && mouseX<670 && mouseY>228 && mouseY<247) \{     //MEDIO \
      instr=3;\
    \}\
    if (mouseX>683 && mouseX<820 && mouseY>228 && mouseY<247) \{     //SUPERIOR\
      instr=4;\
    \}\
\
    if (mouseX>100 && mouseX<160 && mouseY>260 && mouseY<290) \{\
      stroke(#ADFF2F); \
      strokeWeight(3);\
      line(100, 282, 155, 282);\
      inicial=false;\
      println(dificuldade);\
      calculardificuldade();\
      println(dificuldade);\
    \}\
  \}\
\}\
void calculardificuldade() \{\
  if (sexo==1) \{\
    dificuldade=dificuldade+76;\
  \}\
  //if (sexo==2) \{\
  //  dificuldade=dificuldade;\
  //\}\
  if (sexo==3) \{\
    dificuldade=dificuldade+92;\
  \}\
  //if (cor==1) \{\
  //  dificuldade=dificuldade;\
  //\}\
  if (cor==2) \{\
    dificuldade=dificuldade+56;\
  \}\
  if (cor==3) \{\
    dificuldade=dificuldade+56;\
  \}\
  if (ocupa==1) \{\
    dificuldade=dificuldade-20;\
  \}\
  if (ocupa==2) \{\
    dificuldade=dificuldade-12;\
  \}\
  if (ocupa==3) \{\
    dificuldade=dificuldade+76;\
  \}\
  if (ocupa==4) \{\
    dificuldade=dificuldade-28;\
  \}\
    if (ocupa==5) \{\
    dificuldade=dificuldade+72;\
  \}\
  if (patr==1) \{\
    dificuldade=dificuldade+76;\
  \}\
  if (patr==2) \{\
    dificuldade=dificuldade-36;\
  \}\
  if (patr==3) \{\
    dificuldade=dificuldade-48;\
  \}\
  if (patr==4) \{\
    dificuldade=dificuldade-240;\
  \}\
  if (instr==1) \{\
    dificuldade=dificuldade+100;\
  \}\
  if (instr==2) \{\
    dificuldade=dificuldade+88;\
  \}\
  if (instr==3) \{\
    dificuldade=dificuldade+48;\
  \}\
  if (instr==4) \{\
    dificuldade=dificuldade-16;\
  \}\
\}\
\
class Cand \{\
  float x, xdir;\
  float y, ydir;\
\
  Cand() \{\
    this.x = 40;\
    this.xdir = 0;\
    this.y = 40;\
    this.ydir = 0;\
  \}\
\
  void show() \{\
    noStroke();\
    fill(#9b4358);\
    rect(this.x, this.y, 15, 15);\
  \}\
\
  void setDirX(float dir) \{\
    this.xdir = dir;\
  \}\
\
  void setDirY(float dir) \{\
    this.ydir = dir;\
  \}\
\
  void move() \{\
    if (this.x < 40) \{\
      this.x = 40;\
    \}  \
    if (this.x > width-40) \{\
      this.x = width-40;\
    \} \
    this.x += this.xdir*5;\
\
    if (this.y < 40) \{\
      this.y = 40;\
    \}  \
    if (this.y > height-40) \{\
      this.y = height-40;\
    \}  \
    this.y += this.ydir*5;\
\
    if (x >= width-222 && y >= height-222) \{\
      eleito = true;\
    \}\
  \}\
\
  boolean acerta(Obstaculo obstaculos) \{\
    float t = dist(this.x, this.y, obstaculos.x, obstaculos.y);\
    if (t < 10) \{\
      return true;\
    \} else \{\
      return false;\
    \}\
  \}\
  void perde() \{\
    background(#ff3333);\
    this.x = 40;\
    this.y = 40;\
    this.xdir = 0;\
    this.ydir = 0;\
  \}\
\}\
\
class Obstaculo \{\
  float x, y;\
  \
  Obstaculo(float x, float y) \{\
    this.x = x;\
    this.y = y;\
\}\
  void show() \{\
    fill(100);\
    noStroke();\
    rect(this.x, this.y, 7, 7);\
  \}\
\}}