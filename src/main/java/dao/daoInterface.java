package dao;

import java.util.List;

public interface daoInterface<G> {
	public boolean insertX(G g);
	public boolean deleteX(G g);
	public boolean updateX(G g);
	
	public G selectX(G g);
	public List<G> selectAll();
}
