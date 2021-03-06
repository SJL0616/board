package jmp.spring.control;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jmp.spring.service.AttachFileService;
import jmp.spring.service.AttachFileServiceimpl;
import jmp.spring.service.ReplyService;
import jmp.spring.service.addContentsService;
import jmp.spring.service.generateThumnail;
import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;
import jmp.spring.vo.User;
import jmp.spring.vo.VideoVo;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@Log4j
public class FileUploadAjaxController {

	@Autowired
	public AttachFileService service;
	
	@Autowired
	public addContentsService cservice;
	
	@Autowired
	public ReplyService rservice;
	

	
	private static final String ROOT_DIR = "C:\\upload\\";

	@PostMapping("/contents/addContent")
	public Map<String, Object>  addContents(@RequestBody ContentsVo cvo) {
		log.info("/addContent===========cvo :" +  cvo);
		int res =cservice.addcontents(cvo);
		ContentVo list= service.getBycname(cvo.getCname());

		Map<String, Object> map = new HashMap<String, Object>();
		if(res>0) {
			map.put("result", "success");
		map.put("cname", cvo.getCname());
		map.put("list", list);
		}
		else {
			map.put("result", "fail");}
		return map;
	}
	
	
	@GetMapping("/showVList/{cno}/{sort}")
	public List<VideoVo> showVList(@PathVariable("cno") int cno,@PathVariable("sort") String sort){
		List<VideoVo> vvo= null;
		if(sort.equals("DESC")) {
			vvo=	cservice.getAllVideoD(cno);
		}else {
			vvo=	cservice.getAllVideo(cno);
	         
		}

		
		return vvo;
	}
	

