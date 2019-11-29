LineChart chart;
float[] xPlotPoints;
float[] yPlotPoints;

PVector[] arraysToPVector(float[] xArray, float[] yArray){
  ArrayList<PVector> vectorArrayList = new ArrayList<PVector>();
  for(int i = 0; i < xArray.length; i++){
    vectorArrayList.add(new PVector(xArray[i], yArray[i]));
  }
  PVector[] vectorArray = new PVector[]{};
  vectorArrayList.toArray(vectorArray);
  return vectorArray;
}

ArrayList<PVector> arraysToPVectorList(float[] xArray, float[] yArray){
  ArrayList<PVector> vectorArrayList = new ArrayList<PVector>();
  for(int i = 0; i < xArray.length; i++){
    vectorArrayList.add(new PVector(xArray[i], yArray[i]));
  }
  return vectorArrayList;
}

void setup(){
  size(1000, 600);
  
  xPlotPoints = new float[]{0, 0.2, 3, 0.5, 5, 5.5};
  yPlotPoints = new float[]{0, 50, 10, 75, 20, 90};
  
  chart = new LineChart("Test Title");
  
  chart.setSize(800, 500);
  chart.setPosition(20, 20);
  chart.setXScale(0, 5.5, 0.5);
  chart.setYScale(0, 100, 10);
  chart.setPlotPoints(arraysToPVectorList(xPlotPoints, yPlotPoints));
}

void draw(){
  background(220);
  
  chart.renderGraph();
  chart.renderXAxis();
  chart.renderYAxis();
  chart.renderPlotPoints();
}
