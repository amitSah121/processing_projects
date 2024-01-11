import processing.sound.SoundFile;

Pallette colors;
int font_size = 16;


app_state state = app_state.Home;
SoundFile click_sound;
SoundFile method_1,method_2,method_3;

enum app_state{
  Home,
  inkjet,
  Quiz
}


void setup(){
  size(1000,800);
  frameRate(30);
  textSize(font_size);
  colors = new Pallette();
  click_sound = new SoundFile(this,"click.wav");
  click_sound.amp(0.1);
  
  method_1 = new SoundFile(this,"method_1.wav");
  method_2 = new SoundFile(this,"method_2.wav");
  method_3 = new SoundFile(this,"method_3.wav");
  
  
  setup_home();
  setup_inkjet();
  setup_quiz();
  
}

void draw(){
  background(colors.white);
  push();
  fill(colors.purple_2);
  noStroke();
  rect(0,0,width,home.h+10);
  pop();
  home.draw();
  inkjet.draw();
  quiz.draw();
  
  
  switch(state){
    case Home:
      home_state();
      break;
    case inkjet:
      inkjet_state();
      break;
    case Quiz:
      quiz_state();
      break;
  }
  
  
  // button interaction events state change
  if(mouse_released){
    if(home.collision(mouseX,mouseY)){
      state = app_state.Home;
      home.set_focus(true);
      inkjet.set_focus(false);
      quiz.set_focus(false);
      click_sound.play();
    }else if(inkjet.collision(mouseX,mouseY)){
      state = app_state.inkjet;
      home.set_focus(false);
      inkjet.set_focus(true);
      quiz.set_focus(false);
      click_sound.play();
    }else if(quiz.collision(mouseX,mouseY)){
      state = app_state.Quiz;
      home.set_focus(false);
      inkjet.set_focus(false);
      quiz.set_focus(true);
      click_sound.play();
    }
  }
  
  
  
  key_released = false;
  mouse_released = false;
  mouse_wheel_init = false;
}

class Pallette{
  color purple_1= color(220, 132, 243);
  color purple_2 = color(233, 168, 242);
  color purple_3 = color(243, 204, 243);
  color cream = color(255, 231, 193);
  color white = color(255);
  color black = color(0);
  color grey = color(125);
}
