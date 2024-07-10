package com.kh.winepicker.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductFilters {
	private int minPrice;
    private int maxPrice;
    private List<Integer> volumes;
    private List<Integer> types;
    private List<Integer> countries;
    private List<Integer> grapes;
  
    
}
