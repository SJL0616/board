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
import jmp.spring.vo.ReviewVo;
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
	public java.util.List<ContentVo> getalllist(){
	List<ContentVo> list=	cservice.getAllList();

		
		return list;
	}
	
	@PostMapping("/addCast") //��� �����Է�
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
				
				CastVo cvo= new CastVo(castname, ROOT_DIR+"CAST\\", multipartFile.getOriginalFilename());
				log.info("/addCast=========== SAVEPATH:" + cvo.getSavepath());
				log.info("/addCast=========== SAVEPATH:" + cvo.getSavepath());
				File saveFile = new File(cvo.getSavepath());
				try {
					
				
				multipartFile.transferTo(saveFile);
				
				//Ȯ���ڸ� �̿��Ͽ�  MimeType�� �����մϴ�.
				//����Ÿ���� Ȯ������ ���ϸ� null�� Ȯ���մϴ�.
				String contentType = Files.probeContentType(saveFile.toPath());
				log.info("=============contentType :"+contentType );
				//�̹��� ������ ��� ������� �������ݴϴ�.
				if(contentType.startsWith("image")&& contentType!=null) {
					//������� ������ ��θ� ����
			/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; 
					String thmnail = ROOT_DIR+vo.getS_savepath();*/
					String thmnail = cvo.getS_savepath();
					//����� �̹��� ����
					Thumbnails.of(saveFile).size(200, 200).toFile(thmnail);
				cvo.setProfileImgName(multipartFile.getOriginalFilename());
				
				
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
			map.put("result", "��� ������ ����ϼ��� ");
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
	//file ��� : urlPath + uuid + _ + �����̸�
	@GetMapping("/download")
	public ResponseEntity<byte[]> downloafFile (String filename) {
		log.info("/display===========filename :" + filename);
		File file = new File(ROOT_DIR+ filename);
		
		if(file.exists()) {
			//������ ResponseEnity�� ��Ƽ� ��ȯ
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			try {// \"" <- ""�� ����ó�� ������� �� ���� ��.
				//�������� �ΰ�����.
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
	
	//�̹��� ���� ��θ� �޾Ƽ� �̹����� ��ȯ
	//�̹��� ���� ��ȯ�մϴ�.
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
	}else {
		file = new File(ROOT_DIR + filename);}
	
		HttpHeaders headers = new HttpHeaders();
				
		//������ �ִ��� Ȯ��
		if(file.exists()) {
			try {
				//header�� content-type�� ����: img������ ��θ� �־� mymeŸ���� �� �� �ֽ�.
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				//responseEntity ������ ����Ʈ ����, ���, ����ڵ尪�� �־���.
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				
				
			} catch (IOException e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			}
		}else {
			log.info("/���� :display=================fileName:"+ filename);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	
	} 

	@GetMapping("/getFileList/{attachno}")
	public java.util.List<ContentVo> getlist(@PathVariable("attachno") int attachno){
		
		List<ContentVo> list= service.getList(attachno); 
		
		return list;
	}
	
	@PostMapping("/fileUploadAjax")
	public Map<String, Object> fileUpload(MultipartFile[] uploadFile, String cname){
		
		Map<String, Object> map =new HashMap<String, Object>();
		int res=0;
		//�űԻ��� ������ ��� attachNo�� ������.
		/*f(attachno== 0) {
			attachno= service.getSeq();
		}*/
		
		for(MultipartFile multipartFile : uploadFile) {
			String uploadpath =ROOT_DIR;
			/* String uploadpath = getFolder(); */
			ContentVo vo= new ContentVo(cname, uploadpath, multipartFile.getOriginalFilename());
			
			
			//�ߺ������� ���� UUID�� �����ؼ� ���ϸ� �տ� �ٿ��ش�.
			//uuid: �ĺ��� ǥ������ uuid ǥ�ؿ� ���� 36�� ���� (8-4-4-4-12)�� ����
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
						
						//Ȯ���ڸ� �̿��Ͽ�  MimeType�� �����մϴ�.
						//����Ÿ���� Ȯ������ ���ϸ� null�� Ȯ���մϴ�.
						String contentType = Files.probeContentType(saveFile.toPath());
						log.info("=============contentType :"+contentType );
						//�̹��� ������ ��� ������� �������ݴϴ�.
						if(contentType.startsWith("image")&& contentType!=null) {
							//������� ������ ��θ� ����
					/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; 
							String thmnail = ROOT_DIR+vo.getS_savepath();*/
							String thmnail = vo.getS_savepath();
							//����� �̹��� ����
							Thumbnails.of(saveFile).size(500, 200).toFile(thmnail);
						}
				/*
				 * vo.setUuid(uuid.toString()); vo.setAttachno(attachno);
				 * vo.setFilename(multipartFile.getOriginalFilename());
				 */
				/* vo.setFiletype(contentType.startsWith("image")?"Y":"N"); */
				/* vo.setUploadpath(uploadpath); */
					
					if(service.updatePoster(vo)>0) {
						res++;
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
		
		//ATTATCNO�� �ش��ϴ� ���ϸ���Ʈ�� ��ȸ�Ͽ� ���� ����Ʈ�� ��ȸ�Ͽ� ȭ�鿡 ���
		/*
		 * java.util.List<AttachFileVo> list= service.getList(attachno); return list;
		 */
		map.put("cname", cname+"");
		map.put("result", res+"�� ����Ǿ����ϴ�");
		return map;
	}
	
	// �ߺ� ������ ���ε� ��¥�� ���ε� ��η� ����.
	//������ ��ο� ������ �������� ������ ������ ������. 
	private String getFolder() {
		String uploadPath = "";
		
		//���� ��¥�� yyyy-mm-dd ���˿� �°� String ���·� ������ �ɴϴ�.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//��-��-��¥ ���� String ����
		String str = sdf.format(new Date());
		
		//file.sepearator : �÷������� ����ϴ� �����ڸ� ���� - �� /�� �ٲ���.(�ü���� ���� \)
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		
		 File saveFile = new File( ROOT_DIR+uploadPath); log.info(saveFile);
		 
		//���丮 ����.
		 if(!saveFile.exists()) { saveFile.mkdirs(); }
		 
		
		return uploadPath;
	}
	
	@Autowired
	generateThumnail gt;
	
	@PostMapping("/VfileUploadAjax") //��� �����Է�
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
				gt.generate(saveFile);//����� ����
				
				//Ȯ���ڸ� �̿��Ͽ�  MimeType�� �����մϴ�.
				//����Ÿ���� Ȯ������ ���ϸ� null�� Ȯ���մϴ�.
				String contentType = Files.probeContentType(saveFile.toPath());
				log.info("=============contentType :"+contentType );
				//�̹��� ������ ��� ������� �������ݴϴ�.
				
					//������� ������ ��θ� ����
			/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; 
					String thmnail = ROOT_DIR+vo.getS_savepath();*/
				/*
				 * String thmnail = vvo.getS_savepath(); //����� �̹��� ����
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
	
	}///��������ε� �ѳ�
	

	@PostMapping("/reviewInsert") //��� �����Է�
	public Map<String, Object>  addReview(@RequestBody ReviewVo rvo ) {
		
		log.info("/addContent===========rvo :" +  rvo);
		int res =rservice.addReview(rvo);
		int rating=0;
	
		/* List<ReviewVo> rlist= rservice.getReview(rvo.getCno()); */

		Map<String, Object> map = new HashMap<String, Object>();
		if(res>0) {
			rating =rservice.getReviewRating(rvo.getCno());//���� ���� ��հ��� ������.
			rservice.setContentRating(rating, rvo.getCno());//���� ������ ������ ��տ� �Է�.
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
	
	
	
}
