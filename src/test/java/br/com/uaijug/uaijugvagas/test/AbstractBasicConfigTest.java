package br.com.uaijug.uaijugvagas.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(defaultRollback = true)
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public abstract class AbstractBasicConfigTest {

	//protected Logger log = Logger.getLogger(this.getClass());

}
