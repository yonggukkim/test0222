package com.study.project.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.project.dao.BoardDao;
import com.study.project.service.BoardService;
import com.tobesoft.platform.PlatformRequest;
import com.tobesoft.platform.PlatformResponse;
import com.tobesoft.platform.data.ColumnInfo;
import com.tobesoft.platform.data.Dataset;
import com.tobesoft.platform.data.DatasetList;
import com.tobesoft.platform.data.VariableList;

@Service("service")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "dao")
	private BoardDao boardDao;

	@Override
	public List<Map<String, Object>> list1(Map<String, Object> map) {
		return boardDao.list1(map);
	}

	@Override
	public List<Map<String, Object>> list2() {
		return boardDao.list2();
	}

	@Override
	public String write(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("service " + request.getParameter("memName"));
		System.out.println("service " + request.getParameter("memId"));
		System.out.println("service " + request.getParameter("boardSubject"));
		System.out.println("service " + request.getParameter("boardContent"));
		map.put("memName", request.getParameter("memName"));
		map.put("memId", request.getParameter("memId"));
		map.put("boardSubject", request.getParameter("boardSubject"));
		map.put("boardContent", request.getParameter("boardContent"));
		Integer ins = boardDao.write(map);
		if (ins == 1) {
			return "redirect:/list";
		} else {
			return "write";
		}

	}

	@Override
	public Map<String, Object> modi(HttpServletRequest request) {
		String sub = request.getParameter("seq");
		return boardDao.modify1(sub);
	}

	@Override
	public String modify(HttpServletRequest request, Model model) {
		Map<String, Object> modi = new HashMap<String, Object>();
		System.out.println("service " + request.getParameter("memName"));
		System.out.println("service " + request.getParameter("memId"));
		System.out.println("service " + request.getParameter("boardSubject"));
		System.out.println("service " + request.getParameter("boardContent"));
		modi.put("seq", request.getParameter("seq"));
		modi.put("memName", request.getParameter("memName"));
		modi.put("memId", request.getParameter("memId"));
		modi.put("boardSubject", request.getParameter("boardSubject"));
		modi.put("boardContent", request.getParameter("boardContent"));
		Integer mod = boardDao.modify(modi);
		if (mod == 1) {
			return "redirect:/list";
		} else {
			return "modify";
		}
	}

	@Override
	public String delete(Map<String, List<String>> map) {
		System.out.println("service " + map);
		Integer ect = boardDao.delete(map);
		return "redirect:/list";
	}

	@Override
	public String upload(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException {
		// 파일경로
		String path="C:\\Users\\dev\\Desktop\\upload\\";
		Iterator<String> iterator = mRequest.getFileNames();
//		List<MultipartFile> files = mRequest.getFiles("file");
		File file = new File(path);
		if(file.exists() == false) {
			file.mkdirs();
		}
//		System.out.println("files 확인 : "+files.toString());
//		System.out.println("files 확인 : "+files.get(0).getName());
		System.out.println("iterator.toString : "+iterator.toString());
		while(iterator.hasNext()) {
		MultipartFile mFile = mRequest.getFile(iterator.next());
//		for(int i = 0, s =files.size(); i < s; i++) {
//			MultipartFile mFile = mRequest.getFile(files.get(i).getName());
//			System.out.println("mfile is Empty : "+mFile.isEmpty());
			if(mFile.isEmpty() == false) {
				String fileName = System.currentTimeMillis() + "_" + mFile.getOriginalFilename();
				System.out.println("파일 네임 : "+fileName);
				mFile.transferTo(new File(path + fileName));
			}
		}
		return "redirect:/list";
	}

	@Override
	public String download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getParameter("filename");
        String fullPath = "C:/Users/dev/Desktop/upload/" + filename ;
        File file = new File(fullPath);
        System.out.println("파일 경로 :"+file);

        String userAgent = request.getHeader("User-Agent");
        boolean ie = userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("rv:11") > -1;
        String fileName = null;
         
        if (ie) {
         fileName = URLEncoder.encode(file.getName(), "utf-8");
        } else {
         fileName = new String(file.getName().getBytes("utf-8"),"iso-8859-1");
        }
        
        // 겉 딱지 만드는 곳
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment;filename=\"" +fileName+"\";");
        
        FileInputStream fis = new FileInputStream(file);
        BufferedInputStream bis = new BufferedInputStream(fis);
        ServletOutputStream so = response.getOutputStream();
        BufferedOutputStream bos = new BufferedOutputStream(so);
        
        // 파일 넣는 곳
        byte[] data = new byte[2048];
        int input = 0;
        while((input=bis.read(data))!=-1){
         bos.write(data,0,input);
         bos.flush();
        }
        
        if(bos!=null) bos.close();
        if(bis!=null) bis.close();
        if(so!=null) so.close();
        if(fis!=null) fis.close();

		return "redirect:list";
	}

	@Override
	public String excel(Model model) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> boardList = new ArrayList<Map<String, Object>>();
		boardList = boardDao.select();
		model.addAttribute("list", boardList);
	  return "excel";
	}

	@Override
	public void ajax(Map<String, Object> map, Model model) {
		// search
//		System.out.println(map.get("datepicker"));
		LocalDate currentDate = LocalDate.now();
//		System.out.println(currentDate.toString());
		if (map.get("datepicker") == "" && map.get("datepicker1") == "" && map.get("keyword") != "") {
			map.remove("datepicker");
			map.remove("datepicker1");
			map.put("datepicker", currentDate.toString());
			map.put("datepicker1", currentDate.toString());
		}else if (map.get("datepicker") != "" && map.get("datepicker1") == "") {
			map.remove("datepicker1");
			map.put("datepicker1", map.get("datepicker"));
		}else if (map.get("datepicker") == "" && map.get("datepicker1") != "") {
			map.remove("datepicker");
			map.put("datepicker", map.get("datepicker1"));
		}
		System.out.println("data수신:"+map);

		// 첫 페이지 , 한페이지의 최대 게시물 수
		int firstPage = 1;

		if (map.get("nowPage") == null) {
			map.put("nowPage", firstPage);
		} else {
			String nowPage = (String) map.get("nowPage");
			map.remove("nowPage");
			map.put("nowPage", nowPage);
			System.out.println("지금 페이지 : " + map.get("nowPage").toString());
		}

		System.out.println(map.get("nowPage").toString());
		int limit = 7;
		int limitPage = 4;

		map.put("limit", limit);
		// 해당 페이지의 리미트 수 만큼 저장
		List<Map<String, Object>> boardList = new ArrayList<Map<String, Object>>();
		boardList = boardDao.limitSave(map);
		model.addAttribute("list", boardList);

		// 전체 게시물 수
		int totalCount = boardDao.totalCount(map);

		System.out.println("총 게시물 : " + totalCount);
		// 총 페이지 수
		int maxpage = (int) ((double) totalCount / limit + 0.95);
		System.out.println("총 페이지 : " + maxpage);
		System.out.println("(ajax)firstPage" + firstPage);
		System.out.println("limitPage" + limitPage);
		// 현재 보여줄 페이지 수
		int nowPage = Integer.parseInt(map.get("nowPage").toString());
		System.out.println(((double) nowPage / (double) limitPage));
		int block = (int) Math.ceil((double) nowPage / (double) limitPage);
		int startpage = (block - 1) * limitPage + 1; // 1 or 5
		int endpage = startpage + limitPage - 1; // 4 or 8
		if (endpage > maxpage)
			endpage = maxpage;

		System.out.println(block + "block");
		System.out.println(startpage + "startpage");
		System.out.println(endpage + "endpage");
		System.out.println("now:"+nowPage);
		// search end
		Map<String, Object> save = new HashMap<String, Object>();
		save.put("firstPage", firstPage);
		save.put("nowPage", nowPage);
		save.put("block", block);
		save.put("maxpage", maxpage);
		save.put("startpage", startpage);
		save.put("endpage", endpage);
		System.out.println("data발신:"+map);
		System.out.println("data발신:"+save);
		model.addAttribute("reset", map);
		model.addAttribute("paging", save);
		System.out.println("ajax처리끝");
	}
	
	@Override
	public String miplTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dataset ds = new Dataset("javaList");
		ds.addColumn("seq", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("memName", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("memId", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("boardSubject", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("boardContent", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("regDate", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("uptDate", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("viewCnt", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		List<Map<String, Object>> mipl = new ArrayList<Map<String, Object>>();
		mipl = boardDao.miplTest();

		for (int i = 0; i < mipl.size(); i++) {
			int row = ds.appendRow();
			System.out.println(mipl.get(i).toString());
			System.out.println(mipl.get(i).get("uptDate"));
			ds.setColumn(row, "seq", nullValueChk(mipl.get(i).get("seq")));

			ds.setColumn(row, "memName", nullValueChk(mipl.get(i).get("memName")));

			ds.setColumn(row, "memId", nullValueChk(mipl.get(i).get("memId")));

			ds.setColumn(row, "boardSubject", nullValueChk(mipl.get(i).get("boardSubject")));

			ds.setColumn(row, "boardContent", nullValueChk(mipl.get(i).get("boardContent")));

			ds.setColumn(row, "regDate", nullValueChk(mipl.get(i).get("regDate")));

			ds.setColumn(row, "uptDate", nullValueChk(mipl.get(i).get("uptDate")));

			ds.setColumn(row, "viewCnt", nullValueChk(mipl.get(i).get("viewCnt")));

		}
		VariableList vl = new VariableList();
		DatasetList dl = new DatasetList();
		dl.add(ds);

		vl.addStr("ErrorCode", "0");
		vl.addStr("ErrorMsg", "SUCC");

		PlatformResponse pRes = new PlatformResponse(response, PlatformRequest.XML, "UTF-8");
		pRes.sendData(vl, dl);
		return "";
	}

	public String nullValueChk(Object value) {
		String temp;
		if (value == null) {
			temp = "";
		} else {
			temp = value.toString();
		}
		return temp;
	}

	@Override
	public void miplSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dataset ds = new Dataset("javaList");
		ds.addColumn("seq", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("memName", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("memId", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("boardSubject", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("boardContent", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("regDate", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("uptDate", ColumnInfo.COLUMN_TYPE_STRING, 1000);
		ds.addColumn("viewCnt", ColumnInfo.COLUMN_TYPE_STRING, 1000);

		List<Map<String, Object>> mipl = new ArrayList<Map<String, Object>>();
		PlatformRequest req = new PlatformRequest(request, "utf-8");
		VariableList vl = new VariableList();
		// 전체 데이터 가져오기
		req.receiveData();
		// 그걸 변수 가져오기
		vl = req.getVariableList();
		System.out.println(vl.getValue("menu"));

		Map<String, Object> search = new HashMap<String, Object>();

		if (vl.getValueAsString("menu") == "전체") {
			String total = vl.getValueAsString("menu");
			search.put("menu", total);
			search.put("textbar", vl.getValueAsString("textbar"));
			mipl = boardDao.miplSearch(search);
		} else if (vl.getValueAsString("menu") == "성명") {
			String name = vl.getValueAsString("menu");
			search.put("menu", name);
			search.put("textbar", vl.getValueAsString("textbar"));
			mipl = boardDao.miplSearch(search);
		} else if (vl.getValueAsString("menu") == "제목") {
			String subject = vl.getValueAsString("menu");
			search.put("menu", subject);
			search.put("textbar", vl.getValueAsString("textbar"));
			mipl = boardDao.miplSearch(search);
		} else {
			String content = vl.getValueAsString("menu");
			search.put("menu", content);
			search.put("textbar", vl.getValueAsString("textbar"));
			mipl = boardDao.miplSearch(search);
		}

		for (int i = 0; i < mipl.size(); i++) {
			int row = ds.appendRow();
			System.out.println(mipl.get(i).toString());

			ds.setColumn(row, "seq", nullValueChk(mipl.get(i).get("seq")));

			ds.setColumn(row, "memName", nullValueChk(mipl.get(i).get("memName")));

			ds.setColumn(row, "memId", nullValueChk(mipl.get(i).get("memId")));

			ds.setColumn(row, "boardSubject", nullValueChk(mipl.get(i).get("boardSubject")));

			ds.setColumn(row, "boardContent", nullValueChk(mipl.get(i).get("boardContent")));

			ds.setColumn(row, "regDate", nullValueChk(mipl.get(i).get("regDate")));

			ds.setColumn(row, "uptDate", nullValueChk(mipl.get(i).get("uptDate")));

			ds.setColumn(row, "viewCnt", nullValueChk(mipl.get(i).get("viewCnt")));

		}
		// 데이트 셋을 가져오기
		DatasetList dl = new DatasetList();
		dl.add(ds);

		vl.addStr("ErrorCode", "0");
		vl.addStr("ErrorMsg", "SUCC");

		PlatformResponse pRes = new PlatformResponse(response, PlatformRequest.XML, "UTF-8");
		pRes.sendData(vl, dl);
	}

	@Override
	public void miplInsert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PlatformRequest miplreq = new PlatformRequest(req, "utf-8");
		DatasetList dl = new DatasetList();
		miplreq.receiveData();
		dl = miplreq.getDatasetList();
		
		Map<String,Object> map = new HashMap<String, Object>();
		Dataset ds = dl.getDataset("javaList");
		
		int rowcnt = ds.getRowCount();
		
		for(int j = 0; j < ds.getDeleteRowCount(); j++ )
        {
            String del_id = ds.getDeleteColumn(j, "seq").toString();
            int d = boardDao.miplDelete(del_id);
        }
		
		for(int i=0; i< rowcnt; i++) {
			String row_status = ds.getRowStatus(i);
			if(row_status.equals("insert") == true) {
				map.put("memName", ds.getColumnAsString(i, "memName"));
				map.put("memId",ds.getColumnAsString(i, "memId"));
				map.put("boardSubject",ds.getColumnAsString(i, "boardSubject"));
				map.put("boardContent",ds.getColumnAsString(i, "boardContent"));
				int a = boardDao.miplInsert(map);
				if(a != 0) System.out.println("성공");
				else System.out.println("실패");
			}
			else if(row_status.equals("update") == true) {
				map.put("seq", ds.getColumnAsString(i, "seq"));
				map.put("memName", ds.getColumnAsString(i, "memName"));
				map.put("memId",ds.getColumnAsString(i, "memId"));
				map.put("boardSubject",ds.getColumnAsString(i, "boardSubject"));
				map.put("boardContent",ds.getColumnAsString(i, "boardContent"));
				int b = boardDao.miplupdate(map);
				if(b != 0) System.out.println("성공");
				else System.out.println("실패");
			}
		}
		int cnt = ds.getColumnCount();
		
	}
}
