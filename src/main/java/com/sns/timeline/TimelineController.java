package com.sns.timeline;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.bo.CommentBO;
import com.sns.timeline.model.ContentView;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired 
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model) {
		
		// 하나의 카드 => Contentview 객체 (view용 객체)
		List<ContentView> contentList = new ArrayList<>();
		
		//post 내용
		List<Post> postList = postBO.getPostList();
		
		model.addAttribute("contentList", contentList);
		return "timeline/timeline_list";
	}

}
