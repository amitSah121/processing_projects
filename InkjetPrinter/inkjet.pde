
ui inkjet;
ui volume_slider_bg, volume_slider_fg,volume_mute;
ui section_forward, current_section, section_backward;
ui section_1,section_3,section_5;
int percent_volume = 80, previous_volume = 80;
int section = 1;
ui title;
image_ui method_1a_pngs,method_1b_pngs,method_2a_pngs,method_2b_pngs,method_3a_pngs,method_3b_pngs;
ui trigger_1a,trigger_1b,trigger_2a,trigger_2b,trigger_3a,trigger_3b, method_3b_rays;
boolean triggered_1a = false, triggered_1b = false, triggered_2a = false, triggered_2b = false, triggered_3a = false, triggered_3b = false, method_3b_rayed = false;

ui section_audio;
boolean audio_enabled = false, section_change_btn = false;

void setup_inkjet(){
  //margin
  int margin = 10;
  // inkjet
  inkjet = new ui();
  inkjet.set_pos(margin+home.x+home.w,home.y);
  inkjet.set_size(inkjet.w*2,inkjet.h);
  inkjet.set_text("Infographic");
  inkjet.set_stroke_color(colors.purple_2);
  
  title = new ui();
  title.set_size(title.w*6,title.h);
  title.set_pos(width-title.w-margin,0);
  title.set_bg_color(colors.purple_2);
  title.set_font_size(24);
  title.set_stroke_color(colors.purple_2);
  
  volume_slider_bg = new ui();
  volume_slider_bg.set_pos(2*margin + home.x,height-volume_slider_bg.h-margin);
  volume_slider_bg.set_size(volume_slider_bg.w*2,volume_slider_bg.h);
  //volume_slider_bg.set_text("UP");
  volume_slider_bg.set_bg_color(colors.white);
  
  volume_slider_fg = new ui();
  volume_slider_fg.set_pos(2*margin + home.x,height-volume_slider_bg.h-margin);
  //volume_slider_fg.set_text("DOWN");
  volume_slider_fg.set_bg_color(colors.cream);
  
  volume_mute = new ui();
  volume_mute.set_pos(volume_slider_bg.x+volume_slider_bg.w+margin,volume_slider_bg.y);
  volume_mute.set_text("MUTE");
  volume_mute.set_bg_color(colors.white);
  
  section_audio = new ui();
  section_audio.set_pos(volume_mute.x+volume_mute.w+margin,volume_slider_fg.y);
  section_audio.set_text("Play");
  section_audio.set_bg_color(colors.white);
  
  
  section_forward = new ui();
  section_forward.set_pos(width - margin - section_forward.w,volume_slider_fg.y);
  section_forward.set_text("-->");
  section_forward.set_bg_color(colors.white);
  
  current_section = new ui();
  current_section.set_pos(section_forward.x - margin - current_section.w,section_forward.y);
  current_section.set_text(Integer.toString(section));
  current_section.set_bg_color(colors.white);
  
  section_backward = new ui();
  section_backward.set_pos(current_section.x - margin - section_backward.w,section_forward.y);
  section_backward.set_text("<--");
  section_backward.set_bg_color(colors.white);
  
  section_1 = new ui();
  section_1.set_pos(2*margin,inkjet.y+inkjet.h+2*margin);
  section_1.set_size(width-2*margin,height- inkjet.h - volume_slider_fg.h - 3*margin);
  section_1.set_bg_color(colors.white);
  section_1.set_stroke_color(colors.white);
  section_1.set_font_size(20);
  section_1.text_align_x = LEFT;
  section_1.text_align_y = TOP;
  String text_1 = "Piezo inkjet printers use the Drop-On-Demand (DOD) printing technique, which means the printer carries the ink in a chamber located in the printhead.\nIn order to apply ink on a surface, piezo inkjet printers use the so-called piezoelectric effect. This effect consists in creating a voltage on the surface of a piezoelectric material (e.g. piezoelectric crystals) by deforming it. As a result, the printing nozzle is momentarily deformed, exerting a high pressure on the ink and making the printhead eject an ink droplet. The polarity of the voltage is then reversed so that the ink stops flowing from the nozzle.\n\nThere are two modes in which the piezo inkjet printers apply ink: the bend and the shear mode. In the first case, the ink is drawn and forced out of the chamber via the nozzle by a two-way expansion. The second mode achieves the same result, only that pressure waves are used instead, consuming less energy.";
  section_1.set_text(text_1);
  
  section_3 = new ui();
  section_3.set_pos(2*margin,inkjet.y+inkjet.h+2*margin);
  section_3.set_size(width-2*margin,height- inkjet.h - volume_slider_fg.h - 3*margin);
  section_3.set_bg_color(colors.white);
  section_3.set_stroke_color(colors.white);
  section_3.set_font_size(20);
  section_3.text_align_x = LEFT;
  section_3.text_align_y = TOP;
  text_1 = "Through a process called 'drop ejection,'  this models propel the ink from these cartridges and onto the desired substrate via these 4 steps:\n\nHeat the ink: To start the process, the ink is delivered by the cartridge to a firing chamber where electronic resistors heat it at a rate of 1,800,032°F / 1,000,000°C per second. \n\nGenerate a bubble: Once the heat from the resistors causes the ink to reach a temperature of 644°F / 340°C, the ink is vaporized and generates a bubble.\n\nPropel the ink: As the bubble expands, the ink droplet is propelled from the chamber and out of the nozzle.\nCollapse the bubble: Once the droplet breaks away from the nozzle and onto the substrate, the bubble it was propelled by collapses. This creates a vacuum effect that pulls more ink into the chamber, causing the entire process to repeat.";
  section_3.set_text(text_1);
  
  section_5 = new ui();
  section_5.set_pos(2*margin,inkjet.y+inkjet.h+2*margin);
  section_5.set_size(width-2*margin,height- inkjet.h - volume_slider_fg.h - 3*margin);
  section_5.set_bg_color(colors.white);
  section_5.set_stroke_color(colors.white);
  section_5.set_font_size(20);
  section_5.text_align_x = LEFT;
  section_5.text_align_y = TOP;
  text_1 = "CIJ is short for continuous inkjet.In this method, ink is pumped from an ink reservoir and ejected through a nozzle that creates a jet of ink.\n\nThe jet of ink is then broken up into a large number of ink droplets through high frequency vibration. Once the droplets are formed select droplets are charged by electrodes. The stream of droplets then passes through deflector plates which create an electrostatic field.\n\nThe charged drops are deflected as they move through the deflector plates, to be ejected from the print head and placed on the product to form the required message. Uncharged drops are not deflected and return into the CIJ ink system.";
  section_5.set_text(text_1);
  
  // animations
  method_1a_pngs = new image_ui();
  load_images(method_1a_pngs,1,12,"method_1a");
  method_1a_pngs.resize(0.6);
  method_1a_pngs.set_pos(margin,home.y+home.h+margin);
  
  trigger_1a = new ui();
  trigger_1a.set_pos(method_1a_pngs.x+method_1a_pngs.w/2-trigger_1a.w/2,method_1a_pngs.y+method_1a_pngs.h+5*margin);
  trigger_1a.set_text("On");
  
  method_1b_pngs = new image_ui();
  load_images(method_1b_pngs,1,7,"method_1b");
  method_1b_pngs.resize(0.6);
  method_1b_pngs.set_pos(margin+method_1a_pngs.x+method_1a_pngs.w,home.y+home.h+margin);
  
  trigger_1b = new ui();
  trigger_1b.set_pos(method_1b_pngs.x+method_1b_pngs.w-trigger_1b.w/2,method_1b_pngs.y+method_1b_pngs.h+5*margin);
  trigger_1b.set_text("On");
  
  method_2a_pngs = new image_ui();
  load_images(method_2a_pngs,1,14,"method_2a");
  method_2a_pngs.resize(0.6);
  method_2a_pngs.set_pos(margin,home.y+home.h+margin);
  
  trigger_2a = new ui();
  trigger_2a.set_pos(method_2a_pngs.x+method_2a_pngs.w/2-trigger_2a.w/2,method_2a_pngs.y+method_2a_pngs.h+5*margin);
  trigger_2a.set_text("On");
  
  method_2b_pngs = new image_ui();
  load_images(method_2b_pngs,1,11,"method_2b");
  method_2b_pngs.resize(0.6);
  method_2b_pngs.set_pos(margin+method_2a_pngs.x+method_2a_pngs.w,home.y+home.h+margin);
  
  trigger_2b = new ui();
  trigger_2b.set_pos(method_2b_pngs.x+method_2b_pngs.w-trigger_2b.w/2,method_2b_pngs.y+method_2b_pngs.h+5*margin);
  trigger_2b.set_text("On");
  
  method_3a_pngs = new image_ui();
  load_images(method_3a_pngs,1,9,"method_3a");
  method_3a_pngs.resize(0.6);
  method_3a_pngs.set_pos(margin,home.y+home.h+margin);
  
  trigger_3a = new ui();
  trigger_3a.set_pos(method_3a_pngs.x+method_3a_pngs.w/2-trigger_3a.w/2,method_3a_pngs.y+method_3a_pngs.h+5*margin);
  trigger_3a.set_text("On");
  
  method_3b_pngs = new image_ui();
  load_images(method_3b_pngs,1,6,"method_3b");
  method_3b_pngs.resize(0.6);
  method_3b_pngs.set_pos(margin+method_3a_pngs.x+method_3a_pngs.w,home.y+home.h+margin);
  
  trigger_3b = new ui();
  trigger_3b.set_pos(method_3b_pngs.x+method_3b_pngs.w-trigger_3b.w/2,method_3b_pngs.y+method_3b_pngs.h+5*margin);
  trigger_3b.set_text("On");
  
  method_3b_rays = new ui();
  method_3b_rays.set_pos(trigger_3b.x+trigger_3b.w+margin,method_3b_pngs.y+method_3b_pngs.h+5*margin);
  method_3b_rays.set_text("1st volt");
}

