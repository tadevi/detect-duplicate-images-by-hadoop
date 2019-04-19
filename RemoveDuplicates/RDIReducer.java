package RemoveDuplicates;
import java.io.IOException;
import java.util.*;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.*;
public class RDIReducer extends MapReduceBase implements Reducer<BytesWritable,Text,Text,IntWritable>{
	public void reduce(BytesWritable key, Iterator<Text> values, OutputCollector<Text,IntWritable> output, Reporter reporter) throws IOException{
	}
}
