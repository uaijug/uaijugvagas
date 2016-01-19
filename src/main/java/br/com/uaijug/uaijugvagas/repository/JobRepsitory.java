package br.com.uaijug.uaijugvagas.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.uaijug.uaijugvagas.entities.Job;

@Repository
public interface JobRepsitory extends PagingAndSortingRepository<Job, Long> {
	
	/**
	* Pesquisa uma lista de estados cujo atributo country coincide com o valor
	* passado no par??metro country.
	*
	* @param job
	*            o job
	* @return estados encontrados
	*/

	public List<Job> findByTitle(String title);
}
