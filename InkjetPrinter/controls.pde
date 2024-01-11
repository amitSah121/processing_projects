boolean key_pressed,key_released,mouse_pressed,mouse_released, mouse_wheel_init,mouse_wheel_dir;
String key_,state_;


void keyPressed(){
  key_pressed = true;
  key_released = false;
  if(section_change_btn){
    section_change_btn = false;
    try{
      current_section.set_text(Integer.toString(Integer.parseInt(key+"")));
      section = Integer.parseInt(key+"");
    }catch(Exception e){
      section_change_btn = true;
    }
  }
  
  println(Integer.toString((int)(key)));
  if((int)key == 8){
    state = app_state.Home;
    home.set_focus(true);
    inkjet.set_focus(false);
    quiz.set_focus(false);
    click_sound.play();
  }else if((int)key == 9){
    state = app_state.inkjet;
    home.set_focus(false);
    inkjet.set_focus(true);
    quiz.set_focus(false);
    click_sound.play();
  }else if((int)key == 17){
    state = app_state.Quiz;
    home.set_focus(true);
    inkjet.set_focus(false);
    quiz.set_focus(false);
    click_sound.play();
  }
  
}

void keyReleased(){
  key_released = true;
  key_pressed = false;
}

void mousePressed(){
  mouse_pressed = true;
  mouse_released = false;
}

void mouseReleased(){
  mouse_pressed = false;
  mouse_released = true;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  mouse_wheel_init = true;
  mouse_wheel_dir = e == 1 ? true : false;
}

void load_images(image_ui img, int i1,int i2, String path){
  PImage p1;
  for(int i=i1 ; i<=i2 ; i++){
    p1 = loadImage(path+"/"+Integer.toString(i)+".png");
    img.add_image(p1);
    img.set_size(p1.width,p1.height);
  }
}
