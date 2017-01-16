package com.springapp.mvc.Utils;

import com.springapp.mvc.Cafe;
import com.springapp.mvc.CafeDto;
import com.springapp.mvc.DAO.CafeDao;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class SimpleSearchStrategy implements SearchStrategy{

    CafeDao cafeDao = new CafeDao();

    @Override
    public List<CafeDto> search(int min, int max, String position, boolean meat, boolean vegetarian, boolean cakes) {

        List<CafeDto> cafeDtoList = new ArrayList<CafeDto>();
        CoordinatesParser coordinatesParser = null;

        for(Cafe cafe: cafeDao.getALl()){
            if(!meat && !vegetarian && !cakes) {
                if (cafe.getMiddleCost() >= min && cafe.getMiddleCost() <= max) {
                    cafeDtoList.add(new CafeDto(cafe));
                }
            }
            if(meat){
                if (cafe.getMiddleCost() >= min && cafe.getMiddleCost() <= max && cafe.getType().equals("meat")) {
                    cafeDtoList.add(new CafeDto(cafe));
                }
            }
            if(vegetarian){
                if (cafe.getMiddleCost() >= min && cafe.getMiddleCost() <= max && cafe.getType().equals("vegetarian")) {
                    cafeDtoList.add(new CafeDto(cafe));
                }
            }
            if(cakes){
                if (cafe.getMiddleCost() >= min && cafe.getMiddleCost() <= max && cafe.getType().equals("cakes")) {
                    cafeDtoList.add(new CafeDto(cafe));
                }
            }
        }

        if(position.length() != 0){
            coordinatesParser = new CoordinatesParser(position);
            final CoordinatesParser finalCoordinatesParser = coordinatesParser;
            cafeDtoList.sort(new Comparator<CafeDto>() {
                @Override
                public int compare(CafeDto cafeDto1, CafeDto cafeDto2) {
                    return (int) (100000*(finalCoordinatesParser.getDistanceToCafe(cafeDto1) -
                            finalCoordinatesParser.getDistanceToCafe(cafeDto2)));
                }
            });
        }

        return cafeDtoList;
    }
}
