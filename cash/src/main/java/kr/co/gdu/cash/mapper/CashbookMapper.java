package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

//@Controller, @Service, @Mapper, @Repository : 스테레오 타입

@Mapper
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook);
	List<Map<String, Object>> selectCashInOutList();
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String,Object>> selectCashbookListByMonth(Map<String,Object> map);
	List<Cashbook> selectCashbookListByDay(Map<String,Object> map);
	int deleteCashbook(int cashbookId);
	Cashbook selectCashbookOne(int cashbookId);
	int updateCashbook(Cashbook cashbook);
	//전체 cashbookList 페이징 ?,?
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);
	//전체 cashbookList를 엑셀파일로 변환
	List<Cashbook> selectCashbookListAll();
	int cashbookCount();
}
