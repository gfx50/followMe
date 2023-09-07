package common;

import java.io.File;
import java.io.IOException;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import net.coobird.thumbnailator.Thumbnails;

public class ThumbnailMake {
    public Set<String> listFilesUsingJavaIO(String dir) {
        return Stream.of(new File(dir).listFiles())
                .filter(file -> !file.isDirectory())
                .map(File::getName)
                .collect(Collectors.toSet());
    }
    
    public void make(String dir) throws IOException {
    	ThumbnailMake t = new ThumbnailMake();
    	
    	Set s = t.listFilesUsingJavaIO(dir);
    	for(Object f : s) {
    		System.out.println(f);
            Thumbnails.of(new File(dir + "\\" + f.toString()))
                    .size(160, 160)
                    .toFile(new File(dir + "\\" + "thumb_" + f.toString()));
    	}
    }
    
    public void makeUserThumb(String dir, String filename) throws IOException {
    	Thumbnails.of(new File(dir + "\\" + filename))
    	.size(160, 160)
    	.toFile(new File(dir + "\\" + "thumb_" + filename));
    }
}
