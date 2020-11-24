package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	int insertNoticefile(Noticefile noticefile);
	int deleteNoticefileName(int noticefileId);
	List<String> selectNoticeFileNameList(int noticeId);
	int deleteNoticefile(int noticeId);
	String selectNoticeFileName(int noticefileId);
}
