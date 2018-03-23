import java.util.Collections;
import java.util.Random;
PFont font1, font2;
PImage title, round1bg, round2bg, round3bg, start0, start1;
PImage next0, next1, return0, return1, buy0, buy1, buy2;
PImage chooseRole;
PImage howPlay, how0, how1,puzzlehow;
PImage themepark, zoo, question;

// role
PImage role0, run_right0, run_left0, lie0, lie_big0, win0, lose0, text0;
PImage role1, run_right1, run_left1, lie1, lie_big1, win1, lose1, text1;
PImage role2, run_right2, run_left2, lie2, lie_big2, win2, lose2, text2;
PImage role3, run_right3, run_left3, lie3, lie_big3, win3, lose3, text3;
PImage role4, run_right4, run_left4, lie4, lie_big4, win4, lose4, text4;

String whichRole ;

//PImage road;
//won't move
PImage heart;
//will move
PImage milk, poo, magnet, coin, car, rocket, spider, icecream, icecreampour, bonus;
PImage monkey, banana, octopus;
PImage left0, left1, right0, right1, round1, round2, round3, num1, num2, num3;

//state
final int GAME_START = 0, GAME_STORY = 1, GAME_ROLE = 2, GAME_HOW = 3, GAME_RUN1 = 4, GAME_RUN2 = 5, GAME_RUN3 = 6, 
  GAME_DIE = 7, PUZZLE_HOW = 8, PUZZLE_BUY = 9, PUZZLE_PLAY = 10, GAME_WIN = 11, GAME_OVER = 12; 
int gameState = 0;

// START_BUTTON
final int START_BUTTON_WIDTH = 300;
final int START_BUTTON_HEIGHT = 100;
final int START_BUTTON_X = 350;
final int START_BUTTON_Y = 390;

// NEXT_BUTTON
final int NEXT_BUTTON_WIDTH = 150;
final int NEXT_BUTTON_HEIGHT = 80;
final int NEXT_BUTTON_X = 830;
final int NEXT_BUTTON_Y = 400;

// RETURN_BUTTON
final int RETURN_BUTTON_WIDTH = 80;
final int RETURN_BUTTON_HEIGHT = 80;
final int RETURN_BUTTON_X = 20;
final int RETURN_BUTTON_Y = 400;

// ROLE
final int DETECTIVE_X = 70;
final int POLICE_X = 250;
final int VICTIM_X = 430;
final int CRIMINAL1_X = 610;
final int CRIMINAL2_X = 790;
final int ROLE_Y = 130;
final int ROLE_WIDTH = 140;
final int ROLE_HEIGHT = 200;

boolean isAlive = true;

//gamerun1
int time = 670;

//man
Player player;
boolean upPressed, downPressed;
boolean playerDisplay = true;
int jumpCount = 0;


//heart
int heartX = 200;
int heartNum = 3;

//translate
int translate, transSpeed = 0;

//car
PImage[] carColor;

//coins
Coin [][] coins;
int[] coinX, coinY, coinNum;
int coinCount = 0;
int coinRecord1, coinRecord2;

Magnet [] magnets;

Milk [] milks;
int milkcount = 4;
int milkspace = 3000;


Poo [] poos;
int poocount = 35;
int poospace = 450;
Car [] cars;
Rocket [] rockets; 
Spider [] spiders;
Icecream [] icecreams;
Bonus [] bonuses;
Monkey [] monkeys;
Octopus [] octopuses;

Heart [] hearts;
int heartcount = 3;
int heartspace = 4000;

//gamehow
int howplaycount = 0;
int checkWhichRound = 0;

//puzzle
PImage[] puzzle = new PImage[9];
Puzzle [] puzzles;
Puzzle grabbedPuzzle;
float originX, originY;
//new
int squareIndex, puzzleIndex;
int originIndex;


//bouns
int bonusCount = 0;
int bonusRecord1, bonusRecord2;

