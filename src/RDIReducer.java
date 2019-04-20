package rdi;
import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.InputSplit;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
public class RDIReducer extends Reducer<BytesWritable,Text,Text,IntWritable>{
	public void reduce(BytesWritable key, Iterable<Text> values, Context context)
	throws IOException,InterruptedException{
		String s="";
		for(Text t : values)
		s+=t.toString()+";";
		context.write(new Text(s),new IntWritable(0));
	}
}
