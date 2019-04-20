
import java.io.IOException;
 
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.SequenceFile;
import org.apache.hadoop.io.SequenceFile.Reader;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.util.ReflectionUtils;
 
public class SequenceFileRead
{		
  public static void main(String[] args) throws IOException {
	String uri = args[0];
	Configuration conf = new Configuration();
	Path path = new Path(uri);
	SequenceFile.Reader reader = null;
	try {		
	reader = new SequenceFile.Reader(conf, Reader.file(path), Reader.bufferSize(4096), Reader.start(0));
	Writable key = (Writable) ReflectionUtils.newInstance(reader.getKeyClass(), conf);
	Writable value = (Writable) ReflectionUtils.newInstance(reader.getValueClass(), conf);
	//long position = reader.getPosition();
	//reader.seek(position);
	while (reader.next(key, value)) {
          String syncSeen = reader.syncSeen() ? "*" : "";
	  System.out.printf("[%s]\t%s\t%s\n", syncSeen, key, "value");
	}
	} finally {
		IOUtils.closeStream(reader);
		}		
	}
}
