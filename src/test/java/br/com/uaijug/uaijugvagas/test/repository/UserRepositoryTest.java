package br.com.uaijug.uaijugvagas.test.repository;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.hamcrest.Matchers.hasSize;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.uaijug.uaijugvagas.entities.Job;
import br.com.uaijug.uaijugvagas.repository.JobRepsitory;
import br.com.uaijug.uaijugvagas.test.AbstractBasicConfigTest;

public class UserRepositoryTest extends AbstractBasicConfigTest {

	@Autowired
	private JobRepsitory jobRepository;

	@Test
	public void create() {
		Job job = new Job();
		job.setCompany("Psi");
		job.setDescription("Vaga de Java");
		job.setEmail("fontest@sl");
		job.setPosition("sa");
		job.setTitle("sas");
		jobRepository.save(job);

		assertNotNull(job.getId());
	}

	@Test
	public void findAll() {
		List<Job> jobs = (List<Job>) jobRepository.findAll();
		assertThat("Deve haver no mínimo 3 jobs", jobs, hasSize(0));
	}

	@Test
	public void delete() {
		jobRepository.delete(1l);

		List<Job> jobs = (List<Job>) jobRepository.findAll();
		assertThat("Deve haver 2 jobs", jobs, hasSize(2));

		Job job = jobRepository.findOne(1L);
		assertThat("O job 1 não deveria mais existir", job, is(nullValue()));
	}

	@Test
	public void testUpdate() {
		Job job = jobRepository.findOne(1L);
		assertThat("O job 1 deveria existir", job, notNullValue());

		job.setCompany("Test Company");
		job.setDescription("Test Description");
		job.setEmail("test@email");
		job.setPosition("Test Position");
		job.setTitle("Test Title");

		jobRepository.save(job);

		job = jobRepository.findOne(1L);

		assertThat("O Job Description está errado", job.getDescription(), is("Test Description"));
	}
}