//PUZZLE_BUY
PImage store;
PImage lose;
int loseTimer = 5*60;
final int BUY_BUTTON_WIDTH = 120;
final int BUY_BUTTON_HEIGHT = 60;
final int BUY_BUTTON_X = 570;
final int BUY_BUTTON_Y = 375;



void setup() {
  size(1000, 500);

  font1 = createFont("font/font.ttf", 40);
  font2 = createFont("font/font.ttf", 56);
  textFont(font1);

  // load Image
  title = loadImage("img/title.png");
  start0 = loadImage("img/start0.png");
  start1 = loadImage("img/start1.png");
  next0 = loadImage("img/next0.png");
  next1 = loadImage("img/next1.png");
  return0 = loadImage("img/return0.png");
  return1 = loadImage("img/return1.png");
  chooseRole = loadImage("img/chooseRole.png");
  how0 = loadImage("img/how0.png");
  how1 = loadImage("img/how1.png");
  left0 = loadImage("img/left0.png");
  left1 = loadImage("img/left1.png");
  right0 = loadImage("img/right0.png");
  right1 = loadImage("img/right1.png");
  round1 = loadImage("img/round1.png");
  round2 = loadImage("img/round2.png");
  round3 = loadImage("img/round3.png");
  num1 = loadImage("img/1.png");
  num2 = loadImage("img/2.png");
  num3 = loadImage("img/3.png");
  round1bg = loadImage("img/round1bg.png");
  round2bg = loadImage("img/round2bg.png");
  round3bg = loadImage("img/round3bg.png");
  puzzlehow = loadImage("img/puzzlehow.png");
  // role
  role0 = loadImage("img/role/role0.png");
  role1 = loadImage("img/role/role1.png");
  role2 = loadImage("img/role/role2.png");
  role3 = loadImage("img/role/role3.png");
  role4 = loadImage("img/role/role4.png");
  text0 = loadImage("img/role/text0.png");
  text1 = loadImage("img/role/text1.png");
  text2 = loadImage("img/role/text2.png");
  text3 = loadImage("img/role/text3.png");
  text4 = loadImage("img/role/text4.png");

  //road = loadImage("img/road.png");
  milk = loadImage("img/milk.png");
  poo = loadImage("img/poo.png");
  magnet = loadImage("img/magnet.png");
  coin = loadImage("img/coin.png");
  rocket = loadImage("img/rocket.png");
  heart = loadImage("img/heart.png");
  spider = loadImage("img/spider.png");
  icecream = loadImage("img/icecream.png");
  icecreampour = loadImage("img/icecreampour.png");
  monkey = loadImage("img/monkey.png");
  banana = loadImage("img/banana.png");
  bonus = loadImage("img/bonus.png");
  themepark = loadImage("img/themepark.png");
  zoo = loadImage("img/zoo.png");
  question = loadImage("img/question.png");
  store = loadImage("img/store.png");
  buy0 = loadImage("img/buy0.png");
  buy1 = loadImage("img/buy1.png");
  buy2 = loadImage("img/buy2.png");
  lose = loadImage("img/lose.png");
  octopus = loadImage("img/octopus.png");

  

  // load carColor Image
  carColor = new PImage[3];
  for (int i=0; i<3; i++) {
    carColor[i] = loadImage("img/car"+i+".png");
  }

  //init function
  // coins
  initCoins();
  // poos
  initPoo();
  // cars
  initCar();
  // magnets
  initMagnet();
  // milks  
  initMilk();
  // rockets
  initRocket();
  // spiders
  initSpider();
  // icecreams
  initIcecream();
  // monkeys
  initMonkey();
  // Bonuses
  initBonus();
  initHeart();

  
}

