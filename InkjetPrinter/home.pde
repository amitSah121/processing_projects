
ui home, home_text;

void setup_home(){
  //UI
  int margin = 10;
  // Home
  home = new ui();
  home.set_text("Home");
  home.set_pos(margin+home.x,home.y);
  home.set_focus(true);
  home.set_stroke_color(colors.purple_2);
  
  // Home Text
  home_text = new ui();
  home_text.set_bg_color(colors.white);
  home_text.set_stroke_color(colors.white);
  home_text.set_pos(home_text.x+2*margin,home.y+home.h+2*margin);
  home_text.set_size(width-1-margin,height-home_text.y-1);
  home_text.text_align_x = LEFT;
  home_text.text_align_y = TOP;
  home_text.set_font_size(20);
  String  homePageLines ="Get ready to explore inkjet printers in a fun and interactive way!\nEasily switch between the Homepage, Infographic, and Quiz tabs to discover how printers work.\nPressing Ctrl + H, Ctrl + I, and Ctrl + Q will take you to the Homepage, Infographic, and Quiz sections\nEach section uncovers the secrets of Piezo, Bubble, and Continuous printing.\nMove at your own pace using buttons or keyboard shortcuts.\nAdjust the volume and even mute the audio for a personalized experience.\nIn the Quiz section, test with simple multiple-choice questions. Keep an eye on the clock!\nDon't hesitate to restart the quiz for more discovery fun. Enjoy the interactive learning journey!";
  home_text.set_text(homePageLines);
  
}

void home_state(){
  home_text.draw();
}
