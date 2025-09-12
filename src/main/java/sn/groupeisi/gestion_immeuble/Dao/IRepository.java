package sn.groupeisi.gestion_immeuble.Dao;

import java.util.List;

public interface IRepository<T> {
    public int add(T t);
    public int update(T t);
    public int delete(int id);
    public List<T> getAll();
    public T get(int id);
}
