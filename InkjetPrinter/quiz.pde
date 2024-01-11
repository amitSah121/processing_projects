
ui quiz;

ui quiz_1, quiz_2;
ui quiz_1_opt_a,quiz_1_opt_b,quiz_1_opt_c;
ui quiz_2_opt_a,quiz_2_opt_b,quiz_2_opt_c;
ui check_1_a,check_1_b,check_1_c;
ui check_2_a,check_2_b,check_2_c;

ui check_btn, result_btn;
int time_count_bool=0, time_count = 0, max_time_alloted = 30;
boolean logged_in = false;

void setup_quiz(){
  //margin
  int margin = 10;
  // Quiz
  quiz = new ui();
  quiz.set_pos(margin+inkjet.x+inkjet.w,inkjet.y);
  quiz.set_text("Quiz");
  quiz.set_stroke_color(colors.purple_2);
  
  
  quiz_1 = new ui();
  quiz_1.set_pos(home.x,home.y+home.h+2*margin);
  quiz_1.set_bg_color(colors.white);
  quiz_1.set_size(width-margin*2,quiz_1.h);
  quiz_1.set_text("Which effect can be used to produce many bubbles?");
  
  check_1_a = new ui();
  check_1_a.set_pos(quiz_1.x+margin,quiz_1.h+quiz_1.y+margin);
  check_1_a.set_size(40,40);
  
  quiz_1_opt_a = new ui();
  quiz_1_opt_a.set_pos(check_1_a.x+check_1_a.w+margin,check_1_a.y);
  quiz_1_opt_a.set_bg_color(colors.white);
  quiz_1_opt_a.set_size(width,40);
  quiz_1_opt_a.set_stroke_color(colors.white);
  quiz_1_opt_a.text_align_x = LEFT;
  quiz_1_opt_a.set_text("Piezo-methos");
  
  check_1_b = new ui();
  check_1_b.set_pos(quiz_1.x+margin,quiz_1_opt_a.h+quiz_1_opt_a.y+margin);
  check_1_b.set_size(40,40);
  
  quiz_1_opt_b = new ui();
  quiz_1_opt_b.set_pos(check_1_b.x+check_1_b.w+margin,check_1_b.y);
  quiz_1_opt_b.set_bg_color(colors.white);
  quiz_1_opt_b.set_size(width,40);
  quiz_1_opt_b.set_stroke_color(colors.white);
  quiz_1_opt_b.text_align_x = LEFT;
  quiz_1_opt_b.set_text("Bhermische(Blasen)-method");
  
  check_1_c = new ui();
  check_1_c.set_pos(quiz_1.x+margin,quiz_1_opt_b.h+quiz_1_opt_b.y+margin);
  check_1_c.set_size(40,40);
  
  quiz_1_opt_c = new ui();
  quiz_1_opt_c.set_pos(check_1_c.x+check_1_c.w+margin,check_1_c.y);
  quiz_1_opt_c.set_bg_color(colors.white);
  quiz_1_opt_c.set_size(width,40);
  quiz_1_opt_c.set_stroke_color(colors.white);
  quiz_1_opt_c.text_align_x = LEFT;
  quiz_1_opt_c.set_text("continuous-method");
  
  
  
  
  quiz_2 = new ui();
  quiz_2.set_pos(home.x,quiz_1_opt_c.y+quiz_1_opt_c.h+margin*2);
  quiz_2.set_bg_color(colors.white);
  quiz_2.set_size(width-margin*2,quiz_2.h);
  quiz_2.set_text("Which effect can be used to produce one bubble at a time and works on quartz effect?");
  
  check_2_a = new ui();
  check_2_a.set_pos(quiz_2.x+margin,quiz_2.h+quiz_2.y+margin);
  check_2_a.set_size(40,40);
  
  quiz_2_opt_a = new ui();
  quiz_2_opt_a.set_pos(check_2_a.x+check_2_a.w+margin,check_2_a.y);
  quiz_2_opt_a.set_bg_color(colors.white);
  quiz_2_opt_a.set_size(width,40);
  quiz_2_opt_a.set_stroke_color(colors.white);
  quiz_2_opt_a.text_align_x = LEFT;
  quiz_2_opt_a.set_text("Piezo-methos");
  
  check_2_b = new ui();
  check_2_b.set_pos(quiz_2.x+margin,quiz_2_opt_a.h+quiz_2_opt_a.y+margin);
  check_2_b.set_size(40,40);
  
  quiz_2_opt_b = new ui();
  quiz_2_opt_b.set_pos(check_1_b.x+check_2_b.w+margin,check_2_b.y);
  quiz_2_opt_b.set_bg_color(colors.white);
  quiz_2_opt_b.set_size(width,40);
  quiz_2_opt_b.set_stroke_color(colors.white);
  quiz_2_opt_b.text_align_x = LEFT;
  quiz_2_opt_b.set_text("Bhermische(Blasen)-method");
  
  check_2_c = new ui();
  check_2_c.set_pos(quiz_2.x+margin,quiz_2_opt_b.h+quiz_2_opt_b.y+margin);
  check_2_c.set_size(40,40);
  
  quiz_2_opt_c = new ui();
  quiz_2_opt_c.set_pos(check_2_c.x+check_2_c.w+margin,check_2_c.y);
  quiz_2_opt_c.set_bg_color(colors.white);
  quiz_2_opt_c.set_size(width,40);
  quiz_2_opt_c.set_stroke_color(colors.white);
  quiz_2_opt_c.text_align_x = LEFT;
  quiz_2_opt_c.set_text("continuous-method");
  
  check_btn = new ui();
  check_btn.set_pos(width-check_btn.w-margin,height-check_btn.h-margin);
  check_btn.set_text("Log In");
  
  result_btn = new ui();
  result_btn.set_pos(width/2-result_btn.w/2,height-result_btn.h-margin);
  result_btn.set_size(result_btn.w*2,result_btn.h);
  result_btn.set_text("Result");
  
  quiz_1.set_font_size(20);
  check_1_a.set_font_size(20);
  quiz_1_opt_a.set_font_size(20);
  check_1_b.set_font_size(20);
  quiz_1_opt_b.set_font_size(20);
  check_1_c.set_font_size(20);
  quiz_1_opt_c.set_font_size(20);
  
  
  quiz_2.set_font_size(20);
  check_2_a.set_font_size(20);
  quiz_2_opt_a.set_font_size(20);
  check_2_b.set_font_size(20);
  quiz_2_opt_b.set_font_size(20);
  check_2_c.set_font_size(20);
  quiz_2_opt_c.set_font_size(20);
  
}

