package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller
public class CashbookController {
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model, 
			@PathVariable(name="currentPage", required= true) int currentPage) {
		int rowPerPage = 20;
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		model.addAttribute("cashbookList",cashbookList);
		return "cashbookList";
	}
	//가계부 입력 액션
	@PostMapping("/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Cashbook cashbook,
			@PathVariable(name = "currentYear", required = true ) int currentYear,
			@PathVariable(name = "currentMonth", required = true ) int currentMonth,
			@PathVariable(name = "currentDay", required = true ) int currentDay) { //커멘드 객체
		cashbookService.addCashbook(cashbook);	
		return "redirect:/admin/cashbookByDay/now/{currentYear}/{currentMonth}/{currentDay}";
	}
	//가계부 입력 폼
	@GetMapping("/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model,
			@PathVariable(name = "currentYear", required = true ) int currentYear,
			@PathVariable(name = "currentMonth", required = true ) int currentMonth,
			@PathVariable(name = "currentDay", required = true ) int currentDay) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentYear",currentYear);
		model.addAttribute("currentMonth",currentMonth);
		model.addAttribute("currentDay",currentDay);
		return "addCashbook";
	}
	//가계부 수정 폼
	@GetMapping("/admin/modifyCashbookByDay/{cashbookId}")
	public String modifyCashbook(Model model,
			@PathVariable(value="cashbookId")int cashbookId) {
		Cashbook cashbook = cashbookService.selectCashbookOne(cashbookId);
		List<Category> categoryList = categoryService.getCategoryList();
		System.out.println(cashbook);
		model.addAttribute("cashbook",cashbook);
		model.addAttribute("categoryList",categoryList);
		return "modifyCashbookByDay";
	}
	//가계부 수정 액션
	@PostMapping("/admin/modifyCashbookByDay")
	public String modifyCashbookAction(Cashbook cashbook) {
		cashbookService.modifyCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth/now/-1/-1";
	}
	//public String modifyCashbook()
	//가계부 삭제
	@GetMapping("/admin/deleteCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String removeCashbook(@PathVariable(value="cashbookId")int cashbookId,
			@PathVariable(name = "currentYear", required = true ) int currentYear,
			@PathVariable(name = "currentMonth", required = true ) int currentMonth,
			@PathVariable(name = "currentDay", required = true ) int currentDay){
		cashbookService.deleteCashbook(cashbookId);
		return "redirect:/admin/cashbookByDay/now/{currentYear}/{currentMonth}/{currentDay}";
	}
	//일별 가계부
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name = "target" ) String target,
			@PathVariable(name = "currentYear", required = true ) int currentYear,
			@PathVariable(name = "currentMonth", required = true ) int currentMonth,
			@PathVariable(name = "currentDay", required = true ) int currentDay) {
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);
		targetDay.set(Calendar.DATE, currentDay);
		
		if(target.equals("pre")){		
			targetDay.add(Calendar.DATE, -1);
		}else if(target.equals("next")) {
			targetDay.add(Calendar.DATE, 1);
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONTH)+1, targetDay.get(Calendar.DATE));
		model.addAttribute("cashbookList",cashbookList);
		model.addAttribute("currentYear",targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth",targetDay.get(Calendar.MONTH)+1);
		model.addAttribute("currentDay",targetDay.get(Calendar.DATE));
		return "cashbookByDay";
	}
	//월별 가계부
	@GetMapping(value="/admin/cashbookByMonth/{target}/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model,
			@PathVariable(name = "target" ) String target,
			@PathVariable(name = "currentYear", required = true ) int currentYear,
			@PathVariable(name = "currentMonth", required = true ) int currentMonth) {
		
		// 1. 요청분석
		
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일
		//currentYear 넘어오고, currentMonth 넘어오면
		if(currentYear !=-1 || currentMonth != -1) {
			if(currentMonth==0) {
				currentYear-=1;
				currentMonth =12;
			}
			if(currentMonth==13) {
				currentYear+=1;
				currentMonth=1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth -1);
		}
		if(target.equals("pre")){		
			currentDay.add(Calendar.MONTH, -1);
		}else if(target.equals("next")) {
			currentDay.add(Calendar.MONTH, 1);
		}
		currentDay.set(Calendar.DATE, 1); //2020년 11월 1일
		currentYear = currentDay.get(Calendar.YEAR); 
		currentMonth = currentDay.get(Calendar.MONTH) +1; //월
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);	
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		// 2. 서비스 호출
		int sumOut= cashbookService.getselectSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		int sumIn =	cashbookService.getselectSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		
		List<Map<String,Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		// 3. 뷰 모델 추가
		model.addAttribute("currentYear", currentYear); // 월
		model.addAttribute("currentMonth", currentMonth); // 월
		model.addAttribute("lastDay", lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek); 
		model.addAttribute("sumOut", sumOut); 
		model.addAttribute("sumIn", sumIn); 
		
		model.addAttribute("cashList",cashList);
		return "cashbookByMonth";
	}
}