package com.springapp.mvc.Utils;


import com.springapp.mvc.CafeDto;

public class CoordinatesParser {

    private double coordinateX;

    private double coordinateY;

    public CoordinatesParser(){}

    public CoordinatesParser(String coordinates){
        coordinateX = 0.0;
        coordinateY = 0.0;
        String xPoint = coordinates.substring(5, 10);
        String yPoint = coordinates.substring(17, 22);
        try{
            coordinateX = Double.parseDouble(xPoint);
            coordinateY = Double.parseDouble(yPoint);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public double getDistanceToCafe(CafeDto cafeDto){
        return Math.sqrt(Math.pow(coordinateX - cafeDto.getX(), 2) + Math.pow(coordinateY - cafeDto.getY(), 2));
    }

    public double getCoordinateX() {
        return coordinateX;
    }

    public double getCoordinateY() {
        return coordinateY;
    }
}