void draw() {
  switch(gameState) {
  case GAME_START:
    image(title, 0, 0);

    if (isMouseHit(START_BUTTON_X, START_BUTTON_Y, START_BUTTON_WIDTH, START_BUTTON_HEIGHT)) {
      image(start1, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_ROLE;
        
        mousePressed = false;
      }
    } else {
      image(start0, START_BUTTON_X, START_BUTTON_Y);
    }

    break;

  case GAME_STORY:
    break;

  case GAME_ROLE:
    image(chooseRole, 0, 0);

    // DETECTIVE
    tint(255, 150);
    if (isMouseHit(DETECTIVE_X, ROLE_Y, ROLE_WIDTH, ROLE_HEIGHT)) {
      tint(255);
      image(text0, 352, 398); 
      if (mousePressed) {
        whichRole = "0";
        player = new Player(whichRole);
        gameState = GAME_HOW;
        initPuzzle();
        mousePressed = false;
      }
    }
    image(role0, DETECTIVE_X, ROLE_Y);
    noTint();

    // POLICE
    tint(255, 150);
    if (isMouseHit(POLICE_X, ROLE_Y, ROLE_WIDTH, ROLE_HEIGHT)) {
      tint(255);
      image(text1, 315, 398); 
      if (mousePressed) {
        whichRole = "1";
        player = new Player(whichRole);
        gameState = GAME_HOW;
        initPuzzle();
        mousePressed = false;
      }
    }
    image(role1, POLICE_X, ROLE_Y);
    noTint();

    // VICTIM
    tint(255, 150);
    if (isMouseHit(VICTIM_X, ROLE_Y, ROLE_WIDTH, ROLE_HEIGHT)) {
      tint(255);
      image(text2, 235, 398); 
      if (mousePressed) {

        whichRole = "2"; 
        player = new Player(whichRole);
        gameState = GAME_HOW;
        initPuzzle();
        mousePressed = false;
      }
    }
    image(role2, VICTIM_X, ROLE_Y);
    noTint();

    // CRIMINAL1
    tint(255, 150);
    if (isMouseHit(CRIMINAL1_X, ROLE_Y, ROLE_WIDTH, ROLE_HEIGHT)) {
      tint(255);
      image(text3,235, 398); 
      if (mousePressed) {
        whichRole = "3";
        player = new Player(whichRole);
        gameState = GAME_HOW;
        initPuzzle();
        mousePressed = false;
      }
    }
    image(role3, CRIMINAL1_X, ROLE_Y);
    noTint();

    // CRIMINAL2
    tint(255, 150);
    if (isMouseHit(CRIMINAL2_X, ROLE_Y, ROLE_WIDTH, ROLE_HEIGHT)) {
      tint(255);
       image(text4, 235, 398 ); 
      if (mousePressed) {
        whichRole = "4"; 
        player = new Player(whichRole);
        gameState = GAME_HOW;
        initPuzzle();
        mousePressed = false;
      }
    }
    image(role4, CRIMINAL2_X, ROLE_Y);
    noTint();

    break;

  case GAME_HOW:
    if (howplaycount == 0) {
      image(how0, 0, 0);
    } else if (howplaycount == 1) {
      image(how1, 0, 0);
    } else {
      gameState = GAME_RUN1;
      howplaycount = 0;
    }

    if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(next1, NEXT_BUTTON_X, NEXT_BUTTON_Y); 
      if (mousePressed) {
        howplaycount ++;
        mousePressed = false;
      }
    } else {
      image(next0, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }

    break;

    // street
  case GAME_RUN1:

    checkWhichRound = 1;
    milkcount = 3;
    milkspace = 3000;
    image(round1bg, 0, 0);  


    //coinDisplay
    fill(0);
    image(coin, width-150, 10);
    text(coinCount, width-90, 40);
    //bouusDisplay
    image(bonus, width-300, 0, 50, 50);
    text(bonusCount, width-240, 40);

    //translate
    pushMatrix();
    translate(translate, 0);


    translate -= transSpeed;
    image(themepark, 16250, 70);

    //coins
    coins();

    //magnet
    magnets();

    //milk
    milks();

    //poos
    poos();

    //cars
    cars();

    //bonus
    bonus();

    hearts();

    //man
    player.display();
    player.jump();
    player.laydown();

    if (isHit(player.x-35, player.y, player.w, player.h, 16375, 70, 125, 350 )) {
      player.x += 0;
      milkcount = 6;
      milkspace = 2000;
      heartcount = 4;
      heartspace = 3000; 
      reset();   

      gameState = GAME_RUN2;
      coinRecord1 = coinCount;
      bonusRecord1 = bonusCount;

      if (gameState == GAME_RUN2){
        time = 670;
        transSpeed = 0;
      }
    }

    popMatrix();

    time -= 3;
    //round1
    if (500<time && time<670) {    
      image(round1, 200, 100);
    }
    
    //3
    if (330<time && time<500 ) {
      image(num3, 300, 20, 300, 400);
    }
    
    //2
    if (160 <time  && time<330) {
      image(num2, 300, 20, 300, 400);
    }
    //1
    if (0 < time && time<160) {
      image(num1, 300, 20, 300, 400);
    }
    if (time <= 0) {  
      isAlive = false;
      transSpeed = 5;
    }

    if (translate == -15500) {

      transSpeed = 0;
      player.x += 5;
    }

    //heart
    heart();

    break;


    // amusement park
  case GAME_RUN2:
    
    checkWhichRound = 2;
    background(170);
    image(round2bg, 0, 0);


    //coinDisplay
    fill(0);
    image(coin, width-150, 10);
    text(coinCount, width-90, 40);
    //bouusDisplay
    image(bonus, width-300, 0, 50, 50);
    text(bonusCount, width-240, 40);

    //translate
    pushMatrix();
    translate(translate, 0);
    translate -= transSpeed;

    //長旗子
    image(zoo, 16250, 70);

    //coins
    coins();
    //magnet
    magnets();
    //milk
    milks();
    //poos
    poos();

    //bonus
    bonus();

    //icecream
    icecream();
    hearts();
    
    //man
    player.display();
    player.jump();
    player.laydown();

    if (isHit(player.x-35, player.y, player.w, player.h, 16375, 70, 125, 350 )) {
      player.x += 0;
      milkcount =20;
      milkspace = 500;
      poocount = 10;
      poospace = 1600;
      heartcount = 5;
      heartspace = 2000; 
      reset();   
      gameState = GAME_RUN3;
      coinRecord2 = coinCount;
      bonusRecord2 = bonusCount;
      if (gameState == GAME_RUN3)
      {

        time = 670;
        transSpeed = 0;
      }
    }

    popMatrix();
    time -= 3;


    //round2
    if (500<time && time<670) {        
      image(round2, 200, 100);
    }
    //3
    if (330<time && time<500 ) {
      image(num3, 300, 20, 300, 400);
    }
    //2
    if (160 <time  && time<330) {
      image(num2, 300, 20, 300, 400);
    }
    //1
    if (0 < time && time<160) { 
      image(num1, 300, 20, 300, 400);
    }
    if (time <= 0) {  
      isAlive = false;
      transSpeed = 5;
    }


    if (translate == -15500) {
      transSpeed = 0;
      player.x += 5;
    }

    //heart
    heart();


    break;


    // zoo
  case GAME_RUN3:

    checkWhichRound = 3;

    background(170);
    image(round3bg, 0, 0);


    //coinDisplay
    fill(0);
    image(coin, width-150, 10);
    text(coinCount, width-90, 40);
    //bouusDisplay
    image(bonus, width-300, 0, 50, 50);
    text(bonusCount, width-240, 40);

    //translate
    pushMatrix();
    translate(translate, 0);
    translate -= transSpeed;

    //長旗子
    image(question, 16250, 70);

    //coins
    coins();
    //magnet
    magnets();
    //milk
    milks();
    //poos
    poos();

    //bonus
    bonus();

    //rocket
    rockets();

    //spider
    spider();

    //monkey
    monkeys();
    hearts();

    //man
    player.display();
    player.jump();
    player.laydown();

    octopuses();

    if (isHit(player.x-35, player.y, player.w, player.h, 16375, 70, 125, 350 )) {
      player.x += 0;
      translate = 0; // reset 

      gameState = PUZZLE_HOW;
    }

    popMatrix();   
    time -= 3;

    //round3
    if (500<time && time<670) {        
      image(round3, 200, 100);
    }
    //3
    if (330<time && time<500 ) {
      image(num3, 300, 20, 300, 400);
    }
    //2
    if (160 <time  && time<330) {
      image(num2, 300, 20, 300, 400);
    }
    //1
    if (0 < time && time<160) {
      image(num1, 300, 20, 300, 400);
    }
    if (time <= 0) {
      isAlive = false;
      if(player.superSpeed == true){
        transSpeed = 10;
      }else{
        transSpeed = 5;
      }
    }

    if (translate <= -15500) {
      transSpeed = 0;
      player.x += 5;
    }


    //heart
    heart();

    break;



  case PUZZLE_HOW:
  image(puzzlehow,0,0);
    
    if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(next1, NEXT_BUTTON_X, NEXT_BUTTON_Y); 
      if (mousePressed) {
      gameState = PUZZLE_BUY;
      mousePressed = false;
      }
    } else {
      image(next0, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }
    break;

  case PUZZLE_BUY:
    textFont(font2);
    background(150);
    fill(255);
    image(store, 0, 0);
    text("9", 520, 280);
    text(bonusCount, 520, 342);
    fill(0);
    image(coin, width-180, 10);
    text(coinCount, width-130, 50);


    if (bonusCount >=9) {
      image(buy1, BUY_BUTTON_X, BUY_BUTTON_Y);
      if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
        image(right1, NEXT_BUTTON_X, NEXT_BUTTON_Y);
        if (mousePressed) {
          gameState = PUZZLE_PLAY;
          mousePressed = false;
        }
      } else {
        image(right0, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      }
    } else if (bonusCount <9) {
      if (coinCount>=200) {
        image(buy0, BUY_BUTTON_X, BUY_BUTTON_Y);
        if (isMouseHit(BUY_BUTTON_X, BUY_BUTTON_Y, BUY_BUTTON_WIDTH, BUY_BUTTON_HEIGHT)) {
          image(buy2, BUY_BUTTON_X, BUY_BUTTON_Y);
          if (mousePressed) {
            bonusCount++;
            coinCount -= 200;
            mousePressed = false;
          }
        }
      } else if (coinCount<200) {
        image(buy1, BUY_BUTTON_X, BUY_BUTTON_Y);
        text("CAN'T BUY!!!", 400, 480);
        loseTimer--;
        if (loseTimer < 3*60) {
          image(lose, 200, 100);
        }
        if (loseTimer < 0) {
          gameState = GAME_OVER;
        }
      }
    }
    break;

  case PUZZLE_PLAY:
    background(200);
    for (int i=0; i<puzzles.length; i++) {
      puzzles[i].move();
      if (puzzles[i] != grabbedPuzzle) {
        puzzles[i].display();
      }
    }
    if (grabbedPuzzle != null) grabbedPuzzle.display();

    break;

  case GAME_WIN:
    player.win();
    break;

  case GAME_OVER:
    player.lose();
    break;
  }
}


