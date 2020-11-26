package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.VisitorbookMapper;
import kr.co.gdu.cash.vo.Visitorbook;

@Service
@Transactional
public class VisitorbookService {
	@Autowired private VisitorbookMapper visitorbookMapper;
	//전체 방명록 출력과 페이징
	public List<Visitorbook> getVisitorbookListByPage(int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return visitorbookMapper.selectVisitorbookListByPage(map);
	}
	public int getVisitorbookListCount() {
		return visitorbookMapper.selectVisitorbookListCount();
	}
	public void insertVisitorbook(Visitorbook visitorbook) {
		visitorbookMapper.insertVisitorbook(visitorbook);
	}
	public int deleteVisitorbook(int visitorbookId) {
		return visitorbookMapper.deleteVisitorbook(visitorbookId);
	}
}
