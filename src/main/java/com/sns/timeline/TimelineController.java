package com.sns.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.ContentBO;
import com.sns.timeline.model.ContentView;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired 
	private ContentBO contentBO;
	

	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		// 로그인 되어있든 되어있지 않든 허용 - null 허용하기 위해 Integer로 받음
		Integer userId = (Integer)session.getAttribute("userId");
		
		// 하나의 카드 => Contentview 객체 (view용 객체)
		List<ContentView> contentList = contentBO.generateContentViewList(userId); 
		
		//post 내용
		model.addAttribute("contentList", contentList);
		model.addAttribute("viewName", "timeline/timeline");
		return "timeline/timeline_list";
	}

}
