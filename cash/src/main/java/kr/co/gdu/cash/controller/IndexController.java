package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class IndexController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value={"/","/index"})
	public String index(Model model,
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) {
		
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
		
		currentDay.set(Calendar.DATE, 1); //2020년 11월 1일
		int year = currentDay.get(Calendar.YEAR); 
		int month = currentDay.get(Calendar.MONTH) +1; //월
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);	
		Calendar firstDay = Calendar.getInstance(); 
		firstDay.set(Calendar.DATE, 1); // 2020년 11월 1일
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		// 2. 서비스 호출
		List<Notice> list = noticeService.getLatestNoticeList();
		
		// 3. 뷰 모델 추가
		model.addAttribute("year", year); // 월
		model.addAttribute("month", month); // 월
		model.addAttribute("lastDay", lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek); 
		model.addAttribute("list", list);
		return "index";
	}
}