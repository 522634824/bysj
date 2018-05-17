package bs;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shuren.mapper.StatMapper;
import com.shuren.pojo.ApplyStat;
import com.shuren.pojo.Howmuch;
import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectStat;
import com.shuren.pojo.QueryDate;
import com.shuren.service.StatService;
import com.shuren.util.DateUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class UserTest {
	@Resource
	private StatService sservice;
	@Resource
	private StatMapper mapper;
	
	@Test
	public void Test() {
		int year=2018;
		int month=6;
		String starttime=DateUtil.getFirstDayOfMonth(year, month);
		String endtime=DateUtil.getLastDayOfMonth(year, month);
		System.out.println(starttime);
		System.out.println(endtime);
		QueryDate date=new QueryDate();
		date.setStartdate(starttime);
		date.setEnddate(endtime);
		List<ApplyStat> list=sservice.ApplyStatByIf(date);
		for(ApplyStat as: list) {
			System.out.println(as.toString());
		}
		
	}
	
	
	@Test
	public void Test1() {
		int year=2018;
		int month=5;
		String starttime=DateUtil.getFirstDayOfMonth(year, month);
		String endtime=DateUtil.getLastDayOfMonth(year, month);
		System.out.println(starttime);
		System.out.println(endtime);
		QueryDate date=new QueryDate();
		date.setStartdate(starttime);
		date.setEnddate(endtime);
		List<ProjectStat> list=sservice.ProjectStatByIf(date);
		for(ProjectStat as: list) {
			System.out.println(as.toString());
		}
		
	}
//	@Test
//	public void Test2() {
//		List<Howmuch> howmuch=mapper.sumHowmuch();
//		System.out.println(howmuch.toString());
//		List<Project> project=mapper.selectProjectIsOk(null);
//		System.out.println(project.toString());
//		ProjectStat ps=new ProjectStat();
//		List<ProjectStat> list=new ArrayList<>();
//		for(Howmuch h : howmuch) {
//			  
//			for(Project p : project) {
//				if(p.getPerformer().equals(h.getPerformer())) {
//					ps.setUserid(p.getUserid());
//					ps.setHowmuch(String.valueOf(h.getHowmuch()));
//					ps.setCompletecount(p.getCompletecount());
//					ps.setPerformer(p.getPerformer());
//					list.add(ps);
//				}
//			}
//
//			
//			}
//		
//		for(ProjectStat pst : list) {
//			System.out.println(pst.toString());
//		}
//		}
		
	}
	

	
	
