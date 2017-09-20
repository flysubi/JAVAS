package view;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDownView extends AbstractView {
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		String name = (String)map.get("name");
		String path = (String)map.get("path");
		
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "fileName=\""+name+"\"");
		InputStream is = new FileInputStream(new File(path));
		OutputStream os = resp.getOutputStream();
		
		FileCopyUtils.copy(is,os);
	}
}
