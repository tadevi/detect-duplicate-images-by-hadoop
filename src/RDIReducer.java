package rdi;
import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import java.io.*;


public class RDIReducer extends Reducer<Text,Text,IntWritable,Text>{
	public void reduce(Text key, Iterable<Text> values, Context context)
	throws IOException,InterruptedException{
		String s="";
		int count=0;
		for(Text t : values)
		{
			File f = new File(t.toString());
			s+=f.getName()+"\t";
			count++;
		}
		
		context.write(new IntWritable(count),new Text(s));
	}
}
