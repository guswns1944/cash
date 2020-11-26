package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	//private final String PATH ="C:\\Users\\gd7\\Desktop\\git\\cash\\maven.1605832237345\\cash\\src\\main\\webapp\\upload\\";
	private final String PATH ="C:\\Users\\guswn\\OneDrive\\바탕 화면\\git\\cash\\maven.1606098706563\\cash\\src\\main\\webapp\\upload\\";
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	@Autowired private CommentMapper commentMapper;
	
	//기존 파일 삭제
	public void deleteNoticefileName(int noticefileId) {
		String noticefileName = noticefileMapper.selectNoticeFileName(noticefileId);
			File file = new File(PATH+noticefileName);
			if(file.exists()) {
				file.delete();
			}
		noticefileMapper.deleteNoticefileName(noticefileId);
	}
	//총 갯수
	public int getNoticeCount() {
		return noticeMapper.totalNoticeCount();
	}
	//공지사항 수정
	public void modifyNoticeOne(NoticeForm noticeForm){
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		noticeMapper.modifyNoticeOne(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile()!=null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile !=null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	//상세 공지사항 보기
	public Notice getNoticeOne(int noticeId){
		return noticeMapper.selectNoticeOne(noticeId);
	}
	//공지사항 삭제
	public void deleteNotice(int noticeId) {
		//기존파일 삭제
		List<String> noticefileNameList = noticefileMapper.selectNoticeFileNameList(noticeId);
		for(String s : noticefileNameList) {
			File file = new File(PATH+s);
			if(file.exists()) {
				file.delete();
			}
		}
		//댓긇 삭제
		commentMapper.deleteNotice(noticeId);
		//공지파일 삭제
		noticefileMapper.deleteNoticefile(noticeId);
		//공지사항 삭제
		noticeMapper.deleteNotice(noticeId);
	}
	//공지사항 추가
	public void addNotice(NoticeForm noticeForm){
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		noticeMapper.insertNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile()!=null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile !=null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
		
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