package RemoveDuplicates;
import java.io.IOException;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.*;
public class RDIMapper extends MapReduceBase implements Mapper<Object,Text,Text,BytesWritable>{
	public void map(Object key, Text value, OutputCollector<Text,BytesWritable> output, Reporter reporter) throws IOException{
	}
}
