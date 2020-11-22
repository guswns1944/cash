package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashStatsMapper {
	public Map<String, Object> selectTotalOfMonthByYear(int year);
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	public Map<String, Object> selectCategoryByYear(int year);
	public Map<String, Object> selectTotalSumInOutByYear(int year);
	public List<Map<String, Object>> selectTotalOutMonthCategoryByYear(int year);
	public List<Map<String, Object>> selectTotalMaxInOutByYear(int year);
	public Map<String, Object> selectTotalInOfMonthByYear(int year);
}
