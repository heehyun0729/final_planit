package com.jhta.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelDownloadView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment;filename=\"profits.xls\";"); 
		int mem_stat=(Integer)model.get("mem_stat");
		String[] days=(String[])model.get("days");
		String[] adProfit=(String[])model.get("adProfit");
		String[] sellProfit=(String[])model.get("sellProfit");
		String[] totalProfit=(String[])model.get("totalProfit");
		
		HSSFSheet sheet1 = workbook.createSheet("sheet1");// Sheet ����
		
		HSSFRow row = null;
	    HSSFCell cell = null;
     
		row=sheet1.createRow(0);
         
        cell=row.createCell(0);
        cell.setCellValue("��¥");
        
        if(mem_stat==0) {
        	cell=row.createCell(1);
            cell.setCellValue("�������");
            cell=row.createCell(2);
            cell.setCellValue("���Ҹ���");
            cell=row.createCell(3);
            cell.setCellValue("�� ����");
    	}else {
    		cell=row.createCell(1);
            cell.setCellValue("���Ҹ���");
    	}
        
        for(int i=0;i<days.length;i++) {
        	row=sheet1.createRow(i+1);
        	cell=row.createCell(0);
        	cell.setCellValue(days[i]);
        	if(mem_stat==0) {
        		cell=row.createCell(1);
        		cell.setCellValue(adProfit[i]);
        		cell=row.createCell(2);
        		cell.setCellValue(sellProfit[i]);
        		cell=row.createCell(3);
        		cell.setCellValue(totalProfit[i]);
        	}else {
        		cell=row.createCell(1);
            	cell.setCellValue(sellProfit[i]);
        	}        	
        }
	}
	
}
