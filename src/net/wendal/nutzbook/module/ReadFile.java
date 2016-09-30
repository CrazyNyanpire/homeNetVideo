package net.wendal.nutzbook.module;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.nutz.ioc.loader.annotation.IocBean;

import net.wendal.nutzbook.bean.VideoFile;

@IocBean
public class ReadFile {
	
	public ReadFile() {
    }
    /**
     * 读取某个文件夹下的所有文件
     */
    public  List<VideoFile> readfile(String filepath,List<VideoFile> videoList,int length) throws FileNotFoundException, IOException {
            try {

                    File file = new File(filepath);
                    if (!file.isDirectory()) {
                    		String path=file.getPath().substring(length,file.getPath().length());
                            System.out.println("文件");
                            System.out.println("path=" + path);
                            System.out.println("absolutepath=" + file.getAbsolutePath());
                            System.out.println("name=" + file.getName());
                            VideoFile videoFile=new VideoFile();
                            videoFile.setSize(file.length());
                            videoFile.setName(file.getName());
                            videoFile.setPath(path);
                            videoFile.setAbsolutepath(file.getAbsolutePath());
                            videoList.add(videoFile);
                            

                    } else if (file.isDirectory()) {
                            System.out.println("文件夹");
                            String[] filelist = file.list();
                            for (int i = 0; i < filelist.length; i++) {
                                    File readfile = new File(filepath + "\\" + filelist[i]);
                                    if (!readfile.isDirectory()) {
                                    		String path=readfile.getPath().substring(length,readfile.getPath().length());
                                    		path=path.replace("\\", "/");
                                            System.out.println("path=" + path);
                                            System.out.println("absolutepath="+ readfile.getAbsolutePath());
                                            System.out.println("name=" + readfile.getName());
                                            VideoFile videoFile=new VideoFile();
                                            videoFile.setSize(readfile.length());
                                            videoFile.setName(readfile.getName());
                                            videoFile.setPath(path);
                                            videoFile.setAbsolutepath(readfile.getAbsolutePath());
                                            videoList.add(videoFile);      
                                    } else if (readfile.isDirectory()) {
                                            readfile(filepath + "\\" + filelist[i],videoList,length);
                                    }
                            }
                    }

            } catch (FileNotFoundException e) {
                    System.out.println("readfile()   Exception:" + e.getMessage());
            }
			return videoList;
    }
    
    public  List<VideoFile> readfiles(String filepath,List<VideoFile> videoList,int length) throws FileNotFoundException, IOException {
			        File file = new File(filepath);
					if (!file.isDirectory()) {
							String path=file.getPath().substring(length,file.getPath().length());
					        System.out.println("文件");
					        System.out.println("path=" + path);
					        System.out.println("absolutepath=" + file.getAbsolutePath());
					        System.out.println("name=" + file.getName());
					        VideoFile videoFile=new VideoFile();
					        videoFile.setSize(file.length());
					        videoFile.setName(file.getName());
					        videoFile.setPath(path);
					        videoFile.setAbsolutepath(file.getAbsolutePath());
					        videoList.add(videoFile);
					} else if (file.isDirectory()) {
					        System.out.println("文件夹");
					        String[] filelist = file.list();
					        for (int i = 0; i < filelist.length; i++) {
					                File readfile = new File(filepath + "\\" + filelist[i]);
					                String path=readfile.getPath().substring(length,readfile.getPath().length());
					        		path=path.replace("\\", "/");
					                if (!readfile.isDirectory()) {
					                        System.out.println("path=" + path);
					                        System.out.println("absolutepath="+ readfile.getAbsolutePath());
					                        System.out.println("name=" + readfile.getName());
					                        VideoFile videoFile=new VideoFile();
					                        videoFile.setSize(readfile.length());
					                        videoFile.setName(readfile.getName());
					                        videoFile.setPath(path);
					                        videoFile.setAbsolutepath(readfile.getAbsolutePath());
					                        videoFile.setType("0");
					                        videoList.add(videoFile);      
					                } else if (readfile.isDirectory()) {
					                    	VideoFile videoFile=new VideoFile();
					                        videoFile.setSize(readfile.length());
					                        videoFile.setName(readfile.getName());
					                        videoFile.setPath(path);
					                        videoFile.setAbsolutepath(readfile.getAbsolutePath());
					                        videoFile.setType("1");
					                        videoList.add(videoFile);
					                }
					        }
					}
		return videoList;
}
}
