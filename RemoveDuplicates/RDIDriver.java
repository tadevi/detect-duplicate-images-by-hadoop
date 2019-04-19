package RemoveDuplicates;
import java.io.IOException;
import java.util.*;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
public class RDIDriver{
	public static void main(String[] args){
		JobClient my_client=new JobClient();
		JobConf job_conf=new JobConf(RDIDriver.class);
		job_conf.setJobName("RDI");

		job_conf.setOutputKeyClass(Text.class);
		job_conf.setOutputValueClass(IntWritable.class);

		job_conf.setMapperClass(RemoveDuplicates.RDIMapper.class);
		job_conf.setReducerClass(RemoveDuplicates.RDIReducer.class);

		job_conf.setInputFormat(TextInputFormat.class);
		job_conf.setOutputFormat(TextOutputFormat.class);
	}
}