//----------------funtion()---------------------------

//initHeart
void initHeart() {
  hearts = new Heart[heartcount];
  for (int i = 0; i < hearts.length; i++) {
    float heartX = 2000+heartspace*i;
    float heartY = 100*floor(random(1, 3));
    hearts[i] = new Heart(heartX, heartY, 50, 50);
  }
}

void hearts() {
  for (int i = 0; i < hearts.length; i++) {
    hearts[i].display();
    hearts[i].checkCollision(player);
  }
}

//initBonus
void initBonus() {
  bonuses = new Bonus[3];
  for (int i = 0; i < bonuses.length; i++) {
    float bonusX = 3500 + i*5000;
    float bonusY = ((int)random(1, 3))*100-50;
    bonuses[i]= new Bonus(bonusX, bonusY, 50, 50);
  }
}

//initIcecream
void initIcecream() {
  icecreams = new Icecream [16];
  for (int i = 0; i<icecreams.length; i++) {
    float icecreamX = 3000+i*800;
    float icecreamY = 0;
    icecreams[i] = new Icecream(icecreamX, icecreamY);
  }
}


//initMilk
void initMilk() {
  milks = new Milk[milkcount];
  for (int i = 0; i < milks.length; i++) {
    float milkX = 2200 + i*milkspace +25;
    float milkY = ((int)random(1, 4))*100-50;
    milks[i]= new Milk( milkX, milkY, 50, 50);
  }
}