void draw_inkjet_ui(){
  volume_slider_bg.draw();
  volume_slider_fg.draw();
  volume_mute.draw();
  
  section_forward.draw();
  current_section.draw();
  section_backward.draw();
  
  if(mouse_released){
    if(volume_slider_bg.collision(mouseX,mouseY)){
      int diff = mouseX - volume_slider_bg.x;
      volume_slider_fg.set_size(diff<=0 ? 1 : diff,volume_slider_fg.h);
      percent_volume = (int)map(diff,0,volume_slider_bg.w,0,100);
    }else if(volume_mute.collision(mouseX,mouseY)){
      if(percent_volume > 0 ){ 
        previous_volume = percent_volume;
        percent_volume = 0;
        volume_mute.set_text("UNMUTE");
        volume_slider_fg.set_size(1,volume_slider_fg.h);
      }
      else if(percent_volume < 100 ){
        percent_volume = previous_volume;
        volume_mute.set_text("MUTE");
        volume_slider_fg.set_size((int)map(percent_volume,0,100,1,volume_slider_bg.w),volume_slider_fg.h);
      }
      click_sound.play();
    }
    
    
    //print(section_forward.x,section_forward.y,section_forward.w,section_forward.h,mouseX,mouseY,section_forward.collision(mouseX,mouseY));
    boolean sec_changed = false;
    if(section_forward.collision(mouseX,mouseY)){
      section += 1;
      click_sound.play();
      sec_changed = true;
    }else if(section_backward.collision(mouseX,mouseY)){
      section -= 1;
      click_sound.play();
      sec_changed = true;
    }
    
    if(section < 1){
      section = 1;
      sec_changed = false;
    }
    if(section > 6){
      section = 6;
      sec_changed = false;
    }
    if(sec_changed){
      if(section_audio.text.equals("Replay")){
        method_1.stop();
        method_2.stop();
        method_3.stop();
        section_audio.set_text("Play");
      }
    }
    current_section.set_text(Integer.toString(section));
    if(current_section.collision(mouseX,mouseY)){
      current_section.set_text("Enter Number");
      section_change_btn = true;
    }
  }
  
  if(percent_volume < 0 ) percent_volume = 0;
  if(percent_volume > 100 ) percent_volume = 100;
  method_1.amp(((float)percent_volume)/100);
  method_2.amp(((float)percent_volume)/100);
  method_3.amp(((float)percent_volume)/100);
  click_sound.amp(((float)percent_volume)/100);
}

