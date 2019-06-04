package com.jhta.planit.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationFormController {
	@RequestMapping(value="/reservationHome", method=RequestMethod.GET)
	public String adminHome() {
		return ".reservation.reservationHome";
	}
}