//initMagnet
void initMagnet() {
  magnets = new Magnet[5]; 
  for (int i = 0; i < magnets.length; i++) {
    float magnetX = 6000 + i*2000 +25;
    float magnetY = 370;
    magnets[i]= new Magnet(magnetX, magnetY, 50, 50);
  }
}

//initPoo
void initPoo() {
  poos = new Poo [poocount]; 
  for (int i=0; i<poos.length; i++) {
    float poosX = i*poospace;
    float poosY = 390;
    poos[i] = new Poo(poosX, poosY);
  }
}

//initCar
void initCar() { 
  cars = new Car [10]; 
  for (int i=0; i<cars.length; i++) {
    float carsX = 3000 + i*1200;
    float carsY = 350; //420-70
    cars[i] = new Car(carsX, carsY);
  }
}


//initRocket
void initRocket() {
  rockets = new Rocket [5]; 
  for (int i=0; i<rockets.length; i++) {
    float rocketsX = 6000+ i*2000 +25;
    float rocketsY = 370; //420-50
    rockets[i] = new Rocket(rocketsX, rocketsY, 50.0, 50.0);
  }
}


// zoo
//initSpider
void initSpider() {
  spiders = new Spider [6];
  for (int i = 0; i < spiders.length; i++) {
    float spiderX = 1100 + 1331 * i;
    float spiderY = -300;
    spiders[i] = new Spider(spiderX, spiderY);
  }
}

