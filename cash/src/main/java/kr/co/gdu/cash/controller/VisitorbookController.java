package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.VisitorbookService;
import kr.co.gdu.cash.vo.Visitorbook;

@Controller
public class VisitorbookController {
	@Autowired private VisitorbookService visitorbookService;
	
	@GetMapping("/admin/visitorbookList/{currentPage}")
	public String visitorbookList(Model model, @PathVariable(value = "currentPage") int currentPage) {
		int rowPerPage=5;
		List<Visitorbook> visitorbookList = visitorbookService.getVisitorbookListByPage(currentPage, rowPerPage);
		int count = visitorbookService.getVisitorbookListCount();
		int lastPage = count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage+=1;
		}
		System.out.println(visitorbookList+","+lastPage);
		model.addAttribute("visitorbookList",visitorbookList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "/visitorbookList";
	}
	@PostMapping("/admin/addvisitorBook")
	public String addVisitorBook(Visitorbook visitorbook) {
		visitorbookService.insertVisitorbook(visitorbook);
		return "redirect:/admin/visitorbookList/1";
	}
	@GetMapping("/admin/deletevisitorBook/{visitorbookId}")
	public String deleteVisitorBook(@PathVariable(value="visitorbookId") int visitorbookId) {
		visitorbookService.deleteVisitorbook(visitorbookId);
		return "redirect:/admin/visitorbookList/1";
	}
	
}
