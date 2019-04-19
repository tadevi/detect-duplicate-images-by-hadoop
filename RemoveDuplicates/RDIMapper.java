package RemoveDuplicates;
import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.*;
public class RDIMapper extends MapReduceBase implements Mapper<LongWritable,Text,Text,IntWritable>{
	public void map(LongWritable key, Text value, OutputCollector<Text,IntWritable> output, Reporter reporter) throws IOException{
	}
}
