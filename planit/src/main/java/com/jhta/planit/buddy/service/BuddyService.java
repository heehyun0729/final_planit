package com.jhta.planit.buddy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.buddy.dao.BuddyDao;

@Service
public class BuddyService {
	@Autowired private BuddyDao dao;
}
