LineChart chart;

void setup(){
  size(1000, 600);
  
  chart = new LineChart("Test Title");
  
  chart.setSize(800, 500);
  chart.setPosition(20, 20);
  chart.setXScale(0, 5.5, 0.5);
  chart.setYScale(0, 100, 10);
}

void draw(){
  background(220);
  
  chart.renderGraph();
  chart.renderXAxis();
  chart.renderYAxis();
}
