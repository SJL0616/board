package jmp.spring.service;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.jcodec.api.FrameGrab;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.model.Picture;
import org.jcodec.scale.AWTUtil;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Component
@Log4j
public class generateThumnail {

	
	 public void generate(File file) {
	    try {
	        double startSec = 51.632;
	        int frameCount = 1;

	        FrameGrab grab = FrameGrab.createFrameGrab(NIOUtils.readableChannel(file));
	        grab.seekToSecondPrecise(startSec);

	        for (int i = 0; i < frameCount; i++) {
	            Picture picture = grab.getNativeFrame();
	            System.out.println(picture.getWidth() + "x" + picture.getHeight() + " " + picture.getColor());

	            BufferedImage bufferedImage = AWTUtil.toBufferedImage(picture);
	            ImageIO.write(bufferedImage, "png", new File(file.getAbsolutePath() + "-thumb.png"));
	        	
	        
	          
	        }
	    } catch (Exception e) {
	        log.error(e.getMessage());
	    }
	}
	
	
}
