package rdi;
import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


//Mapper will map image_name----> <image_hast,image_name>
public class RDIMapper extends  Mapper<Text,BytesWritable,Text,Text>{
	BytesWritable keyOut=new BytesWritable();
	Text valueOut=new Text();
	@Override
	protected void map(Text key, BytesWritable value, Context context)
	throws IOException,InterruptedException{
		Text hash=new Text(SkeinHash.hash(value.getBytes(),value.getLength()));
		context.write(hash,key);
	}

}
