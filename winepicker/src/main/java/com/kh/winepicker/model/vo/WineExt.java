package com.kh.winepicker.model.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class WineExt extends Wine {
	private WineImage attachment;
	private Characteristic taste;
}
