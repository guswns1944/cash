package kr.co.gdu.cash.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashStatsMapper;

@Service
@Transactional
public class CashStatsService {
	@Autowired CashStatsMapper cashStatsMapper;
	public Map<String, Object> getTotalOfMonthByYear(){
		return cashStatsMapper.selectTotalOfMonthByYear();
	}
	
	public Map<String, Object> getTotalOutAndInByYear(int year){
		return cashStatsMapper.selectTotalOutAndInByYear(year);
	}
}
