
class ui{
  int x,y,w,h;
  color bg_color,focus_bg_color,text_color,stroke_color;
  Pallette colors;
  int round_amount = 5, font_size = 18;
  String text = "";
  int text_align_x=CENTER,text_align_y=CENTER;
  boolean on_focus = false;
  
  ui(){
    this.default_ui(0,0,60,40);
  }
  
  void default_ui(int x,int y,int w,int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = new Pallette();
    this.bg_color = this.colors.purple_2;
    this.focus_bg_color = this.colors.purple_1;
    this.text_color = this.colors.black;
    this.stroke_color = this.colors.black;
  }
  
  void set_pos(int x,int y){
    this.x = x;
    this.y = y;
  }
  
  void set_size(int w,int h){
    this.w = w;
    this.h = h;
  }
  
  void set_text(String text){
    this.text = text;
  }
  
  void set_bg_color(int c){
    this.bg_color = c;
  }
  
  void set_focus_bg_color(int c){
    this.focus_bg_color = c;
  }
  
  void set_text_color(int c){
    this.text_color = c;
  }
  
  void set_stroke_color(int c){
    this.stroke_color = c;
  }
  
  void set_focus(boolean focus){
    this.on_focus = focus;
  }
  
  void set_font_size(int s){
    this.font_size = s;
  }
  
  void draw(){
    push();
    translate(this.x,this.y);
    fill(this.on_focus ?this.focus_bg_color : this.bg_color);
    stroke(this.stroke_color);
    rect(0,0,this.w,this.h,this.round_amount);
    textSize(this.font_size);
    textAlign(text_align_x,text_align_y);
    textLeading(30);
    fill(this.text_color);
    text(this.text,0,0,this.w,this.h);
    textSize(font_size);
    pop();
  }
  
  boolean collision(int x,int y){
    return (x>this.x && x<this.x+this.w && y>this.y && y<this.y+this.h);
  }
  
  
}

class image_ui{
  int x,y,w,h;
  ArrayList<PImage> image;
  ArrayList<PVector> image_size;
  boolean custom_size = true;
  int count = 0, delay_count = 0, max_delay_count = 60;
  
  image_ui(){
    this.default_image_ui(0,0,100,100);
  }
  
  void default_image_ui(int x,int y,int w,int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.image = new ArrayList<PImage>();
    this.image_size = new ArrayList<PVector>();
  }
  
  void set_pos(int x,int y){
    this.x = x;
    this.y = y;
  }
  
  void set_size(int w,int h){
    this.w = w;
    this.h = h;
  }
  
  void resize(float f){
    this.w = (int)(f*this.w);
    this.h = (int)(f*this.h);
  }
  
  void set_custom_size(boolean b){
    this.custom_size = b;
  }
  
  void add_image(PImage img){
    this.image.add(img);
    PVector p = new PVector(img.width,img.height);
    this.image_size.add(p);
  }
  
  void draw_index(int i){
    push();
    translate(this.x,this.y);
    if(!custom_size){
      this.w = (int)this.image_size.get(i).x;
      this.h = (int)this.image_size.get(i).y;
    }
    image(this.image.get(i),this.x,this.y,this.w,this.h);
    pop();
  }
  
  boolean animate(int speed){
    if(speed <= 0) speed = 1;
    boolean p1 = false;
    push();
    translate(this.x,this.y);
    if(!this.custom_size){
      this.w = (int)this.image_size.get(this.count).x;
      this.h = (int)this.image_size.get(this.count).y;
    }
    image(this.image.get(this.count),this.x,this.y,this.w,this.h);
    pop();
    this.delay_count+=speed;
    if(this.delay_count >= this.max_delay_count){
      this.delay_count = 0;
      this.count++;
    }
    if(this.count >= this.image.size()){
      this.count = 0;
      p1 = true;
    }
    return p1;
  }
  
  boolean collision(int x,int y){
    return (x>this.x && x<this.x+this.w && y>this.y && y<this.y+this.h);
  }
  
  
}
