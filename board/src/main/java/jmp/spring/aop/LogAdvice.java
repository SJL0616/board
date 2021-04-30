package jmp.spring.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jmp.spring.mapper.BoardMapper;
import lombok.experimental.Accessors;
import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j
public class LogAdvice {

	@Autowired
	BoardMapper mapper;
	
	  @Before("execution(* jmp.spring.service.BoardService.*(..))") public void
	  logBefore() { log.info("AOP=====================");
	  
	  }
	  /*
	  @Around("execution(* jmp.spring.service.BoardService*.*(..))") public Object
	  logTiome(ProceedingJoinPoint pjp) { Object result= null; long start =
	  System.currentTimeMillis();
	  
	  log.info(pjp.getTarget()); log.info(Arrays.toString(pjp.getArgs()));
	  
	  try { result = pjp.proceed(); } 
	  catch (Throwable e)
	  { e.printStackTrace(); } long end = System.currentTimeMillis();
	  log.info("실행시간 :"+(end-start)/1000.0+"초"); return result; }
	  */
	  
	  @Around("execution(* jmp.spring.service.*.*(..))")
	  public Object logTime(ProceedingJoinPoint pjp){
		
		  Object res= null;
		  //전처리
		  long startTime = System.currentTimeMillis();
		  
		  try {
			res= pjp.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  long endTime = System.currentTimeMillis();
		  log.info((endTime-startTime)/1000.0+"초");
		  return res;
		  
	  }
	

}
