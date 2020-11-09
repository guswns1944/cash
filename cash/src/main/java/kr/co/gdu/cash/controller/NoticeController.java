package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	//전체 공지사항
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
			@PathVariable(value = "currentPage") int currentPage) {	
		int rowPerPage = 10;
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		int count = noticeService.getNoticeCount(); //전체 카운트
	
		int lastPage = count/rowPerPage;
		if(count%rowPerPage !=0) {
			lastPage +=1;
		}
		System.out.println("current="+currentPage);
		System.out.println("last="+lastPage);
		System.out.println("count="+count);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "/noticeList";
	}
	//공지 입력 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	//공지 입력 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice) {
		noticeService.addNotice(notice);
		return "redirect:/admin/noticeList/1";
	}
	//공지 상세보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model,
			@PathVariable(value="noticeId") int noticeId) {
		List<Notice> noticeOne = noticeService.getNoticeOne(noticeId);
		model.addAttribute("noticeOne",noticeOne);
		return "noticeOne";
	}
	//공지 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(@PathVariable(value="noticeId")int noticeId) {
		noticeService.deleteNotice(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	//공지 수정 폼
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model,
			@PathVariable(value="noticeId")int noticeId) {
		List<Notice> noticeOne = noticeService.getNoticeOne(noticeId);
		model.addAttribute("noticeOne",noticeOne);
		return "modifyNotice";
	}
	//공지 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		noticeService.modifyNoticeOne(notice);
		return "redirect:/admin/noticeOne/"+notice.getNoticeId();
	}
}
