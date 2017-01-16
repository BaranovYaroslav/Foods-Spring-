package com.springapp.mvc.Utils;

import com.springapp.mvc.CafeDto;

import java.util.List;


public interface SearchStrategy {

    public List<CafeDto> search(int min, int max, String position, boolean meat, boolean vegetarian, boolean cakes);

}