//initMonkey
void initMonkey() {
  monkeys = new Monkey [3];
  for (int i=0; i<monkeys.length; i++) {
    float monkeyX = 2000+i*3000;
    float monkeyY = 320;
    monkeys[i] = new Monkey (monkeyX, monkeyY);
  }
}

void initOctopus() {
  octopuses = new Octopus [1];
  for (int i=0; i < octopuses.length; i++) {
    float octopusX = 10000;
    float octopusY = 200;
    float octopusW = 50;
    float octopusH = 50;
    octopuses[i] = new Octopus (octopusX, octopusY, octopusW, octopusH);
  }
}

void octopuses() {
  for (int i=0; i < octopuses.length; i++) {
    octopuses[i].display();
    octopuses[i].becomeBlack();
  }
}


//initPuzzle
void initPuzzle() {
  //int a = int(random(5));
  puzzles = new Puzzle [9];

  for (int i=0; i<puzzles.length; i++) {
    puzzles[i] = new Puzzle(0, 0, whichRole, str(i), squareIndex, puzzleIndex);
    squareIndex++;
    puzzleIndex++;
  }

  //shuffle

  shufflePuzzleArray(puzzles);

  for (int i = 0; i < puzzles.length; i++) {
    float puzzleX, puzzleY;
    if (i<3) {
      puzzleX = 315+i*125;
      puzzleY = 60;
    } else if (i<6) {
      puzzleX = 315+(i-3)*125;
      puzzleY = 185;
    } else {
      puzzleX = 315+(i-6)*125;
      puzzleY = 310;
    }
    puzzles[i].x = puzzleX;
    puzzles[i].y = puzzleY;
    puzzles[i].index2 = i;
  }
}






