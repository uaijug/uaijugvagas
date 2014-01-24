package br.com.uaijug.uaijugvagas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.uaijug.uaijugvagas.entities.Job;
import br.com.uaijug.uaijugvagas.repository.JobRepsitory;

@Controller
public class JobController {

	@Autowired
	private JobRepsitory repository;
	
	  @RequestMapping(value = "/jobs", method = RequestMethod.GET)
	  @ResponseBody
	  public List<Job> getJobs() {
	    return (List<Job>) repository.findAll();
	  }

	  
	  @RequestMapping(value="/job", method = RequestMethod.POST)
	  @ResponseBody
	  public void fazerPedido(@RequestBody Job job) {
		repository.save(job);
	  }
}
