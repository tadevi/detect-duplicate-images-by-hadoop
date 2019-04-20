package rdi;
import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


//Mapper will map image_name----> <image_hast,image_name>
public class RDIMapper extends  Mapper<Text,BytesWritable,BytesWritable,Text>{
	BytesWritable keyOut=new BytesWritable();
	Text valueOut=new Text();
	@Override
	protected void map(Text key, BytesWritable value, Context context)
	throws IOException,InterruptedException{
		byte[] hash=new byte[64];
		byte[] data=new byte[value.getLength()];
		System.arraycopy(value.getBytes(),0,data,0,data.length);
		SkeinHash.hash(data,hash);
		System.out.println(value.getLength());
		context.write(new BytesWritable(hash),key);
	}

}
