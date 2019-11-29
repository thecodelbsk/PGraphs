class LineChart{
  String title;
  String xLabel;
  String yLabel;
  
  PVector xScale;
  PVector yScale;
  
  PVector size;
  PVector position;
  
  float theSpace;
  float theXGap;
  
  LineChart(String title){
    this.title = title;
    this.xScale = new PVector(0, 100, 10);
    this.yScale = new PVector(0, 100, 10);
    this.size = new PVector(100, 100);
    this.position = new PVector(10, 10);
    this.theSpace = 50.0f;
    this.theXGap = textWidth(str((float)this.xScale.y/2));
  }
  
  void setXLabel(String label){
    this.xLabel = label;
  }
  
  void setYLabel(String label){
    this.yLabel = label; 
  }
  
  void setXScale(float min, float max, float step){
    this.xScale.set(min, max, step);
  }
  
  void setYScale(float min, float max, float step){
    this.yScale.set(min, max, step);
  }
  
  void setSize(float graphWidth, float graphHeight){
    this.size.set(graphWidth, graphHeight);
  }
  
  void setPosition(float xPos, float yPos){
    this.position.set(xPos, yPos);
  }
  
  void renderGraph(){
    fill(221, 255, 144);
    noStroke();
    rect(this.position.x, this.position.y, this.size.x, this.size.y);
  }
  
  void renderXAxis(){
    stroke(0);
    strokeWeight(1);
    float x1 = this.position.x+this.theSpace;
    float x2 = this.position.x+this.size.x-theXGap;
    float y = this.position.y+this.size.y-this.theSpace;
    line(x1, y, x2, y);
    
    float axisWidth = (float)this.size.x-(this.theSpace+theXGap);
    int numOfLines = int((this.xScale.y-this.xScale.x)/this.xScale.z);
    int linesInterval = int(axisWidth/numOfLines);
    
    for(int i = 0; i < numOfLines; i++){
      float currentNum = (float)this.xScale.x+this.xScale.z+this.xScale.z*i;
      float xPos = (float)this.position.x+this.theSpace+linesInterval+linesInterval*i;
      float yPos1 = (float)(this.position.y+this.size.y-this.theSpace)-10.0f;
      float yPos2 = (float)(this.position.y+this.size.y-this.theSpace)+10.0f;
      
      line(xPos, yPos1, xPos, yPos2);
      fill(255, 0, 0);
      
      String stringCurrentNum = str(currentNum);
      stringCurrentNum = stringCurrentNum.contains(".") ? stringCurrentNum.replaceAll("0*$","").replaceAll("\\.$","") : stringCurrentNum;
      
      textAlign(CENTER);
      text(stringCurrentNum, xPos, yPos2+13);
    }
  }
  
  void renderYAxis(){
    stroke(0);
    strokeWeight(1);
    float x = this.position.x+this.theSpace;
    float y1 = this.position.y+4;
    float y2 = this.position.y+this.size.y-this.theSpace;
    line(x, y1, x, y2);
    
    float axisHeight = (float)this.size.y-(this.theSpace+4);
    int numOfLines = int((this.yScale.y-this.yScale.x)/this.yScale.z);
    int linesInterval = int(axisHeight/numOfLines);
    
    for(int i = 0; i < numOfLines; i++){
      float currentNum = (float)this.yScale.x+this.yScale.z+this.yScale.z*i;
      float xPos1 = (float)(this.position.x+this.theSpace)-10.0f;
      float xPos2 = (float)(this.position.x+this.theSpace)+10.0f;
      float yPos = (float)(((this.position.y+this.size.y)-this.theSpace)-linesInterval)-linesInterval*i;
      
      line(xPos1, yPos, xPos2, yPos);
      
      String stringCurrentNum = str(currentNum);
      stringCurrentNum = stringCurrentNum.contains(".") ? stringCurrentNum.replaceAll("0*$","").replaceAll("\\.$","") : stringCurrentNum;
      
      float numWidth = (float)textWidth(stringCurrentNum);
      text(stringCurrentNum, xPos1-(numWidth/2), yPos+5);
    }
  }
}
