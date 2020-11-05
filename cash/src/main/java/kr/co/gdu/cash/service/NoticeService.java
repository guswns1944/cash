package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	//총 갯수
	public int getNoticeCount() {
		return noticeMapper.totalNoticeCount();
	}
	//공지사항 수정
	public int modifyNoticeOne(Notice notice){
		return noticeMapper.modifyNoticeOne(notice);
	}
	//상세 공지사항 보기
	public List<Notice> getNoticeOne(int noticeId){
		return noticeMapper.selectNoticeOne(noticeId);
	}
	//공지사항 삭제
	public int deleteNotice(int noticeId) {
		return noticeMapper.deleteNotice(noticeId);
	}
	//공지사항 추가
	public int addNotice(Notice notice){
		return noticeMapper.insertNotice(notice);
	}
	//전체 공지사항 출력 ,페이징
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage){
		//int currentPage, rowPerPage로 beginRow 생성
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return noticeMapper.selectNoticeListByPage(map);			
	}
	//공지사항5개 출력과 달력보여주기
	public Map<String, Object> getNoticeAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("noticeList",noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	//로그인창에 공지사항 5개출력
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLatestNoiceList();
	}
}