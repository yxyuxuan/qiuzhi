package com.qiuzhi.service;

import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.SendRecordDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.SendRecord;
import com.qiuzhi.util.HelperUtil;

@Service
public class SendRecordService {
	@Autowired
	private SendRecordDao sendRecordDao;
	
	/**
	 * 投递简历
	 * @param jobId
	 * @param companyid
	 * @param companyName
	 * @param jobname
	 * @param resumeid
	 * @return
	 */
	public BaseResult sendRecord(int jobId,int companyid,String companyName,String jobname,int resumeid){
		BaseResult result = new BaseResult();
		SendRecord sendRecord = new SendRecord();
		sendRecord.setApplicantid(Integer.valueOf(HelperUtil.getValueByKey("id")));
		sendRecord.setApplicantname(HelperUtil.getValueByKey("name"));
		sendRecord.setCompanyid(companyid);
		sendRecord.setCompanyname(companyName);
		sendRecord.setJobid(jobId);
		sendRecord.setJobname(jobname);
		sendRecord.setResumeid(resumeid);
		sendRecord.setSendtime(new Date());
		sendRecord.setStatus("待查看");
		int affectedRecord = sendRecordDao.insert(sendRecord);
		if(affectedRecord>0){
			result.setMessage("投递成功!");
			result.setStatus(1);
			return result;
		}
		result.setMessage("投递失败!");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 查询已经发送的简历
	 * @return
	 */
	public ArrayList<SendRecord> querySendRecords(){
		int applicantid = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ArrayList<SendRecord>  sendRecordList= sendRecordDao.selectSendRecords(applicantid);
		return sendRecordList;
	}
	
	
	/**
	 * 查询已经公司已经收到的简历
	 * @return
	 */
	public ArrayList<SendRecord> receivedRecords(){
		int companyid = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ArrayList<SendRecord>  sendRecordList= sendRecordDao.receivedRecords(companyid);
		return sendRecordList;
	}
	
	/**
	 * 更新接受到的简历的状态
	 * @param status
	 * @param id
	 * @return
	 */
	public BaseResult updateReceivedRecordStatus(String status,Integer id){
		BaseResult result = new BaseResult();
		int affectedRecord = sendRecordDao.updateStatusByPrimaryKey(status, id);
		if(affectedRecord>0){
			result.setMessage("操作成功!");
			result.setStatus(1);
			return result;
		}
		result.setMessage("操作失败!");
		result.setStatus(-1);
		return result;
	}

	
	
}
