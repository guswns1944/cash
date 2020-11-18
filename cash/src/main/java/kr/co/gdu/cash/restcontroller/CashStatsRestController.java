package kr.co.gdu.cash.restcontroller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashStatsService;

@RestController
public class CashStatsRestController {
	@Autowired CashStatsService cashStatsService;
	//Logger loger = Logger();
	@GetMapping("/admin/totalOfMonthByYear/{year}")
	public Map<String, Object> totalOfMonthByYear(@PathVariable(name="year") int year){
		System.out.println("totalOfMonthByYear 호출 성공");
		return cashStatsService.getTotalOfMonthByYear(year); // RestController
	}
	@GetMapping("/admin/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(@PathVariable(name="year") int year ){
		return cashStatsService.getTotalOutAndInByYear(year);
	}
	@GetMapping("/admin/categoryByYear/{year}")
	public Map<String, Object> categoryByYear(@PathVariable(name="year") int year){
		return cashStatsService.getCategoryByYear(year);
	}
	@GetMapping("/admin/totalSumInOutByYear/{year}")
	public Map<String, Object> totalSumInOutByYear(@PathVariable(name="year") int year){
		return cashStatsService.getTotalSumInOutByYear(year);
	}
}
