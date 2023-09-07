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

import search.model.service.SearchService;
import tag.model.vo.Tag;

/**
 * Servlet implementation class WweeklyHotKeyServlet
 */
@WebServlet("/weeklyhot")
public class WweeklyHotKeyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**s
     * @see HttpServlet#HttpServlet()
     */
    public WweeklyHotKeyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주간 태그 조회순 
		
		ArrayList<Tag> list = new SearchService().selectWeeklyBestTag();
		
		JSONArray jarr = new JSONArray();
		
		for(Tag tag : list) {
			JSONObject job = new JSONObject();
			job.put("tagname",URLEncoder.encode(tag.getTagName(),"UTF-8"));
			job.put("no", tag.getTagno());
			jarr.add(job);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("tlist", jarr);
		
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