//heart -> GAME_OVER
void heart() {
  fill(#251E16);
  rect(100, 15, 204, 30, 10);
  fill(#D53233);
  rect(102, 17, heartX, 26, 10);
  image(heart, 65, 18, 30, 30);
  if (heartX <= 0) heartX = 0;
  if (heartX <= 0) {
    transSpeed = 0;
    loseTimer--;
    if (loseTimer < 3*60) {
      image(lose, 200, 100);
    }
    if (loseTimer < 0) {
      gameState = GAME_OVER;
    }
  }
}


// magnets
void magnets() {
  for (int i = 0; i < magnets.length; i++) {
    magnets[i].display();
    magnets[i].checkCollision(player);
    magnets[i].powering();
  }
}


// milks
void milks() {
  for (int i = 0; i < milks.length; i++) {
    milks[i].display();
    milks[i].checkCollision(player);
    milks[i].growUp();
  }
}


// rockets
void rockets() {
  for (int i = 0; i < rockets.length; i++) {
    rockets[i].display();
    rockets[i].checkCollision(player);
    rockets[i].isChanging();
  }
}


// poos
void poos() {
  for (int i = 0; i<poos.length; i++) {
    poos[i].display();
    poos[i].checkCollision(player);
  }
}


// cars
void cars() {
  for (int i = 0; i<cars.length; i++) {
    cars[i].display();
    cars[i].checkCollision(player);
    cars[i].fastMove();
  }
}

//monkeys
void monkeys() {
  for (int i = 0; i<monkeys.length; i++) {
    monkeys[i].display();
    monkeys[i].checkCollision();
    monkeys[i].bananaAppear();
  }
}


//initcoins
void initCoins()
{
  coinX = new int [3];
  coinY = new int [3];
  coinNum = new int [3];
  coins = new Coin [320][8];

  for (int k = 0; k < coins.length; k += 20)
  {
    for (int i=0; i<3; i++)
    {
      int coinCount=0;
      int a = 20;
      if (k == 300) {
        a = 10;
      }
      coinX[i]=floor(random(k, k+a));
      coinY[i]=floor(random(1, 8));
      coinNum[i]=floor(random(5, 11));  
      for (int j=0; j<coinNum[i]; j++)
      {
        if (coins[coinX[i]+j][coinY[i]] != null)
        {
          coinCount ++;
        }
      }
      while (coinCount!=0)
      {
        coinCount=0;
        coinX[i]=floor(random(k, k+a));
        coinY[i]=floor(random(1, 8));
        coinNum[i]=floor(random(5, 11));
        for (int j=0; j<coinNum[i]; j++)
        {
          if (coins[coinX[i]+j][coinY[i]]!=null)
          {
            coinCount++;
          }
        }
      }
      for (int j=0; j<coinNum[i]; j++)
      {
        coins[coinX[i]+j][coinY[i]] = new Coin((coinX[i]+j)*50, coinY[i]*50);
      }
    }
  }
}


//coins
void coins()
{
  for (int i = 0; i < 300; i++) 
  {
    for (int j = 1; j < 8; j++ ) 
    {
      if (coins[i][j] != null) 
      {
        if (player.isPower==true && coins[i][j].coinMoving()==true) {
          float coinX= coins[i][j].x;
          float coinY= coins[i][j].y;
          float a =(coinY-(player.y+player.h/2))/(coinX-(player.x+player.w/2));
          float b =coinY-coinX*a;
          coins[i][j].x-=25; // speed of coin to man
          coins[i][j].y=a*coins[i][j].x+b;
        }
        image(coin, coins[i][j].x, coins[i][j].y);  
        if (isHit(player.x, player.y, player.w/2, player.h, coins[i][j].x, coins[i][j].y, 50, 50)) 
        {
          coins[i][j] = null;

          //coindisplay
          coinCount ++;
        }
      }
    }
  }
}


// spider
void spider() {
  for (int i = 0; i < spiders.length; i++) {
    spiders[i].display();
    spiders[i].checkCollision(player);
  }
}
//icecream
void icecream() {
  for (int i = 0; i<icecreams.length; i++) {
    icecreams[i].display();
    icecreams[i].checkCollision(player);
  }
}

//bonus
void bonus() {
  for (int i = 0; i < bonuses.length; i++) {
    bonuses[i].display();
    bonuses[i].checkCollision(player);
  }
}

//reset
void reset() {
  //initialize everything
  translate = 0; // reset 

  //timePlayer = INIT_TIMEPLAYER;
  player.x = 115;
  player.y = 320;
  player.w = 70;
  player.h = 100;
  player.speed = 0;
  initMilk();
  initRocket();
  initMagnet();
  initPoo();
  initCar();
  initCoins();
  initSpider();
  initIcecream();
  initBonus();
  initOctopus();
  initHeart();
  player.isPower = false;
  initMonkey();
  for (int i=0; i<monkeys.length; i++) {
    monkeys[i].bananaX = monkeys[i].bananaX_original+ monkeys[i].bananaSpeed;
  }
  transSpeed=5;
  jumpCount = 0;
  loseTimer = 5*60;
}




boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return  ax + aw > bx &&    // a right edge past b left
    ax < bx + bw &&    // a left edge past b right
    ay + ah > by &&    // a top edge past b bottom
    ay < by + bh;
}


boolean isMouseHit(float bx, float by, float bw, float bh) {
  return  mouseX > bx && 
    mouseX < bx + bw && 
    mouseY > by && 
    mouseY < by + bh;
}


void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {      
    case UP:
      upPressed = true;
      jumpCount ++;
      if (player.y < 420-player.h && jumpCount<2) {
        player.speed = -17;
      }
      if (player.y >= 420-player.h) {
        jumpCount = 0;
      }

      //println(jumpCount);
      break;

    case DOWN:
      downPressed = true;
      break;
    }
  }
}


