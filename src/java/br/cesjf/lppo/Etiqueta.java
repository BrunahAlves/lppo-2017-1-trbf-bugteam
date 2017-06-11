package br.cesjf.lppo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Bruna Alves
 */
@Entity
public class Etiqueta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String referencia_autor;
    private String referencia_tarefa;
    private String titulo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReferencia_autor() {
        return referencia_autor;
    }

    public void setReferencia_autor(String referencia_autor) {
        this.referencia_autor = referencia_autor;
    }

    public String getReferencia_tarefa() {
        return referencia_tarefa;
    }

    public void setReferencia_tarefa(String referencia_tarefa) {
        this.referencia_tarefa = referencia_tarefa;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    
}
