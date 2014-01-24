package br.com.uaijug.uaijugvagas.test.repository;

import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.uaijug.uaijugvagas.entities.Job;
import br.com.uaijug.uaijugvagas.repository.JobRepsitory;
import br.com.uaijug.uaijugvagas.test.AbstractBasicConfigTest;

public class UserRepositoryTest extends AbstractBasicConfigTest {

	@Autowired
	private JobRepsitory jobRepsitory;

	@Test
	public void create() {

		Job job = new Job();
		job.setCompany("Psi");
		job.setDescription("Vaga de JAva");
		job.setEmail("fontest@sl");
		job.setPosition("sa");
		job.setTitle("sas");
		jobRepsitory.save(job);

		assertNull(job.getId());
	}
}
