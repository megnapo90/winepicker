package com.kh.winepicker.model.vo;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class HistoryExt extends History {

	private Wine wine;
	private WineImage wineImage;
	private Review review;
	private User user;
	private List<Integer> quantities;
	private List<Integer> wineNos;
	private int quantity;
}
