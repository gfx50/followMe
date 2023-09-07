package search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.Paging;
import search.model.service.SearchService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class WeeklyOneTagServlet
 */
@WebServlet("/weeklyonetag")
public class WeeklyOneTagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeeklyOneTagServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 최상위 인기태그 게시글 불러오기 서블릿
				
		ArrayList<Trail> list = new SearchService().selectBestOneTag();
		System.out.println(list.toString());
		
		JSONArray jarr = new JSONArray();
		
		for(Trail trail : list) {
			JSONObject job = new JSONObject();
			
			job.put("trailId", trail.getTrailId());
			job.put("mid", URLEncoder.encode(trail.getmId(),"utf-8"));
			job.put("trailDate",trail.getTrailDate().toString());
			job.put("trailJson", URLEncoder.encode(trail.getTrailJson(),"utf-8"));
			job.put("trailCount", trail.getTrailCount());
			job.put("trailGood", trail.getTrailGood());
			job.put("trailRange", trail.getTrailRange());
			job.put("threadYn", trail.getThreadYn());
			job.put("trailReport",trail.getTrailReport());
			job.put("trailMeta", trail.getTrailMeta());
			job.put("nickName", trail.getSelectNickName());
			job.put("tag", trail.getTagName());
			jarr.add(job);
		}
		JSONObject sendJson = new JSONObject();
		sendJson.put("olist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(sendJson.toJSONString());
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