void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {

    case DOWN:
      downPressed = false;
      playerDisplay = true;
      if (player.isBig) {
        player.y = 270; //320+50
      }
      if (!player.isBig) {   
        player.w = 70;
        player.h = 100;
        player.y = 320; //320+50
      }
      break;
    }
  }
}

void mouseReleased() {

  if (grabbedPuzzle == null) return;

  grabbedPuzzle.x = originX;
  grabbedPuzzle.y = originY;
  grabbedPuzzle.index2 = originIndex;


  for (int i=0; i<puzzles.length; i++) {
    if (grabbedPuzzle == puzzles[i]) {
      continue;
    }
    if (puzzles[i].x + 120 > mouseX && puzzles[i].x < mouseX && puzzles[i].y + 120 > mouseY && puzzles[i].y < mouseY) {
      grabbedPuzzle.x = puzzles[i].x;
      grabbedPuzzle.y = puzzles[i].y;
      grabbedPuzzle.index2 = puzzles[i].index2;


      puzzles[i].x = originX;
      puzzles[i].y = originY;
      puzzles[i].index2 = originIndex;

      if (checkPuzzleWin()==true) {
        gameState = GAME_WIN;
      } 
      break;
    }
  }
  grabbedPuzzle = null;
}


boolean checkPuzzleWin () {
  for (int i=0; i < 9; i++) {
    if (puzzles[i].index1 != puzzles[i].index2) {
      return false;
    }
  }
  return true;
}

void shufflePuzzleArray(Puzzle[] array) {

  // with code from WikiPedia; Fisher–Yates shuffle 
  //@ <a href="http://en.wikipedia.org/wiki/Fisher" target="_blank" rel="nofollow">http://en.wikipedia.org/wiki/Fisher</a>–Yates_shuffle

  Random rng = new Random();

  // i is the number of items remaining to be shuffled.
  for (int i = array.length; i > 1; i--) {

    // Pick a random element to swap with the i-th element.
    int j = rng.nextInt(i);  // 0 <= j <= i-1 (0-based array)

    // Swap array elements.
    Puzzle tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}
