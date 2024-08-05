package modelo.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import modelo.dao.UsuarioDAO;
import modelo.entidades.Movimiento;
import modelo.entidades.Usuario;
import utils.BCryptUtil;

public class JPAUsuarioDAO extends JPAGenericDAO<Usuario, Integer> implements UsuarioDAO{


	public JPAUsuarioDAO() {
		
		super(Usuario.class);
	
	}

	@Override
	public Usuario autorizar(String nombre, String password) {
		 // Buscar al usuario por nombre
	    String sentenciaJPQL = "SELECT p FROM Usuario p WHERE p.nombre = :nombre";
	    Query query = em.createQuery(sentenciaJPQL);
	    query.setParameter("nombre", nombre);

	    try {
	        Usuario usuarioAutorizado = (Usuario) query.getSingleResult();
	        boolean passwordMatch = BCryptUtil.checkPassword(password, usuarioAutorizado.getPassword());

	        if (passwordMatch) {
	            return usuarioAutorizado;
	        } else {
	            return null;
	        }
	    } catch (NoResultException e) {
	        return null;
	    }
	}
	
	@Override
	public List<Usuario> getUsuarioByCorreo(String correo) {
	    try {
	        String jpql = "SELECT u FROM Usuario u " +
	                      "WHERE u.nombre = :nombre";
	        TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
	        query.setParameter("nombre", correo);
	        return query.getResultList();
	    } catch (Exception e) {
	        return new ArrayList<>(); 
	    }
	}

}
