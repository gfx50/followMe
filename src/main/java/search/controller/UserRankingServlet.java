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

import follow.model.vo.Follow;
import search.model.service.SearchService;

/**
 * Servlet implementation class UserRankingServlet
 */
@WebServlet("/userranking")
public class UserRankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRankingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 팔로워 순위 유저
		
		ArrayList<Follow> list = new SearchService().selectFolloweeRank();
		/* System.out.println(list.toString()); */
		
		JSONArray jarr = new JSONArray();
		
		for(Follow foll : list) {
			JSONObject job = new JSONObject();
			
			job.put("no", foll.getFollowRank());
			job.put("mid", foll.getmID());
			job.put("NickName",foll.getSelectNickName());
			job.put("followe", foll.getFollowTotal());
			
			jarr.add(job);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("flist", jarr);
		
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