void quiz_state(){
  quiz_1.draw();
  check_1_a.draw();
  quiz_1_opt_a.draw();
  check_1_b.draw();
  quiz_1_opt_b.draw();
  check_1_c.draw();
  quiz_1_opt_c.draw();
  
  
  quiz_2.draw();
  check_2_a.draw();
  quiz_2_opt_a.draw();
  check_2_b.draw();
  quiz_2_opt_b.draw();
  check_2_c.draw();
  quiz_2_opt_c.draw();
  
  check_btn.draw();
  result_btn.draw();
  
  time_count_bool++;
  if(time_count_bool % 30 == 0){
    time_count_bool = 0;
    time_count++;
  }
  if(!logged_in){
    time_count_bool = 0;
  }
  result_btn.set_text(Integer.toString(time_count));
  
  
  boolean first = false, second = false;
  if(mouse_released){
    if(check_1_a.collision(mouseX,mouseY)){
      if(check_1_a.text.equals("X")){
        check_1_a.set_text("");
      }
      else{
        check_1_a.set_text("X");
        check_1_b.set_text("");
        check_1_b.set_text("");
      }
    }else if(check_1_b.collision(mouseX,mouseY)){
      if(check_1_b.text.equals("X")) check_1_b.set_text("");
      else{
        check_1_b.set_text("X");
        check_1_a.set_text("");
        check_1_c.set_text("");
      }
    }else if(check_1_c.collision(mouseX,mouseY)){
      if(check_1_c.text.equals("X")) check_1_c.set_text("");
      else{
        check_1_c.set_text("X");
        check_1_a.set_text("");
        check_1_b.set_text("");
      }
    }
    
    if(check_2_a.collision(mouseX,mouseY)){
      if(check_2_a.text.equals("X")) check_2_a.set_text("");
      else{
        check_2_a.set_text("X");
        check_2_b.set_text("");
        check_2_c.set_text("");
      }
    }else if(check_2_b.collision(mouseX,mouseY)){
      if(check_2_b.text.equals("X")) check_2_b.set_text("");
      else{
        check_2_b.set_text("X");
        check_2_a.set_text("");
        check_2_c.set_text("");
      }
    }else if(check_2_c.collision(mouseX,mouseY)){
      if(check_2_c.text.equals("X")) check_2_c.set_text("");
      else{
        check_2_c.set_text("X");
        check_2_a.set_text("");
        check_2_b.set_text("");
      }
    }
    
    //boolean first = false, second = false;
    if(check_btn.collision(mouseX,mouseY)){
      check_btn.set_text("Restart");
      logged_in = true;
      time_count = 0;
    }
    
    //if( time_count == max_time_alloted){
    //  logged_in = false;
    //  if(first && second){
    //    result_btn.set_text("Both Right");
    //  }else if(first){
    //    result_btn.set_text("First right only");
    //  }else if(second){
    //    result_btn.set_text("Second right only");
    //  }else{
    //    result_btn.set_text("Result");
    //  }
    //}
  }
  if( time_count == max_time_alloted){
    logged_in = false;
    if(check_1_c.text.equals("X")) first = true;
    if(check_2_a.text.equals("X")) second = true;
    if(first && second){
      result_btn.set_text("Both Right");
    }else if(first){
      result_btn.set_text("First right only");
    }else if(second){
      result_btn.set_text("Second right only");
    }else{
      result_btn.set_text("None");
    }
  }

}