void inkjet_state(){
  int margin = 10;
  
  switch(section){
    case 1:
      title.set_text("Piezo-Method");
      section_1.draw();
      break;
    case 2:
      title.set_text("Piezo-Method");
      method_1();
      break;
    case 3:
      title.set_text("Bhermische(Blasen)-method");
      section_3.draw();
      break;
    case 4:
      title.set_text("Bhermische(Blasen)-method");
      method_2();
      break;
    case 5:
      title.set_text("Continuous-Method");
      section_5.draw();
      break;
    case 6:
      title.set_text("Continuous-Method");
      method_3();
      break;
  }
  title.draw();
  section_audio.draw();
  if(mouse_released && section_audio.collision(mouseX,mouseY)){
    if(section_audio.text.equals("Replay")){
      method_1.stop();
      method_2.stop();
      method_3.stop();
      section_audio.set_text("Play");
    }else{
      audio_enabled = true;
      section_audio.set_text("Replay");
    }
  }
  
  if(audio_enabled){
    switch(section){
      case 1:
      case 2:
        if(method_1.isPlaying()) break;
        method_1.play();
        break;
      case 3:
      case 4:
        if(method_2.isPlaying()) break;
        method_2.play();
        break;
      case 5:
      case 6:
        if(method_3.isPlaying()) break;
        method_3.play();
        break;
    }
    audio_enabled = false;
  }else{
    
    if(!method_1.isPlaying() && !method_2.isPlaying() && !method_3.isPlaying()) section_audio.set_text("Play");
  }
  
  //push();
  //int conversion = (int)map(100 - percent_volume,0,100,0,volume_up.h);
  //fill(colors.white);
  //rect(volume_up.x-margin*2 ,volume_up.y,margin,volume_up.h);
  //fill(colors.cream);
  //rect(volume_up.x-margin*2 ,volume_up.y + conversion ,margin,volume_up.h - conversion);
  //pop();
  draw_inkjet_ui();
}

