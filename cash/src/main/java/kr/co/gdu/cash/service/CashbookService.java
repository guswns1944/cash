package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
	public int getCashbookCount() {
		return cashbookMapper.cashbookCount();
	}
	public List<Cashbook> getCashbookListAll(){
		return cashbookMapper.selectCashbookListAll();
	}
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return cashbookMapper.selectCashbookListByPage(map);	
	}
	public int addCashbook(Cashbook cashbook) {
		return cashbookMapper.insertCashbook(cashbook);
	}
	public Cashbook selectCashbookOne(int cashbookId) {
		Cashbook cashbookOne = cashbookMapper.selectCashbookOne(cashbookId);
		return cashbookOne;
	}
	public int modifyCashbook(Cashbook cashbook) {
		return cashbookMapper.updateCashbook(cashbook);
	}
	public int deleteCashbook(int cashbookId) {
		return cashbookMapper.deleteCashbook(cashbookId);
	}
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		return cashbookMapper.selectCashbookListByDay(map);
	}
	
	public int getselectSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		int sum = cashbookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
	
	public List<Map<String,Object>> getCashListByMonth(int currentYear, int currentMonth){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		return cashbookMapper.selectCashbookListByMonth(map);
	}
}
