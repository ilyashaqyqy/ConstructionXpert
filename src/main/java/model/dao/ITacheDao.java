package model.dao;

import model.entities.Tache;

import java.util.List;

public interface ITacheDao {

    Tache save(Tache tache);

    List<Tache> getAllTasks();

    List<Tache> tachesParMc(String mc);

    void update(Tache tache);

    void delete(int id);

    Tache getTacheById(int id);
    public void updateTaskStatus(int taskId, String status);
    
    public List<Tache> getTasksByProjectId(int projectId) ;
}

