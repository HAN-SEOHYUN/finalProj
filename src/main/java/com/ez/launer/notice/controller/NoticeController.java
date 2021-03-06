package com.ez.launer.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.admin.controller.AdminController;
import com.ez.launer.notice.model.NoticeService;
import com.ez.launer.notice.model.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class NoticeController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);

	private final NoticeService noticeService;
	
	@RequestMapping("/noticeAll")
	public String selectAll(Model model) {
		logger.info("사내공지사항 더보기 페이지");
		
		List<NoticeVO> list = noticeService.selectAll();
		logger.info("사내공지사항 더보기 페이지 - 전체조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/admin/noticeAll";
	}
	
	//ajax - 공지사항 등록
	@ResponseBody
	@RequestMapping("/insertNotice")
	public NoticeVO insertNotice(@RequestParam HashMap<String, Object> param,
			Model model) {
		logger.info("사내공지사항 등록 처리");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date now = new Date();
		
		NoticeVO vo = new NoticeVO();
		vo.setUsersNo(9999);
		vo.setTitle(param.get("title")+"");
		vo.setContent(param.get("content")+"");
		noticeService.insertNotice(vo);
		vo.setRegdateStr(sdf.format(now));
		
		return vo;
	}
	
	//ajax - 공지사항 삭제
	@ResponseBody
	@RequestMapping("/deleteNotice")
	public NoticeVO deleteNotoce(@RequestParam HashMap<String, Object> param,
			Model model) {
		logger.info("사내공지사항 삭제 처리");
		
		NoticeVO vo = new NoticeVO();
		int no = Integer.parseInt(param.get("no")+"");
		logger.info("삭제할 게시물 번호 = {}", no);
		vo.setNo(no);
		noticeService.deleteNotice(vo.getNo());
		
		return vo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
