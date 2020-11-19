package kr.co.gdu.cash.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashStatsMapper;

@Service
@Transactional
public class CashStatsService {
	@Autowired CashStatsMapper cashStatsMapper;
	
	public List<Map<String, Object>> getTotalOutMonthCategoryByYear(int year){
		return cashStatsMapper.selectTotalOutMonthCategoryByYear(year);
	}
	public Map<String, Object> getTotalOfMonthByYear(int year){
		return cashStatsMapper.selectTotalOfMonthByYear(year);
	}
	
	public Map<String, Object> getTotalOutAndInByYear(int year){
		return cashStatsMapper.selectTotalOutAndInByYear(year);
	}
	public Map<String, Object> getCategoryByYear(int year){
		return cashStatsMapper.selectCategoryByYear(year);
	}
	public Map<String, Object> getTotalSumInOutByYear(int year){
		return cashStatsMapper.selectTotalSumInOutByYear(year);
	}
}
