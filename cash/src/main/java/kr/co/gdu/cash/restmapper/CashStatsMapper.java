package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashStatsMapper {
	public Map<String, Object> selectTotalOfMonthByYear();
	public Map<String, Object> selectTotalOutAndInByYear(int year);
}