void method_1(){
  
  if(triggered_1a){
    triggered_1a = !method_1a_pngs.animate(5);
  }else{
    method_1a_pngs.draw_index(0);
    trigger_1a.set_text("ON");
  }
  
  
  trigger_1a.draw();
  if(mouse_released){
    if(trigger_1a.collision(mouseX,mouseY)){
      trigger_1a.set_text("OFF");
      triggered_1a = true;
    }
  }
  
  if(triggered_1b){
    triggered_1b = !method_1b_pngs.animate(5);
  }else{
    method_1b_pngs.draw_index(0);
    trigger_1b.set_text("ON");
  }
  
  
  trigger_1b.draw();
  if(mouse_released){
    if(trigger_1b.collision(mouseX,mouseY)){
      trigger_1b.set_text("OFF");
      triggered_1b = true;
    }
  }
}

void method_2(){
  if(triggered_2a){
    triggered_2a = !method_1a_pngs.animate(5);
  }else{
    method_2a_pngs.draw_index(0);
    trigger_2a.set_text("ON");
  }
  
  
  trigger_2a.draw();
  if(mouse_released){
    if(trigger_2a.collision(mouseX,mouseY)){
      trigger_2a.set_text("OFF");
      triggered_2a = true;
    }
  }
  
  if(triggered_2b){
    triggered_2b = !method_2b_pngs.animate(5);
  }else{
    method_2b_pngs.draw_index(0);
    trigger_2b.set_text("ON");
  }
  
  
  trigger_2b.draw();
  if(mouse_released){
    if(trigger_2b.collision(mouseX,mouseY)){
      trigger_2b.set_text("OFF");
      triggered_2b = true;
    }
  }
}

void method_3(){
  if(triggered_3a){
    triggered_3a = !method_3a_pngs.animate(5);
  }else{
    method_3a_pngs.draw_index(0);
    trigger_3a.set_text("ON");
  }
  
  
  trigger_3a.draw();
  if(mouse_released){
    if(trigger_3a.collision(mouseX,mouseY)){
      trigger_3a.set_text("OFF");
      triggered_3a = true;
    }
  }
  
  
  
  if(triggered_3b){
    if(method_3b_rayed){
      method_3b_rayed = !method_3b_pngs.animate(5);
      triggered_3b = method_3b_rayed;
      method_3b_rays.set_text("1st volt");
    }else{
      triggered_3b = !method_1b_pngs.animate(5);
    }
  }else{
    if(method_3b_rayed) method_3b_pngs.draw_index(0);
    else method_1b_pngs.draw_index(0);
    trigger_3b.set_text("ON");
  }
  
  
  
  
  trigger_3b.draw();
  method_3b_rays.draw();
  if(mouse_released){
    if(trigger_3b.collision(mouseX,mouseY)){
      trigger_3b.set_text("OFF");
      triggered_3b = true;
    }
    if(method_3b_rays.collision(mouseX,mouseY)){
      if(method_3b_rays.text.equals("1st volt")){
        method_3b_rays.set_text("2nd volt");
        method_3b_rayed = true;
      }else{
        method_3b_rays.set_text("1st volt");
        method_3b_rayed = false;
      }
    }
  }
}
