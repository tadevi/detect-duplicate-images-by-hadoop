package rdi;
import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;


public class RDIReducer extends Reducer<BytesWritable,Text,Text,IntWritable>{
	public void reduce(BytesWritable key, Iterable<Text> values, Context context)
	throws IOException,InterruptedException{
		String s="";
		for(Text t : values)
		s+=t.toString()+";";
		context.write(new Text(s),new IntWritable(0));
	}
}
