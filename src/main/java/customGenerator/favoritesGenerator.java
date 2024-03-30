package customGenerator;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class favoritesGenerator implements IdentifierGenerator{

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) {
	    try {
	        String customId = "FR " + java.util.Calendar.getInstance().getTime();
	        return customId;
	    } catch (Exception e) {
	        throw new HibernateException("Failed to generate custom ID: " + e.getMessage(), e);
	    }
	}


}