	@GetMapping("/getAllFileList/")
	public Map<String, Object>  getalllist(){
	List<ContentVo> list=	cservice.getAllList();
	int length =list.size();

	Map<String, Object> map = new HashMap<String, Object>();
	map.put("list", list);
	map.put("length", length);
		return map;
	}
	@GetMapping("/getTureAllList/")
	public Map<String, Object> getTureAllList(){
	List<ContentVo> list=	cservice.getTureAllList();
	int length =list.size();

	Map<String, Object> map = new HashMap<String, Object>();
	map.put("list", list);
	map.put("length", length);
		return map;
	}
	

	
	@GetMapping("/getSelectedList/{selectedG}/{selectedT}/{type}")
	public Map<String, Object>  getselectedlist(@PathVariable("selectedG") String[] selectedG,
			@PathVariable("selectedT") String[]  selectedT,
			@PathVariable("type") String type){
		log.info("/addCast===========  selectedG :" +  selectedG);
		log.info("/addCast=========== selectedT :" + selectedT);
		log.info("/addCast=========== Type :" + type);
		
		if(selectedT[0].equals("0")) {//????????? ?????? ????????? 0?????? null??? ??????.
			selectedT=null;
		}
		if(selectedG[0].equals("0")) {
			selectedG=null;
		}
		String[] genreArray= selectedG;
		String[] tagArray= selectedT;
		
		ContentVo cvo = new ContentVo();
		cvo.setTagArray(tagArray);
		cvo.setGenreArray(genreArray);
		cvo.setType(type);
		
	List<ContentVo> list=	cservice.getFilteredList(cvo);
	int length =list.size();

	Map<String, Object> map = new HashMap<String, Object>();
	map.put("list", list);
	map.put("length", length);
		return map;
	}
	
	
	
	
	@PostMapping("/addCast") //?????? ????????????
	public Map<String, Object>  addcast(MultipartFile[] uploadFile,
			 String castname, String cast ) {
		log.info("/addCast===========uploadFile :" + uploadFile);
		log.info("/addCast===========castname :" + castname);
		log.info("/addCast===========cast :" + cast);
		log.info("/addCast=========== uploadFileName:" + uploadFile.length);
		Map<String, Object> map = new HashMap<String, Object>();
		
	
			
		/*	cvo.setCastname(castname);
			cvo.setProfileUploadPath(ROOT_DIR+"CAST\\");*/
			
			for(MultipartFile multipartFile : uploadFile) {
				
				CastVo cvo= new CastVo(castname, ROOT_DIR+"CAST\\", "cast_"+multipartFile.getOriginalFilename());
				log.info("/addCast=========== SAVEPATH:" + cvo.getSavepath());
				log.info("/addCast=========== SAVEPATH:" + cvo.getSavepath());
				File saveFile = new File(cvo.getSavepath());
				try {
					
				
				multipartFile.transferTo(saveFile);
				
				//???????????? ????????????  MimeType??? ???????????????.
				//??????????????? ???????????? ????????? null??? ???????????????.
				String contentType = Files.probeContentType(saveFile.toPath());
				log.info("=============contentType :"+contentType );
				//????????? ????????? ?????? ???????????? ??????????????????.
				if(contentType.startsWith("image")&& contentType!=null) {
					//???????????? ????????? ????????? ??????
			/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; 
					String thmnail = ROOT_DIR+vo.getS_savepath();*/
					String thmnail = cvo.getS_savepath();
					//????????? ????????? ??????
					Thumbnails.of(saveFile).size(200, 200).toFile(thmnail);
				cvo.setProfileImgName("cast_"+multipartFile.getOriginalFilename());
				
				
			}
			}catch(IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
			int res= cservice.addcast(cvo);	
			if(res>0) {
				map.put("result", "success");
			    map.put("castname", castname);
			   
			}
			else {	
				map.put("result", "error");
				
			}
	
		}
			 return map;	
	
	}
		
	
			
		/* CastVo cvo =cservice.getcastByName(castname); */
		/*
		int res=cservice.addcast_match(cno, cast, castvo.getCastno());
		
	

	}*/
	
	
	

	@GetMapping("/addCastMatch/{cno}/{castname}/{cast}")
	public Map<String, Object>  addcast(@PathVariable("cno") int cno, 
			@PathVariable("castname") String castname, @PathVariable("cast") String cast ) {
		log.info("/addCast===========cno :" + cno);
		log.info("/addCast===========castname :" + castname);
		log.info("/addCast===========cast :" + cast);
		Map<String, Object> map = new HashMap<String, Object>();
		
		CastVo castvo =cservice.getcastByName(castname);
		if(castvo==null) {
			map.put("result", "?????? ????????? ??????????????? ");
			return map;
		}
			
		CastVo cvo =cservice.getcastByName(castname);
		
		int res=cservice.addcast_match(cno, cast, cvo.getCastno());
		
		if(res>0) {
			map.put("result", "success");
		    map.put("castname", castname);
		    return map;
		}
		else {	
			map.put("result", "error");
			return map;
		}
		

	}
	
	
	/*
	@GetMapping("/attachFileDelete/{uuid}/{attachno}")
	public String deleteFile (@PathVariable("uuid") String uuid, 
			@PathVariable("attachno") int attachno	) {
		log.info("/deleteFile===========uuid :" +  uuid);
		log.info("/deleteFile===========attachno :" + attachno);
		
		ContentVo vo =service.get(cno);
		log.info("/deleteFile===========vo :" + vo);
		log.info("/deleteFile===========vo :" + vo.getSavepath());
		log.info("/deleteFile===========vo :" + vo.getS_savepath());
		log.info("/deleteFile===========vo :" + vo.getFiletype());
		File file  = new File(ROOT_DIR+vo.getSavepath());
		if(file.exists()) {
		file.delete();
		}
		if(vo.getFiletype().equals("Y")) {
			File sfile  = new File(ROOT_DIR+vo.getS_savepath());
			log.info("/deleteFile===========s_savepath :" +ROOT_DIR+vo.getS_savepath());
			log.info("/deleteFile===========sfile :" +sfile);
			if(sfile.exists()) {
			sfile.delete();
			}
		}
		int res = service.delete(uuid, attachno);
		
		return res>0?"success":"error";
	}*/
	//file ?????? : urlPath + uuid + _ + ????????????
	@GetMapping("/download")
	public ResponseEntity<byte[]> downloafFile (String filename) {
		log.info("/display===========filename :" + filename);
		File file = new File(ROOT_DIR+ filename);
		
		if(file.exists()) {
			//????????? ResponseEnity??? ????????? ??????
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			try {// \"" <- ""??? ???????????? ???????????? ??? ?????? ???.
				//???????????? ????????????.
				headers.add("Content-Disposition", "attachment;filename=\""+ new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			
					return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),
							headers,
							HttpStatus.OK);
			
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return  new ResponseEntity<>(
						HttpStatus.INTERNAL_SERVER_ERROR);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return  new ResponseEntity<>(
						HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		}else {
			return  new ResponseEntity<>(
					HttpStatus.NOT_FOUND);
		}
		
	}
	
	//????????? ?????? ????????? ????????? ???????????? ??????
	//????????? ?????? ???????????????.
	@GetMapping("/display")
	public  ResponseEntity<byte[]> displayFile(String filename) {
		log.info("/display=================fileName:"+ filename);
		//filename :uploadpath + uuid + '_'+ filename
		File file ;
		log.info("/display=================filename.contains(\"-thumb\"):"+filename.contains("-thumb"));
	if( filename.contains("mp4")) {
			/*
			 * if(filename.contains("-thumb")) {
			 * 
			 * }
			 */
		 file = new File(ROOT_DIR+"VIDEO\\"+filename);
	}else if(filename.contains("cast")){
		 file = new File(ROOT_DIR+"CAST\\"+"s_"+filename);
	}else {
		file = new File(ROOT_DIR + filename);}
	
		HttpHeaders headers = new HttpHeaders();
				
		//????????? ????????? ??????
		if(file.exists()) {
			try {
				//header??? content-type??? ??????: img????????? ????????? ?????? myme????????? ??? ??? ??????.
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				//responseEntity ????????? ????????? ??????, ??????, ?????????????????? ?????????.
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				
				
			} catch (IOException e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			}
		}else {
			log.info("/?????? :display=================fileName:"+ filename);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	
	} 

	@GetMapping("/getFileList/{attachno}")
	public java.util.List<ContentVo> getlist(@PathVariable("attachno") int attachno){
		
		List<ContentVo> list= service.getList(attachno); 
		
		return list;
	}
	
	@PostMapping("/fileUploadAjax")
	public Map<String, Object> fileUpload(MultipartFile[] uploadFile, String cname,int type){
		
		Map<String, Object> map =new HashMap<String, Object>();
		int res=0;
		
		

		for(MultipartFile multipartFile : uploadFile) {
			String uploadpath =ROOT_DIR;
			/* String uploadpath = getFolder(); */
			

				
		    ContentVo vo= new ContentVo(cname, uploadpath, multipartFile.getOriginalFilename());


			
		
			
			//??????????????? ?????? UUID??? ???????????? ????????? ?????? ????????????.
			//uuid: ????????? ???????????? uuid ????????? ?????? 36??? ?????? (8-4-4-4-12)??? ??????
			 UUID uuid = UUID.randomUUID(); 
			
			
			/*
			 * String uploadFileName=
			 * uuid.toString()+"_"+multipartFile.getOriginalFilename();
			 */
			/* File saveFile = new File(ROOT_DIR+uploadPath+uploadFileName);
			File saveFile = new File(ROOT_DIR+vo.getSavepath()); */
			File saveFile = new File(vo.getSavepath());
		
			
			try {
				
				
						multipartFile.transferTo(saveFile);
						
						//???????????? ????????????  MimeType??? ???????????????.
						//??????????????? ???????????? ????????? null??? ???????????????.
						String contentType = Files.probeContentType(saveFile.toPath());
						log.info("=============contentType :"+contentType );
						//????????? ????????? ?????? ???????????? ??????????????????.
						if(contentType.startsWith("image")&& contentType!=null&&type!=1) {
							//???????????? ????????? ????????? ??????
					/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; 
							String thmnail = ROOT_DIR+vo.getS_savepath();*/
							String thmnail = vo.getS_savepath();
							//????????? ????????? ??????
							Thumbnails.of(saveFile).size(500, 200).toFile(thmnail);
						}
				/*
				 * vo.setUuid(uuid.toString()); vo.setAttachno(attachno);
				 * vo.setFilename(multipartFile.getOriginalFilename());
				 */
				/* vo.setFiletype(contentType.startsWith("image")?"Y":"N"); */
				/* vo.setUploadpath(uploadpath); */
					if(type!=1) {
						if(service.updatePoster(vo)>0) {
							res++;
						}
					}else {
						if(service.updatePoster2(vo)>0) {
							res++;
						}
					}
					
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		
			
			log.info("====================");
			log.info(multipartFile.getOriginalFilename());
			log.info(multipartFile.getSize());
			log.info(multipartFile.getName());
			log.info("====================");
		}
		
		//ATTATCNO??? ???????????? ?????????????????? ???????????? ?????? ???????????? ???????????? ????????? ??????
		/*
		 * java.util.List<AttachFileVo> list= service.getList(attachno); return list;
		 */
		map.put("cname", cname+"");
		map.put("result", res+"??? ?????????????????????");
		return map;
	}
	
	// ?????? ????????? ????????? ????????? ????????? ????????? ??????.
	//????????? ????????? ????????? ???????????? ????????? ????????? ?????????. 
	private String getFolder() {
		String uploadPath = "";
		
		//?????? ????????? yyyy-mm-dd ????????? ?????? String ????????? ????????? ?????????.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//???-???-?????? ?????? String ??????
		String str = sdf.format(new Date());
		
		//file.sepearator : ??????????????? ???????????? ???????????? ?????? - ??? /??? ?????????.(??????????????? ????????? \)
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		
		 File saveFile = new File( ROOT_DIR+uploadPath); log.info(saveFile);
		 
		//???????????? ??????.
		 if(!saveFile.exists()) { saveFile.mkdirs(); }
		 
		
		return uploadPath;
	}
	
	@Autowired
	generateThumnail gt;
	
	@PostMapping("/VfileUploadAjax") //?????? ????????????
	public Map<String, Object>  addcast(MultipartFile[] uploadFile,
			 String story, String regdate,int cno ) {
		log.info("/addCast===========uploadFile :" + uploadFile);
		log.info("/addCast===========castname :" + story);
		log.info("/addCast===========cast :" +  cno );

		Map<String, Object> map = new HashMap<String, Object>();
		
	
			
		/*	cvo.setCastname(castname);
			cvo.setProfileUploadPath(ROOT_DIR+"CAST\\");*/
			
			for(MultipartFile multipartFile : uploadFile) {
				
				VideoVo vvo= new VideoVo( regdate, multipartFile.getOriginalFilename(), ROOT_DIR+"VIDEO\\",story,cno );
						
				log.info("/addCast=========== SAVEPATH:" + vvo.getSavepath());
				
				File saveFile = new File(vvo.getSavepath());
				try {
					
				
				multipartFile.transferTo(saveFile);
				gt.generate(saveFile);//????????? ??????
				
				//???????????? ????????????  MimeType??? ???????????????.
				//??????????????? ???????????? ????????? null??? ???????????????.
				String contentType = Files.probeContentType(saveFile.toPath());
				log.info("=============contentType :"+contentType );
				//????????? ????????? ?????? ???????????? ??????????????????.
				
					//???????????? ????????? ????????? ??????
			/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; 
					String thmnail = ROOT_DIR+vo.getS_savepath();*/
				/*
				 * String thmnail = vvo.getS_savepath(); //????????? ????????? ??????
				 * Thumbnails.of(saveFile).size(200, 200).toFile(thmnail);
				 */
				
				
			
			}catch(IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

				int res= cservice.addVideo(vvo);
	
			 /* = cservice.addcast(cvo); */
			if(res>0) {
				map.put("result", "success");
				map.put("vname", multipartFile.getOriginalFilename());
			   
			}
			else {	
				map.put("result", "error");
				
			}
	
		}
			 return map;	
	
	}///?????????????????? ??????
	

	@PostMapping("/reviewInsert") //?????? ????????????
	public Map<String, Object>  addReview(@RequestBody ReviewVo rvo ) {
		
		log.info("/addContent===========rvo :" +  rvo);
		int res =rservice.addReview(rvo);
		int rating=0;
	
		/* List<ReviewVo> rlist= rservice.getReview(rvo.getCno()); */

		Map<String, Object> map = new HashMap<String, Object>();
		if(res>0) {
			rating =rservice.getReviewRating(rvo.getCno());//?????? ?????? ???????????? ?????????.
			rservice.setContentRating(rating, rvo.getCno());//?????? ????????? ????????? ????????? ??????.
			map.put("result", "success");
			/* map.put("rlist", rlist); */
		
		}
		else {
			map.put("result", "fail");}
		return map;
	}
	
	@GetMapping("/getReviewList/{cno}/{pageNum}")
	public Map<String, Object> getReviewList(@PathVariable("cno") int cno,@PathVariable("pageNum") int pageNum ){
		/* List<ReviewVo> rlist= rservice.getReview(cno); */
		int total =rservice.getTotal(cno);
		Criteria cri= new Criteria(pageNum, 10, total);
		
		 List<ReviewVo> rlist= rservice.getList(cno, cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(rlist!=null) {
			map.put("result", "success");
		map.put("rlist", rlist);
		map.put("cri", cri);
		map.put("rCount", total);
		
		}
		else {
			map.put("result", "fail");}
		return map;
		
	}
	
	@PostMapping("/replyInsert") //?????? ????????????
	public Map<String, Object>  addReply(@RequestBody ReplyVo rvo ) {
	
		log.info("/addContent===========rvo :" +  rvo);
		int res =rservice.insert(rvo);
		log.info("/addContent===========rvo.getRe_rno() :" +  rvo.getRe_rno());
		log.info( rvo.getRe_rno()>0);
		
		if(rvo.getRe_rno()>0) {
			int rno =rservice.getSeq_Currval();
			rservice.setRe_rno(rvo.getRe_rno(), rno);
		}
	
		/* List<ReviewVo> rlist= rservice.getReview(rvo.getCno()); */

		Map<String, Object> map = new HashMap<String, Object>();
		if(res>0) {
			map.put("result", "success");
			/* map.put("rlist", rlist); */
		
		}
		else {
			map.put("result", "fail");}
		return map;
	}

	/* /{pageNum} */
	@GetMapping("/getReplyList/{vno}/{pageNum}")
	public Map<String, Object> getReplyList(@PathVariable("vno") int vno,@PathVariable("pageNum") int pageNum){
		/* List<ReviewVo> rlist= rservice.getReview(cno); */
		int total =rservice.getReplyTotal(vno);
		 Criteria cri= new Criteria(pageNum, 10, total); 
		
		/* List<ReviewVo> rlist= rservice.getList(cno, cri); */
		 List<ReplyVo> rlist= rservice.get(vno,cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(rlist!=null) {
			map.put("result", "success");
		map.put("rlist", rlist);
			map.put("cri", cri); 
		map.put("rCount", total);
		
		}
		else {
			map.put("result", "fail");}
		return map;
		
	}
	@GetMapping("/getRe_reply")
	public Map<String, Object> getReplyList(){

		 List<ReplyVo> rlist= rservice.getRe_reply();
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(rlist!=null) {
			map.put("result", "success");
		map.put("rlist", rlist);

		
		}
		else {
			map.put("result", "fail");}
		return map;
		
	}
	

	@GetMapping("/getImgList/{type}")//index ?????? 
	public Map<String, Object> getImgList(@PathVariable("type") String type){

		 List<ContentVo> clist= cservice.getIndexList(type);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(clist!=null) {
			map.put("result", "success");
		map.put("clist", clist);
		map.put("type", type);

		
		}
		else {
			map.put("result", "fail");}
		return map;
		
	}
	
	//????????? ????????? ?????? ??????????????? ????????????.
	
	@GetMapping("/getSearchedList/{word2}")
	public Map<String, Object>  getselectedlist(@PathVariable("word2") String word2){

		log.info("/getSearchedList=========== word :" + word2);
		
		List<ContentVo> list=cservice.getSearchedCListByCname(word2);
		List<CastVo> castlist=cservice.getCastListByName(word2);
		
		/*
		 * if(selectedT[0].equals("0")) {//????????? ?????? ????????? 0?????? null??? ??????. selectedT=null; }
		 * if(selectedG[0].equals("0")) { selectedG=null; }
		 */
	
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		
		 if(list.size()!=0 || castlist.size() !=0){
			 
			  map.put("result","success"); 
			  map.put("contentlist",list); 
			  map.put("castlist", castlist);
		 }else {
			 map.put("result","error"); 
			 map.put("word",word2);
		 }
		return map;
	}
	
	@GetMapping("/searchList/{word}")
	public Map<String, Object>  searchlist(@PathVariable("word") String word){

		log.info("/searchList=========== word :" + word);
		
		List<ContentVo> list=cservice.getSearchedCListByCname(word);
		 List<ContentVo> clist= null;
			log.info("/searchList=========== word.contains(\"??????\"):" +word.contains("??????"));
		 
		if(word.contains("??????")) {// ??????_ ??? ?????? word??? ?????? ???????????? contentsList??? ????????????.
		int idx=word.indexOf("_");
		String str= word.substring(idx+1);
		  clist=cservice.getSearchedCListByCast(str); 
		}
		
		List<CastVo> castlist=cservice.getCastListByName(word);
		
		/*
		 * if(selectedT[0].equals("0")) {//????????? ?????? ????????? 0?????? null??? ??????. selectedT=null; }
		 * if(selectedG[0].equals("0")) { selectedG=null; }
		 */
	
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		
		 if(list.size()!=0 || castlist.size() !=0 || clist.size() !=0  ){
		
			 int length= list.size()+castlist.size();
			 if(clist!=null) {
				 length	+=clist.size();
			 }
				
			 
			  map.put("result","success"); 
			  map.put("contentlist",list); 
			map.put("contentlist2", clist); 
			  map.put("castlist", castlist);
			  map.put("length", length);
		
  
		 }else {
			 map.put("result","error"); 
			 map.put("word",word);
		 }
		return map;
	}
	
	@GetMapping("/notRec/{cno}")
	public Map<String, Object>  notRecContents(@PathVariable("cno") int cno){

		log.info("/notRec=========== cno :" + cno);
		
		int res= cservice.notRec(cno);


		  
		  Map<String, Object> map = new HashMap<String, Object>();
		 
		  map.put("result", res);

		return map;
	}
	
	@GetMapping("/Rec/{cno}")
	public Map<String, Object> RecContents(@PathVariable("cno") int cno){

		log.info("/Rec=========== cno :" + cno);
		int res=cservice.Rec(cno);

		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("result", res);
		return map;
	}
	@GetMapping("/notShow/{cno}")
	public Map<String, Object>  notshowContents(@PathVariable("cno") int cno){

		log.info("/notshow=========== cno :" + cno);
		
		int res= cservice.notshow(cno);


		  
		  Map<String, Object> map = new HashMap<String, Object>();
		 
		  map.put("result", res);

		return map;
	}
	
	@GetMapping("/show/{cno}")
	public Map<String, Object> showContents(@PathVariable("cno") int cno){

		log.info("/show=========== cno :" + cno);
		int res=cservice.show(cno);

		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("result", res);
		return map;
	}
	
	@GetMapping("/deleteReply/{rno}")
	public Map<String, Object> deleteReply(@PathVariable("rno") int rno){

		log.info("/deleteReply=========== rno :" + rno);
		int res=rservice.remove(rno);

		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("result", res);
		return map;
	}
	
	@PostMapping("/SaveVMatch") //?????? ????????????
	public Map<String, Object>  SaveVMatch(
		@RequestBody User user) {
		//?????? ???????????? ????????? ??????
		User uList = cservice.getMatch(user.getCno(), user.getId());
		log.info("==========user Match ??????"+uList!=null);
		int res;
		if(uList!=null) {
			res= cservice.saveMatch(user.getCno(), user.getId(), user.getVno());
		}else {
			res= cservice.insertMatch(user.getCno(),user.getId(), user.getVno());
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		return map;

	}
	
	@GetMapping("/getVMatch/{id}")
	public Map<String, Object> getVMatch(@PathVariable("id") String id){

		log.info("/getVMatch=========== activatied:");
		List<ContentVo> list = cservice.getVMatchList(id);

		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("list", list);
		return map;
	}
	
	@PostMapping("/getMatch") //?????? ????????????
	public Map<String, Object>  getMatch(
		@RequestBody User user) {
		//?????? ???????????? ????????? ??????
		User uList = cservice.getMatch(user.getCno(), user.getId());
		log.info("==========user Match ??????"+uList!=null);
		
		Map<String, Object> map = new HashMap<String, Object>();

		

		if(uList!=null) {
			
			map.put("ulist", uList);
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		

		return map;

	}
}
	
	