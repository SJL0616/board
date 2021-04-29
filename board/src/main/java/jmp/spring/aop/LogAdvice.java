package jmp.spring.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j
public class LogAdvice {

	
	@Before("execution(* jmp.spring.service.BoardService.*(..))")
	public void logBefore() {
		log.info("AOP=====================");
		
	}
	
	@Around("execution(* jmp.spring.service.BoardService.*(..))")
	public Object logTiome(ProceedingJoinPoint pjp) {
		Object result= null;
		long start = System.currentTimeMillis();
		
		log.info(pjp.getTarget());
		log.info(Arrays.toString(pjp.getArgs()));
		
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		log.info("실행시간 :"+(end-start)/1000.0+"초");
		return result;
	}
	
	
}
